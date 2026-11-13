import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/auth/component/pinput_box.dart';

class OtpVerifyscreen extends StatefulWidget {
  static const route = "/otpverify";
  final String phone;
  const OtpVerifyscreen({super.key, this.phone = "+64 78748 348"});

  @override
  State<OtpVerifyscreen> createState() => _OtpVerifyscreenState();
}

class _OtpVerifyscreenState extends State<OtpVerifyscreen> {
  String _otp = '';

  void _submit() {
    if (_otp.length < 4) return;
    
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;

    return Scaffold(
      body: Material(
        type: MaterialType.transparency,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverAppBar(),

            SliverToBoxAdapter(child: SizedBox(height: myPadding * 4)),

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
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 4.8)),

            SliverToBoxAdapter(
              child: Text(
                "Verify Your Account",
                style: text.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 1.1)),

            SliverToBoxAdapter(
              child: Text(
                "We have sent a 4 digit code to the number",
                style: text.bodyLarge?.copyWith(
                  color: AppColors.textcolor2,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),
            SliverToBoxAdapter(
              child: Text(
                widget.phone,
                style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 1.5)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: myPadding * 1),
                child: PinputBox(
                  onChanged: (v) => _otp = v,
                  onCompleted: (_) => _submit(),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: myPadding * 1)),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code ?",
                    style: text.bodyLarge?.copyWith(
                      color: AppColors.textcolor2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend",
                      style: text.bodyLarge?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: myPadding * 4.5)),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.3),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: myPadding * 3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/splash");
                    },
                    child: Text(
                      "Submit",
                      style: text.titleLarge?.copyWith(
                        fontSize: myPadding * 1.3,
                        color: AppColors.bgcolor,
                        fontWeight: FontWeight.w600,
                      ),
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
