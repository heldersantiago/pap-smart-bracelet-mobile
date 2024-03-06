import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pap/views/screens/auth/register_view.dart';
import 'package:pap/views/widgets/input.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("images/doctors.png"),
            ),
            const SizedBox(height: 15),
            const Input(
              labelText: "Email or Username",
              icon: Icons.email,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                obscureText: passToggle ? true : false,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (passToggle == true) {
                          passToggle = false;
                        } else {
                          passToggle = true;
                        }
                        setState(() {});
                      },
                      child: passToggle
                          ? const Icon(CupertinoIcons.eye_slash_fill)
                          : const Icon(CupertinoIcons.eye_fill),
                    )),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: const Color(0XFF7165D6),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have any account?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                    },
                    child: const Text("Create Account",
                        style: TextStyle(
                          color: Color(0XFF7165D6),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
