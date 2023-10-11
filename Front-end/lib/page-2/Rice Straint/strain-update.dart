import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/utils.dart';

import 'strain-manager.dart';

class updateStrain extends StatefulWidget {
  final Map<String, dynamic> strainData;

  updateStrain({required this.strainData});

  @override
  _updateStrainState createState() => _updateStrainState();
}

class _updateStrainState extends State<updateStrain> {
  TextEditingController strainNameController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController characteristicsController = TextEditingController();

  Future<void> updateStrain() async {
    final strainId = widget.strainData['_id'];
    final url = 'http://10.0.2.2:5000/rice-strain/update/riceStrain/$strainId';
    Map<String, dynamic> requestBody = {};

    if (strainNameController.text.isNotEmpty) {
      requestBody['strainName'] = strainNameController.text;
    }

    if (supplierController.text.isNotEmpty) {
      requestBody['supplier'] = supplierController.text;
    }

    if (characteristicsController.text.isNotEmpty) {
      requestBody['characteristics'] = characteristicsController.text;
    }

    final response = await http.patch(
      Uri.parse(url),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('Strain update successfully');
    } else {
      print('Error in update Strain: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 38 * fem, 0 * fem, 0 * fem),
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
                    EdgeInsets.fromLTRB(19 * fem, 0 * fem, 45 * fem, 33 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 60 * fem, 3 * fem),
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
                      'Sửa thông tin',
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
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 21 * fem, 16 * fem, 72 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x8effffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          89 * fem, 0 * fem, 89 * fem, 28 * fem),
                      padding: EdgeInsets.fromLTRB(
                          111 * fem, 126 * fem, 15 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(75 * fem),
                      ),
                      child: Align(
                          // group17PMB (97:28)
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              // Handle button tap
                            },
                            child: SizedBox(
                              width: 24 * fem,
                              height: 24 * fem,
                              child: Image.asset(
                                'assets/page-1/images/plus-circle.png',
                                width: 24 * fem,
                                height: 24 * fem,
                              ),
                            ),
                          )),
                    ),
                    //Tên giống lúa
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/black-user.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16 * fem),
                              // Add some spacing
                              child: TextFormField(
                                controller: strainNameController,
                                style: TextStyle(
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Tên giống lúa',
                                  hintStyle: TextStyle(
                                    color: Color(0xb57e7e7e),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Đặc tính
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 10 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/mail.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: characteristicsController,
                              style: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Đặc tính',
                                hintStyle: TextStyle(
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Nhà cung cấp
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/key.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: supplierController,
                              style: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Nhà cung cấp',
                                hintStyle: TextStyle(
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Confirm + Cancel
                    Container(
                      width: double.infinity,
                      height: 72 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                updateStrain().then((_) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StrainManager(),
                                    ),
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffffffff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25 * fem),
                                ),
                              ),
                              child: Text(
                                'Xác nhận',
                                style: SafeGoogleFont(
                                  'Cabin',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.215 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16 * fem),
                          // Add some spacing between buttons
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StrainManager(),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25 * fem),
                                ),
                              ),
                              child: Text(
                                'Hủy bỏ',
                                style: SafeGoogleFont(
                                  'Cabin',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.215 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
