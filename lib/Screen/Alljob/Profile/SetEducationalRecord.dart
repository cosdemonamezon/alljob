import 'dart:developer';

import 'package:alljob/Screen/Alljob/Profile/ProfileService.dart';
import 'package:alljob/models/userModel/userDetailJob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/LoadingDialog.dart';
import '../../Widgets/PhoneFieldWidget.dart';
import '../../Widgets/TextFieldWidget.dart';
import '../../app/AppController.dart';

class SetEducationalRecord extends StatefulWidget {
  SetEducationalRecord({super.key, this.id});
  int? id;
  @override
  State<SetEducationalRecord> createState() => _SetEducationalRecordState();
}

class _SetEducationalRecordState extends State<SetEducationalRecord> {
  final GlobalKey<FormState> profileForm = GlobalKey<FormState>();
  final TextEditingController? educate = TextEditingController();
  final TextEditingController? major = TextEditingController();
  // final TextEditingController degree = TextEditingController();
  final TextEditingController? grade = TextEditingController();
  final TextEditingController? finished = TextEditingController();
  final TextEditingController? thai = TextEditingController();
  final TextEditingController? english = TextEditingController();
  final TextEditingController? china = TextEditingController();
  final TextEditingController? japan = TextEditingController();
  final TextEditingController? exp = TextEditingController();
  final TextEditingController? position = TextEditingController();
  final TextEditingController? salary = TextEditingController();
  final TextEditingController? remark = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

  final List<String> _dropdownValues = [
    "ป.ตรี",
    "ป.โท",
    "ป.เอก",
  ];
  String? _selectedValue;

  @override
  void dispose() {
    // TODO: implement dispose
    educate?.dispose();
    major?.dispose();
    grade?.dispose();
    finished?.dispose();
    thai?.dispose();
    english?.dispose();
    china?.dispose();
    japan?.dispose();
    exp?.dispose();
    position?.dispose();
    salary?.dispose();
    remark?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, controller, child) {
        final user = context.read<AppController>().user;
        inspect(user);
        return Scaffold(
          appBar: AppBar(
            title: Text('ประวัติการศึกษา', style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text(
                            'ยืนยัน',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          content: Text(
                            'ยืนยันการบันทึก',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: Text(
                                'ยกเลิก',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                              onPressed: () => Navigator.pop(context, true),
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'ยืนยัน',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                // ),
                              ),
                              onPressed: () async {
                                try {
                                  LoadingDialog.open(context);
                                  await ProfileService().setInformationDetil(
                                    user_job_id: widget.id.toString(),
                                    location_of_educate: educate?.text,
                                    major: major?.text,
                                    degree: _selectedValue ?? '-',
                                    grade: grade?.text,
                                    finished: finished?.text,
                                    thai: thai?.text,
                                    english: english?.text,
                                    china: china?.text,
                                    japan: japan?.text,
                                    exp: exp?.text,
                                    position: position?.text,
                                    salary: salary?.text,
                                    remark: remark?.text,
                                  );
                                  if (mounted) {
                                    LoadingDialog.close(context);
                                    Navigator.of(context)
                                      ..pop()
                                      ..pop();
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
                            )
                          ],
                        ),
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                    elevation: 0,
                    highlightElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    child: Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 10),
                // MaterialButton(
                //   onPressed: () {},
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   color: Colors.white.withOpacity(0.1),
                //   elevation: 0,
                //   highlightElevation: 0,
                //   hoverElevation: 0,
                //   focusElevation: 0,
                //   child: Text("Reset", style: TextStyle(color: Colors.blue)),
                // ),
              ],
            ),
          ),
          body: Form(
            key: profileForm,
            child: ListView(
              // primary: true,
              children: [
                TextFieldRegisterWidget(
                  controller: educate,
                  hintText: user!.user_job_detail!.isNotEmpty && user.user_job_detail?[0].location_of_educate != null
                      ? user.user_job_detail![0].location_of_educate
                      : 'สถานศึกษาที่จบ',
                  labelText: "มหาวิทยาลัย",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกมหาวิทยาลัย';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: major,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].major != null
                      ? user.user_job_detail![0].major
                      : 'สาขาที่จบ',
                  labelText: "สาขาที่จบ",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกสาขาที่จบ';
                  //   }
                  // }
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text('ระดับการศึกษา'),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].major != null
                              ? Text(user.user_job_detail![0].degree!)
                              : Text(''),
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
                          items: _dropdownValues
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.75,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          isExpanded: false,
                          value: _selectedValue,
                          onChanged: (String? value) async {
                            setState(() {
                              _selectedValue = value!;
                              print(_selectedValue);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                TextFieldRegisterWidget(
                  controller: grade,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].grade != null
                      ? user.user_job_detail![0].grade
                      : '1.00',
                  labelText: "เกรดเฉลี่ย",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกเกรดเฉลี่ย';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: finished,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].finished != null
                      ? user.user_job_detail![0].finished
                      : '2565',
                  labelText: "ปีจบการศึกษา",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกปีจบการศึกษา';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: position,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].position != null
                      ? user.user_job_detail![0].position
                      : '',
                  labelText: "ตำแหน่งที่ต้องการ",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกตำแหน่ง';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: salary,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].salary != null
                      ? user.user_job_detail![0].salary
                      : '',
                  labelText: "เงินเดือนที่ต้องการ",
                  keyboardType: TextInputType.number,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกเงินเดือนที่ต้องการ';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: exp,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].exp != null
                      ? user.user_job_detail![0].exp
                      : '',
                  labelText: "ประสบการณ์การทำงาน",
                  keyboardType: TextInputType.multiline,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกประสบการณ์การทำงาน ถ้าไม่มีให้ขีด (-)';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  keyboardType: TextInputType.multiline,
                  controller: remark,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].remark != null
                      ? user.user_job_detail![0].remark
                      : '',
                  labelText: "อธิบายเกี่ยวกับตัวเอง",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกคำอธิบายเกี่ยวกับตัวเอง';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: thai,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].thai != null
                      ? user.user_job_detail![0].thai
                      : '',
                  labelText: "ระดับภาษาไทย",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกอีเมลล์';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: english,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].english != null
                      ? user.user_job_detail![0].english
                      : '',
                  labelText: "ระดับภาษาอังกฤษ",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกอีเมลล์';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: china,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].china != null
                      ? user.user_job_detail![0].china
                      : '',
                  labelText: "ระดับภาษาจีน",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกอีเมลล์';
                  //   }
                  // }
                ),
                TextFieldRegisterWidget(
                  controller: japan,
                  hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].japan != null
                      ? user.user_job_detail![0].japan
                      : '',
                  labelText: "ระดับภาษาญี่ปุ่น",
                  // keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value!.isEmpty || value == '') {
                  //     return 'กรุณากรอกอีเมลล์';
                  //   }
                  // }
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
