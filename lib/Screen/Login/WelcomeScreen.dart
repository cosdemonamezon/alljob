import 'package:alljob/Screen/Login/LoginScreen.dart';
import 'package:alljob/Screen/Register/RegisterScreen.dart';
import 'package:alljob/Screen/Widgets/ButtonRounded.dart';
import 'package:alljob/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/[960x1600]ALLZJOB.jpg'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
            Color(0xFFffffff),
            Color(0xFFd5e8f9),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: kDefaultHorizonPadding,
        margin: EdgeInsets.only(bottom: padding.bottom + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonRounded(
              text: 'เข้าสู่ระบบ',
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(height: 8),
            ButtonRounded(
              text: 'สมัครสมาชิก',
              color: Color.fromARGB(255, 247, 244, 244),
              textColor: Colors.blue,
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
