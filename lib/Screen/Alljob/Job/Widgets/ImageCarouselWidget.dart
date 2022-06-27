import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatelessWidget {
  List<Map<String, dynamic>>? image;
  VoidCallback press;
  ImageCarouselWidget({Key? key, this.image, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(bottom: 15),
      child: ListView.builder(
          primary: false,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: image!.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: press,
              child: Container(
                width: 150,
                height: 180,
                margin: EdgeInsetsDirectional.only(
                    end: 20, start: index == 0 ? 20 : 0),
                //padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent.withOpacity(0.7),
                        Colors.blue.withOpacity(0.01)
                      ],
                      begin: AlignmentDirectional.topStart,
                      //const FractionalOffset(1, 0),
                      end: AlignmentDirectional.bottomEnd,
                      stops: [0.1, 0.9],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    image![index]['img'],
                    fit: BoxFit.fill,
                    //color: Colors.white,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
