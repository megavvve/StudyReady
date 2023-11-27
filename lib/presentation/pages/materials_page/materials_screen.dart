import 'package:flutter/material.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Материалы"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Материалы находятся в доработке"),
      ),
    );
  }
}
