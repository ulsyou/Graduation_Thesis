import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-1/employee-detail.dart';

import '../utils.dart';
import 'admin-manager.dart';
import 'employee-add.dart';

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
        filteredEmployees = employees;
      });
    } else {
      print('Failed to fetch employees: ${response.statusCode}');
    }
  }

  void navigateToEmployeeDetail(Map<String, dynamic> employeeData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmployeeDetail(
          employeeData: employeeData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 915,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 50,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    width: 412,
                    height: 915,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x99000000)),
                      color: Color(0x84FFFDF4),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      ),
                    ),
                    child: ListView.builder(
                        itemCount: filteredEmployees.length,
                        itemBuilder: (context, index) {
                          final employee = filteredEmployees[index];
                          EdgeInsets margin = EdgeInsets.symmetric(vertical: 0);
                          if (index == 0) {
                            margin = EdgeInsets.only(top: 130);
                          }
                          return InkWell(
                            onTap: () {
                              navigateToEmployeeDetail(employee);
                            },
                            child: Container(
                              margin: margin,
                              width: double.infinity,
                              height: 160,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Align(
                                      child: SizedBox(
                                        width: 350,
                                        height: 130,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            gradient: LinearGradient(
                                              begin: Alignment(1.217, -0.146),
                                              end: Alignment(-1.379, 0.131),
                                              colors: <Color>[
                                                Color(0xffffffff),
                                                Color(0x00fffacd)
                                              ],
                                              stops: <double>[0, 1],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    child: Align(
                                      child: SizedBox(
                                        width: 165,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            employee['image'],
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 175,
                                    top: 20,
                                    child: Align(
                                      child: SizedBox(
                                        width: 200,
                                        height: 25,
                                        child: Text(
                                          employee['fullName'],
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 175,
                                    top: 95,
                                    child: Align(
                                      child: SizedBox(
                                        width: 77,
                                        height: 20,
                                        child: Text(
                                          'Vai trò: ${employee['role']}',
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 175,
                                    top: 48,
                                    child: Align(
                                      child: SizedBox(
                                        width: 120,
                                        height: 20,
                                        child: Text(
                                          'Mã nhân viên: ${employee['employeeCode']}',
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 230,
                                    top: 75,
                                    child: Align(
                                      child: SizedBox(
                                        width: 50,
                                        height: 17,
                                        child: Text(
                                          employee['employeeCode'],
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3625,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 230,
                                    top: 113,
                                    child: Align(
                                      child: SizedBox(
                                        width: 80,
                                        height: 17,
                                        child: Text(
                                          employee['role'],
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3625,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 360,
                                    top: 40,
                                    child: Align(
                                      child: SizedBox(
                                        width: 6,
                                        height: 50,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFF400),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 412,
                    height: 127,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 412,
                            height: 127,
                            decoration: BoxDecoration(
                              color: Color(0xFFD7FF96),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 360,
                                height: 115,
                                child: Image.asset(
                                  'assets/page-1/images/mask-group.png',
                                  width: 360,
                                  height: 115,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 35.4800109863,
                          top: 66,
                          child: Align(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AdminManagerPage(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Image.asset(
                                  'assets/page-1/images/Group 25.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 66,
                          child: Align(
                            child: SizedBox(
                              width: 250,
                              height: 33,
                              child: Text(
                                'Quản trị người dùng',
                                style: SafeGoogleFont(
                                  'Noto Sans',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 293,
                  top: 800,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(35),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddEmployee(),
                          ),
                        );
                      },
                      overlayColor: const MaterialStatePropertyAll<Color>(
                        Color(0x0c7f7f7f),
                      ),
                      child: Ink(
                        color: const Color(0xFF7CFF5B),
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 316,
                  top: 822,
                  child: Material(
                    type: MaterialType.transparency,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddEmployee(),
                          ),
                        );
                      },
                      overlayColor: const MaterialStatePropertyAll<Color>(
                        Color(0x0c7f7f7f),
                      ),
                      child: Container(
                        width: 28,
                        height: 28,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Image.asset(
                                'assets/page-1/images/Group 1.png',
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 120,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width - 16,
                      child: TextField(
                        onChanged: (value) {
                          // searchQuery = value;
                          // filteredEmployees = employees.where((employee) {
                          //   return employee['cropSeasonName']
                          //       .toLowerCase()
                          //       .contains(searchQuery.toLowerCase());
                          // }).toList();
                        },
                        decoration: InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
