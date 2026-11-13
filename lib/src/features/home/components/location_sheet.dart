import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/auth/component/slidebutton.dart';

class Locationresult {
  final String city;
  final String state;
  const Locationresult({required this.city, required this.state});
}

class LocationSheet extends StatefulWidget {
  const LocationSheet({super.key});
  static Future<Locationresult?> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      useSafeArea: true,
      backgroundColor: AppColors.bgcolor,
      builder: (_) => LocationSheet(),
    );
  }

  @override
  State<LocationSheet> createState() => _LocationSheetState();
}

class _LocationSheetState extends State<LocationSheet> {
  static const cities = ['Multan', 'Lahore', 'Karachi', 'Islamabad'];
  static const states = ['Punjab', 'Sindh', 'KPK', 'Balochistan'];
  String? city;
  String? state;
  Widget arrow() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: myPadding * 2.1,
        width: myPadding / 16,

        child: Card(
          elevation: 0,
          color: AppColors.border,
          shape: RoundedRectangleBorder(
          ),
        ),
      ),
      SizedBox(width: myPadding / 2),
      Icon(Icons.keyboard_arrow_down, color: AppColors.textcolor2),
    ],
  );
  Widget dropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return SizedBox(
      height: myPadding*3.3,
      child: Card(
        color: AppColors.border.withAlpha(90),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(myPadding * .7),
        ),
        elevation: 0,
        child: DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          icon: arrow(),
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.transparent,
          ),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  void usecurrentlocation() {}
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Card(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: myPadding * 1,
              vertical: myPadding * 1.5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/otpverify.svg",
                      height: myPadding * 2,
                      width: myPadding * 2,
                    ),
                    SizedBox(width: myPadding / 2),
                    Text(
                      "Holy Coffee",
                      style: text.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: myPadding * 1),
                Text(
                  "Please Select your location",
                  style: text.titleMedium?.copyWith(
                    color: AppColors.textcolor2,
                    fontSize: myPadding * 1.15,
                  ),
                ),
                SizedBox(height: myPadding * 1),
                SizedBox(
                  height: myPadding * 3,
                  width: myPadding * 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(myPadding * 2),
                    child: ElevatedButton.icon(
                      onPressed: usecurrentlocation,
                      icon: const Icon(Icons.my_location, color: Colors.white),
                      label: Text(
                        "Use Current Location",
                        style: text.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: myPadding * 1.5),
                dropdown(
                  hint: "City",
                  value: city,
                  items: cities,
                  onChanged: (v) => setState(() => city = v),
                ),
                SizedBox(height: myPadding * .8),
                dropdown(
                  hint: "State",
                  value: state,
                  items: states,
                  onChanged: (v) => setState(() => state = v),
                ),
                SizedBox(height: myPadding * 2),
                Slidebutton(title: "Select", ontap: (){
                  Navigator.of(context).pop();
                }, color: AppColors.primary)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
