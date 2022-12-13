import 'package:alljob/Screen/Register/RegisterService.dart';
import 'package:alljob/models/userModel/user.dart';
import 'package:flutter/material.dart';

import '../Alljob/AlljobHome.dart';
import '../Login/WelcomeScreen.dart';
import 'Widgets/NumericPad.dart';

class OtpPage extends StatefulWidget {
  OtpPage({super.key, this.phone, required this.userdata});
  String? phone;
  final Map<String, dynamic>? userdata;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 350,
                          child: Text(
                            "Verification Code",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 320,
                      child: Text(
                        'This code sent to your phone. Please, Check SMS or inbox on your phone ${widget.phone}',
                        // "This code sent to your phone. Please, Check SMS or inbox on your ${text_type} ${widget.user_contack}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildCodeNumberBox(
                          code.isNotEmpty ? code.substring(0, 1) : "•"),
                      buildCodeNumberBox(
                          code.length > 1 ? code.substring(1, 2) : "•"),
                      buildCodeNumberBox(
                          code.length > 2 ? code.substring(2, 3) : "•"),
                      buildCodeNumberBox(
                          code.length > 3 ? code.substring(3, 4) : "•"),
                      buildCodeNumberBox(
                          code.length > 4 ? code.substring(4, 5) : "•"),
                      buildCodeNumberBox(
                          code.length > 5 ? code.substring(5, 6) : "•"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 30),
            child: NumericPad(
              onNumberSelected: (value) async {
                setState(() {
                  if (value != -1) {
                    if (code.length < 6) {
                      code = code + value.toString();
                    }
                  } else {
                    if (code.isNotEmpty) {
                      code = code.substring(0, code.length - 1);
                    }
                  }
                });
                if (code.length > 5) {
                  try {
                    final User? user = await RegisterService().setInformation(
                      email: widget.userdata!['email'],
                      username: widget.userdata!['email'],
                      name: widget.userdata!['name'],
                      birthday: widget.userdata!['birthday'],
                      phone: widget.userdata!['phone'],
                      gender: widget.userdata!['gender'],
                      marital: widget.userdata!['marital'],
                      password: widget.userdata!['password'],
                    );
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return WelcomeScreen();
                    }), (route) => false);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.blueAccent,
                        title: Text("Error",
                            style: TextStyle(color: Colors.white)),
                        content: Text(e.toString(),
                            style: TextStyle(color: Colors.white)),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK',
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                    );
                  }

                  // Navigator.pushReplacement<void, void>(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => AlljobHome(),
                  //   ),
                  // );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Center(
          child: Text(
            codeNumber,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
