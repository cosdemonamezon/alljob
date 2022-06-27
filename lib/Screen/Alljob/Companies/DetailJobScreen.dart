
import 'package:alljob/Screen/Widgets/ButtonJobSelect.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailJobScreen extends StatefulWidget {
  DetailJobScreen({Key? key}) : super(key: key);

  @override
  State<DetailJobScreen> createState() => _DetailJobScreenState();
}

class _DetailJobScreenState extends State<DetailJobScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('บริษัท อาชาเทคโนโลยี Ltd.'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                                  fontSize: 14, fontWeight: FontWeight.w400),
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
                                  fontSize: 14, fontWeight: FontWeight.w400),
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
                                  fontSize: 14, fontWeight: FontWeight.w400),
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
                                  fontSize: 14, fontWeight: FontWeight.w400),
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
              Row(
                children: [
                  Text(
                    'รายละเอียดของงาน',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'หน้าที่ความรับผิดชอบ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                'สนับสนุน งานภายใน ติดต่อประสานงาน ดูแลอุปรณ์เครื่องมือภายในสำนักงาน',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '1. สนับสนุน งานภายใน งานซ่อมบำรุง ดูแลอุปรณ์เครื่องมือภายในสำนักงาน',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2. นำเสนอสินค้าของบริษัท',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '3. อบรมเกี่ยวกับสินค้า และเทคโนโลยีที่เกี่ยวข้อง ตามที่ได้รับมอบหมาย',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '4. พัฒนาความรู้เกี่ยวกับผลิตภัณฑ์ ของบริษัท',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text('ความรู้ความสามารถเฉพาะทาง',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '1. มีความสามารถในการใช้งาน โปรแกรม Word Excel Microsoft .Net Java PHP Mobile Application',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2. มีประสบการณ์ในการทำงานด้านเขียนโปรแกรม สามปี',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '3. สามารถตรวจเช็คอุปกรณ์ และสามารถซ่อมแซมอุปกรณ์ที่เกี่ยวกับคอมพิวเตอร์ได้',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '4. หากได้ภาษาอังกฤษ จะพิจารณาเป็นพิเศษ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('สวัสดิการ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '1. มีท่องเที่ยวประจำปี',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2. ปรับเงินเดือน',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '3. ค่าล่วงเวลา ค่าทำ OT ต่างๆ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '4. ค่าษาพยาบาลปีละ 150,000',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '5. ประกันอุบัติเหตุอีก 3 ล้านบาท',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('วิธีการสมัคร',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '- ส่ง Resume ผ่าน Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '- สมัครผ่าน AllServe',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'คุณ HR (แผนกทัพยากรบุคคล)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'อาชาเทค',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ถนนลาดกระบัง ประเวศ กรุงเทพมหานคร',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'โทรศัพท์: 02-889-9545 ต่อ 4554, 4444',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'อีเมล: asha@job.allserv.com (อีเมลนี้ใช้สำหรับสมัครงานผ่าน Allserve เท่านั้น)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('สถานที่ปฏิบัติงาน',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ลาดกระบัง กรุงเทพฯ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('การเดินทาง',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ชึ้นรถไฟฟ้า แอร์พ็อตเรียลลิ้งค์ มาลงที่สถานีลาดกระบังแล้วต่อ สองแถวสาย 15 สีแดงมาลงที่ซอย ข้างโรงบาล บริษัทจะอยู่ทางด้านซ้ายมือ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.30,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text('แผนที่'),
                    ),
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    //color: Colors.blue,
                    child: Center(
                      child: Text('แผนภาพ'),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height * 0.25,
                width: double.infinity,
                child: Image.asset('assets/images/function.png',fit: BoxFit.fill,),
                // color: Colors.green,
                // child: Center(
                //   child: Text('Map', style: TextStyle(fontSize: 25),),
                // ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'เลือกวิธีการสมัคร',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.deepOrange,
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () async {
                      launch(
                          'mailto:demonridercos@gmail.com?subject=Test Email&body=Test Description');
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
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
