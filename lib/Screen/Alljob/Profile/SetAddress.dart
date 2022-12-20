import 'package:alljob/Screen/Alljob/Profile/Widgets/AddTextForm.dart';
import 'package:alljob/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/material.dart';

class SetAddress extends StatefulWidget {
  SetAddress({Key? key}) : super(key: key);

  @override
  State<SetAddress> createState() => _SetAddressState();
}

class _SetAddressState extends State<SetAddress> {
  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  List address = [];
  String _address =
      '503/32 อาคาร เค.เอส.แอล. ทาวเวอร์, ชั้น 18, ถนนศรีอยุธยา แขวงถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400';
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(vertical: 5, horizontal: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ที่อยู่ของคุณ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: padding,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('ที่อยู่',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.star,
                        color: Colors.blue,
                        size: 35,
                      ),
                      title: Text('บริษัท ทดลอง จำกัด'),
                      subtitle: Text(_address),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _dialogAddress();
                      },
                      child: Center(
                        child: Text(
                          '+ เพิ่มที่อยู่',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogAddress() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('เพิ่มที่อยู่'),
          content: SingleChildScrollView(
            child: Form(
              key: addFormKey,
              child: Wrap(
                children: [
                  AddTextForm(
                    controller: username,
                    hintText: '',
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonRounded(
                  text: 'ยกเลิก',
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ButtonRounded(
                  text: 'บันทึก',
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
