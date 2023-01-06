import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../appTheme.dart';

class LinkPage extends StatefulWidget {
  LinkPage({super.key, this.link});
  String? link;

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Link Matching',
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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                ),
                InkWell(
                    onTap: () async {
                      final url = widget.link;
                      inspect(widget.link);

                      // // ignore: deprecated_member_use
                      // if (await canLaunch(url!)) {
                      //   // ignore: deprecated_member_use
                      //   await launch(url);
                      // }

                      openBrowserURL(url: url!, inApp: true);
                    },
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 82, 145, 255),
                        radius: 120,
                        child: ClipOval(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Join',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              'Link',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 50,
                              ),
                            ),
                          ],
                        )
                            //     Image.asset(
                            //   'assets/icons/user.png',
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    }
  }
}
