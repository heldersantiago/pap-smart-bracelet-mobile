import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pap/Utils/animations.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/routes.dart';
import 'package:pap/views/widgets/button_auth.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final animationsMap = <String, List<Effect>>{};

  @override
  void initState() {
    super.initState();
    animationsMap.addAll({
      "textOnPageLoadAnimation1": [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.0.ms,
          duration: 600.0.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.0.ms,
          duration: 600.0.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        )
      ],
      "imageOnPageLoadAnimation1": [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.0.ms,
          duration: 600.0.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.0.ms,
          duration: 600.0.ms,
          begin: 0,
          end: 1,
        ),
      ],
      "textOnPageLoadAnimation2": [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.0.ms,
          duration: 600.0.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.0.ms,
          duration: 600.0.ms,
          begin: 0,
          end: 1,
        ),
      ]
    });
  }

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
                Image.asset("assets/medical_research.png")
                    .animate(effects: Animations.imageOnPageLoadAnimation1),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Monitoramento de Saúde",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 35,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      wordSpacing: 2),
                  textAlign: TextAlign.center,
                ).animate(effects: Animations.textOnPageLoadAnimation2),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Monitoramento de Saude para idosos, controle a saude do seu idoso em qualquer lugar",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      wordSpacing: 2),
                  textAlign: TextAlign.center,
                ).animate(effects: Animations.textOnPageLoadAnimation1),
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
