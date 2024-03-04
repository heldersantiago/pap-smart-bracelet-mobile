import 'package:flutter/material.dart';
import 'package:pap/views/login_view.dart';

class ButtonAuth extends StatelessWidget {
  final String buttonText;
  final Widget view;
  const ButtonAuth({Key? key, required this.buttonText, required this.view})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0XFF7165D6),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => view));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
