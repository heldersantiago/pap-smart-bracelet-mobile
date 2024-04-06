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
        child: Column(
          children: [
            const ListTile(
              title: Text(
                "Dr. Helder Santiago",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Engenheiro"),
              trailing: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("images/doctor1.jpg"),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(thickness: 1, height: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 5),
                const Row(
                  children: [
                    Icon(Icons.access_time_filled, color: Colors.black54),
                    SizedBox(width: 5),
                    Text(
                      "14:30 min",
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 5),
                    const Text("confirmado",
                        style: TextStyle(color: Colors.black87))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
