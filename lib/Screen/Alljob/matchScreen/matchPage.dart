import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../appTheme.dart';
import '../../Widgets/LoadingDialog.dart';
import '../../app/AppController.dart';
import 'linkPage.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  bool? result = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AppController>(
      builder: (context, controller, child) {
        final appFontSize = AppFontSize.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Matching',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: appFontSize?.appBarFont,
              ),
            ),
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: controller.user!.meetings!.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.user!.meetings!.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/promotionBG.png'),
                                  fit: BoxFit.fill,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 2), color: Color.fromRGBO(0, 78, 179, 0.05), blurRadius: 10)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(
                                    //   child: CircleAvatar(
                                    //     radius: 30,
                                    //     child: ClipOval(
                                    //         child: Image.asset(
                                    //             'assets/images/cd3739.png')),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 170,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.user!.meetings![i].topic!,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          Text(
                                            controller.user!.meetings![i].recruitment_companie_id!,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          Text(
                                            'วันที่ ${controller.user!.meetings![i].agenda}',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                          Text(
                                            'เวลา ${controller.user!.meetings![i].start_time}',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    controller.user?.meetings?[i].isAccept != true
                                        ? InkWell(
                                            onTap: () async {
                                              final result2 = await showCupertinoDialog<bool>(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: Text(
                                                      'ยืนยัน',
                                                    ),
                                                    content: Text(
                                                      'ยืนยันเพื่อนัดหมาย',
                                                    ),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        child: Text(
                                                          'ยืนยัน',
                                                        ),
                                                        onPressed: () async {
                                                          Navigator.pop(context, true);
                                                        },
                                                      ),
                                                      CupertinoDialogAction(
                                                        child: Text(
                                                          'ยกเลิก',
                                                        ),
                                                        onPressed: () => Navigator.pop(context, false),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (result2 == true) {
                                                setState(() {
                                                  controller.user?.meetings?[i].isAccept = true;
                                                });
                                                print(controller.user?.meetings?[i].isAccept);
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.2,
                                              height: MediaQuery.of(context).size.height * 0.1,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Accept',
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return LinkPage(
                                                  link: controller.user!.meetings![i].join_url,
                                                );
                                              }));
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.2,
                                              height: MediaQuery.of(context).size.height * 0.1,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'รับลิ้งค์',
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                    // Row(
                                    //   children: [
                                    //     InkWell(
                                    //       onTap: () {
                                    //         showCupertinoDialog(
                                    //           context: context,
                                    //           builder: (context) =>
                                    //               CupertinoAlertDialog(
                                    //             title: Text(
                                    //               'ยืนยัน',
                                    //             ),
                                    //             content: Text(
                                    //               'ยืนยันเพื่อนัดหมาย',
                                    //             ),
                                    //             actions: [
                                    //               CupertinoDialogAction(
                                    //                 child: Text(
                                    //                   'ยกเลิก',
                                    //                 ),
                                    //                 onPressed: () {
                                    //                   Navigator.pop(context, false);
                                    //                 },
                                    //               ),
                                    //               CupertinoDialogAction(
                                    //                 child: Text(
                                    //                   'ยืนยัน',
                                    //                 ),
                                    //                 onPressed: () async {
                                    //                   Navigator.pop(context, true);
                                    //                 },
                                    //               )
                                    //             ],
                                    //           ),
                                    //         );
                                    //       },
                                    //       child: Container(
                                    //         width:
                                    //             MediaQuery.of(context).size.width *
                                    //                 0.085,
                                    //         height:
                                    //             MediaQuery.of(context).size.height *
                                    //                 0.04,
                                    //         decoration: BoxDecoration(
                                    //           color: Colors.blue,
                                    //           borderRadius:
                                    //               BorderRadius.circular(20),
                                    //         ),
                                    //         child: Row(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //           children: [
                                    //             Icon(
                                    //               Icons.check,
                                    //               size: 31,
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 10,
                                    //     ),
                                    //     InkWell(
                                    //       onTap: () {
                                    //         showCupertinoDialog(
                                    //           context: context,
                                    //           builder: (context) =>
                                    //               CupertinoAlertDialog(
                                    //             title: Text(
                                    //               'ยกเลิก',
                                    //             ),
                                    //             content: Text(
                                    //               'ยืนยันเพื่อยกเลิกนัดหมาย',
                                    //             ),
                                    //             actions: [
                                    //               CupertinoDialogAction(
                                    //                 child: Text(
                                    //                   'ยกเลิก',
                                    //                 ),
                                    //                 onPressed: () =>
                                    //                     Navigator.pop(context),
                                    //               ),
                                    //               CupertinoDialogAction(
                                    //                 child: Text(
                                    //                   'ยืนยัน',
                                    //                 ),
                                    //                 onPressed: () async {
                                    //                   Navigator.pop(context);
                                    //                 },
                                    //               )
                                    //             ],
                                    //           ),
                                    //         );
                                    //       },
                                    //       child: Container(
                                    //         width:
                                    //             MediaQuery.of(context).size.width *
                                    //                 0.085,
                                    //         height:
                                    //             MediaQuery.of(context).size.height *
                                    //                 0.04,
                                    //         decoration: BoxDecoration(
                                    //           color: Colors.blue,
                                    //           borderRadius:
                                    //               BorderRadius.circular(20),
                                    //         ),
                                    //         child: Row(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //           children: [
                                    //             Icon(
                                    //               Icons.cancel_outlined,
                                    //               size: 31,
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
    );
  }
}
