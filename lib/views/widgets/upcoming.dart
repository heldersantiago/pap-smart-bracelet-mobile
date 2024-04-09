import 'package:flutter/material.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Notifications(),
          SizedBox(height: 20),
          Notifications(),
          SizedBox(height: 20),
          Notifications(),
          SizedBox(height: 20),
          Notifications(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ]),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListTile(
          title: const Text(
            "Dr. Helder Santiago",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: const CircleAvatar(child: Icon(Icons.notifications)),
          subtitle: const Text("Engenheiro"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Notification"),
                    content: const Text("Any notifications coming"),
                    actions: <Widget>[
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Fechar"),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
