import 'package:flutter/material.dart';

class JobCarouselWidget extends StatelessWidget {
  List<Map<String, dynamic>>? jobpartner;
  VoidCallback press;
  JobCarouselWidget({Key? key, this.jobpartner, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(bottom: 15),
      child: ListView.builder(
          primary: false,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: jobpartner!.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: press,
              child: Container(
                // width: 100,
                // height: 100,
                // margin: EdgeInsetsDirectional.only(
                //     end: 20, start: index == 0 ? 20 : 0),
                padding: EdgeInsets.symmetric(vertical: 10),
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //       colors: [
                //         Colors.blueAccent.withOpacity(0.7),
                //         Colors.blue.withOpacity(0.01)
                //       ],
                //       begin: AlignmentDirectional.topStart,
                //       //const FractionalOffset(1, 0),
                //       end: AlignmentDirectional.bottomEnd,
                //       stops: [0.1, 0.9],
                //       tileMode: TileMode.clamp),
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 30, top: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          jobpartner![index]['img'],
                          fit: BoxFit.fill,
                          //color: Colors.white,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsetsDirectional.only(start: 10, top: 0),
                    //   child: Text(
                    //     jobpartner![index]['name'],
                    //     maxLines: 2,
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
