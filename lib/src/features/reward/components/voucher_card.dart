import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
import 'package:hollycoffee/src/constants/app_string.dart';
import 'package:hollycoffee/src/features/reward/models/voucher_model.dart';

class Vouchercard extends StatelessWidget {
  final Vouchermodel voucher;
  final VoidCallback onApply;
  const Vouchercard({super.key, required this.voucher, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: AppColors.bgcolor,
      elevation: 0,
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.circular(myPadding * .8),
        side: BorderSide(width: myPadding / 16, color: AppColors.border),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: myPadding * .8,
          vertical: myPadding * .7,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: myPadding * 1.8,
            backgroundColor: theme.cardColor,
            child: Image.network(
              voucher.image,
              height: myPadding * 2.3,
              width: myPadding * 2.3,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            voucher.discryption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Padding(
            padding:  EdgeInsets.only(top: myPadding*1.2),
            child: ElevatedButton(
              onPressed: onApply,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: myPadding * 1.4,
                  vertical: myPadding / 3.2,
                ),
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(myPadding * 1),
                ),
              ),
              child: Text(
                Appstring.apply,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppColors.bgcolor,
                  fontSize: myPadding * .9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
