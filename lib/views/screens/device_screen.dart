import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scaffold(
              drawer: Drawer(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.people),
                      title: const Text("sample"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.people),
                      title: const Text("sample"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )));
  }
}
