import 'package:flutter/material.dart';

class Ecran1 extends StatelessWidget {
  const Ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: const Center(
        child: Text("Ecran 1"),
      )
    );
  }
}
