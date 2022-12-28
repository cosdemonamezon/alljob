import 'package:alljob/Screen/Alljob/Companies/CompanyScreen.dart';
import 'package:alljob/Screen/Alljob/Job/JobScreen.dart';
import 'package:alljob/Screen/Alljob/Notification/NotificationScreen.dart';
import 'package:alljob/Screen/Alljob/Profile/ProfileScreen.dart';
import 'package:alljob/Screen/Alljob/Search/SearchScreen.dart';
import 'package:flutter/material.dart';

import 'matchScreen/matchPage.dart';

class AlljobHome extends StatefulWidget {
  AlljobHome({Key? key}) : super(key: key);

  @override
  State<AlljobHome> createState() => _AlljobHomeState();
}

class _AlljobHomeState extends State<AlljobHome> {
  int selectedIndex = 0;
  final PageController controller = PageController();

  Future<void> _onItemTapped(int index) async {
    setState(() {
      selectedIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          JobScreen(),
          CompanyScreen(),
          MatchPage(),
          SearchScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          height: 100,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi1.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi1_active.png', height: size.height * 0.025),
                label: 'หน้าแรก',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi2.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi2_active.png', height: size.height * 0.025),
                label: 'บริษัท',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi3.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi3_active.png', height: size.height * 0.025),
                label: 'นัดหมาย',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi4.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi4_active.png', height: size.height * 0.025),
                label: 'ค้นหา',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi5.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi5_active.png', height: size.height * 0.025),
                label: 'ตั้งค่า',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.blue,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelStyle: TextStyle(color: Colors.white),
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
