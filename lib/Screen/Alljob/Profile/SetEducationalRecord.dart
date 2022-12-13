import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/PhoneFieldWidget.dart';
import '../../Widgets/TextFieldWidget.dart';

class SetEducationalRecord extends StatefulWidget {
  const SetEducationalRecord({super.key});

  @override
  State<SetEducationalRecord> createState() => _SetEducationalRecordState();
}

class _SetEducationalRecordState extends State<SetEducationalRecord> {
  final GlobalKey<FormState> profileForm = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติการศึกษา',
            style: TextStyle(fontWeight: FontWeight.bold)),
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
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.blueAccent.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, -5)),
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
                          onPressed: () => Navigator.pop(context, true),
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
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
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
          primary: true,
          children: [
            TextFieldWidget(
              onSaved: (input) => username.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: username.text,
              hintText: "",
              labelText: "มหาวิทยาลัย",
              iconData: Icons.person_outline,
            ),
            TextFieldWidget(
              onSaved: (input) => address.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: address.text,
              hintText: "",
              labelText: "สาขาที่จบ",
              iconData: Icons.map_outlined,
            ),
            TextFieldWidget(
              onSaved: (input) => username.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: username.text,
              hintText: "0.00",
              labelText: "เกรดเฉลี่ย",
              iconData: Icons.person_outline,
            ),
            TextFieldWidget(
              onSaved: (input) => address.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: address.text,
              hintText: "2665",
              labelText: "ปีจบการศึกษา",
              iconData: Icons.map_outlined,
            ),
            TextFieldWidget(
              onSaved: (input) => username.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: username.text,
              hintText: "",
              labelText: "ระดับภาษาไทย",
              iconData: Icons.person_outline,
            ),
            TextFieldWidget(
              onSaved: (input) => address.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: address.text,
              hintText: "",
              labelText: "ระดับภาษาอังกฤษ",
              iconData: Icons.map_outlined,
            ),
            TextFieldWidget(
              onSaved: (input) => username.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: username.text,
              hintText: "",
              labelText: "ระดับภาษาจีน",
              iconData: Icons.person_outline,
            ),
            TextFieldWidget(
              onSaved: (input) => username.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: username.text,
              hintText: "",
              labelText: "ระดับภาษาญี่ปุ่น",
              iconData: Icons.person_outline,
            ),
            TextFieldWidget(
              onSaved: (input) => username.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: username.text,
              hintText: "",
              labelText: "ตำแหน่งที่ต้องการ",
              iconData: Icons.person_outline,
            ),
            TextFieldWidget(
              onSaved: (input) => address.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: address.text,
              hintText: "",
              labelText: "เงินเดือนที่ต้องการ",
              iconData: Icons.map_outlined,
            ),
            TextFieldWidget(
              onSaved: (input) => username.text = input!,
              validator: (input) =>
                  input!.length < 3 ? "Should be more than 3 letters" : null,
              initialValue: username.text,
              style: TextStyle(),
              keyboardType: TextInputType.multiline,
              hintText: "",
              labelText: "อธิบายเกี่ยวกับตัวเอง",
              iconData: Icons.person_outline,
            ),
          ],
        ),
      ),
    );
  }
}
