import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-1/employee-detail.dart';

class updateEmployee extends StatefulWidget {
  final Map<String, dynamic> employeeData;

  updateEmployee({required this.employeeData});

  @override
  _updateEmployeeState createState() => _updateEmployeeState();
}

class _updateEmployeeState extends State<updateEmployee> {
  late Map<String, dynamic> updatedEmployeeData;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();
  String? imagePath;
  File? image;

  String selectedRole = 'Quản trị viên';

  String _formatPhoneNumber(String text) {
    if (text.length <= 3) {
      return text;
    } else if (text.length <= 6) {
      return '${text.substring(0, 3)}-${text.substring(3)}';
    } else {
      return '${text.substring(0, 3)}-${text.substring(3, 6)}-${text.substring(6)}';
    }
  }

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final formattedText = _formatPhoneNumber(text);
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  @override
  void initState() {
    super.initState();
    updatedEmployeeData = widget.employeeData;
  }

  Future<Map<String, dynamic>> getEmployeeData(String id) async {
    final String apiUrl = 'http://10.0.2.2:5000/user/users/$id';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load employee data');
    }
  }

  Future<bool> updateEmployee(String id, File? image) async {
    try {
      final String apiUrl = 'http://10.0.2.2:5000/user/update/users/$id';

      var request = http.MultipartRequest('PATCH', Uri.parse(apiUrl))
        ..fields['fullName'] = nameController.text
        ..fields['phoneNumber'] = _formatPhoneNumber(phoneController.text)
        ..fields['email'] = emailController.text
        ..fields['password'] = passwordController.text
        ..fields['role'] = selectedRole
        ..fields['expertise'] = expertiseController.text;

      if (image != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      } else {
        request.fields['image'] = widget.employeeData['image'];
      }
      var response = await request.send().timeout(Duration(seconds: 30));
      if (response.statusCode == 200) {
        print('Season updated successfully');
        updatedEmployeeData = await getEmployeeData(id);
        return true; // Indicate success
      } else {
        print('Request failed with status ${response.statusCode}');
        return false; // Indicate failure
      }
    } catch (e) {
      print('An error occurred: $e');
      return false; // Indicate failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 915,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 412,
                  height: 915,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                      ),
                      fit: BoxFit.fill,
                      alignment: Alignment.centerLeft,
                      opacity: 0.7,
                      scale: 3.1,
                    ),
                    border: Border.all(),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 412,
                  height: 915,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0x84FFFDF4),
                  ),
                ),
              ),
              Positioned(
                left: 47,
                top: 164,
                child: InkWell(
                  onTap: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        image = File(pickedFile.path);
                      });
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: image != null
                        ? Image.file(
                            File(image!.path),
                            width: 318,
                            height: 180,
                            fit: BoxFit.cover,
                          )
                        : widget.employeeData['image'] != null
                            ? Image.network(
                                widget.employeeData['image'],
                                width: 318,
                                height: 180,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'assets/page-1/images/Group 46.png',
                                width: 318,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 659,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 664,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Text(
                          'Mật khẩu:',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: -13,
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Nhập mật khẩu mới',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xb57e7e7e),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 603,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 608,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Text(
                          'Số điện thoại:',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 160,
                        top: -13,
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: phoneController
                              ..text =
                                  (widget.employeeData['phoneNumber'] ?? 'N/A'),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) =>
                                      formatEditUpdate(oldValue, newValue)),
                            ],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xb57e7e7e),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 547,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 552,
                child: Text(
                  'Vai trò:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 217,
                top: 541,
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
                    'Nhân viên',
                    'Chuyên gia',
                    'Quản trị viên',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                left: 44,
                top: 491,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 496,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Text(
                          'Chuyên môn:',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: -13,
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: expertiseController
                              ..text =
                                  (widget.employeeData['expertise'] ?? 'N/A'),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xb57e7e7e),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 435,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 440,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Text(
                          'Email:',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 95,
                        top: -13,
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: emailController
                              ..text = (widget.employeeData['email'] ?? 'N/A'),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xb57e7e7e),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 379,
                child: Container(
                  width: 328,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 328,
                          height: 35,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: const Color(0xCCFFFFFF),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 4,
                        child: Text(
                          'Họ và tên:',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: -7,
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: nameController
                              ..text =
                                  (widget.employeeData['fullName'] ?? 'N/A'),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xb57e7e7e),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 790,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(35),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () async {
                      final id = widget.employeeData['_id'];

                      bool success = await updateEmployee(id, image);

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetail(
                                employeeData: updatedEmployeeData),
                          ),
                        );
                      }
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: Colors.white,
                      width: 170,
                      height: 58,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 216,
                top: 790,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(35),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EmployeeDetail(employeeData: widget.employeeData),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xFFFD9C9C),
                      width: 173,
                      height: 58,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 71,
                top: 810,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () async {
                      final id = widget.employeeData['_id'];

                      bool success = await updateEmployee(id, image);

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetail(
                                employeeData: updatedEmployeeData),
                          ),
                        );
                      }
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Text(
                      'Xác nhận',
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 0.9,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 287,
                top: 810,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EmployeeDetail(employeeData: widget.employeeData),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Text(
                      'Huỷ',
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 0.9,
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
                  width: 412,
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
                        left: -115,
                        top: -118,
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2Fc635059ff9273dae3cfa4172964d22eb.png',
                          width: 351,
                          height: 254,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 104,
                        top: 66,
                        child: Text(
                          'Cập nhật thông tin',
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
              ),
              Positioned(
                left: 35,
                top: 66,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EmployeeDetail(employeeData: widget.employeeData),
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
            ],
          ),
        ),
      ),
    );
  }
}
