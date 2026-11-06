import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/features/profile/models/to_review_model.dart';

class Reviewcard extends StatefulWidget {
  final Toreviewmodel item;
  final void Function(int rating, String text) onSubmit;
  const Reviewcard({super.key, required this.item, required this.onSubmit});

  @override
  State<Reviewcard> createState() => _ReviewcardState();
}

class _ReviewcardState extends State<Reviewcard> {
  int rating = 0;
  late final TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final item = widget.item;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(
          myPadding / 1.5,
          myPadding / 6,
          myPadding / 1.5,
          myPadding / 1.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(myPadding / 1.5),
                child: Image.network(
                  item.image,
                  height: myPadding * 2.9,
                  width: myPadding * 2.9,
                  fit: BoxFit.cover,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: myPadding * 1.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: myPadding / 4),
                  Text(
                    "${item.category} . QTY : ${item.qty} item",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: myPadding * .95,
                      color: AppColors.textcolor2,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Rate this order",
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: myPadding * 1.08,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: myPadding / 6),
            Row(
              children: [
                for (int i = 1; i <= 5; i++)
                  GestureDetector(
                    onTap: () => setState(() => rating = i),
                    child: Icon(
                      i <= rating
                          ? Icons.star_rounded
                          : Icons.star_border_outlined,
                      color: i <= rating
                          ? AppColors.primary
                          : AppColors.textcolor2.withAlpha(80),
                      size: myPadding * 1.5,
                    ),
                  ),
              ],
            ),
            SizedBox(height: myPadding / 3),

            Text(
              "Share your experience (optional)",
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: myPadding * 1.08,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: myPadding / 1.5),

            SizedBox(
              height: myPadding * 2.8,
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(myPadding * .6),
                  dashPattern: const [4, 3], // [line ki lambai, gap]
                  strokeWidth: 1,
                  color: Colors.grey.shade400,
                  padding: EdgeInsets.zero,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tell us about your order experience",
                  ),
                ),
              ),
            ),
            SizedBox(height: myPadding / 1.5),
            SizedBox(
              height: myPadding * 2.8,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: rating == 0
                    ? null
                    : () => widget.onSubmit(rating, controller.text.trim()),
                child: Text(
                  "Submit Review",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.bgcolor,
                    fontWeight: FontWeight.w600,
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
