import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-1/employee-manager.dart';
import 'package:myapp/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();

  Future<void> addEmployee() async {
    final String apiUrl = 'http://10.0.2.2:5000/user/create/users';

    final response = await http.post(Uri.parse(apiUrl), body: {
      'fullName': nameController.text,
      'phoneNumber': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'role': selectedRole,
      'expertise': expertiseController.text,
    });

    if (response.statusCode == 201) {
      print('User create successfully');
    } else {
      print('Error in Create new User:  ${response.body}');
    }
  }

  String selectedRole = 'Quản trị viên';

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
              left: 249,
              top: 664,
              child: Text(
                'RC00002',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
              left: 249,
              top: 608,
              child: Text(
                'RC00002',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
                'Vị trí:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 249,
              top: 552,
              child: Text(
                'RC00002',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
              left: 249,
              top: 496,
              child: Text(
                'RC00002',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
              left: 249,
              top: 440,
              child: Text(
                'RC00002',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
                decoration: BoxDecoration(
                  color: const Color(0xCCFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Positioned(
              left: 51,
              top: 383,
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
              left: 249,
              top: 383,
              child: Text(
                'RC00002',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 47,
              top: 164,
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
                    color: Colors.white,
                    width: 318,
                    height: 180,
                  ),
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
                  onTap: () {},
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
                        builder: (context) => EmployeeManager(),
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
                  onTap: () {},
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
                        builder: (context) => EmployeeManager(),
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
                      color: Colors.white,
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
                        builder: (context) => EmployeeManager(),
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
              left: 106,
              top: 65,
              child: SizedBox(
                width: 214,
                child: Text(
                  'Thêm người dùng',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
