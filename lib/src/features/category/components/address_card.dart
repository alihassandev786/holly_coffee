import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    const center = LatLng(30.1575, 71.5249);
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(myPadding / 1.2),
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(myPadding/1.2),
                child: SizedBox(
                  height: myPadding*11,
                  width: double.infinity,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: center,
                      initialZoom: 17,
                      minZoom: 4,
                      maxZoom: 24,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: "com.example.hollycoffee",
                      ),
                      MarkerLayer(markers: [Marker(point: center,height: myPadding*2.4,width: myPadding*2.4, child: Icon(Icons.location_on,color: AppColors.primary,size: myPadding*2.4,))],)
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Padding(
                padding:  EdgeInsets.only(bottom: myPadding*1),
                child: Icon(Icons.location_on_outlined,size: myPadding*1.5,color: theme.primaryColor,),
              ),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deliver To",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: myPadding / 3),
                    Text(
                      "6391 Elgin St. Celina, Delaware 10299",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
