import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/constants/appstring.dart';
import 'package:hollycoffee/models/vouchermodel.dart';

class Vouchercard extends StatelessWidget {
  final Vouchermodel voucher;
  final VoidCallback onApply;
  const Vouchercard({super.key, required this.voucher, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(myPadding * .8),
        side: BorderSide(width: myPadding / 16, color: AppColors.border),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: myPadding * .8,vertical: myPadding * .7),
        child: Row(
          children: [
            CircleAvatar(
              radius: myPadding * 1.8,
              backgroundColor: theme.cardColor,
              child: Image.network(
                voucher.image,
                height: myPadding * 2.3,
                width: myPadding * 2.3,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: myPadding / 2),
            Expanded(
              child: Text(
                voucher.discryption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: myPadding*3.8,
              child: Column(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: onApply,
                    style: ElevatedButton.styleFrom(
                    
                      padding: EdgeInsets.symmetric(
                        horizontal: myPadding * 1.4,
                        vertical: myPadding / 3.2,
                        
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(myPadding*1)
                      )
                    ),
                    child: Text(Appstring.apply, style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.bgcolor,
                      fontSize: myPadding*.9,
                      fontWeight: FontWeight.w600,
                    )),
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
