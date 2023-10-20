import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myapp/utils.dart';

import '../login-page.dart';
import 'Seasons/season-manager.dart';
import 'catalog-manager.dart';

class EmployeeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 37 * fem, 0 * fem, 0 * fem),
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/page-1/images/yuki-ho-_YGqbbZEmMI-unsplash.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(10 * fem, 0 * fem, 0 * fem, 33 * fem),
                child: Text(
                  'Nhật ký vụ mùa',
                  style: SafeGoogleFont(
                    'Cabin',
                    fontSize: 28 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.215 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.fromLTRB(43 * fem, 25 * fem, 37 * fem, 32 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x8efff0f5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xfffafad2),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0xfffafad2),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeasonManager()),
                              );
                            },
                            child: Text(
                              'Theo dõi mùa vụ',
                              style: SafeGoogleFont(
                                'Cabin',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.215 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xfffafad2),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0xfffafad2),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Backup()),
                              // );
                            },
                            child: Text(
                              'Thống kê',
                              style: SafeGoogleFont(
                                'Cabin',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.215 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xfffafad2),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0xfffafad2),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Backup()),
                              // );
                            },
                            child: Text(
                              'Dự đoán năng suất',
                              style: SafeGoogleFont(
                                'Cabin',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.215 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 150 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xfffafad2),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0xfffafad2),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CatalogtManagerPage()),
                              );
                            },
                            child: Text(
                              'Quản lý danh mục',
                              style: SafeGoogleFont(
                                'Cabin',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.215 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 0),
                      child: Container(
                        width: 120 * fem,
                        height: 60 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffff0000),
                          borderRadius: BorderRadius.circular(45 * fem),
                        ),
                        child: Center(
                          child: Material(
                            color: Color(0xffff0000),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scene()),
                                );
                              },
                              child: Text(
                                'Đăng xuất',
                                style: SafeGoogleFont(
                                  'Cabin',
                                  fontSize: 24 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.215 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GNav(
                  rippleColor: Colors.grey[800]!,
                  // tab button ripple color when pressed
                  hoverColor: Colors.grey[700]!,
                  // tab button hover color
                  haptic: true,
                  // haptic feedback
                  tabBorderRadius: 15,
                  tabActiveBorder: Border.all(color: Colors.black, width: 1),
                  // tab button border
                  tabBorder: Border.all(color: Colors.grey, width: 1),
                  // tab button border
                  tabShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5), blurRadius: 8)
                  ],
                  // tab button shadow
                  curve: Curves.easeOutExpo,
                  // tab animation curves
                  duration: Duration(milliseconds: 900),
                  // tab animation duration
                  gap: 8,
                  // the tab button gap between icon and text
                  color: Colors.grey[800],
                  // unselected icon color
                  activeColor: Colors.purple,
                  // selected icon and text color
                  iconSize: 24,
                  // tab button icon size
                  tabBackgroundColor: Colors.purple.withOpacity(0.1),
                  // selected tab background color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // navigation bar padding
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineIcons.heart,
                      text: 'Likes',
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
