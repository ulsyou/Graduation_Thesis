import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'admin-manager.dart';
import 'employee-add.dart';
import 'employee-information.dart';

class EmployeeManager extends StatefulWidget {
  @override
  _EmployeeManagerState createState() => _EmployeeManagerState();
}

class _EmployeeManagerState extends State<EmployeeManager> {
  List<dynamic> employees = [];
  String searchQuery = '';
  List<dynamic> filteredEmployees = [];
  FocusNode searchFocus = FocusNode();

  void performSearch(String searchText) {
    setState(() {
      searchQuery = searchText;
      filteredEmployees = employees.where((employee) {
        return employee['fullName']
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();
    });
    searchFocus.requestFocus();
  }

  void resetSearch() {
    setState(() {
      searchQuery = '';
      filteredEmployees.clear();
    });
    searchFocus.unfocus();
  }

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/user/users'));

    if (response.statusCode == 200) {
      setState(() {
        employees = json.decode(response.body);
      });
    } else {
      print('Failed to fetch employees: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0 * fem, 37 * fem, 0 * fem, 0 * fem),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            image: DecorationImage(
              image: AssetImage(
                'assets/page-1/images/wolfgang-hasselmann-ucnhoxas6pq-unsplash-1-bg-vS5.png',
              ),
              fit: BoxFit.cover,
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AdminManagerPage(), // Thay thế AdminManagerPage bằng tên trang của bạn
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
                      'Quản trị người dùng',
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
                    EdgeInsets.fromLTRB(16 * fem, 13 * fem, 16 * fem, 18 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x8effffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 10 * fem, 0 * fem, 17 * fem),
                      padding: EdgeInsets.fromLTRB(
                          15 * fem, 16 * fem, 198 * fem, 13 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xb2ffffff),
                        borderRadius: BorderRadius.circular(45 * fem),
                      ),
                      //Search bar
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 8 * fem, 1 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/search.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              focusNode: searchFocus,
                              onChanged: (value) {
                                performSearch(value);
                              },
                              decoration: InputDecoration(
                                hintText: 'Tìm kiếm',
                                hintStyle: TextStyle(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0x7f000000),
                                ),
                                border: InputBorder.none,
                                suffixIcon: searchQuery.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          resetSearch();
                                        },
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children:
                          (searchQuery.isEmpty ? employees : filteredEmployees)
                              .map((employee) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EmployeeInformation(employeeData: employee),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 17 * fem),
                            padding: EdgeInsets.fromLTRB(
                                12 * fem, 17 * fem, 0 * fem, 17 * fem),
                            width: double.infinity,
                            height: 169 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xbffdffc8),
                              borderRadius: BorderRadius.circular(35 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      5 * fem, 0 * fem, 10 * fem, 0 * fem),
                                  width: 120 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius:
                                        BorderRadius.circular(25 * fem),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(16.67 * fem,
                                        16.88 * fem, 16.67 * fem, 16.88 * fem),
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xceffffff),
                                      borderRadius:
                                          BorderRadius.circular(25 * fem),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 22.5 * fem),
                                          width: 33.33 * fem,
                                          height: 45 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/vector.png',
                                            width: 33.33 * fem,
                                            height: 45 * fem,
                                          ),
                                        ),
                                        Container(
                                          width: 66.67 * fem,
                                          height: 33.7 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/vector-Lmo.png',
                                            width: 66.67 * fem,
                                            height: 33.75 * fem,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 161 * fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 35 * fem,
                                        decoration: BoxDecoration(
                                          color: Color(0xfffffafa),
                                          borderRadius:
                                              BorderRadius.circular(25 * fem),
                                        ),
                                        child: Center(
                                          child: Text(
                                            employee['expertise'],
                                            style: TextStyle(
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.215 * ffem / fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(18 * fem,
                                            9 * fem, 18 * fem, 7 * fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xfffffafa),
                                          borderRadius:
                                              BorderRadius.circular(25 * fem),
                                        ),
                                        child: Text(
                                          employee['fullName'],
                                          style: TextStyle(
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.215 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(18 * fem,
                                            10 * fem, 18 * fem, 8 * fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xfffffafa),
                                          borderRadius:
                                              BorderRadius.circular(25 * fem),
                                        ),
                                        child: Text(
                                          employee['phoneNumber'],
                                          style: TextStyle(
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.215 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    //Thêm nhân viên
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEmployee()),
                        );
                      },
                      child: Transform.translate(
                        offset: Offset(0, 0 * fem),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              250 * fem, 0 * fem, 0 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              20 * fem, 20 * fem, 20 * fem, 20 * fem),
                          decoration: BoxDecoration(
                            color: Color(0xff14ff00),
                            borderRadius: BorderRadius.circular(35 * fem),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 30 * fem,
                              height: 30 * fem,
                              child: Image.asset(
                                'assets/page-1/images/user-plus.png',
                                width: 30 * fem,
                                height: 30 * fem,
                              ),
                            ),
                          ),
                        ),
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
