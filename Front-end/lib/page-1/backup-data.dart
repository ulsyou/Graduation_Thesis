import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

import 'admin-manager.dart';

class Backup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: SingleChildScrollView(
        child: Container(
          // backupdatakuF (63:69)
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // autogroupubboFLD (CQPaDbGuVJYSomMuWyUBBo)
                margin:
                    EdgeInsets.fromLTRB(19 * fem, 0 * fem, 78 * fem, 32 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AdminManagerPage(), // Thay thế AdminManagerPage bằng tên trang của bạn
                          ),
                        );
                      },
                      child: Container(
                        // group9n5F (68:184)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 48 * fem, 3 * fem),
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
                      // saoludliuhT7 (63:72)
                      'Sao lưu dữ liệu',
                      style: SafeGoogleFont(
                        'Cabin',
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
                // autogroupbhr3DwF (CQPaM1EDk9JCcWVSgQBhR3)
                padding:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 26 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x8effffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogrouplpvf82d (CQPaULMLiXSGpqg9vHLpVf)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 66 * fem, 33 * fem),
                      width: 294 * fem,
                      height: 43 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle27qhj (74:187)
                            left: 0 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 288 * fem,
                                height: 43 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffff9e58),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(45 * fem),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // ccbnsaoludliugnyLuP (74:188)
                            left: 7 * fem,
                            top: 7 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 287 * fem,
                                height: 25 * fem,
                                child: Text(
                                  'Các bản sao lưu dữ liệu gần đây',
                                  style: SafeGoogleFont(
                                    'Cabin',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.215 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // group12DCV (74:216)
                      margin: EdgeInsets.fromLTRB(
                          16 * fem, 0 * fem, 16 * fem, 447 * fem),
                      width: double.infinity,
                      height: 77 * fem,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // autogrouppsmwjgd (CQPakk3fcvdkiAtvnUPSmw)
                            width: 248 * fem,
                            height: 77 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xffd7ffb8),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20 * fem),
                                bottomLeft: Radius.circular(20 * fem),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Text',
                                style: SafeGoogleFont(
                                  'Cabin',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.215 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Handle download action
                            },
                            child: Container(
                              // autogroupab93Q25 (CQPaqzPvVqPm6BSywkab93)
                              padding: EdgeInsets.fromLTRB(
                                  9 * fem, 27 * fem, 8 * fem, 26 * fem),
                              height: 80 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff00ff0a),
                              ),
                              child: Image.asset(
                                'assets/page-1/images/download-cloud.png',
                                width: 24 * fem,
                                height: 24 * fem,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Handle delete action
                            },
                            child: Container(
                              // autogroupdlskTW9 (CQPavKc3FhPFwebwx3dLsK)
                              padding: EdgeInsets.fromLTRB(
                                  8 * fem, 26 * fem, 7 * fem, 27 * fem),
                              height: 80 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffff0000),
                              ),
                              child: Image.asset(
                                'assets/page-1/images/trash-2.png',
                                width: 24 * fem,
                                height: 24 * fem,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -80 * fem),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle cloud backup action
                            },
                            borderRadius: BorderRadius.circular(35 * fem),
                            child: Container(
                              width: 200 * fem,
                              height: 60 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xfffffa97),
                                borderRadius: BorderRadius.circular(35 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Sao lưu đám mây',
                                  style: TextStyle(
                                    fontSize: 24 * ffem,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Color(0xff000000), // Button text color
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
            ],
          ),
        ),
      ),
    );
  }
}
