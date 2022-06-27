import 'package:alljob/Screen/Alljob/Job/Widgets/RecordTexForm.dart';
import 'package:alljob/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/material.dart';

class ShortHistory extends StatefulWidget {
  ShortHistory({Key? key}) : super(key: key);

  @override
  State<ShortHistory> createState() => _ShortHistoryState();
}

class _ShortHistoryState extends State<ShortHistory> {
  int val = 0;
  String dayvalue = 'วัน';
  String mounthvalue = 'เดือน';
  String yearvalue = 'ปี';
  bool isChecked = false;

  var dropdownDay = [
    'วัน',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  List<String> dropdownMounth = [
    'เดือน',
    'มกราคม',
    'กุมภาพันธุ์.',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม',
  ];
  List<String> dropdownYear = [
    'ปี',
    '2018',
    '2019',
    '2020',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
  ];
  final GlobalKey<FormState> recordFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('กรอกประวัติแบบย่อ'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                title: Text('ประวัติส่วนตัว'),
                children: [
                  Image.asset(
                    'assets/images/ALLZERVELogo.png',
                    height: 50,
                    width: 50,
                  ),
                  Text('อัพโหลดรูป'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Form(
                    key: recordFormKey,
                    child: Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            'ชื่อ - นามสกุล *',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: RecordTextForm(
                            controller: username,
                            hintText: 'กรุณากรอกชื่อและนามสกุล',
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            'เพศ *',
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            'วันเกิด *',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: DropdownButton(
                                  value: dayvalue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  items: dropdownDay.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dayvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              SizedBox(
                                width: size.width * 0.25,
                                child: DropdownButton(
                                  value: mounthvalue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  items: dropdownMounth.map((String items2) {
                                    return DropdownMenuItem(
                                      value: items2,
                                      child: Text(items2),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      mounthvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              SizedBox(
                                width: size.width * 0.25,
                                child: DropdownButton(
                                  value: yearvalue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  items: dropdownYear.map((String items3) {
                                    return DropdownMenuItem(
                                      value: items3,
                                      child: Text(items3),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      yearvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'เบอร์โทรศัพ *',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: RecordTextForm(
                            controller: username,
                            hintText: 'กรุณากรอกเบอร์โทรติดต่อ',
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'อีเมล *',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: RecordTextForm(
                            controller: username,
                            hintText: 'กรุณาระบุอีเมล',
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'ที่อยู่ *',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: RecordTextForm(
                            controller: username,
                            hintText: '',
                            maxLine: 4,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ExpansionTile(
                title: Text('เกี่ยวกับคุณ *'),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: RecordTextForm(
                      controller: username,
                      hintText: '',
                      maxLine: 4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: Color.fromARGB(255, 221, 219, 219),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ประวัติการศึกษา'),
                          Wrap(
                            children: [
                              Container(
                                  color: Colors.blue,
                                  child: Center(
                                      child: Text(
                                    "เพิ่ม",
                                    textScaleFactor: 1.5,
                                  ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ประวัติการทำงาน'),
                          Wrap(
                            children: [
                              Container(
                                  color: Colors.blue,
                                  child: Center(
                                      child: Text(
                                    "เพิ่ม",
                                    textScaleFactor: 1.5,
                                  ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เอกสารอื่นๆ'),
                          Wrap(
                            children: [
                              Container(
                                  color: Colors.blue,
                                  child: Center(
                                      child: Text(
                                    "เพิ่ม",
                                    textScaleFactor: 1.5,
                                  ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'ยอมรับเงื่อนไขข้อตกลงการใช้บริการและนโยบายของ AllServe',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: size.width*0.65,
                  child: ButtonRounded(
                    text: 'สมัครงาน',
                    color: Colors.blue,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onPressed: (){},
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
