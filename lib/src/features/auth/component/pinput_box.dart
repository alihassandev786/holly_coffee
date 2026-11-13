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
  State<PinputBox> createState() => _PinputBoxState();
}

class _PinputBoxState extends State<PinputBox> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _onChanged(String v) {
    setState(() {});
    widget.onChanged(v);
    if (v.length == widget.length) {
      widget.onCompleted?.call(v);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final value = _controller.text;
    final boxSize = myPadding * 4.1;

    return GestureDetector(
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
                style:  TextStyle(fontSize: 1),
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
                      (i == widget.length - 1 && value.length == widget.length));

              return AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: boxSize,
                height: boxSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(myPadding*.7),
                  border: Border.all(
                    color: active ? AppColors.primary : AppColors.border,
                  ),
                ),
                child: Text(filled ? value[i] : '', style: text.titleLarge),
              );
            }),
          ),
        ],
      ),
    );
  }
}