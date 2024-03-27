import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/constants/constant.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/controllers/user_controller.dart';
import 'package:pap/routes.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<String> symptoms = Constant().symptoms;
  List<String> cardnames = Constant().cardName;
  List<IconData> cardIcons = Constant().cardIcons;

  final UserController userController = Get.put(UserController());

  final AuthController authController = Get.put(AuthController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "SMSI",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 25),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: ClipOval(
                            child: Image.asset(
                              "images/default-user.png",
                              color: primaryColor.withOpacity(0.4),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          authController.currentUser.value.email!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "Filho",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ListTile(
                    title: Text(
                      "Página Inicial",
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Ajuda",
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    leading: Icon(
                      Icons.help,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Definições",
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    leading: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () async {
                authController.isLoading.value = true;
                await authController.logout();
              },
              title: Text(
                "Terminar Sessão",
                style: TextStyle(
                  color: primaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 180,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: primaryColor,
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
                                color: primaryColor, size: 35),
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
                                color: primaryColor, shape: BoxShape.circle),
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
              itemCount: cardnames.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                IconData cardIcon =
                    (index < cardIcons.length) ? cardIcons[index] : Icons.error;
                String cardName =
                    (index < cardnames.length) ? cardnames[index] : "";

                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 2)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(cardIcon, color: Colors.red, size: 40),
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
      ),
    );
  }
}
