import 'dart:io';

import 'package:alljob/Screen/Alljob/Job/Widgets/RecordTexForm.dart';
import 'package:alljob/Screen/Widgets/ButtonRounded.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendHistoryFile extends StatefulWidget {
  SendHistoryFile({Key? key}) : super(key: key);

  @override
  State<SendHistoryFile> createState() => _SendHistoryFileState();
}

class _SendHistoryFileState extends State<SendHistoryFile> {
  bool isChecked = false;
  final GlobalKey<FormState> recordFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ส่งไฟล์ประวัติ'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Form(
                key: recordFormKey,
                child: Wrap(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        'อีเมลของคุณ(สำหรับติดต่อ) *',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: RecordTextForm(
                        controller: username,
                        hintText: 'ระบุอีเมลของคุณ',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.75,
                        child: ButtonRounded(
                          text: 'เลือกไฟล์ (ทั้งหมดไม่เกิน 5 MB)',
                          color:
                              file != null ? Colors.redAccent : Colors.blue,
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          onPressed: () async {
                            result = await FilePicker.platform.pickFiles();
                            setState(() {
                              if (result != null) {
                                file = result!.files.first;
                                print(file);
                              } else {
                                print('No file');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text('เฉพาะ PNG JPG JPEG PDF (ไม่จำกัดจำนวนไฟล์)'),
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            'ยอมรับเงื่อนไขข้อตกลงการใช้บริการและนโยบายของ AllServe',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.65,
                        child: ButtonRounded(
                          text: 'สมัครงาน',
                          color: Colors.blue,
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: Text(
                                  'ดำเนินการเรียบร้อย',
                                  //style: TextStyle(fontFamily: fontFamily),
                                ),
                                content: Text(
                                  'ต้องการออกจากหน้านี้หรือไม่',
                                  //style: TextStyle(fontFamily: fontFamily),
                                ),
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    child: Text(
                                      'ยกเลิก',
                                      // style: TextStyle(
                                      //   color: kThemeTextColor,
                                      //   fontFamily: fontFamily,
                                      //   fontWeight: FontWeight.bold,
                                      // ),
                                    ),
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text(
                                      'ตกลง',
                                      // style: TextStyle(
                                      //   color: kThemeTextColor,
                                      //   fontFamily: fontFamily,
                                      // ),
                                    ),
                                    onPressed: () => Navigator.of(context)
                                      ..pop()
                                      ..pop()
                                      ..pop()
                                      ..pop(),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
