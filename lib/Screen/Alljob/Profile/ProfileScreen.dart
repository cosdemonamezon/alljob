import 'dart:developer';

import 'package:alljob/Screen/Alljob/Notification/NotificationScreen.dart';
import 'package:alljob/Screen/Alljob/Profile/ProfileDetailScreen.dart';
import 'package:alljob/Screen/Alljob/Profile/SetAbout.dart';
import 'package:alljob/Screen/Alljob/Profile/SetAddress.dart';
import 'package:alljob/Screen/Alljob/Profile/SetEducationalRecord.dart';
import 'package:alljob/Screen/Alljob/Profile/SetHelp.dart';
import 'package:alljob/Screen/Alljob/Profile/SetLanguage.dart';
import 'package:alljob/Screen/Alljob/Profile/SetPayment.dart';
import 'package:alljob/Screen/Alljob/Profile/Widgets/CustomButton.dart';
import 'package:alljob/Screen/Alljob/Profile/Widgets/SettingMenu.dart';
import 'package:alljob/Screen/Login/WelcomeScreen.dart';
import 'package:alljob/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/AppController.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, controller, child) {
        final size = MediaQuery.of(context).size;
        final appFontSize = AppFontSize.of(context);
        final user = context.read<AppController>().user;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Stack(
                  children: [
                    Container(
                      height: size.height / 6,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: size.height / 6,
                          width: size.width,
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(left: size.height / 40, right: size.height / 40, top: size.height * 0.01),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: user!.image != null
                                      ? Container(
                                          margin: const EdgeInsets.only(right: 10),
                                          height: size.width > 700 ? 70 : 50,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(user.image!),
                                                fit: BoxFit.cover,
                                              )),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.only(right: 10),
                                          height: size.width > 700 ? 70 : 50,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage('assets/icons/user.png'),
                                                fit: BoxFit.cover,
                                              )),
                                        )),
                              Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user.name ?? '',
                                      style: TextStyle(
                                        fontSize: appFontSize?.body,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => ProfileDetailScreen()));
                                      },
                                      child: Text(
                                        'แก้ไขข้อมูล',
                                        style: TextStyle(
                                          fontSize: appFontSize?.body3,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Divider(color: Colors.grey),

                        TitleTextWidget(title: 'บัญชีของฉัน', size: size),
                        SettingMenu(
                          title: 'ประวัติการศึกษา',
                          image: 'user',
                          page: SetEducationalRecord(
                            id: user.id?.toInt(),
                          ),
                        ),
                        Divider(color: Colors.grey),
                        SettingMenu(
                          title: 'จัดการที่อยู่',
                          image: 'mapSetting',
                          page: SetAddress(),
                        ),
                        Divider(color: Colors.grey),
                        SettingMenu(
                          title: 'ภาษา',
                          image: 'translate',
                          page: SetLanguage(),
                        ),
                        Divider(color: Colors.grey),
                        TitleTextWidget(title: 'ตั้งค่าแอป', size: size),
                        SettingMenu(
                          title: 'แจ้งเตือน',
                          image: 'notificationSetting',
                          page: NotificationScreen(),
                        ),
                        Divider(color: Colors.grey),
                        SettingMenu(
                          title: 'ข้อมูลบัตรเครดิต/เดบิต',
                          image: 'wallet',
                          page: SetPayment(),
                        ),
                        Divider(color: Colors.grey),
                        TitleTextWidget(title: 'ข้อมูล', size: size),
                        SettingMenu(
                          title: 'ช่วยเหลือ',
                          image: 'questionSetting',
                          page: SetHelp(),
                        ),
                        Divider(color: Colors.grey),
                        SettingMenu(
                          title: 'เกี่ยวกับเรา',
                          image: 'copyright',
                          page: SetAbout(),
                        ),
                        Divider(color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // bottomNavigationBar: ButtonRounded(
          //   text: 'ออกจากระบบ',
          //   color: Colors.blue,
          //   textColor: Colors.white,
          //   onPressed: (){
          //           Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(
          //           builder: (BuildContext context) => WelcomeScreen(),
          //         ),
          //         (route) => false,
          //       );
          //   },
          // ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: CustomButton(
              color: Colors.white,
              borderOnly: true,
              text: 'ออกจากระบบ',
              onPressed: () async {
                logOut(context);
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => WelcomeScreen(),
                //   ),
                //   (route) => false,
                // );
              },
            ),
          ),
        );
      },
    );
  }

  logOut(context) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomeScreen(),
      ),
      (route) => false,
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.size, required this.title}) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
