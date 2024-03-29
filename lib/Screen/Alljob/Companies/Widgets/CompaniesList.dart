import 'package:alljob/appTheme.dart';
import 'package:flutter/material.dart';

class CompaniesList extends StatelessWidget {
  final dynamic companydata;
  final bool? use;
  VoidCallback? press;
  CompaniesList({Key? key, required this.companydata, this.use, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    return Stack(
      children: [
        InkWell(
          onTap: press,
          child: Container(
            width: size.width,
            margin: EdgeInsets.only(right: 25, left: 25, top: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/promotionBG.png'),
                fit: BoxFit.fill,
              ),
              boxShadow: const [BoxShadow(offset: Offset(0, 2), color: Color.fromRGBO(0, 78, 179, 0.05), blurRadius: 10)],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(companydata['imageUrl'], height: size.height / 17),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            companydata['title'],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                          ),
                          SizedBox(height: 5),
                          Text(
                            companydata['location'],
                            style: TextStyle(fontSize: appFontSize?.body2),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            companydata['vacancy'],
                            style: TextStyle(fontSize: appFontSize?.body2),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'เงินเดือน ${companydata['price']}',
                            style: TextStyle(fontSize: appFontSize?.body2),
                            overflow: TextOverflow.ellipsis,
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
  }
}