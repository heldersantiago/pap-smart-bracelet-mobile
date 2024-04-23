import 'package:flutter/material.dart';
import 'package:pap/routes.dart';
import 'package:pap/views/widgets/button_auth.dart';
import 'package:pap/views/widgets/navbar_roots.dart';
import 'package:pap/constants/color.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/medical_research.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Monitoramento de Saúde",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      wordSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Monitoramento de Saude para idosos, controle a saude do seu idoso em qualquer lugar",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      wordSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonAuth(
                      buttonText: "Entrar",
                      view: RouteGenerator.loginPage,
                    ),
                    ButtonAuth(
                      buttonText: "Registrar",
                      view: RouteGenerator.registerPage,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
