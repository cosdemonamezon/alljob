import 'package:flutter/material.dart';

class CardApply extends StatelessWidget {
  CardApply({Key? key, this.img,this.press, this.title}) : super(key: key);

  VoidCallback? press;
  String? title;
  String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide.none),
        gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.1),
              Colors.blueAccent.withOpacity(0.1)
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.topEnd,
            stops: [0.0, 0.5],
            tileMode: TileMode.clamp),
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ListTile(
          onTap: press,
          leading: Image.asset(img!),
          title: Text(title!),
        ),
      ),
    );
  }
}