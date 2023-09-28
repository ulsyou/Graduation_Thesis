import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/utils.dart';

import 'fertilizer-manager.dart';

class fertilizerInformation extends StatefulWidget {
  final Map<String, dynamic> fertilizerData;

  fertilizerInformation({required this.fertilizerData});

  @override
  _fertilizerInformationState createState() => _fertilizerInformationState();
}

class _fertilizerInformationState extends State<fertilizerInformation> {
  List<Map<String, dynamic>> fertilizers = [];
  String? selectedOption;
  bool isDropdownOpen = false;

  // Hàm gọi API để xóa mùa vụ
  Future<void> deletefertilizer() async {
    final fertilizerId = widget.fertilizerData['_id'];
    final apiUrl = Uri.parse(
        'http://10.0.2.2:5000/fertilizer/delete/fertilizer/$fertilizerId');

    try {
      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          fertilizers.removeWhere((fertilizer) => fertilizer['_id'] == fertilizerId);
        });
      } else {
        print('Failed to delete fertilizer: ${response.statusCode}');
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting fertilizer: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Map<String, dynamic> fertilizerData = widget.fertilizerData;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 37 * fem, 0 * fem, 0 * fem),
          width: double.infinity,
          decoration: const BoxDecoration(
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
                EdgeInsets.fromLTRB(19 * fem, 0 * fem, 32 * fem, 37 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => fertilizerManager(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 40 * fem, 3 * fem),
                        width: 24 * fem,
                        height: 24 * fem,
                        child: Image.asset(
                          'assets/page-1/images/arrow-left.png',
                          width: 24 * fem,
                          height: 24 * fem,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          5 * fem, 5 * fem, 15 * fem, 0 * fem),
                      child: Text(
                        'Thông tin mùa vụ',
                        style: TextStyle(
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.215 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7 * fem, left: 10 * fem),
                      width: 24 * fem,
                      height: 24 * fem,
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            // //Xử lý khi chọn "Sửa"
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => updatefertilizer(
                            //       fertilizerData: fertilizerData,
                            //     ),
                            //   ),
                            // );
                          } else if (value == 'delete') {
                            // Xử lý khi chọn "Xóa"
                            deletefertilizer().then((_) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => fertilizerManager(),
                                ),
                              );
                            });
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'edit',
                              child: Text('Sửa'),
                            ),
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: Text('Xóa'),
                            ),
                          ];
                        },
                        child: Image.asset(
                          'assets/page-1/images/more-vertical.png',
                          width: 24 * fem,
                          height: 24 * fem,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 800 * fem,
                decoration: const BoxDecoration(
                  color: Color(0x8effffff),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 6 * fem,
                      top: 19 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 347 * fem,
                          height: 800 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffeaffe0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45 * fem),
                                topRight: Radius.circular(45 * fem),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 44 * fem,
                      top: 43 * fem,
                      child: Container(
                        width: 270 * fem,
                        height: 170 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(25 * fem),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(28.33 * fem, 21.25 * fem,
                              28.33 * fem, 21.25 * fem),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xceffffff),
                            borderRadius: BorderRadius.circular(25 * fem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 28.33 * fem),
                                width: 56.67 * fem,
                                height: 56.67 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/vector-JVP.png',
                                  width: 56.67 * fem,
                                  height: 56.67 * fem,
                                ),
                              ),
                              Container(
                                width: 113.33 * fem,
                                height: 42.5 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/vector-kPb.png',
                                  width: 113.33 * fem,
                                  height: 42.5 * fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16 * fem,
                      top: 234 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 328 * fem,
                          height: 800 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xbffeffcf),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35 * fem),
                                topRight: Radius.circular(35 * fem),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Mã phân bón
                    Positioned(
                      left: 30 * fem,
                      top: 259 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 87 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Mã mùa vụ :',
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
                    ),
                    //Tên phân bón
                    Positioned(
                      left: 30 * fem,
                      top: 318 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 97 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Tên phân bón :',
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
                    ),
                    //Nhà cung cấp
                    Positioned(
                      left: 30 * fem,
                      top: 377 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 97 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Nhà cung cấp : ',
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
                    ),
                    //Thành phần dinh dưỡng
                    Positioned(
                      left: 30 * fem,
                      top: 436 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 191 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Thành phần dinh dưỡng : ',
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
                    ),
                    //Đạm
                    Positioned(
                      left: 100 * fem,
                      top: 470 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 78 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Đạm : ',
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
                    ),
                    //Lân
                    Positioned(
                      left: 100 * fem,
                      top: 510 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 78 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Lân : ',
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
                    ),
                    //Kali
                    Positioned(
                      left: 100 * fem,
                      top: 550 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 78 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Kali : ',
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
                    ),
                    //Khác
                    Positioned(
                      left: 100 * fem,
                      top: 590 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 78 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Khác : ',
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
                    ),
                    //Công dụng
                    Positioned(
                      left: 30 * fem,
                      top: 632 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 97 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Công dụng :',
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
                    ),
                    //Hướng dẫn sử dụng
                    Positioned(
                      left: 30 * fem,
                      top: 701 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 125 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Hướng dẫn sử dụng :',
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
                    ),
                    //Mã phân bón
                    Positioned(
                      left: 128 * fem,
                      top: 253 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 191 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xfffffafa),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['fertilizerCode'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Tên phân bón
                    Positioned(
                      left: 128 * fem,
                      top: 312 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 191 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['fertilizerName'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Nhà cung cấp
                    Positioned(
                      left: 128 * fem,
                      top: 371 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 191 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['supplier'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Đạm
                    Positioned(
                      left: 180 * fem,
                      top: 465 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 80 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['nutrients']['nitro'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Lân
                    Positioned(
                      left: 180 * fem,
                      top: 505 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 80 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['nutrients']['phosphate'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Kali
                    Positioned(
                      left: 180 * fem,
                      top: 545 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 80 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['nutrients']['kali'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Khác
                    Positioned(
                      left: 180 * fem,
                      top: 585 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 80 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['nutrients']['others'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Công dụng
                    Positioned(
                      left: 25 * fem,
                      top: 656 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 191 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['usage'] ?? 'N/A',
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
                        ),
                      ),
                    ),
                    //Hướng dẫn sử dụng
                    Positioned(
                      left: 25 * fem,
                      top: 725 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 191 * fem,
                          height: 28 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * fem),
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                widget.fertilizerData['instructions'] ?? 'N/A',
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
