import 'package:flutter/material.dart';
import 'package:pap/views/screens/auth/login_view.dart';
import 'package:pap/views/screens/auth/register_view.dart';
import 'package:pap/views/widgets/button_auth.dart';
import 'package:pap/views/widgets/navbar_roots.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavbarRoots()));
                  },
                  child: const Text(
                    "SKIP",
                    style: TextStyle(color: Color(0xff7165d6), fontSize: 20),
                  )),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("images/doctors.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Monitoramento de Saude",
              style: TextStyle(
                  color: Color(0XFF7165D6),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Monitoramento de Saude para idosos",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonAuth(
                  buttonText: "LOG IN",
                  view: LoginView(),
                ),
                ButtonAuth(
                  buttonText: "SIGN UP",
                  view: RegisterView(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
