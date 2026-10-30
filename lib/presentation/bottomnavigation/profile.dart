import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appstring.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              titleSpacing: myPadding / 1.2,
              title: Text(
                Appstring.profile,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: myPadding * 1.4,
                ),
              ),
            ),
        ],
      )
    );
  }
}