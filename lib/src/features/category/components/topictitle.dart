import 'package:flutter/material.dart';
class Topictitle extends StatelessWidget {
  final String title;
  const Topictitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}