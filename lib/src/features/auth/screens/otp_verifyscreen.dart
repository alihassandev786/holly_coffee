import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class OtpVerifyscreen extends StatefulWidget {
  static const route = "/otpverify";
  final String phone;
  const OtpVerifyscreen({super.key, this.phone = "+64 78748 348"});

  @override
  State<OtpVerifyscreen> createState() => _OtpVerifyscreenState();
}

class _OtpVerifyscreenState extends State<OtpVerifyscreen> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_otpController.text.length < 4) return;
    debugPrint(_otpController.text);
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final text = theme.textTheme;

    final defaultPinTheme = PinTheme(
      width: myPadding * 3.4,
      height: myPadding * 3.4,
      textStyle: text.titleMedium,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(myPadding*1),
        border: Border.all(color: AppColors.border),
      ),
    );

    return Scaffold(
      body: Material(
        type: MaterialType.transparency,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 11)),
        
            // Logo
            SliverToBoxAdapter(
              child: Row(
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
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 5)),
        
            // Title
            SliverToBoxAdapter(
              child: Text(
                "Verify Your Account",
                style: text.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding*1)),
        
            // Subtitle + phone
            SliverToBoxAdapter(
              child: Text(
                "We have sent a 4 digit code to the number",
                style: text.bodyLarge?.copyWith(color: AppColors.textcolor2),
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
            SliverToBoxAdapter(
              child: Text(
                widget.phone,
                style: text.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 1.5)),
        
            // OTP boxes
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: myPadding*1),
                child: Material(
                  type: MaterialType.transparency,
                  child: Pinput(
                    length: 4,
                    controller: _otpController,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: AppColors.primary),
                      ),
                    ),
                    onCompleted: (_) => _submit(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 1.5)),
        
            // Resend
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code ?",
                    style: text.bodyLarge?.copyWith(color: AppColors.textcolor2),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend",
                      style: text.bodyLarge?.copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
        
            // Submit button neeche
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    myPadding*1,
                    myPadding*1,
                    myPadding*1,
                    myPadding * 1.5,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: myPadding * 3,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: const Text("Submit"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}