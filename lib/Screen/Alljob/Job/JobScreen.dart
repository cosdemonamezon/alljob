import 'package:alljob/Screen/Alljob/Companies/CompanyScreen.dart';
import 'package:alljob/Screen/Alljob/Job/JobDetail.dart';
import 'package:alljob/Screen/Alljob/Job/PositionScreen.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/ImageCarouselWidget.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/JobCarouselWidget.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/SlidelJobWidget.dart';
import 'package:alljob/Screen/Alljob/Job/Widgets/TipsCarouselWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/AppController.dart';
import 'JobController.dart';
import 'detailCompany/detailCompany.dart';

class JobScreen extends StatefulWidget {
  JobScreen({Key? key}) : super(key: key);

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  late JobController jobController;
  @override
  void initState() {
    _loadItem();
    super.initState();
  }

  Future _loadItem() async {
    await context.read<JobController>().loadLogoCompay();
    await context.read<AppController>().initialize();
  }

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
  // List<Map<String, dynamic>> jobpartner = [
  //   {'name': 'Microsoft', 'img': 'assets/icons/microsoft.png'},
  //   {'name': 'XBOX', 'img': 'assets/icons/xbox.png'},
  //   {'name': 'Amazon', 'img': 'assets/icons/amazonlogo.png'},
  //   {'name': 'LG', 'img': 'assets/icons/lg.png'},
  //   {'name': 'LG', 'img': 'assets/icons/lg.png'},
  //   {'name': 'LG', 'img': 'assets/icons/lg.png'}
  // ];
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
      'title': 'หากคุณต้องการเปลี่ยนทักษะการขายของคุณให้เป็นไปตามมาตรฐานองค์กรระดับโลก',
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
      'title': 'เข้าถึงกลุ่มเป้าหมายใหม่และขับเคลื่อนผลลัพธ์ให้มีประสิทธิภาพมากขึ้นด้วยตัวจัดการโฆษณา TikTok',
      'img': 'assets/images/images25.png',
      'subtitle': 'วิเคราะห์ข้อมูลที่ลูกค้า และ ผู้มีอิทธิพลทางความคิด (KOL) กล่าวถึงแบรนด์ของคุณในรูปแบบกราฟ',
    }
  ];

  List<Map<String, dynamic>> poppular = [
    {
      'title': 'กรุงเทพ',
      'subtitle': '40,995',
    },
    {
      'title': 'ตะวันออก',
      'subtitle': '40,995',
    },
    {
      'title': 'นิคมอุตสาหกรรม',
      'subtitle': '40,995',
    },
    {
      'title': 'งานภาคกลาง',
      'subtitle': '40,995',
    },
    {
      'title': 'ภาคอีสาน',
      'subtitle': '40,995',
    },
    {
      'title': 'Work from Home',
      'subtitle': '40,995',
    },
    {
      'title': 'Online',
      'subtitle': '40,995',
    },
    {
      'title': 'ภาคเหนือ',
      'subtitle': '40,995',
    },
    {
      'title': 'ภาคใต้',
      'subtitle': '40,995',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<JobController>(
      builder: (context, controller, child) => Scaffold(
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
                // title: Text(
                //   'All Job',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                // leading: IconButton(
                //   icon: Icon(Icons.sort, color: Colors.black87),
                //   onPressed: () {},
                // ),
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
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        children: [
                          Expanded(child: Text("TOP COMPANIES", style: TextStyle(fontWeight: FontWeight.bold))),
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

                    Container(
                      height: 100,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ListView.builder(
                          // primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.logoCompay.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailCompany(
                                              id: controller.logoCompay[index].id!,
                                              name: controller.logoCompay[index].name!,
                                            )));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 60,
                                child: ClipOval(
                                    child: Image.network(
                                  controller.logoCompay[index].image!,
                                  width: 100,
                                  height: 100,
                                  errorBuilder: (context, error, stackTrace) => Center(
                                    child: Image.asset('assets/images/No_Image_Available.jpg'),
                                  ),
                                )),
                              ),
                              // child: Container(
                              //   padding: EdgeInsets.all(10),
                              //   child: ClipRRect(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(10)),
                              //     child: Image.network(
                              //       controller.logoCompay[index].image!,
                              //       height: 100,
                              //       width: 180,
                              //     ),
                              //   ),
                              //   SizedBox(
                              //     child: CircleAvatar(
                              //       radius: 30,
                              //       child: ClipOval(
                              //           child: Image.network(
                              //         '${controller.ownerGuild!.guild!.guildImage}',
                              //         errorBuilder:
                              //             (context, error, stackTrace) =>
                              //                 Center(
                              //           child: Image.asset(
                              //               'assets/No_Image_Available.jpg'),
                              //         ),
                              //       )),
                              //     ),
                              //   ),
                              // ),
                            );
                          }),
                    ),
                    // JobCarouselWidget(
                    //   jobpartner: jobpartner,
                    //   press: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => CompanyScreen()));
                    //   },
                    // ),
                    // SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 2,
                        color: Color.fromARGB(255, 250, 248, 248),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFFF3F3F3),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text("POPULAR JOB", style: TextStyle(fontWeight: FontWeight.bold))),
                                    Text("ดูทั้งหมด", style: TextStyle(fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  margin: EdgeInsets.zero,
                                  elevation: 0,
                                  color: Color.fromARGB(255, 255, 254, 254),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: SizedBox(
                                      height: size.height * 0.06,
                                      child: Row(
                                        children: [Text('งานทั้งหมด  100,000 อัตรา')],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                  spacing: 10,
                                  children: List.generate(
                                      poppular.length,
                                      (index) => Padding(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: CardJobWidget(
                                              size: size,
                                              poppular: poppular,
                                              index: index,
                                            ),
                                          )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Text("HIGHLIGHT JOBS", style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    ImageCarouselWidget(
                      press: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetail()));
                      },
                      image: imageList,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Text("TIPS & UPDATES", style: TextStyle(fontWeight: FontWeight.bold))),
                          MaterialButton(
                            onPressed: () {},
                            shape: StadiumBorder(),
                            color: Color.fromARGB(255, 17, 95, 81).withOpacity(0.1),
                            elevation: 0,
                            child: Text("ดูทั้งหมด", style: TextStyle(fontWeight: FontWeight.w600)),
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
      ),
    );
  }
}

class CardJobWidget extends StatelessWidget {
  const CardJobWidget({
    Key? key,
    required this.size,
    required this.poppular,
    this.index,
  }) : super(key: key);

  final Size size;
  final List<Map<String, dynamic>> poppular;
  final index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Color.fromARGB(255, 255, 254, 254),
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.27,
        child: ListTile(
          dense: true,
          minLeadingWidth: 1,
          minVerticalPadding: 1,
          visualDensity: VisualDensity.compact,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PositionScreen()));
          },
          title: Text(
            poppular[index]['title'],
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            poppular[index]['subtitle'] + ' อัตรา',
            style: TextStyle(fontSize: 11),
          ),
        ),
      ),
    );
  }
}
