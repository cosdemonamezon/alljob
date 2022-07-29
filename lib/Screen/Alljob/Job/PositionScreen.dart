import 'package:alljob/Screen/Alljob/Job/CompaniesDetailScreen.dart';
import 'package:flutter/material.dart';

class PositionScreen extends StatefulWidget {
  PositionScreen({Key? key}) : super(key: key);

  @override
  State<PositionScreen> createState() => _PositionScreenState();
}

class _PositionScreenState extends State<PositionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('100,000 ตำแหน่งงาน'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: List.generate(
                50,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompaniesDetailScreen()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${index + 1}.',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.24,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'รับสมัครด่วน',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                              Text(
                                '28 ก.ค. 65',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Sale Executive'),
                                    Text(
                                      'บริษัท เอสพีซี อินเตอร์พรินท์ จำกัด / บริษัท แพคพรินท์ จำกัด',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.fmd_good,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          'นิคมอุตสาหกรรมอมตะนคร จ.ชลบุรี',
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          '15,000 - 30,000 ตามความสามารถ',
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.maps_home_work,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          'Work from Home',
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.desktop_mac,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          'สัมภาษณ์งานออนไลน์',
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Image.asset(
                                      'assets/icons/starbucks.png')),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
