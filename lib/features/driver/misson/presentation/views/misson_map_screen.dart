import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
import 'package:mobile/features/driver/misson/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class DriverMissionMapScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const DriverMissionMapScreen({
    super.key,
    required this.plan,
  });

  final PlanModel plan;

  @override
  DriverMissionMapScreenState createState() => DriverMissionMapScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => MissionBloc(),
        child: this,
      );
}

class DriverMissionMapScreenState extends State<DriverMissionMapScreen>
    with TickerProviderStateMixin {
  late List<Marker> _markers;
  late List<LocationModel> _locations;
  late ValueNotifier<List<LocationModel>> _visitedLocations;
  late List<LatLng> _path;
  late LatLng _currentLocation;
  Timer? _timer;

  bool isAbleToAdd = false;

  Marker buildPin(LocationModel location) {
    final visited = _visitedLocations.value.contains(location);
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

  void buildPins() {
    for (var location in _locations) {
      _markers.add(buildPin(location));
    }
  }

  @override
  void initState() {
    _markers = [];
    _locations = widget.plan.city.locations!;
    _visitedLocations = ValueNotifier(widget.plan.visitedLocation!);
    _path = [];
    _currentLocation = widget.plan.city.cityLocation.toLatLng();
    buildPins();
    _startLocationUpdates();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _visitedLocations.dispose();
    super.dispose();
  }

  void _startLocationUpdates() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      context.read<MissionBloc>().add(GetLocationEvent());
    });
  }

  final mapController = MapController();

  Future<void> animateMap(LatLng location) async {
    log(_currentLocation.toString());
    await Future.delayed(const Duration(milliseconds: 100));
    mapController.move(location, mapController.camera.zoom);
  }

  void findNearestPoint(LatLng selectedPoint) {
    const Distance distance = Distance();
    final points = _locations
        .where((item) => !_visitedLocations.value.contains(item))
        .toList();
    if (points.isEmpty) {
      throw ArgumentError("The list of points should not be empty");
    }

    LocationModel nearestPoint = points[0];
    double minDistance = distance(selectedPoint, nearestPoint.toLatLng());

    for (final point in points) {
      double currentDistance = distance(selectedPoint, point.toLatLng());
      if (currentDistance < minDistance) {
        minDistance = currentDistance;
        nearestPoint = point;
      }
    }
    context.read<MissionBloc>().add(
          GetLocationsEvent(
            start: selectedPoint,
            end: nearestPoint.toLatLng(),
          ),
        );
    if (minDistance < 10) {
      _visitedLocations.value = [..._visitedLocations.value, nearestPoint];
      _visitedLocations.notifyListeners();
      // context.read<MissionBloc>().add(
      //       GetLocationsEvent(
      //         start: selectedPoint,
      //         end: nearestPoint.toLatLng(),
      //       ),
      //     );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<MissionBloc, MissionState>(
          listener: (context, state) async {
            if (state is GeolocationError) {
              if (state.message.contains('permanently denied')) {
                openAppSettings();
              }
            }
            if (state is GeolocationLoaded) {
              if (_currentLocation.latitude != state.position.latitude ||
                  _currentLocation.longitude != state.position.longitude) {
                setState(() {
                  _currentLocation =
                      LatLng(state.position.latitude, state.position.longitude);
                });
                await animateMap(_currentLocation);
                findNearestPoint(_currentLocation);
              }
            }
            if (state is GetLocationsSuccess) {
              setState(() {
                _path = state.locations;
              });
            }
          },
          child: BlocBuilder<MissionBloc, MissionState>(
            builder: (context, state) {
              return ValueListenableBuilder<List<LocationModel>>(
                valueListenable: _visitedLocations,
                builder: (context, visitedLocations, child) {
                  _markers = [];
                  buildPins();
                  return FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: _currentLocation,
                      initialZoom: 16,
                      maxZoom: 19,
                      minZoom: 15,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                        tileProvider: CancellableNetworkTileProvider(),
                      ),
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: _path,
                            strokeWidth: 4.0,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      MarkerLayer(
                        markers: [
                          ..._markers,
                          Marker(
                            point: _currentLocation,
                            width: 60,
                            height: 60,
                            child: const Icon(
                              Icons.location_pin,
                              size: 60,
                              color: AppColors.greenDarkColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}