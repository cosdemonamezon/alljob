import 'package:alljob/Screen/Alljob/Companies/JobCompanyScreen.dart';
import 'package:alljob/Screen/Alljob/Companies/Widgets/CompaniesList.dart';
import 'package:alljob/Screen/Widgets/SearchTextField.dart';
import 'package:alljob/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Job/JobController.dart';
import '../Job/detailCompany/detailCompany.dart';

class CompanyScreen extends StatefulWidget {
  CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  List companydata = [
    // {
    //   "title": "Amazon.com",
    //   "imageUrl": "assets/icons/amazon.png",
    //   "rating": "4.8",
    //   "location": "New york, USA",
    //   "vacancy": "1 Vacancy",
    //   "price": "8,000 - 23,000"
    // },
    {
      "title": "Bank of America",
      "imageUrl": "assets/icons/bankofamerica.png",
      "rating": "4.3",
      "location": "Birmngham, UK",
      "vacancy": "3 Vacancy",
      "price": "18,000 - 35,000"
    },
    {
      "title": "Comcast",
      "imageUrl": "assets/icons/comcast.png",
      "rating": "4.1",
      "location": "Montreal,Quebec",
      "vacancy": "1 Vacancy",
      "price": "28,000 - 45,000"
    },
    {
      "title": "Dell Technologies",
      "imageUrl": "assets/icons/dell.jpeg",
      "rating": "3.9",
      "location": "New york, USA",
      "vacancy": "2 Vacancy",
      "price": "38,000 - 75,000"
    },
    {
      "title": "Emerson Electric",
      "imageUrl": "assets/icons/electric.png",
      "rating": "3.8",
      "location": "Liverpool, UK",
      "vacancy": "0 Vacancy",
      "price": "18,000 - 27,000"
    },
    {
      "title": "FedEx",
      "imageUrl": "assets/icons/finder.png",
      "rating": "2.6",
      "location": "New york, USA",
      "vacancy": "1 Vacancy",
      "price": "15,000 - 35,000"
    },
    {
      "title": "Starbucks",
      "imageUrl": "assets/icons/starbucks.png",
      "rating": "1.7",
      "location": "Toronto,Ontario",
      "vacancy": "1 Vacancy",
      "price": "18,000 - 25,000"
    },
  ];
  void initState() {
    _loadItem();
    super.initState();
  }

  Future _loadItem() async {
    await context.read<JobController>().loadLogoCompay();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    return Consumer<JobController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Companies',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SearchTextField(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                    // controller: _controller,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.logoCompay.length,
                    itemBuilder: (_, index) {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailCompany(
                                            Id: controller
                                                .logoCompay[index].id!,
                                          )));
                            },
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/promotionBG.png'),
                                  fit: BoxFit.fill,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Color.fromRGBO(0, 78, 179, 0.05),
                                      blurRadius: 10)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Image.network(
                                          "${controller.logoCompay[index].image}",
                                          height: size.height / 17,
                                          errorBuilder: (context, error,
                                                  stackTrace) =>
                                              Image.asset(
                                                  'assets/images/No_Image_Available.jpg'),
                                        )
                                        // : Image.asset(
                                        //     'assets/images/No_Image_Available.jpg'),
                                        ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.logoCompay[index]
                                                      .username ??
                                                  '',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: appFontSize?.body),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'เบอร์โทรศัพท์ ${controller.logoCompay[index].phone ?? ''}',
                                              style: TextStyle(
                                                  fontSize: appFontSize?.body2),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'ความต้องการ ${controller.logoCompay[index].status ?? ''} ',
                                              style: TextStyle(
                                                  fontSize: appFontSize?.body2),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
                                              style: TextStyle(
                                                  fontSize: appFontSize?.body2),
                                              // overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   children: companydata
              //       .map((data) => CompaniesList(
              //             companydata: data,
              //             use: true,
              //             press: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => JobCompanyScreen()));
              //             },
              //           ))
              //       .toList(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
