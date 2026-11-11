import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' as math;

import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/category/components/map_pin.dart';

enum OrderMapmode { direction, tracking }

const List<LatLng> Ksimpleroute = [
  LatLng(30.2105, 71.4610),
  LatLng(30.2090, 71.4635),
  LatLng(30.2072, 71.4668),
  LatLng(30.2050, 71.4690),
  LatLng(30.2030, 71.4715),
  LatLng(30.2008, 71.4740),
];

class CustomMap extends StatelessWidget {
  final OrderMapmode mode;
  final List<LatLng> route;
  final double progress;
  final String etaLabel;
  final String? userImageUrl;
  final String? courierImageUrl;
  final LatLng? center;

  const CustomMap({
    super.key,
    this.mode = OrderMapmode.direction,
    this.route = Ksimpleroute,
    this.progress = 0.6,
    this.etaLabel = "21 min",
    this.userImageUrl,
    this.courierImageUrl,
    this.center,
  });

  bool get isTracking => mode == OrderMapmode.tracking;

  @override
  Widget build(BuildContext context) {
    final splitIndex = (route.length * progress)
        .round()
        .clamp(1, route.length - 1);

    final donePart = route.sublist(0, splitIndex + 1);
    final restPart = route.sublist(splitIndex);

    final bearing = const Distance().bearing(
      route[splitIndex - 1],
      route[splitIndex],
    );

    final mid = route[route.length ~/ 2];

    final homePin = MapPin(
      child: Icon(Icons.home_outlined, color: AppColors.primary),
    );

    final avatarPin = MapPin(
      child: Pinavatar(
        imageUrl: isTracking ? courierImageUrl : userImageUrl,
      ),
    );

    final startPin = isTracking ? avatarPin : homePin;
    final endPin = isTracking ? homePin : avatarPin;

    return FlutterMap(
      options: MapOptions(
        initialCameraFit: center == null
            ? CameraFit.bounds(
                bounds: LatLngBounds.fromPoints(route),
                padding: EdgeInsets.all(myPadding * 3),
              )
            : null,
        initialCenter: center ?? route.first,
        initialZoom: center == null ? 14 : 14,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.pinchZoom |
              InteractiveFlag.pinchMove |
              InteractiveFlag.doubleTapZoom,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.hollycoffee',
        ),

        if (center == null)
          PolylineLayer(
            polylines: [
              Polyline(
                points: restPart,
                strokeWidth: myPadding / 3,
                color: AppColors.textcolor2.withAlpha(120),
                strokeCap: StrokeCap.round,
                strokeJoin: StrokeJoin.round,
              ),
              Polyline(
                points: donePart,
                strokeWidth: myPadding / 3,
                color: AppColors.primary,
                strokeCap: StrokeCap.round,
                strokeJoin: StrokeJoin.round,
              ),
            ],
          ),

        MarkerLayer(
          markers: center != null
              ? [
                  Marker(
                    point: center!,
                    width: myPadding * 2.8,
                    height: myPadding * 3.5,
                    alignment: Alignment.topCenter,
                    child: homePin,
                  ),
                ]
              : [
                  Marker(
                    point: route[splitIndex],
                    width: myPadding * 2,
                    height: myPadding * 2,
                    child: Transform.rotate(
                      angle: bearing * math.pi / 180,
                      child: Icon(
                        Icons.navigation,
                        color: AppColors.primary,
                        size: myPadding * 1.6,
                      ),
                    ),
                  ),
                  Marker(
                    point: mid,
                    width: myPadding * 5.5,
                    height: myPadding * 2.2,
                    child: EtaBubble(label: etaLabel),
                  ),
                  Marker(
                    point: route.first,
                    width: myPadding * 2.8,
                    height: myPadding * 3.5,
                    alignment: Alignment.topCenter,
                    child: startPin,
                  ),
                  Marker(
                    point: route.last,
                    width: myPadding * 2.8,
                    height: myPadding * 3.5,
                    alignment: Alignment.topCenter,
                    child: endPin,
                  ),
                ],
        ),
      ],
    );
  }
}

class EtaBubble extends StatelessWidget {
  final String label;

  const EtaBubble({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.primary,
      shape: const StadiumBorder(),
      child: Center(
        child: Text(
          label,
          style: theme.textTheme.titleSmall?.copyWith(
            color: AppColors.bgcolor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}