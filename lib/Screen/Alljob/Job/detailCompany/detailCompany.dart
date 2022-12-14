import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../appTheme.dart';
import '../../../Widgets/SearchTextField.dart';
import '../../Companies/JobCompanyScreen.dart';
import '../../Companies/Widgets/CompaniesList.dart';
import '../JobController.dart';

class DetailCompany extends StatefulWidget {
  DetailCompany({super.key, required this.Id});
  final int Id;

  @override
  State<DetailCompany> createState() => _DetailCompanyState();
}

class _DetailCompanyState extends State<DetailCompany> {
  List companydata = [
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
  final _controller = ScrollController();

  @override
  void initState() {
    _loadItem();
    super.initState();
  }

  Future _loadItem() async {
    await context.read<JobController>().loadPositionCompay(Id: widget.Id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    return Consumer<JobController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Job Position',
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
                    controller: _controller,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller
                        .positionCompany[0].recruitment_companies?.length,
                    itemBuilder: (_, index) {
                      final recruitment_companies = controller
                          .positionCompany[0].recruitment_companies?[index];

                      return recruitment_companies == null
                          ? SizedBox.shrink()
                          : Stack(
                              children: [
                                InkWell(
                                  onTap: () {},
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
                                            color: Color.fromRGBO(
                                                0, 78, 179, 0.05),
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
                                            child: controller.positionCompany[0]
                                                        .compay?.image !=
                                                    null
                                                ? Image.network(
                                                    "${controller.positionCompany[0].compay?.image}",
                                                    height: size.height / 17,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                            'assets/images/No_Image_Available.jpg'),
                                                  )
                                                : Image.asset(
                                                    'assets/images/No_Image_Available.jpg'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    recruitment_companies
                                                            .position ??
                                                        '',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            appFontSize?.body),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'เงินเดือน ${recruitment_companies.salary ?? ''}',
                                                    style: TextStyle(
                                                        fontSize:
                                                            appFontSize?.body2),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'ว่าง ${recruitment_companies.qty ?? ''} ตำแหน่ง',
                                                    style: TextStyle(
                                                        fontSize:
                                                            appFontSize?.body2),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'ลักษณะงาน ${recruitment_companies.description ?? ''}',
                                                    style: TextStyle(
                                                        fontSize:
                                                            appFontSize?.body2),
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
