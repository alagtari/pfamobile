import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/common_used/socket_service.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
import 'package:mobile/theme/colors.dart';

@RoutePage()
class AdminMissionMapScreen extends StatefulWidget {
  const AdminMissionMapScreen({
    super.key,
    required this.plan,
  });

  final PlanModel plan;

  @override
  AdminMissionMapScreenState createState() => AdminMissionMapScreenState();
}

class AdminMissionMapScreenState extends State<AdminMissionMapScreen>
    with TickerProviderStateMixin {
  late List<Marker> _markers;
  late List<LocationModel> _locations;
  late List<LocationModel> _visitedLocations;
  late Stream<LatLng> _driverLocation;
  late Stream<LocationModel> _visitedLocation;
  final SocketService _socketService = sl<SocketService>();

  bool isAbleToAdd = false;

  Marker buildPin(LocationModel location) {
    final visited = _visitedLocations.contains(location);

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
    _visitedLocations = widget.plan.visitedLocation!;
    _socketService.joinMissionRoom(widget.plan.id!);
    _driverLocation = _socketService.driverLocation;
    _visitedLocation = _socketService.visitedLocation;
    buildPins();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<LatLng>(
            stream: _driverLocation,
            builder: (context, snapshot) {
              log(snapshot.data.toString());
              return StreamBuilder<LocationModel>(
                  stream: _visitedLocation,
                  builder: (context, visitedSnapshot) {
                    if (visitedSnapshot.data != null) {
                      _markers = [];
                      _visitedLocations.add(visitedSnapshot.data!);
                      buildPins();
                    }
                    return FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        initialCenter: widget.plan.city.cityLocation.toLatLng(),
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
                        MarkerLayer(
                          markers: [
                            snapshot.data != null
                                ? Marker(
                                    point: snapshot.data!,
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/svg/track.svg',
                                      ),
                                    ),
                                  )
                                : Marker(
                                    point: widget.plan.city.cityLocation
                                        .toLatLng(),
                                    width: 0,
                                    height: 0,
                                    child: const SizedBox()),
                            ..._markers,
                          ],
                        ),
                      ],
                    );
                  });
            }),
      ),
    );
  }
}
