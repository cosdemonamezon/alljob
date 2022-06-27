import 'package:flutter/material.dart';

class ApplyWorkScreen extends StatefulWidget {
  ApplyWorkScreen({Key? key}) : super(key: key);

  @override
  State<ApplyWorkScreen> createState() => _ApplyWorkScreenState();
}

class _ApplyWorkScreenState extends State<ApplyWorkScreen> {
  List<Map<String, dynamic>> listApply = [
    {
      "imgurl":"assets/icons/copyright.png",
      "name":"สมัครด่วน"
    },
    {
      "imgurl":"assets/icons/calendarIcon.png",
      "name":"ส่งไฟล์ประวัติ"
    },
    {
      "imgurl":"assets/icons/mapSetting.png",
      "name":"ส่งอีเมล"
    },
    {
      "imgurl":"assets/icons/wallet.png",
      "name":"กรอกประวัติแบบย่อ"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST BKK Co. Ltd.'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('การเดินทาง')
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('- รถไฟฟ้า BTS สถานี xxx')
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('- รถไฟฟ้า MRT สถานี yyy')
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('- รถเมย์สาย 15, 76, 115, 164, 504, 506')
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('เลือกวิธีการสมัครงาน ?')
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}