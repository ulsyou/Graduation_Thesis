import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-1/employee-update.dart';
import 'package:myapp/utils.dart';

import 'employee-manager.dart';

class EmployeeInformation extends StatefulWidget {
  final Map<String, dynamic> employeeData;

  EmployeeInformation({required this.employeeData});

  @override
  _EmployeeInformationState createState() => _EmployeeInformationState();
}

class _EmployeeInformationState extends State<EmployeeInformation> {
  List<Map<String, dynamic>> employees = [];
  String? selectedOption;
  bool isDropdownOpen = false;

  // Hàm gọi API để xóa người dùng
  Future<void> deleteEmployee() async {
    final userId = widget.employeeData['_id'];
    final apiUrl = Uri.parse('http://10.0.2.2:5000/user/delete/users/$userId');

    try {
      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          employees.removeWhere((employee) => employee['_id'] == userId);
        });
      } else {
        print('Failed to delete employee: ${response.statusCode}');
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting employee: $error');
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
                            builder: (context) => EmployeeManager(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 20 * fem, 3 * fem),
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
                          5 * fem, 5 * fem, 0 * fem, 0 * fem),
                      child: Text(
                        'Thông tin người dùng',
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
                            // Xử lý khi chọn "Sửa"
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => updateEmployee(
                                        employeeData: widget.employeeData,
                                      )),
                            );
                          } else if (value == 'delete') {
                            // Xử lý khi chọn "Xóa"
                            deleteEmployee().then((_) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmployeeManager(),
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
                height: 695 * fem,
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
                          height: 676 * fem,
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
                      left: 95 * fem,
                      top: 43 * fem,
                      child: Container(
                        width: 170 * fem,
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
                      // rectangle149Rs (66:136)
                      left: 16 * fem,
                      top: 234 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 328 * fem,
                          height: 461 * fem,
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
                    //Mã nhân viên
                    Positioned(
                      left: 38 * fem,
                      top: 259 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 87 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Mã nhân viên :',
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
                    //Họ và tên
                    Positioned(
                      left: 38 * fem,
                      top: 318 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 66 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Họ và tên :',
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
                    //SĐT
                    Positioned(
                      left: 38 * fem,
                      top: 377 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 97 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Số điện thoại : ',
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
                    //Email
                    Positioned(
                      left: 38 * fem,
                      top: 436 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 43 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Email : ',
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
                    //Chuyên môn
                    Positioned(
                      left: 38 * fem,
                      top: 495 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 87 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Chuyên môn : ',
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
                    //Vai trò
                    Positioned(
                      left: 38 * fem,
                      top: 554 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 88 * fem,
                          height: 18 * fem,
                          child: Text(
                            'Vai trò : ',
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
                    //Mã nhân viên
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
                                widget.employeeData['employeeCode'] ?? 'N/A',
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
                    //Họ và tên
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
                                widget.employeeData['fullName'] ?? 'N/A',
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
                    //SĐT
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
                                widget.employeeData['phoneNumber'] ?? 'N/A',
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
                    //Email
                    Positioned(
                      left: 128 * fem,
                      top: 430 * fem,
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
                                widget.employeeData['email'] ?? 'N/A',
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
                    //Chuyên môn
                    Positioned(
                      left: 128 * fem,
                      top: 489 * fem,
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
                                widget.employeeData['expertise'] ?? 'N/A',
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
                    //Vai trò
                    Positioned(
                      left: 128 * fem,
                      top: 548 * fem,
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
                                widget.employeeData['role'] ?? 'N/A',
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
