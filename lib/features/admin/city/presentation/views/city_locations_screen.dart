import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/admin/city/data/models/add_location_model.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/city/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';

@RoutePage()
class CityLocationsScreen extends StatefulWidget implements AutoRouteWrapper {
  const CityLocationsScreen({
    super.key,
    required this.city,
  });

  final CityModel city;

  @override
  CityLocationsScreenState createState() => CityLocationsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => CityBloc(),
        child: this,
      );
}

class CityLocationsScreenState extends State<CityLocationsScreen>
    with TickerProviderStateMixin {
  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  late List<Marker> _markers;
  late List<LocationModel> _locations;

  bool isAbleToAdd = false;

  Marker buildPin(LocationModel location) => Marker(
        point: location.toLatLng(),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _locations = _locations
                  .where((locationItem) => locationItem.id != location.id)
                  .toList();
            });
            reBuildPins();
            context.read<CityBloc>().add(
                  DeleteCityLocationEvent(id: location.id!),
                );
          },
          child: const Icon(
            Icons.location_pin,
            size: 60,
            color: AppColors.greenDarkColor,
          ),
        ),
      );

  @override
  void initState() {
    _markers = [];
    _locations = widget.city.locations!;

    buildPins();
    super.initState();
  }

  void buildPins() {
    for (var location in _locations) {
      _markers.add(buildPin(location));
    }
  }

  void reBuildPins() {
    log(_locations.length.toString());
    List<Marker> markers = [];
    for (var location in _locations) {
      markers.add(buildPin(location));
    }
    setState(() {
      _markers = markers;
    });
  }

  final mapController = MapController();

  Future<void> animateMap() async {
    await Future.delayed(const Duration(milliseconds: 100));
    mapController.move(
        widget.city.cityLocation.toLatLng(), mapController.camera.zoom);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await animateMap();
    });

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            isAbleToAdd = !isAbleToAdd;
          });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: AppColors.greenDarkColor,
          ),
          child: isAbleToAdd
              ? const Icon(
                  Icons.done,
                  color: AppColors.whiteDarkColor,
                )
              : const Icon(
                  Icons.add,
                  color: AppColors.whiteDarkColor,
                ),
        ),
      ),
      body: SafeArea(
        child: BlocListener<CityBloc, CityState>(
          listener: (context, state) {
            if (state is AddCityLocationSuccess) {
              setState(() {
                _markers.add(buildPin(state.location));
                _locations.add(state.location);
              });
            }
          },
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 30, left: 30, bottom: 15),
                child: ScreenTitle(
                  title: "Add locations",
                  arrowBack: true,
                ),
              ),
              Expanded(
                child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: const LatLng(51.5, -0.09),
                    initialZoom: 16,
                    minZoom: 15,
                    onTap: (_, p) {
                      if (isAbleToAdd) {
                        final location = AddLocationModel(
                            longitude: p.longitude,
                            latitude: p.latitude,
                            cityId: widget.city.id!);
                        context.read<CityBloc>().add(
                              AddCityLocationEvent(
                                location: location,
                              ),
                            );
                      }
                    },
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
  if (id?.startsWith(CityLocationsScreenState._startedId) ?? false) {
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
  } else if (id == CityLocationsScreenState._inProgressId) {
  } else if (id == CityLocationsScreenState._finishedId) {
    // We already prefetched the tiles when animation started so just prune.
    sink.add(updateEvent.pruneOnly());
  } else {
    sink.add(updateEvent);
  }
});
