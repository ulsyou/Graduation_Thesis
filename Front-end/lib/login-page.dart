import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'page-1/admin-manager.dart';
import 'page-2/employee-homescreen.dart';
import 'page-3/expert-manager-page.dart';

class Scene extends StatefulWidget {
  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  Future<void> loginUser() async {
    String url = 'http://10.0.2.2:5000/user/login'; //192.168.139.183
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> body = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        // Login successful
        print('Login successful');
        // Show the loading screen while fetching data
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) =>
                LoadingScreen(),
          ),
        );

        // Simulate a delay before navigating to admin-manager.dart
        await Future.delayed(Duration(seconds: 2));

        // Check if there's a route to pop before navigating
        if (Navigator.of(context).canPop()) {
          // Pop the loading screen route before navigating to admin-manager.dart
          Navigator.of(context).pop();
        }

        // Decode response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Save user data to local storage
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userData', jsonEncode(responseData));

        if (responseData.containsKey('role')) {
          String role = responseData['role'];

          // Navigate based on role
          if (role == 'Quản trị viên') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminManagerPage()),
            );
          } else if (role == 'Chuyên gia') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ExpertManagerPage(isNavigatedFromOtherPage: true)),
            );
          } else if (role == 'Nhân viên') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmployeeHomeScreen()),
            );
          }
        } else {
          // Không có thuộc tính "role" trong dữ liệu
          print('Role not found in response data');
        }
      } else {
        // Login failed
        print('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during login
      print('Error: $e');
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
          width: double.infinity,
          height: 915,
          decoration: const BoxDecoration(
            color: Color(0x72e0e0e0),
            image: DecorationImage(
              image: AssetImage(
                'assets/page-1/images/polina-kuzovkova-_OQ17__L06U-unsplash.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  // rectangle6xh7 (21:2)
                  left: 16 * fem,
                  top: 100 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 328 * fem,
                      height: 580 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40 * fem),
                          color: Color(0x59000000),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle33Cm (2:41)
                  left: 57 * fem,
                  top: 184 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 50 * fem,
                      height: 50 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(42 * fem),
                        child: Image.asset(
                          'assets/page-1/images/rectangle-3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle5w3F (2:43)
                  left: 72 * fem,
                  top: 400 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 260 * fem,
                      height: 64 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * fem),
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle4RUD (2:42)
                  left: 72 * fem,
                  top: 322 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 260 * fem,
                      height: 64 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * fem),
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle2jjo (2:40)
                  left: 120 * fem,
                  top: 543 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 120 * fem,
                      height: 46 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * fem),
                          color: Color(0xfffff739),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group2qXw (2:59)
                  left: 41 * fem,
                  top: 422 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 18 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/page-1/images/white-lock.png',
                        width: 18 * fem,
                        height: 20 * fem,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group1LzV (2:58)
                  left: 37 * fem,
                  top: 342 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 24 * fem,
                      height: 24 * fem,
                      child: Image.asset(
                        'assets/page-1/images/user.png',
                        width: 24 * fem,
                        height: 24 * fem,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 138 * fem,
                  top: 555 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 93 * fem,
                      height: 22 * fem,
                      child: Material(
                        color: Color(0xfffff739),
                        child: InkWell(
                          onTap: () {
                            loginUser();
                          },
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.215 * ffem / fem,
                              fontStyle: FontStyle.italic,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // ngnhp5qb (2:61)
                  left: 120 * fem,
                  top: 187 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 216 * fem,
                      height: 44 * fem,
                      child: Text(
                        'ĐĂNG NHẬP',
                        style: SafeGoogleFont(
                          'Cabin',
                          fontSize: 36 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.215 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      left: 96 * fem,
                      top: 344 * fem,
                      child: Align(
                        child: Container(
                          width: 200 * fem,
                          height: 22 * fem,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Tên tài khoản',
                              hintStyle: TextStyle(
                                fontFamily: 'Cabin',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 0.215 * ffem / fem,
                                color: Color(0x7f000000),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 96 * fem,
                      top: 421 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 160 * fem,
                          height: 22 * fem,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Mật khẩu',
                              hintStyle: TextStyle(
                                fontFamily: 'Cabin',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 0.215 * ffem / fem,
                                color: Color(0x7f000000),
                              ),
                              border: InputBorder.none,
                            ),
                            obscureText: !isPasswordVisible,
                            obscuringCharacter: '•',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 288 * fem,
                      top: 420 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 24 * fem,
                          height: 24 * fem,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Image.asset(
                              isPasswordVisible
                                  ? 'assets/page-1/images/eye.png'
                                  : 'assets/page-1/images/eye-off.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
