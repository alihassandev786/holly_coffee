import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
class Logincard extends StatelessWidget {
  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(myPadding * 1),
    borderSide: BorderSide(color: color),
  );

  final ValueChanged<PhoneNumber> onPhonechanged;
  final bool remember;
  final ValueChanged<bool> onRemember;
  final GlobalKey<FormState> formKey;
  final VoidCallback onLogin;
  const Logincard({
    super.key,
    required this.onPhonechanged,
    required this.remember,
    required this.onRemember,
    required this.formKey,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Card(
      color: AppColors.bgcolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: myPadding / 1.3,
          vertical: myPadding * 1.2,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Login with your phone \nnumber",
                style: text.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: myPadding * 1.4),
              IntlPhoneField(
                initialCountryCode: "PK",
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: AppColors.textcolor2),
                  border: _border(AppColors.border),
                  enabledBorder: _border(AppColors.border),
                  focusedBorder: _border(AppColors.primary),
                  errorBorder: _border(Colors.red),
                  focusedErrorBorder: _border(Colors.red),
                ),
                style: theme.textTheme.bodyLarge,
                dropdownTextStyle: const TextStyle(fontSize: 0, height: 0),
                dropdownIconPosition: IconPosition.trailing,
                flagsButtonPadding: EdgeInsetsGeometry.only(
                  left: myPadding / 1.5,
                ),
                disableLengthCheck: false,
                languageCode: "en",
                pickerDialogStyle: PickerDialogStyle(
                  backgroundColor: theme.colorScheme.surface,
                  countryNameStyle: text.bodyLarge,
                  countryCodeStyle: text.titleMedium,
                  searchFieldInputDecoration: InputDecoration(
                    hintText: "Search Country",
                  ),
                ),
                onChanged: onPhonechanged,
              ),
              
              Row(
                children: [
                  SizedBox(
                    height: myPadding * 2,
                    width: myPadding * 2,
                    child: Checkbox(
                      value: remember,
                      onChanged: (v) => onRemember(v ?? false),
                    ),
                  ),
                  Text("Remember me", style: text.bodyLarge),
                ],
              ),
              SizedBox(height: myPadding * 1.2),
              SizedBox(
                height: myPadding * 3,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed("/home");
                  },
                  child: Text(
                    'Login',
                    style: text.titleLarge?.copyWith(
                      fontSize: myPadding * 1.3,
                      color: AppColors.bgcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: myPadding / 1.5),
              Row(
                children: [
                  Text("Don't have an account?", style: text.bodyLarge),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Create account',
                      style: text.bodyLarge?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: myPadding * 1.7),
            ],
          ),
        ),
      ),
    );
  }
}
