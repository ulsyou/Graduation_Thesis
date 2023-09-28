import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/utils.dart';

import 'employee-manager.dart';

class updateEmployee extends StatefulWidget {
  final Map<String, dynamic> employeeData;

  updateEmployee({required this.employeeData});

  @override
  _updateEmployeeState createState() => _updateEmployeeState();
}

class _updateEmployeeState extends State<updateEmployee> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();

  Future<void> updateEmployee() async {
    final employeeId = widget.employeeData['_id'];
    final url = 'http://10.0.2.2:5000/user/update/users/$employeeId';

    Map<String, dynamic> requestBody = {
      'role': selectedRole,
    };

    if (nameController.text.isNotEmpty) {
      requestBody['fullName'] = nameController.text;
    }

    if (phoneController.text.isNotEmpty) {
      requestBody['phoneNumber'] = phoneController.text;
    }

    if (emailController.text.isNotEmpty) {
      requestBody['email'] = emailController.text;
    }

    if (passwordController.text.isNotEmpty) {
      requestBody['password'] = passwordController.text;
    }

    if (expertiseController.text.isNotEmpty) {
      requestBody['expertise'] = expertiseController.text;
    }

    final response = await http.patch(
      Uri.parse(url),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('User update successfully');
    } else {
      print('Error in update user: ${response.body}');
    }
  }

  String selectedRole = 'Quản trị viên';

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
                        Navigator.pop(
                            context);
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
                      // autogrouplncy6N5 (KxhnrYbcsCwadmYYztLNCy)
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
                    //Họ tên
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 175 * fem, 0 * fem),
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
                                controller: nameController,
                                style: TextStyle(
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Họ và tên',
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
                    //SĐT
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          22.11 * fem, 0 * fem, 0 * fem, 0 * fem),
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
                                0 * fem, 0 * fem, 18 * fem, 0.07 * fem),
                            width: 19.89 * fem,
                            height: 19.93 * fem,
                            child: Image.asset(
                              'assets/page-1/images/phone.png',
                              width: 19.89 * fem,
                              height: 19.93 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 2 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              style: SafeGoogleFont(
                                'Cabin',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.215 * ffem / fem,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Số điện thoại',
                                hintStyle: TextStyle(
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.phone,
                              // Để hiển thị bàn phím số
                              inputFormatters: [
                                // Định dạng số điện thoại (XXX-XXX-XXXX)
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                                // Giới hạn số ký tự
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  if (newValue.text.isNotEmpty) {
                                    final text = newValue.text.replaceAll(
                                        RegExp(r'\D'),
                                        ''); // Remove non-numeric characters
                                    final formattedText = <String>[];

                                    for (var i = 0; i < text.length; i++) {
                                      if (i == 3 || i == 6) {
                                        formattedText.add('-');
                                      }
                                      formattedText.add(text[i]);
                                    }

                                    final newText = formattedText.join('');

                                    return TextEditingValue(
                                      text: newText,
                                      selection: TextSelection.collapsed(
                                          offset: newText.length),
                                    );
                                  }
                                  return newValue;
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Email
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 207 * fem, 0 * fem),
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
                              controller: emailController,
                              style: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Pass
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 175 * fem, 0 * fem),
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
                              controller: passwordController,
                              style: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Mật khẩu',
                                hintStyle: TextStyle(
                                  fontSize: 16 * fem,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Chuyên môn
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          23 * fem, 0 * fem, 151 * fem, 0 * fem),
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
                                0 * fem, 0 * fem, 19 * fem, 0 * fem),
                            width: 18 * fem,
                            height: 18 * fem,
                            child: Image.asset(
                              'assets/page-1/images/command.png',
                              width: 18 * fem,
                              height: 18 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: expertiseController,
                              style: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Chuyên môn',
                                hintStyle: TextStyle(
                                  fontSize: 16 * fem,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Vai trò
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 51 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 139 * fem, 0 * fem),
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
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/users.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                              value: selectedRole,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedRole = newValue;
                                  });
                                }
                              },
                              items: <String>[
                                'Quản trị viên',
                                'Chuyên gia',
                                'Nhân viên',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 16 * fem,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Confirm + Cancel
                    Container(
                      width: double.infinity,
                      height: 58 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                updateEmployee().then((_) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmployeeManager(),
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
                                    builder: (context) => EmployeeManager(),
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
