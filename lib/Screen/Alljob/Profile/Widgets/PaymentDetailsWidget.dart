import 'package:flutter/material.dart';

class PaymentDetailsWidget extends StatelessWidget {
  PaymentDetailsWidget({Key? key, this.data}) : super(key: key);

  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  'assets/images/ALLZERVE.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data!['name'],
                      style: TextStyle(),
                      maxLines: 3,
                      // textAlign: TextAlign.end,
                    ),
                    Divider(height: 8, thickness: 1),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        data!['tax'],
                        style: TextStyle(),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          data!['value'],
                          style: TextStyle(),
                          maxLines: 3,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        data!['subtotal'],
                        style: TextStyle(),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          data!['valuesub'],
                          style: TextStyle(),
                          maxLines: 3,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        data!['total'],
                        style: TextStyle(),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          data!['valuetotal'],
                          style: TextStyle(),
                          maxLines: 3,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
