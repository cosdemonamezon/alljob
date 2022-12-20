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
                InkWell(
                  onTap: () async {
                    final url = widget.link;

                    // if (await canLaunch(url!)) {
                    //   await launch(url);
                    // }

                    openBrowserURL(url: url!, inApp: true);
                  },
                  child: Text(
                    widget.link ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
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
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }
}
