import 'package:flutter/material.dart';
import 'package:SMSI/constants/color.dart';
import 'package:SMSI/routes.dart';

class RelativeScreen extends StatefulWidget {
  const RelativeScreen({super.key});

  @override
  State<RelativeScreen> createState() => _RelativeScreenState();
}

class _RelativeScreenState extends State<RelativeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteGenerator.homePage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.createRelative);
              },
              icon: const Icon(Icons.person_add),
            ),
          ],
          backgroundColor: primaryColor,
          title: const Text(
            "Familiares",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: backgroundColor.withOpacity(.9),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 1, spreadRadius: 1)
                    ]),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RouteGenerator.showRelative,
                        arguments: index);
                  },
                  child: const ListTile(
                    title: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "heldersantiago273@gmail.com",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Outfit",
                          fontSize: 20),
                    ),
                    subtitle: Text("Filho"),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
