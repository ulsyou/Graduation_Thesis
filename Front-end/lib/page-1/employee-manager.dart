import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
      width: 412,
      height: 915,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 412,
                height: 918,
                clipBehavior: Clip.hardEdge,
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
                ),
              ),

            Positioned(
              left: 73,
              top: 231,
              child: Material(
                type: MaterialType.transparency,
                borderRadius: BorderRadius.circular(30),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {

                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Ink(
                    width: 311,
                    height: 138,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD3FFBF), Color(0x00FFFACD)],
                        stops: [0.12, 1],
                        transform: GradientRotation(180 * pi / 180),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 45,
              top: 245,
              child: Material(
                type: MaterialType.transparency,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {},
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Ink(
                    width: 165,
                    height: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FbBi0N1EZ1GlEm38rYJyr%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2aRectangle%2026.png?alt=media&token=e6124bc2-14f7-40e7-bceb-4bef15e3c37a',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 216,
              top: 238,
              child: Text(
                'Tên nhân viên',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 217,
              top: 315,
              child: Text(
                'Vai trò:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 216,
              top: 268,
              child: SizedBox(
                width: 112,
                child: Text(
                  'Mã nhân viên:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 246,
              top: 294,
              child: Text(
                'RC00002',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: const Color(0xFF777777),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 246,
              top: 339,
              child: Text(
                'Vụ mùa',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: const Color(0xFF777777),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 378,
              top: 270,
              child: Transform.rotate(
                angle: 180 * pi / 180,
                child: Container(
                  width: 6,
                  height: 50,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF400),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 26,
              top: 144,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2F0fbad377eca9bcae2be58b854caef4f0.png',
                  width: 360,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              left: 53,
              top: 155,
              child: Text(
                'Tìm kiếm',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: const Color(0xFF646464),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
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
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 5,
                          top: 5,
                          child: Image.network(
                            'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2Fb3e9c2f4ae02858e93b665c13e511eda.png',
                            width: 14,
                            height: 14,
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
              top: 0,
              child: Container(
                width: 412,
                height: 127,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Color(0xFFD7FF96),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 360,
                height: 115,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -100,
                      top: -118,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2Fb321c41cffe9bedffce10c943759ce90.png',
                        width: 307,
                        height: 254,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 31,
              top: 66,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AdminManagerPage(),
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
                          left: 4,
                          top: 4,
                          child: Image.asset(
                            'assets/page-1/images/Group 25.png',
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
              left: 93,
              top: 61,
              child: Text(
                'Quản trị người dùng',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
