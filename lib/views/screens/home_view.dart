import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  List symptoms = [
    "Batimento Cardiaco",
    "Pressão arterial",
    "Localização",
    "Oxigénio no sangue",
    "Temperatura corporal",
    "Estado físico",
    "Alertas",
  ];
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor5.jpg"
  ];

  HomeView({super.key});

  // const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, Jamal Adjani",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("images/doctors.png"),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0XFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 4)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.emergency,
                            color: Color(0XFF7165D6), size: 35),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Saúde Adulta",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Monitorize sua saúde",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 4)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color(0XFF7165D6), shape: BoxShape.circle),
                        child: const Icon(Icons.home_filled,
                            color: Colors.white, size: 35),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Página Inicial",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      const Text("Sistema - SMSI",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Controle sua Saúde com o SMSI",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              )),
          SizedBox(
              height: 70,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: symptoms.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          color: const Color(0XFFF4F6FA),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 1,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          symptoms[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  })),
          const SizedBox(height: 15),
          const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Dados Vitais",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              )),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              List<IconData> icons = [
                CupertinoIcons.heart_solid,
                CupertinoIcons.heart_slash_fill,
                Icons.gas_meter_outlined,
                Icons.thermostat,
                // Add more icons as needed
              ];

              List<String> names = [
                "Batimento Cardíaco",
                "Pressão arterial",
                "Oxigénio no sangue",
                "Temperatura corporal",
                "Estado físico",
                "Localização",
                "Alertas",
              ];

              IconData iconData =
                  (index < icons.length) ? icons[index] : Icons.error;
              String cardName = (index < names.length) ? names[index] : "";

              return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color(0XFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            spreadRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(iconData, color: Colors.red, size: 40),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          cardName,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
