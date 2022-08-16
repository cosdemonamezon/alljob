import 'dart:ui';

import 'package:alljob/Screen/Alljob/Job/ActivityScreen.dart';
import 'package:alljob/Screen/Alljob/Job/SendHistoryFile.dart';
import 'package:alljob/Screen/Alljob/Job/ShortHistory.dart';
import 'package:alljob/Screen/Alljob/Job/VisionScreen.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/ListJobCompanies.dart';
import 'package:alljob/Screen/Widgets/ButtonJobSelect.dart';
import 'package:alljob/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetail extends StatefulWidget {
  JobDetail({Key? key}) : super(key: key);

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> with TickerProviderStateMixin {
  late TabController _tabController;
  void launchEmailSubmission() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'demonridercos@gmail.com',
        queryParameters: {
          'subject': 'Default Subject',
          'body': 'Default body'
        });
    String url = params.toString();
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void launchTel() async {
    String url = 'tel://0922568260';
    if (url != '') {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('บริษัท อาชาเทคโนโลยี Ltd.'),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'รายละเอียด'),
              Tab(text: 'สมัครงาน'),
              Tab(text: 'เกียวกับบริษัท'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: Color.fromARGB(255, 218, 216, 216),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFFF3F3F3),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '30 มิ.ย 65',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Digital Infamation Service',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.place,
                                    color: Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'ประเวศ กรุงเทพฯ มหานคร',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 55),
                                  child: Text(
                                    '3 ก.ม (จากตำแน่งของคุณ)',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.paid,
                                    color: Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'ยังไม่ระบุเงินเดือน',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.ondemand_video,
                                    color: Colors.blue,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "สัมภาษณ์งานออนไลน",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.reply,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'รายละเอียดของงาน',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'หน้าที่ความรับผิดชอบ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Text(
                              'สนับสนุน งานภายใน ติดต่อประสานงาน ดูแลอุปรณ์เครื่องมือภายในสำนักงาน',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'ลักษณะงานที่ต้องปฏิบัติ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '1. สนับสนุน งานภายใน งานซ่อมบำรุง ดูแลอุปรณ์เครื่องมือภายในสำนักงาน',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2. นำเสนอสินค้าของบริษัท',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '3. อบรมเกี่ยวกับสินค้า และเทคโนโลยีที่เกี่ยวข้อง ตามที่ได้รับมอบหมาย',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4. พัฒนาความรู้เกี่ยวกับผลิตภัณฑ์ ของบริษัท',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('ความรู้ความสามารถเฉพาะทาง',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '1. มีความสามารถในการใช้งาน โปรแกรม Word Excel Microsoft .Net Java PHP Mobile Application',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2. มีประสบการณ์ในการทำงานด้านเขียนโปรแกรม สามปี',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '3. สามารถตรวจเช็คอุปกรณ์ และสามารถซ่อมแซมอุปกรณ์ที่เกี่ยวกับคอมพิวเตอร์ได้',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4. หากได้ภาษาอังกฤษ จะพิจารณาเป็นพิเศษ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('สวัสดิการ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '1. มีท่องเที่ยวประจำปี',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2. ปรับเงินเดือน',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '3. ค่าล่วงเวลา ค่าทำ OT ต่างๆ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4. ค่าษาพยาบาลปีละ 150,000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '5. ประกันอุบัติเหตุอีก 3 ล้านบาท',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('วิธีการสมัคร',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '- ส่ง Resume ผ่าน Email',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '- สมัครผ่าน AllServe',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('ติดต่อ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'คุณ HR (แผนกทัพยากรบุคคล)',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'อาชาเทค',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ถนนลาดกระบัง ประเวศ กรุงเทพมหานคร',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'โทรศัพท์: 02-889-9545 ต่อ 4554, 4444',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'อีเมล: asha@job.allserv.com (อีเมลนี้ใช้สำหรับสมัครงานผ่าน Allserve เท่านั้น)',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('สถานที่ปฏิบัติงาน',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ลาดกระบัง กรุงเทพฯ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('การเดินทาง',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ชึ้นรถไฟฟ้า แอร์พ็อตเรียลลิ้งค์ มาลงที่สถานีลาดกระบังแล้วต่อ สองแถวสาย 15 สีแดงมาลงที่ซอย ข้างโรงบาล บริษัทจะอยู่ทางด้านซ้ายมือ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            // Tab2
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'เลือกวิธีการสมัคร',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.65,
                        child: ButtonJobSelect(
                          text: 'สมัครด่วน',
                          color: Colors.blue,
                          textColor: Colors.white,
                          iconImage: 'assets/icons/note-text.svg',
                          iconColor: Colors.white,
                          onPressed: () {
                            launchTel();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.65,
                        child: ButtonJobSelect(
                          text: 'ส่งไฟล์ประวัติ',
                          color: Colors.blue,
                          textColor: Colors.white,
                          iconImage: 'assets/icons/note-text.svg',
                          iconColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SendHistoryFile()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.65,
                        child: ButtonJobSelect(
                          text: 'ส่งอีเมล',
                          color: Colors.blue,
                          textColor: Colors.white,
                          iconImage: 'assets/icons/note-text.svg',
                          iconColor: Colors.white,
                          onPressed: () {
                            launchEmailSubmission();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.65,
                        child: ButtonJobSelect(
                          text: 'กรอกประวัติแบบย่อ',
                          color: Colors.blue,
                          textColor: Colors.white,
                          iconImage: 'assets/icons/note-text.svg',
                          iconColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShortHistory()));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //tab 3
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      'ข้อมูลบริษัท',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 230,
                      //color: Colors.blue,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 35,
                              left: 10,
                              child: Material(
                                child: Container(
                                  height: 180.0,
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          offset: Offset(0, 0),
                                          blurRadius: 20.0,
                                          spreadRadius: 4.0,
                                        ),
                                      ]),
                                ),
                              )),
                          Positioned(
                            top: 0,
                            left: 15,
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.grey.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: 200,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/gettyimages.png")),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 155,
                            child: Container(
                              height: 150,
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "บริษัท อาชาเทค",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF363f93)),
                                  ),
                                  Text(
                                    "รับเขียนโปแกรม แอพพลิเคชั่น โมบาย, งานไอทีและเทคโนโลยีทุกรูปแบบ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: (){
                                          launchEmailSubmission();
                                        }, 
                                        icon: Icon(Icons.email)),
                                      SizedBox(
                                        width:10,
                                      ),
                                      IconButton(
                                        onPressed: (){
                                          launchTel();
                                        }, 
                                        icon: Icon(Icons.phone)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('การกำกับดูแลกิจการ'),
                            subtitle: Text(
                              comData,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: jobCom
                          .map((data) => ListJobCompanies(
                                companydata: data,
                                use: true,
                                press: () {
                                  if (data['rating'] == '4.8') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VisionScreen()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityScreen()));
                            }
                                },
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       height: size.height * 0.08,
                    //       width: size.width * 0.30,
                    //       //color: Colors.red,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.grey),
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(10),
                    //             topRight: Radius.circular(10)),
                    //       ),
                    //       child: Center(
                    //         child: Text('แผนที่'),
                    //       ),
                    //     ),

                    //   ],
                    // ),
                    // Container(
                    //   height: size.height * 0.25,
                    //   width: double.infinity,
                    //   child: Image.asset(
                    //     'assets/images/function.png',
                    //     fit: BoxFit.fill,
                    //   ),
                    //   //color: Colors.green,
                    //   // child: Center(
                    //   //   child: Text('Map', style: TextStyle(fontSize: 25),),
                    //   // ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
