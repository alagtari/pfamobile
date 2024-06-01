import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';

@RoutePage()
class DriverPlanLocationsScreen extends StatefulWidget {
  const DriverPlanLocationsScreen({
    super.key,
    required this.plan,
  });

  final PlanModel plan;

  @override
  DriverPlanLocationsScreenState createState() => DriverPlanLocationsScreenState();
}

class DriverPlanLocationsScreenState extends State<DriverPlanLocationsScreen>
    with TickerProviderStateMixin {
  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  late List<Marker> _markers;
  late List<LocationModel> _locations;
  late List<LocationModel> _visitedLocationsocations;

  bool isAbleToAdd = false;

  Marker buildPin(LocationModel location) {
    final visited = _visitedLocationsocations.contains(location);
    return Marker(
      point: location.toLatLng(),
      width: 60,
      height: 60,
      child: Icon(
        Icons.location_pin,
        size: 60,
        color: visited ? AppColors.greenDarkColor : Colors.red,
      ),
    );
  }

  @override
  void initState() {
    _markers = [];
    _locations = widget.plan.city.locations!;
    _visitedLocationsocations = widget.plan.visitedLocation!;
    buildPins();
    super.initState();
  }

  void buildPins() {
    for (var location in _locations) {
      _markers.add(buildPin(location));
    }
  }

  final mapController = MapController();

  Future<void> animateMap() async {
    await Future.delayed(const Duration(milliseconds: 100));
    mapController.move(
        widget.plan.city.cityLocation.toLatLng(), mapController.camera.zoom);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await animateMap();
    });

    return Scaffold(
      body: SafeArea(
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
                  initialZoom: 16,
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
          ],
        ),
      ),
    );
  }
}

final _animatedMoveTileUpdateTransformer =
    TileUpdateTransformer.fromHandlers(handleData: (updateEvent, sink) {
  final mapEvent = updateEvent.mapEvent;

  final id = mapEvent is MapEventMove ? mapEvent.id : null;
  if (id?.startsWith(DriverPlanLocationsScreenState._startedId) ?? false) {
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
  } else if (id == DriverPlanLocationsScreenState._inProgressId) {
  } else if (id == DriverPlanLocationsScreenState._finishedId) {
    // We already prefetched the tiles when animation started so just prune.
    sink.add(updateEvent.pruneOnly());
  } else {
    sink.add(updateEvent);
  }
});
