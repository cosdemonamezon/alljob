import 'package:alljob/Screen/Alljob/Companies/CompanyScreen.dart';
import 'package:alljob/Screen/Alljob/Job/JobDetail.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/ImageCarouselWidget.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/JobCarouselWidget.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/SlidelJobWidget.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/TipsCarouselWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  JobScreen({Key? key}) : super(key: key);

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  List<String> joblist = [
    'รับสมัครงาน ตำแหน่งโปรแกรมเมอร์',
    'รับสมัครงาน แอดมิน',
    'ตำแหน่งงานว่างหลายตำแหน่ง',
    'รับพนักงานใหม่ หลายอัตตรา',
    'รับสมัครงาน ตำแหน่งช่าง',
    'สมัครงานหลายตำแหน่ง',
    'รับสมัคร',
    'รับสมัครงาน ที่นิคม',
    'รับสมัครงานหลายอัตตรา',
    'รับสมัครงานนะครับ'
  ];

  List slide = ['assets/images/HR.png', 'assets/images/HRR2.png'];
  List<Map<String, dynamic>> jobpartner = [
    {'name': 'Microsoft', 'img': 'assets/icons/microsoft.png'},
    {'name': 'XBOX', 'img': 'assets/icons/xbox.png'},
    {'name': 'Amazon', 'img': 'assets/icons/amazonlogo.png'},
    {'name': 'LG', 'img': 'assets/icons/lg.png'}
  ];
  List<Map<String, dynamic>> imageList = [
    {'img': 'assets/images/Interesting.png'},
    {'img': 'assets/images/resume.png'},
    {'img': 'assets/images/profiletips.png'},
    {'img': 'assets/images/images1.png'},
    {'img': 'assets/images/images2.png'},
    {'img': 'assets/images/images3.png'}
  ];
  List<Map<String, dynamic>> tips = [
    {
      'title': 'องค์กรควรทำ 5 ส.',
      'img': 'assets/images/image26.png',
      'subtitle':
          'กิจกรรม 5ส เป็นกระบวนการหนึ่งที่เป็นระบบมีแนวปฏิบัติ ที่เหมาะสมสามารถนำมาใช้เพื่อปรับปรุงแก้ไขงานและรักษาสิ่งแวดล้อมในสถานที่ทำงานให้ดีขึ้น',
    },
    {
      'title':
          'หากคุณต้องการเปลี่ยนทักษะการขายของคุณให้เป็นไปตามมาตรฐานองค์กรระดับโลก',
      'img': 'assets/images/image27.png',
      'subtitle':
          'เชิญคุณมาเรียนรู้เคล็ดลับที่จะเปลี่ยนคุณจากสถานภาพนักขายที่ต้องวิ่งไล่ล่าลูกค้า ให้กลายมาเป็นที่ปรึกษาที่ใคร ๆ ก็ต้องเรียกตัว นี่คือคอร์สที่มีเนื้อหาจากการทดลองทำจริงกว่า 15 ปี รวบรวมเนื้อหาและประสบการณ์ตรงจาก Sales Director',
    },
    {
      'title': '8 กลยุทธ์เด็ดเพิ่มยอดขายให้ทีมขาย ด้วยระบบ CRM',
      'img': 'assets/images/image28.png',
      'subtitle':
          'การแพร่ระบาดของโรคกลายเป็นปัญหาของโลกที่กำลังเจอกับปัญหาเศรษฐกิจที่พ่วงท้ายมากับโรคระบาด ทั้งธุรกิจออนไลน์หรือออฟไลน์ต่างได้รับผลกระทบเรื่องยอดขายตกกันทั้งนั้น!',
    },
    {
      'title':
          'เข้าถึงกลุ่มเป้าหมายใหม่และขับเคลื่อนผลลัพธ์ให้มีประสิทธิภาพมากขึ้นด้วยตัวจัดการโฆษณา TikTok',
      'img': 'assets/images/images25.png',
      'subtitle':
          'วิเคราะห์ข้อมูลที่ลูกค้า และ ผู้มีอิทธิพลทางความคิด (KOL) กล่าวถึงแบรนด์ของคุณในรูปแบบกราฟ',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Job List'),
      // ),
      body: SafeArea(
        child: CustomScrollView(
          primary: true,
          shrinkWrap: false,
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 300,
              elevation: 0.5,
              floating: true,
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
              title: Text(
                'All Job',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.sort, color: Colors.black87),
                onPressed: () {},
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 7),
                        height: 360,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {},
                      ),
                      items: slide.map((i) {
                        return SlidelJobWidget(slide: i);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("TOP COMPANIES",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        // MaterialButton(
                        //   onPressed: () {},
                        //   shape: StadiumBorder(),
                        //   color:
                        //       Color.fromARGB(255, 17, 95, 81).withOpacity(0.1),
                        //   elevation: 0,
                        //   child: Text("View All",
                        //       style: TextStyle(fontWeight: FontWeight.w600)),
                        // ),
                      ],
                    ),
                  ),
                  JobCarouselWidget(
                    jobpartner: jobpartner,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CompanyScreen()));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("HIGHLIGHT JOBS",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  ImageCarouselWidget(
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JobDetail()));
                    },
                    image: imageList,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("TIPS & UPDATES",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        MaterialButton(
                          onPressed: () {},
                          shape: StadiumBorder(),
                          color:
                              Color.fromARGB(255, 17, 95, 81).withOpacity(0.1),
                          elevation: 0,
                          child: Text("ดูทั้งหมด",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                  TipsCarouselWidget(
                    tips: tips,
                  ),
                  SizedBox(
                    height: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 10),
        //         child: SearchTextField(),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       ListView.builder(
        //         shrinkWrap: true,
        //         physics: NeverScrollableScrollPhysics(),
        //         itemCount: 10,
        //         itemBuilder: (BuildContext context, int i) {
        //           return Padding(
        //             padding: EdgeInsets.symmetric(vertical: 3),
        //             child: ListCard(
        //               title: joblist[i],
        //               press: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => JobDetail()));
        //               },
        //             ),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
