import 'dart:developer';
import 'dart:io';

import 'package:alljob/Screen/Alljob/AlljobHome.dart';
import 'package:alljob/Screen/Register/Widgets/RegisTextField.dart';
import 'package:alljob/Screen/Widgets/BackButtonWithOrIcon.dart';
import 'package:alljob/Screen/Widgets/ButtonRounded.dart';
import 'package:alljob/Screen/otpScreen/otpPage.dart';
import 'package:alljob/appTheme.dart';
import 'package:alljob/constants.dart';
import 'package:alljob/extension/dateExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/TextFieldWidget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController? email = TextEditingController();
  final TextEditingController? password = TextEditingController();
  // final TextEditingController birthday = TextEditingController();
  final TextEditingController? confirmpassword = TextEditingController();
  final TextEditingController? firstname = TextEditingController();
  // final TextEditingController? lastname = TextEditingController();
  final TextEditingController? phone = TextEditingController();
  bool isLoadding = false;
  bool isObscureText = true;
  bool isObscureText2 = true;
  bool _errorPhone = false;
  Map<String, dynamic> userdata = {};

  String selectedSex = 'm';
  String selectedStatus = 'single';

  DateTime date = DateTime.now();

  @override
  void dispose() {
    // TODO: implement dispose
    email!.dispose();
    password!.dispose();
    confirmpassword!.dispose();
    firstname!.dispose();
    phone!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Image.asset(
            'assets/images/ALLZJOB.png',
            scale: 15,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: isLoadding == true
              ? Center(
                  child: SizedBox(
                    width: size.width / 1.5,
                    height: 300,
                    child: Image.asset("assets/images/645bf.gif"),
                  ),
                )
              : Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      constraints: BoxConstraints(maxWidth: 900),
                      child: Form(
                        key: registerFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // BackButtonWithOrIcon(),
                            // SizedBox(height: 22),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'สมัครสมาชิก',
                                style: TextStyle(
                                  fontSize: appFontSize?.title,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFieldRegisterWidget(
                                // onSaved: (input) => email.text = input!,
                                // initialValue: email.text,
                                controller: email,
                                hintText: "อีเมล",
                                labelText: "อีเมล*",
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return 'กรุณากรอกอีเมลล์';
                                  }
                                }),
                            // Text(
                            //   'อีเมล*',
                            //   style: TextStyle(fontSize: appFontSize?.body),
                            // ),
                            // SizedBox(height: 10),
                            // RegisTextField(
                            //   controller: email,
                            //   hintText: 'อีเมล',
                            //   validator: (value) {
                            //     if (value!.isEmpty || value == '') {
                            //       return 'กรุณากรอกอีเมลล์';
                            //     }
                            //   },
                            // ),
                            // SizedBox(height: 10),
                            TextFieldRegisterWidget(
                              // onSaved: (input) => firstname.text = input!,
                              initialValue: firstname?.text,
                              controller: firstname,
                              hintText: "ชื่อ - นามสกุล",
                              labelText: "ชื่อ - นามสกุล*",
                              validator: (value) {
                                if (value!.isEmpty || value == '') {
                                  return 'กรุณากรอกชื่อ - นามสกุล';
                                }
                              },
                            ),
                            // Text(
                            //   'ชื่อ - นามสกุล*',
                            //   style: TextStyle(fontSize: appFontSize?.body),
                            // ),
                            // SizedBox(height: 10),
                            // RegisTextField(
                            //   controller: firstname,
                            //   hintText: 'ชื่อ - นามสกุล',
                            //   validator: (value) {
                            //     if (value!.isEmpty || value == '') {
                            //       return 'กรุณากรอกชื่อ - นามสกุล';
                            //     }
                            //   },
                            // ),
                            SizedBox(height: 10),
                            TextFieldRegisterWidget(
                              // onSaved: (input) => firstname.text = input!,
                              hintText: date.formatTo('dd-MM-yyyy'),
                              // '${date.day}/${date.month}/${date.year}',
                              style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                              labelText: "วันเกิด(วว/ดด/ปปปป)*",
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));

                                    // Cancel
                                    if (newDate == null) return;

                                    setState(() {
                                      date = newDate;
                                    });
                                    print(date);
                                  },
                                  icon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.black,
                                  )),
                            ),

                            // Text(
                            //   'วว/ดด/ปปปป*',
                            //   style: TextStyle(fontSize: appFontSize?.body),
                            // ),
                            // SizedBox(height: 10),

                            // Container(
                            //   height: 50,
                            //   width: double.infinity,
                            //   padding: EdgeInsets.all(8),
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //         color:
                            //             Color.fromARGB(126, 158, 158, 158)),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(15)),
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         '${date.day}/${date.month}/${date.year}',
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           // fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //       GestureDetector(
                            //           onTap: () async {
                            //             DateTime? newDate =
                            //                 await showDatePicker(
                            //                     context: context,
                            //                     initialDate: date,
                            //                     firstDate: DateTime(1900),
                            //                     lastDate: DateTime(2100));

                            //             // Cancel
                            //             if (newDate == null) return;

                            //             setState(() {
                            //               date = newDate;
                            //             });
                            //             print(date);
                            //           },
                            //           child: Icon(Icons.calendar_month))
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 10),
                            // TextField(
                            //   // autofocus: true,
                            //   readOnly: true,
                            //   decoration: InputDecoration(
                            //       contentPadding: EdgeInsets.all(10),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Colors.grey,
                            //           width: 0,
                            //         ),
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(15)),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Colors.blue,
                            //           width: 2,
                            //         ),
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(15)),
                            //       ),
                            //       prefix: Text(
                            //         ' ${date.day}/${date.month}/${date.year}',
                            //         style: TextStyle(
                            //           fontSize: 18,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //       suffix: GestureDetector(
                            //           onTap: () async {
                            //             DateTime? newDate =
                            //                 await showDatePicker(
                            //                     context: context,
                            //                     initialDate: date,
                            //                     firstDate: DateTime(1900),
                            //                     lastDate: DateTime(2100));

                            //             // Cancel
                            //             if (newDate == null) return;

                            //             setState(() {
                            //               date = newDate;
                            //             });
                            //             print(date);
                            //           },
                            //           child: Icon(Icons.calendar_month))),
                            // ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 14, left: 16, right: 20),
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.zero,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(0, 5)),
                                  ],
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.05))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '  เพศ',
                                    style:
                                        TextStyle(fontSize: appFontSize?.body),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('ชาย',
                                                style: TextStyle(fontSize: 15)),
                                            value: 'm',
                                            groupValue: selectedSex,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedSex = value.toString();
                                                print(selectedSex);
                                              });
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('หญิง',
                                                style: TextStyle(fontSize: 15)),
                                            value: 'f',
                                            groupValue: selectedSex,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedSex = value.toString();
                                                print(selectedSex);
                                              });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 14, left: 16, right: 20),
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.zero,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(0, 5)),
                                  ],
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.05))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '  สถานะ',
                                    style:
                                        TextStyle(fontSize: appFontSize?.body),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('โสด',
                                                style: TextStyle(fontSize: 15)),
                                            value: 'single',
                                            groupValue: selectedStatus,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedStatus =
                                                    value.toString();
                                                print(selectedStatus);
                                              });
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('สมรส',
                                                style: TextStyle(fontSize: 15)),
                                            value: 'married',
                                            groupValue: selectedStatus,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedStatus =
                                                    value.toString();
                                                print(selectedStatus);
                                              });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFieldRegisterWidget(
                              // onSaved: (input) => password.text = input!,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              controller: phone,
                              // initialValue: phone.text,
                              hintText: "เบอร์โทรศัพท์",
                              labelText: "เบอร์โทรศัพท์*",
                              errorText: _errorPhone
                                  ? 'หมายเลขโทรศัพท์นี้ถูกใช้งานแล้ว'
                                  : null,
                              validator: (value) {
                                if (value!.isEmpty || value == '') {
                                  return 'กรุณากรอกเบอร์โทรศัพท์';
                                } else if (_errorPhone) {
                                  return 'หมายเลขโทรศัพท์นี้ถูกใช้งานแล้ว';
                                }
                                return null;
                              },
                            ),
                            // Text(
                            //   'เบอร์โทรศัพท์*',
                            //   style: TextStyle(fontSize: appFontSize?.body),
                            // ),
                            // SizedBox(height: 10),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.only(top: 16.0),
                            //       child: Text(
                            //         '+66',
                            //         style: TextStyle(
                            //           fontSize: appFontSize?.body2,
                            //           color: Colors.black87,
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 8),
                            //     Expanded(
                            //       child: RegisTextField(
                            //         controller: phone,
                            //         hintText: 'เบอร์โทรศัพท์',
                            //         keyboardType: TextInputType.phone,
                            //         maxLength: 10,
                            //         isHideCounter: true,
                            //         validator: (value) {
                            //           if (value!.isEmpty || value == '') {
                            //             return 'กรุณากรอกเบอร์โทรศัพท์';
                            //           }
                            //         },
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(height: 10),
                            TextFieldRegisterWidget(
                              controller: password,
                              labelText: "รหัสผ่าน*",
                              hintText: "รหัสผ่าน",
                              // initialValue: password.text,
                              obscureText: isObscureText,
                              iconData: Icons.lock_outline,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                final regExp = RegExp(
                                  r'^(?=.*\d)(?=.*[a-zA-Z]).{0,}$',
                                );
                                if (value!.isEmpty || value == '') {
                                  return 'กรุณากรอกรหัสผ่าน';
                                }
                                if (value.length < 8 || value.length > 20) {
                                  return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                                }
                                if (value != confirmpassword!.text) {
                                  return 'รหัสผ่านไม่ตรงกัน';
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                      () => isObscureText = !isObscureText);
                                },
                                icon: Icon(!isObscureText
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                              ),
                            ),
                            // Text(
                            //   'รหัสผ่าน*',
                            //   style: TextStyle(fontSize: appFontSize?.body),
                            // ),
                            // SizedBox(height: 10),
                            // RegisTextField(
                            //   controller: password,
                            //   hintText: 'รหัสผ่าน',
                            //   isPassword: true,
                            //   validator: (value) {
                            //     if (value!.isEmpty || value == '') {
                            //       return 'กรุณากรอกรหัสผ่าน';
                            //     }
                            //   },
                            // ),
                            TextFieldRegisterWidget(
                              controller: confirmpassword,
                              labelText: "ยืนยันรหัสผ่าน*",
                              hintText: "ยืนยันรหัสผ่าน",
                              // initialValue: confirmpassword.text,
                              obscureText: isObscureText2,
                              iconData: Icons.lock_outline,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty || value == '') {
                                  return 'กรุณากรอกยืนยันรหัสผ่าน';
                                }
                                if (value.length < 8 || value.length > 20) {
                                  return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                                }
                                if (value != password!.text) {
                                  return 'รหัสผ่านไม่ตรงกัน';
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                      () => isObscureText2 = !isObscureText2);
                                },
                                icon: Icon(!isObscureText2
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                              ),
                            ),
                            // Text(
                            //   'ยืนยันรหัสผ่าน*',
                            //   style: TextStyle(fontSize: appFontSize?.body),
                            // ),
                            // SizedBox(height: 10),
                            // RegisTextField(
                            //   controller: confirmpassword,
                            //   hintText: 'ยืนยันรหัสผ่าน',
                            //   isPassword: true,
                            //   validator: (value) {
                            //     if (value!.isEmpty || value == '') {
                            //       return 'กรุณากรอกรหัสผ่าน';
                            //     }
                            //   },
                            // ),
                            // SizedBox(height: 10),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 45,
                                    child: GestureDetector(
                                      onTap: () async {
                                        print(email!.text);
                                        print(firstname!.text);
                                        print(date.formatTo('dd-MM-yyyy'));
                                        print(selectedSex);
                                        print(selectedStatus);
                                        print(phone!.text);
                                        print(password!.text);
                                        print(confirmpassword!.text);
                                        if (registerFormKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            userdata = {
                                              'username': email!.text,
                                              'name': firstname!.text,
                                              'email': email!.text,
                                              'phone': phone!.text,
                                              'birthday':
                                                  date.formatTo('dd-MM-yyyy'),
                                              'gender': selectedSex,
                                              'marital': selectedStatus,
                                              'password': password!.text,
                                              'confirmpassword':
                                                  confirmpassword!.text,
                                            };
                                          });
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return OtpPage(
                                              phone: phone!.text,
                                              userdata: userdata,
                                            );
                                          }));
                                          // Navigator.pushReplacement<void,
                                          //     void>(
                                          //   context,
                                          //   MaterialPageRoute<void>(
                                          //     builder:
                                          //         (BuildContext context) =>
                                          //             AlljobHome(),
                                          //   ),
                                          // );
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.blueAccent,
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 3))
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "สมัครสมาชิก",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: 100,
                            //   height: size.height / 7,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(height: 8),
                            //       ButtonRounded(
                            //         text: 'สมัครสมาชิก',
                            //         color: Colors.blue,
                            //         textColor: Colors.white,
                            //         onPressed: () async {
                            //           print(password.text);
                            //           print(confirmpassword.text);
                            //           // if (password.text ==
                            //           //     confirmpassword.text) {
                            //           if (registerFormKey.currentState!
                            //               .validate()) {
                            //             Navigator.push(context,
                            //                 MaterialPageRoute(
                            //                     builder: (context) {
                            //               return OtpPage();
                            //             }));
                            //             // Navigator.pushReplacement<void,
                            //             //     void>(
                            //             //   context,
                            //             //   MaterialPageRoute<void>(
                            //             //     builder:
                            //             //         (BuildContext context) =>
                            //             //             AlljobHome(),
                            //             //   ),
                            //             // );
                            //           }
                            //           // } else {
                            //           //   Fluttertoast.showToast(
                            //           //       msg:
                            //           //           "password and confirm password is not match!");
                            //           // }
                            //         },
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).viewInsets.bottom *
                            //       0.4,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // void register(context) async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     isLoadding = true;
  //   });
  //   final response = await RegisterApi.register(
  //       email: email.text,
  //       password: password.text,
  //       firstname: firstname.text,
  //       lastname: lastname.text);
  //   if (response['status_api']) {
  //     inspect(response);
  //     await prefs.setString('token', response['token']);
  //     Future.delayed(Duration(seconds: 3), () {
  //       setState(() {
  //         isLoadding = false;
  //       });
  //       Navigator.pushReplacement<void, void>(
  //         context,
  //         MaterialPageRoute<void>(
  //           builder: (BuildContext context) => AlljobHome(),
  //         ),
  //       );
  //     });
  //   } else {
  //     print(response);
  //   }
  // }
}
