import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/constants/app_string.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
            titleSpacing: myPadding / 1.5,
            title: Text(Appstring.profile),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: myPadding * 3.5,
                    backgroundImage: AssetImage(
                      "assets/images/profileimage.png",
                    ),
                  ),
                ),
                Positioned(
                  top: myPadding * 4.5,
                  left: myPadding * 14,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/editprofile");
                    },
                    child: SizedBox(
                      height: myPadding * 2.5,
                      width: myPadding * 2.5,
                      child: Card(
                        shape: RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.circular(myPadding * 2),
                          side: BorderSide(
                            width: myPadding / 7,
                            color: AppColors.bgcolor,
                          ),
                        ),
                        color: theme.primaryColor,

                        child: Icon(Icons.edit, color: AppColors.bgcolor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),
          SliverToBoxAdapter(
            child: Text(
              Appstring.profilename,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: myPadding * 1.23,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 2)),

          SliverToBoxAdapter(
            child: Text(
              Appstring.profilenumber,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: myPadding * 1.1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),

          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: Sectiontitle(title: Appstring.generaltitle),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),

          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),

            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Tile(
                    icon: Iconsax.wallet_2_copy,
                    title: Appstring.mywallet,
                    ontap: () {
                      Navigator.of(context).pushNamed("/wallet");
                    },
                  ),
                  Tile(
                    icon: Icons.card_giftcard,
                    title: Appstring.reward,
                    ontap: () {},
                  ),
                  Tile(
                    icon: Icons.record_voice_over_outlined,
                    title: Appstring.toreview,
                    ontap: () {
                      Navigator.of(context).pushNamed("/toreview");
                    },
                  ),
                  Tile(
                    icon: Iconsax.notification_bing_copy,
                    title: Appstring.notifications,
                    ontap: () {},
                  ),
                  Tile(
                    icon: Iconsax.logout_1_copy,
                    title: Appstring.logout,
                    ontap: () {},
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),

            sliver: SliverToBoxAdapter(
              child: Sectiontitle(title: Appstring.settingtitle),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1.5)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: myPadding / 1.5),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Tile(
                    icon: Icons.mail_outline,
                    title: Appstring.emailnotification,
                    ontap: () {},
                  ),
                  Tile(
                    icon: Icons.assignment_outlined,
                    title: Appstring.termandpolicy,
                    ontap: () {},
                  ),
                  Tile(
                    icon: Icons.help_outline,
                    title: Appstring.helpcenter,
                    ontap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback ontap;
  const Tile({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: myPadding / 1.5),
      child: InkWell(
        onTap: ontap,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Card(
            elevation: 0,
            color: theme.cardColor,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(myPadding * 3),
            ),

            child: Padding(
              padding: EdgeInsets.all(myPadding / 1.5),

              child: Icon(icon),
            ),
          ),
          title: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: myPadding * 1.23,
            ),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class Sectiontitle extends StatelessWidget {
  final String title;
  const Sectiontitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
