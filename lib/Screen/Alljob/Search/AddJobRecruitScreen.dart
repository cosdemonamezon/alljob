
import 'package:alljob/Screen/Alljob/Profile/Widgets/AddTextForm.dart';
import 'package:alljob/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddJobRecruitScreen extends StatefulWidget {
  AddJobRecruitScreen({Key? key}) : super(key: key);

  @override
  State<AddJobRecruitScreen> createState() => _AddJobRecruitScreenState();
}

class _AddJobRecruitScreenState extends State<AddJobRecruitScreen> {
  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  int val = 0;
  String dayvalue = 'วัน';
  String mounthvalue = 'เดือน';
  String yearvalue = 'ปี';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มงานที่ต้องการสมัคร',
          //style: TextStyle(color: Colors.deepOrange),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xFFF3F3F3),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: addFormKey,
                          child: Wrap(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'ตำแหน่งงานที่ต้องการสมัคร',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: username,
                                hintText: '',
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'เงินเดือนที่ต้องการ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: username,
                                hintText: '',
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'ระบุวุฒิการศึกษา',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: username,
                                hintText: '',
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'เบอร์โทรติดต่อ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: username,
                                hintText: '',
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'ระบุพื้นที่ที่ต้องการสมัครงาน',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: username,
                                hintText: '',
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  'เพศ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = int.parse(value.toString());
                                        });
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text("ชาย"),
                                    Radio(
                                      value: 2,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = int.parse(value.toString());
                                        });
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                    Text("หญิง"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'ที่อยู่ของคุณ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: username,
                                hintText: '',
                                maxLines: 4,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'เกี่ยวกับผู้สมัคร',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: username,
                                hintText: '',
                                maxLines: 4,
                              ),
                              SizedBox(height: 25),
                              ButtonRounded(
                                text: 'บันทึก',
                                color: Colors.blue,
                                textColor: Colors.white,
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
                                            ..pop(),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
