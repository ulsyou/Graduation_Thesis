import 'package:flutter/material.dart';
import 'package:myapp/page-2/Fertilizer/fertilizer-manager.dart';
import 'package:myapp/utils.dart';

import 'Rice Straint/strain-manager.dart';
import 'expert-manager-page.dart';

class CatalogtManagerPage extends StatelessWidget {
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
                    EdgeInsets.fromLTRB(25 * fem, 0 * fem, 0 * fem, 33 * fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExpertManagerPage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 25 * fem, 3 * fem),
                        width: 24 * fem,
                        height: 24 * fem,
                        child: Image.asset(
                          'assets/page-1/images/arrow-left.png',
                          width: 24 * fem,
                          height: 24 * fem,
                        ),
                      ),
                    ),
                    Text(
                      'Quản lý danh mục',
                      style: TextStyle(
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.215 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.fromLTRB(43 * fem, 25 * fem, 37 * fem, 32 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x8effffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Giống lúa
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
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
                                    builder: (context) => StrainManager()),
                              );
                            },
                            child: Text(
                              'Giống lúa',
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
                    //Phân bón
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
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
                                    builder: (context) => fertilizerManager()),
                              );
                            },
                            child: Text(
                              'Phân bón',
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
                    //Bệnh dịch
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x8effffff),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0x8effffff),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Bệnh dịch',
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
                    //Mẫu ruộng
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x8effffff),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0x8effffff),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Mẫu ruộng',
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
                    //Thuốc trị bệnh dịch
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x8effffff),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0x8effffff),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Thuốc trị bệnh dịch',
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
                    //Các hoạt động
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 40 * fem),
                      width: 250 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x8effffff),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      child: Center(
                        child: Material(
                          color: Color(0x8effffff),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Các hoạt động',
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
