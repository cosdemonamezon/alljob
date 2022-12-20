import 'package:alljob/Screen/Alljob/Search/AddJobRecruitScreen.dart';
import 'package:alljob/Screen/Alljob/Search/Widgets/CardJobList.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> productlist = [
    {
      "imgurl": "assets/images/MockupALLZJOB.png",
      "title": "รับสมัคร โปรแกรมเมอร์",
      "subtitle": "เงินเดือน 3 หมื่น บริษัท อาชาเทคโนโลยี",
      "address": "ที่อยู่ ลาดกระบัง กรุงเทพมหานคร",
      "total": "105.5s",
      "createAt": "2022-05-06 18:31:50.133920",
      "hh": "18:31",
      "dd": "06",
      "mm": "Feb"
    }
  ];

  final List<String> _dropdownValues = [
    "ทั้งหมด",
    "รถไฟฟ้าและ  BRT",
    "รถเมล์",
    "นิคมอุตสาหกรรม",
  ];
  String _selectedValue = 'ทั้งหมด';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ค้นหางาน'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icons/n1.png'),
                          //child: Image.asset('assets/icons/n1.png',fit: BoxFit.fill,),
                        ),
                        Text('นิคมอุตลสาหกรรม')
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icons/m1.png'),
                          //child: Image.asset('assets/icons/m1.png',fit: BoxFit.fill,),
                        ),
                        Text('รถเมล์')
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icons/f1.png'),
                          //child: Image.asset('assets/icons/f1.png',fit: BoxFit.fill,),
                        ),
                        Text('รถไฟฟ้า')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('สถานที่ปฏิบัติงาน'),
                  Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                        items: _dropdownValues
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: SizedBox(
                                    width: size.width * 0.75,
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ))
                            .toList(),
                        isExpanded: false,
                        value: _selectedValue,
                        onChanged: (String? value) async {
                          setState(() {
                            _selectedValue = value!;
                            print(_selectedValue);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text('ทำงานที่บ้าน (Work from Home)'),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        child: Text('คำที่ต้องการค้นหา'),
                      ),
                      buildSearchBar(),
                    ],
                  ),
                  searchController.text != ''
                      ? ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          children: List.generate(
                              20, (index) => CardJobList(list: productlist[0])),
                        )
                      //CardJobList(list: productlist[0])
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddJobRecruitScreen()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildSearchBar() {
    return Hero(
      tag: 'tag',
      child: Container(
        margin: EdgeInsets.only(left: 1, right: 1, bottom: 1),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 0),
              child: Icon(Icons.search, color: Colors.deepOrange),
            ),
            Expanded(
              child: Material(
                color: Colors.white,
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.black),
                  onSubmitted: (value) {},
                  autofocus: false,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'Search for home service...',
                  ),
                ),
              ),
            ),
            // SizedBox(width: 8),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     padding: const EdgeInsets.only(
            //         right: 10, left: 10, top: 10, bottom: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //       color: Colors.grey.withOpacity(0.1),
            //     ),
            //     child: Wrap(
            //       crossAxisAlignment: WrapCrossAlignment.center,
            //       spacing: 4,
            //       children: [
            //         Text(
            //           "Filter",
            //           style: TextStyle(
            //               color: Colors
            //                   .black), //TextStyle(color: Get.theme.hintColor),
            //         ),
            //         Icon(
            //           Icons.filter_list,
            //           color: Colors.black,
            //           size: 21,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
