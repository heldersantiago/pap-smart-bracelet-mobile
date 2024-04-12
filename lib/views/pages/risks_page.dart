import 'package:flutter/material.dart';

class RisksPage extends StatefulWidget {
  const RisksPage({super.key});

  @override
  State<RisksPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<RisksPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sem riscos no momento",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
    );
  }
}
