import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  ListCard({Key? key, this.press, this.title}) : super(key: key);

  VoidCallback? press;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide.none),
        gradient: LinearGradient(
            colors: [
              Colors.grey.withOpacity(0.1),
              Colors.grey.withOpacity(0.1)
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.topEnd,
            stops: [0.0, 0.5],
            tileMode: TileMode.clamp),
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: false,
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          title: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.blue.withOpacity(0.08),
            onTap: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'assets/icons/user.png',
                    height: 100,
                    //color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title.toString(),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          //subtitle: Text('data'),
        ),
      ),
    );
  }
}
