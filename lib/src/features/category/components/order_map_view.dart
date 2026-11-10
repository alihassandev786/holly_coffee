import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/category/components/courior_card.dart';
import 'package:hollycoffee/src/features/category/components/map_pin.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' as math;

enum OrderMapmode { direction, tracking }

const List<LatLng> Ksimpleroute = [
  LatLng(30.2105, 71.4610),
  LatLng(30.2090, 71.4635),
  LatLng(30.2072, 71.4668),
  LatLng(30.2050, 71.4690),
  LatLng(30.2030, 71.4715),
  LatLng(30.2008, 71.4740),
];

class OrderMapView extends StatelessWidget {
  final OrderMapmode mode;
  final List<LatLng> route;
  final double progress;
  final String eatalable;
  final String? userimageUrl;
  final courierinfo? courier;
  final VoidCallback? onCall;
  final VoidCallback? onChat;
  const OrderMapView({
    super.key,
    required this.mode,
    this.route = Ksimpleroute,
    this.progress = 0.6,
    this.eatalable = "21 min",
    this.userimageUrl,
    this.courier,
    this.onCall,
    this.onChat,
  });

  bool get istracking => mode == OrderMapmode.tracking;

  @override
  Widget build(BuildContext context) {
    final splitIndex = (route.length * progress).round().clamp(
      1,
      route.length - 1,
    );
    final donePart = route.sublist(0, splitIndex + 1);
    final restPart = route.sublist(splitIndex);

    final bearing = const Distance().bearing(
      route[splitIndex - 1],
      route[splitIndex],
    );
    final mid = LatLng(
      (route[1].latitude + route[2].latitude) / 2,
      (route[1].longitude + route[2].longitude) / 2,
    );

    final homePin = MapPin(
      child: Icon(Icons.home_outlined, color: AppColors.primary),
    );
    final avatarPin = MapPin(
      child: Pinavatar(imageUrl: istracking ? courier?.imageUrl : userimageUrl),
    );
    final startPin = istracking ? avatarPin : homePin;
    final endPin = istracking ? homePin : avatarPin;

    final map = ExcludeSemantics(
      child: FlutterMap(
        options: MapOptions(
          initialCameraFit: CameraFit.bounds(
            bounds: LatLngBounds.fromPoints(route),
            padding: EdgeInsets.all(myPadding * 3),
          ),
          interactionOptions: const InteractionOptions(
            flags:
                InteractiveFlag.pinchZoom |
                InteractiveFlag.pinchMove |
                InteractiveFlag.doubleTapZoom,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.hollycoffee', // <- apna package id
          ),
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
            markers: [
              // direction arrow
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
              // ETA bubble
              Marker(
                point: mid,
                width: myPadding * 5.5,
                height: myPadding * 2.2,
                child: Etabubble(label: eatalable),
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
      ),
    );
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: AppColors.bgcolor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(myPadding * 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: istracking ? myPadding * 18 : myPadding * 20.5,
            width: double.infinity,
            child: map,
          ),
          if (istracking && courier != null) ...[
            Divider(height: 0, color: AppColors.border),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              child: courierCard(
                courier: courier!,
                oncall: onCall,
                onchat: onChat,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class Etabubble extends StatelessWidget {
  final String label;
  const Etabubble({required this.label});

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
