import 'package:alljob/Screen/Alljob/AlljobHome.dart';
import 'package:alljob/Screen/Login/LoginService.dart';
import 'package:alljob/Screen/Login/Widgets/AppTextForm.dart';
import 'package:alljob/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login/login.dart';
import '../Widgets/LoadingDialog.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoadding = false;

  void initState() {
    super.initState();
    _initPrefs();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  SharedPreferences? prefs;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //extendBody: true,
      body: SafeArea(
        child: isLoadding == true
            ? Center(
                child: SizedBox(
                  width: size.width / 1.5,
                  height: 140,
                  child: Image.asset("assets/images/645bf.gif"),
                ),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Screenshot 2566-03-09 at 16.03.22.png',
                          height: 200,
                          width: 250,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: loginFormKey,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Email',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: email,
                            hintText: 'Email',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Password',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: password,
                            hintText: 'Password',
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    ButtonRounded(
                      text: 'Login',
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () async {
                        try {
                          LoadingDialog.open(context);
                          final String _email = email.text;
                          final String _password = password.text;
                          final Login? login = await LoginService().loginUser(_email, _password);
                          if (login != null) {
                            await prefs!.setString('token', login.token!);
                            await prefs!.setString('member_id', login.id.toString());
                            if (!mounted) return;
                            LoadingDialog.close(context);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                              return AlljobHome();
                            }), (route) => false);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AlljobHome()));
                          }
                        } catch (e) {
                          LoadingDialog.close(context);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.blueAccent,
                              title: Text("Error", style: TextStyle(color: Colors.white)),
                              content: Text(e.toString(), style: TextStyle(color: Colors.white)),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK', style: TextStyle(color: Colors.white)))
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'ForgotPassword',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  // void login(context) async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     isLoadding = true;
  //   });
  //   final response =
  //       await LoginApi.login(email: email.text, password: password.text);
  //   if (response['status_api']) {
  //     await prefs.setString('token', response['token']);

  //     Future.delayed(Duration(seconds: 3), () {
  //       setState(() {
  //         isLoadding = false;
  //       });
  //       if (response['data']['firstName'] == 'allserve') {
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => AllServeHome()));
  //       } else if (response['data']['firstName'] == 'alljob') {
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => AlljobHome()));
  //       } else if (response['data']['firstName'] == 'allpartner') {
  //         Navigator.pushReplacement(context,
  //             MaterialPageRoute(builder: (context) => AllPartnerHome()));
  //       } else {
  //         Navigator.pushReplacement(context,
  //             MaterialPageRoute(builder: (context) => AllPartnerHome()));
  //       }
  //     });
  //   } else {
  //     print(response);
  //   }
  // }
}
