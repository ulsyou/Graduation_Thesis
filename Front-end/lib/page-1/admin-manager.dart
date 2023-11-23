import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

import '../login-page.dart';
import 'backup-data.dart';
import 'employee-manager.dart';

class AdminManagerPage extends StatelessWidget {
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
          height: 915,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            image: DecorationImage(
              image: AssetImage(
                'assets/page-1/images/wolfgang-hasselmann-ucnhoxas6pq-unsplash-1-bg-vS5.png',
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
                    EdgeInsets.fromLTRB(43 * fem, 47 * fem, 37 * fem, 32 * fem),
                width: double.infinity,
                height: 798,
                decoration: BoxDecoration(
                  color: Color(0x8effffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 48 * fem),
                      width: 250 * fem,
                      height: 80 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x8effffff),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmployeeManager()),
                              );
                            },
                            child: Text(
                              'Quản trị người dùng',
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
                          0 * fem, 0 * fem, 0 * fem, 300 * fem),
                      width: 250 * fem,
                      height: 80 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x8effffff),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0x8effffff),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Backup()),
                              );
                            },
                            child: Text(
                              'Sao lưu dữ liệu',
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
                      offset: Offset(0, -40 * fem),
                      child: Container(
                        width: 150 * fem,
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
            ],
          ),
        ),
      ),
    );
  }
}
