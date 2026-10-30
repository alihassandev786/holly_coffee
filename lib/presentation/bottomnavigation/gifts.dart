import 'package:flutter/material.dart';
class Gifts extends StatefulWidget {
  const Gifts({super.key});

  @override
  State<Gifts> createState() => _GiftsState();
}

class _GiftsState extends State<Gifts> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text("Gift Screen", style: theme.textTheme.titleLarge,),
      ),
    );
  }
}