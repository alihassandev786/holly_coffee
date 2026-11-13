import 'package:flutter/material.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';
class Slidebutton extends StatefulWidget {
  final VoidCallback onComplete;
  final String lable;
  final bool Function()? canComplete;
  final VoidCallback? onBlocked;
  final Color iconcolor;
  const Slidebutton({super.key, required this.onComplete, required this.lable,this.canComplete,this.onBlocked,required this.iconcolor});

  @override
  State<Slidebutton> createState() => _SlidebuttonState();
}

class _SlidebuttonState extends State<Slidebutton> {
  double dx = 0;
  bool done = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    final knob = myPadding * 2.8;
    final pad = myPadding * .4;
    return LayoutBuilder(
      builder: (context, c) {
        final maxdx = c.maxWidth - knob - pad * 2;
        final progress = maxdx <= 0 ? 0.0 : (dx / maxdx).clamp(0.0, 1.0);
        return SizedBox(
          width: double.infinity,
          height: myPadding * 3.4,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(myPadding*1),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Opacity(
                      opacity: 1 - progress,
                      child: Text(
                        widget.lable,
                        style: text.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: pad + dx,
                child: GestureDetector(
                  onHorizontalDragUpdate:(d){
                    if(done) return;
                    setState(() => dx = (dx + d.delta.dx).clamp(0.0, maxdx));
                  },
                  onHorizontalDragEnd: (_){
                    if(done)return;
                    if(dx>= maxdx *0.85){
                      setState(() {
                        dx = maxdx;
                        done = true;
                        
                      });
                      widget.onComplete();
                    }else{
                      setState(() =>dx = 0);
                    }
                  },
                  child: SizedBox(
                    height: knob,
                    width: knob,
                    child: Card(
                      color: AppColors.bgcolor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(myPadding/1.3)
                      ),
                      child: Icon(
                        Icons.keyboard_double_arrow_right,
                        color: widget.iconcolor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
