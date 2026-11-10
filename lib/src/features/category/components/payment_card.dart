import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(myPadding*.9)
      ),
      child: Padding(
        padding:  EdgeInsets.fromLTRB(
          myPadding/1.2,
          0,
          myPadding/1.2,
          myPadding/1.2
        ),
        child: Column(
          children: [
            Paymenttile(title: "Current Balance", amount: "100"),
                      Paymenttile(title: "delivery Fee", amount: "8.00"),
            Paymenttile(title: "Current Balance", amount: "92.00",isRemaining: true,),
            SizedBox(height: myPadding/1.5,),
            SizedBox(
              height: myPadding*3.2,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bgcolor,
                foregroundColor: AppColors.primary,
                side: BorderSide(
                  color: AppColors.primary
                )
              ), child: Text("Top up Wallet",style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: myPadding*1.2
                      ))),
            )
        
          ],
        
        ),
      ),
    );
  }
}
class Paymenttile extends StatelessWidget {
  final String title;
  final String amount;
  final bool isRemaining;
  const Paymenttile({super.key,required this.title,required this.amount,this.isRemaining = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: myPadding*2.5,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title,style: theme.textTheme.titleMedium?.copyWith(
          color: AppColors.textcolor2,
          fontSize: myPadding*1.2
        )),
        trailing: Text("\$ $amount",style: theme.textTheme.titleLarge?.copyWith(
          color: isRemaining? AppColors.error:AppColors.textcolor1,
                  fontSize: myPadding*1.2
      
        ),),
      ),
    );
  }
}