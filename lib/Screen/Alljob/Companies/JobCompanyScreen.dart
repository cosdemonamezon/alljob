
import 'package:alljob/Screen/Alljob/Companies/Widgets/ListCompanyJob.dart';
import 'package:alljob/Screen/Alljob/Job/JobDetail.dart';
import 'package:alljob/appTheme.dart';
import 'package:flutter/material.dart';

class JobCompanyScreen extends StatefulWidget {
  JobCompanyScreen({Key? key}) : super(key: key);

  @override
  State<JobCompanyScreen> createState() => _JobCompanyScreenState();
}

class _JobCompanyScreenState extends State<JobCompanyScreen> {
  List jobdata = [
    {
      "title": "รับสมัครงาน โปรแกรมเมอร์",
      "imageUrl": "assets/icons/user.png",
      "rating": "4.8",
      "detail": "รับสมัครงาน โปรแกรมเมอร์หลายอัตตรา",
      "vacancy": "จำนวน 1 ตำแหน่ง"
    },
    {
      "title": "รับสมัครงาน Admin",
      "imageUrl": "assets/icons/user.png",
      "rating": "4.8",
      "detail": "รับสมัครงานแอดมินประสบการ์ณ์ 3 ปี",
      "vacancy": "จำนวน 4 ตำแหน่ง"
    },
    {
      "title": "รับสมัครงาน ช่างหลายอัตตรา",
      "imageUrl": "assets/icons/user.png",
      "rating": "4.8",
      "detail": "รับวุฒิการศึกษา ป.ตรี เงินเดือน 20,000",
      "vacancy": "จำนวน 2 ตำแหน่ง"
    },
    {
      "title": "รับสมัครงาน แม่บ้าน",
      "imageUrl": "assets/icons/user.png",
      "rating": "4.8",
      "detail": "รับสมัครงานแม่บ้าน วุฒิ ม.6 หลายอัตตรา",
      "vacancy": "จำนวน 6 ตำแหน่ง"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ตำแหน่งงานของบริษัทนี้',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: appFontSize?.appBarFont,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: jobdata
                  .map((e) => ListCompanyJob(
                        companydata: e,
                        use: true,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDetail()));
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
