import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/city/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class VerifyCityScreen extends StatefulWidget implements AutoRouteWrapper {
  const VerifyCityScreen({
    super.key,
    required this.location,
    required this.name,
    required this.state,
    required this.postalCode,
  });

  final LatLng location;
  final String name;
  final String state;
  final String postalCode;

  @override
  VerifyCityScreenState createState() => VerifyCityScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => CityBloc(),
        child: this,
      );
}

class VerifyCityScreenState extends State<VerifyCityScreen>
    with TickerProviderStateMixin {
  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  late List<Marker> _markers;
  @override
  void initState() {
    _markers = [
      Marker(
        width: 80,
        height: 80,
        point: widget.location,
        child: const Icon(
          Icons.location_pin,
          color: Colors.green,
          size: 60,
        ),
      ),
    ];
    super.initState();
  }

  final mapController = MapController();

  Future<void> animateMap() async {
    await Future.delayed(const Duration(milliseconds: 100));
    mapController.move(widget.location, 16);
  }

  void _onSubmit() {
    final city = CityModel(
      name: widget.name,
      postalCode: widget.postalCode,
      state: widget.state,
      cityLocation: LocationModel.fromLatLng(widget.location),
    );
    context.read<CityBloc>().add(AddCityEvent(city: city));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await animateMap();
    });

    return Scaffold(
      body: SafeArea(
        child: BlocListener<CityBloc, CityState>(
          listener: (context, state) {
            if (state is AddCitySuccess) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "City added succesfully",
                ),
              );

              context.router.back();
            }

            if (state is AddCityFailed) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: state.message,
                ),
              );
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
                child: ScreenTitle(
                  title: context.l10n.add_city,
                  arrowBack: true,
                ),
              ),
              Expanded(
                child: FlutterMap(
                  mapController: mapController,
                  options: const MapOptions(
                    initialCenter: LatLng(51.5, -0.09),
                    initialZoom: 5,
                    maxZoom: 30,
                    minZoom: 3,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                      tileProvider: CancellableNetworkTileProvider(),
                      tileUpdateTransformer: _animatedMoveTileUpdateTransformer,
                    ),
                    MarkerLayer(markers: _markers),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: AppBotton(
                  bottonText: context.l10n.add_city,
                  onClick: () {
                    _onSubmit();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _animatedMoveTileUpdateTransformer =
    TileUpdateTransformer.fromHandlers(handleData: (updateEvent, sink) {
  final mapEvent = updateEvent.mapEvent;

  final id = mapEvent is MapEventMove ? mapEvent.id : null;
  if (id?.startsWith(VerifyCityScreenState._startedId) ?? false) {
    final parts = id!.split('#')[2].split(',');
    final lat = double.parse(parts[0]);
    final lon = double.parse(parts[1]);
    final zoom = double.parse(parts[2]);

    sink.add(
      updateEvent.loadOnly(
        loadCenterOverride: LatLng(lat, lon),
        loadZoomOverride: zoom,
      ),
    );
  } else if (id == VerifyCityScreenState._inProgressId) {
  } else if (id == VerifyCityScreenState._finishedId) {
    // We already prefetched the tiles when animation started so just prune.
    sink.add(updateEvent.pruneOnly());
  } else {
    sink.add(updateEvent);
  }
});
