import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hollycoffee/config/apptheme/app_colors.dart';
import 'package:hollycoffee/config/apptheme/app_theme.dart';

class PinputBox extends StatefulWidget {
  final int length;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;

  const PinputBox({
    super.key,
    this.length = 4,
    required this.onChanged,
    this.onCompleted,
  });

  @override
  State<PinputBox> createState() => PinputBoxState();
}

// Public rakha hai taake bahar se shake() call ho sake
class PinputBoxState extends State<PinputBox>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focus = FocusNode();
  late final AnimationController _shakeCtrl;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() {}));
    _shakeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    _shakeCtrl.dispose();
    super.dispose();
  }

  void _onChanged(String v) {
    setState(() {});
    HapticFeedback.selectionClick(); // halki vibration
    widget.onChanged(v);
    if (v.length == widget.length) {
      widget.onCompleted?.call(v);
    }
  }

  // Galat PIN par bahar se call karein: key.currentState?.shake();
  void shake() {
    HapticFeedback.heavyImpact();
    _shakeCtrl.forward(from: 0);
  }

  // PIN saaf karne ke liye
  void clear() {
    _controller.clear();
    setState(() {});
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final value = _controller.text;
    final boxSize = myPadding * 4.1;

    return AnimatedBuilder(
      animation: _shakeCtrl,
      builder: (context, child) {
        // sine wave se left-right shake, aakhir mein 0 par aa jata hai
        final dx = Curves.elasticIn.transform(_shakeCtrl.value) * 0;
        final offset =
            (1 - _shakeCtrl.value) * 12 * (_shakeCtrl.value == 0 ? 0 : _sin(_shakeCtrl.value * 6 * 3.1416));
        return Transform.translate(offset: Offset(offset + dx, 0), child: child);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _focus.requestFocus(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 1,
              height: 1,
              child: Opacity(
                opacity: 0,
                child: EditableText(
                  focusNode: _focus,
                  cursorColor: AppColors.primary,
                  controller: _controller,
                  style: const TextStyle(fontSize: 1),
                  backgroundCursorColor: Colors.transparent,
                  keyboardType: TextInputType.number,
                  autofillHints: const [AutofillHints.oneTimeCode],
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(widget.length),
                  ],
                  onChanged: _onChanged,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(widget.length, (i) {
                final filled = i < value.length;
                final active = _focus.hasFocus &&
                    (i == value.length ||
                        (i == widget.length - 1 &&
                            value.length == widget.length));

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  width: boxSize,
                  height: boxSize,
                  alignment: Alignment.center,
                  // active box thora bara hota hai
                  transform: Matrix4.identity()..scale(active ? 1.06 : 1.0),
                  transformAlignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(myPadding * .7),
                    border: Border.all(
                      width: active ? 2 : 1,
                      color: active
                          ? AppColors.primary
                          : filled
                              ? AppColors.primary.withOpacity(.6)
                              : AppColors.border,
                    ),
                    boxShadow: active
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(.25),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]
                        : [],
                  ),
                  // digit aate hi pop animation
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, anim) => ScaleTransition(
                      scale: CurvedAnimation(
                          parent: anim, curve: Curves.easeOutBack),
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                    child: Text(
                      filled ? value[i] : '',
                      key: ValueKey(filled ? '${i}_${value[i]}' : 'empty_$i'),
                      style: text.titleLarge,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

double _sin(double x) => math.sin(x);