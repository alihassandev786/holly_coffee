import 'package:flutter/material.dart';
import 'package:hollycoffee/src/features/auth/component/login_card.dart';
import 'package:intl_phone_field/phone_number.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  bool _remember = true;
  PhoneNumber? _phone;

  void _login() {
    if (!_formKey.currentState!.validate()) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/loginbackground.png",
              fit: BoxFit.cover,
            ),
          ),

          AnimatedPadding(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
            padding: EdgeInsetsGeometry.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Logincard(
                      onPhonechanged: (p) => _phone = p,
                      remember: _remember,
                      onRemember: (v) => setState(() => _remember = (v)),
                      formKey: _formKey,
                      onLogin: _login,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

