import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/config/constants/app_string.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();

  static const route = "/editprofile";
}

class _EditprofileState extends State<Editprofile> {
  late TextEditingController genderController;
  late TextEditingController dobController;
  @override
  void initState() {
    super.initState();
    genderController = TextEditingController();
    dobController = TextEditingController();
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  Future<void> selectdob() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1999, 1, 1),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(data: Theme.of(context), child: child!);
      },
    );

    if (pickedDate != null) {
      setState(() {
        dobController.text = formatDate(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    genderController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            titleSpacing: myPadding / 10,
            title: Text(
              Appstring.editprofile,
              
            ),
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
                  child: Container(
                    height: myPadding * 2.5,
                    width: myPadding * 2.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor,
                      border: Border.all(
                        width: myPadding / 7,
                        color: AppColors.bgcolor,
                      ),
                    ),
                    child: Icon(Icons.camera_alt_outlined, color: AppColors.bgcolor),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: myPadding / 1)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: myPadding / 2),
                  Sectiontitle(title: "Name"),
                  SizedBox(height: myPadding / 1.5),
                  TextField(
                    decoration: InputDecoration(hintText: "Cameran Williamson"),
                  ),
                  SizedBox(height: myPadding / 1),
                  Sectiontitle(title: "Phone"),
                  SizedBox(height: myPadding / 1.5),
                  TextField(
                    decoration: InputDecoration(hintText: "wilie.jennings@example.com"),
                  ),
                  SizedBox(height: myPadding / 1),
                  Sectiontitle(title: "Email"),
                  SizedBox(height: myPadding / 1.5),
                  TextField(
                    decoration: InputDecoration(hintText: "+83 278 037278"),
                  ),
                  SizedBox(height: myPadding / 1),
                  Sectiontitle(title: "Gender"),

                  SizedBox(height: myPadding / 1.5),

                  TextField(
                    controller: genderController,
                    readOnly: true,
                    
                    
                    decoration: InputDecoration(
                      hintText: "Male",
                      suffixIcon: PopupMenuButton<String>(
                        icon: Icon(Icons.keyboard_arrow_down),
                        color: Theme.of(context).colorScheme.surface,
                        onSelected: (value) {
                          setState(() {
                            genderController.text = value;
                          });
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(value: "Male", child: Text("Male")),
                          PopupMenuItem(value: "Female", child: Text("Female")),
                          PopupMenuItem(value: "Other", child: Text("Other")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: myPadding / 1),
                  Sectiontitle(title: "DOB"),
                  SizedBox(height: myPadding / 1.5),
                  TextField(
                    controller: dobController,
                    readOnly: true,
                    onTap: selectdob,
                    decoration: InputDecoration(
                      hintText: "Select DOB",
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
            SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: myPadding/1.5,vertical: myPadding*1.5),
                      child: Column(
                        children: [
                          Spacer(),
                          SizedBox(
                            height: myPadding*3.2,
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){
                              Navigator.of(context).pushNamedAndRemoveUntil("/", (route)=>false);
                            },style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric()
                            ), child: Text("Save",style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: myPadding*1.2,
                              fontWeight: FontWeight.w600,
                              color: AppColors.bgcolor
                            ),)),
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

class Sectiontitle extends StatelessWidget {
  final String title;
  const Sectiontitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(fontSize: myPadding * 1.23),
    );
  }
}
