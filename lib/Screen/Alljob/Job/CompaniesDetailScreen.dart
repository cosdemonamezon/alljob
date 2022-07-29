import 'package:flutter/material.dart';

class CompaniesDetailScreen extends StatefulWidget {
  CompaniesDetailScreen({Key? key}) : super(key: key);

  @override
  State<CompaniesDetailScreen> createState() => _CompaniesDetailScreenState();
}

class _CompaniesDetailScreenState extends State<CompaniesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดบริษัท'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.21,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.12,
                    width: double.infinity,
                    color: Colors.amber,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asha Tech Corporation Co.,Ltd',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.03,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: size.height * 0.10,
                            width: size.width * 0.22,
                            //color: Colors.red,
                            child: Image.asset('assets/icons/amazon.png',fit: BoxFit.fill,),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Text(
                              'Asha Tech Corporation Co.,Ltd',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.38,
              width: double.infinity,
              color: Color.fromARGB(255, 226, 226, 226),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('29 ก.ค. 2565'),
                      ],
                    ),
                    Text('Sale Executive'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.fmd_good,
                        ),
                        Expanded(
                            child: Text(
                          'สวนลาดกระบัง ใกล้ตลาดนัดสุวรรณภูมิ ซอยข้างมหาลัย xxccccxxbbbbbbbb',
                          maxLines: 2,
                        ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.monetization_on,
                        ),
                        Expanded(
                            child: Text(
                          '15,000 - 30,000 ตามความสามารถและประสบการณ์',
                          maxLines: 2,
                        ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                        ),
                        Expanded(
                            child: Text(
                          '2',
                          maxLines: 2,
                        ))
                      ],
                    ),
                    Container(
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 152, 187, 248),
                        border: Border.all(width: 2, color: Colors.blue),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.maps_home_work,
                          ),
                          Expanded(
                              child: Text(
                            'Work from Home',
                            maxLines: 2,
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 152, 187, 248),
                        border: Border.all(width: 2, color: Colors.blue),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.desktop_mac,
                          ),
                          Expanded(
                              child: Text(
                            'สัมภาษณ์งานออนไลน์',
                            maxLines: 2,
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 16)),
                          onPressed: () {},
                          child: Text('ดูรายละเอียดงาน'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                '- ประกอบกิจการรับผลิตซอฟแวร์ที่ใช้ภายในองค์กร ระบบอีคอมเมิร์ส เวปไซต์เซลเพจ ระบบอีอาร์พี ระบบลงเวลาทำงาน และอื่นๆที่เกี่ยวกับ ซอฟแวร์'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('ติดต่อ'),
                        Text('คุณ ธวัชชัย มุ้งภูเขียว'),
                        Text('Asha Tech Corporation Co.,Ltd'),
                        Text('โทรศัพท์ : 0922568262'),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
