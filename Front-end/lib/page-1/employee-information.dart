import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

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
    return Container(
      width: 412,
      height: 966,
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
              top: -13,
              child: Container(
                width: 412,
                height: 979,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                    ),
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                    opacity: 0.7,
                    scale: 2.9,
                  ),
                  border: Border.all(),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: -13,
              child: Container(
                width: 412,
                height: 979,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Color(0x84FFFDF4),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 15,
              child: Image.network(
                'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2F6c85841d9d76081c90947acd92470ff2.png',
                width: 360,
                height: 198,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: -167,
              top: 195,
              child: Image.network(
                'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2F60bf1379acec0b1e7b40559b40219817.png',
                width: 663,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 35,
              top: 146,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FbBi0N1EZ1GlEm38rYJyr%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2aEllipse%202.png?alt=media&token=e547c55c-4b91-45b5-ad94-a49001112dba',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 307,
              child: SizedBox(
                width: 195,
                height: 27,
                child: Text(
                  'Họ và tên',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 333,
              child: Container(
                width: 354,
                height: 44,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x82000000),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Positioned(
              left: 49,
              top: 348,
              child: SizedBox(
                width: 171,
                child: Text(
                  'Melissa Peters',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: const Color(0xFF534C4C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 393,
              child: SizedBox(
                width: 122,
                child: Text(
                  'Email',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 419,
              child: Container(
                width: 354,
                height: 44,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x82000000),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: 434,
              child: SizedBox(
                width: 320,
                child: Text(
                  'melpeters@gmail.com',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: const Color(0xFF534C4C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 481,
              child: SizedBox(
                width: 136,
                child: Text(
                  'Chuyên môn',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 507,
              child: Container(
                width: 354,
                height: 44,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x82000000),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: 522,
              child: SizedBox(
                width: 323,
                child: Text(
                  'Chuyên môn',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: const Color(0xFF544C4C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 659,
              child: SizedBox(
                width: 187,
                child: Text(
                  'Số điện thoại',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 685,
              child: Container(
                width: 354,
                height: 44,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x82000000),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Positioned(
              left: 51,
              top: 700,
              child: SizedBox(
                width: 162,
                child: Text(
                  '0123456789',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: const Color(0xFF534C4C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 749,
              child: SizedBox(
                width: 187,
                child: Text(
                  'Vai trò',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 775,
              child: Container(
                width: 354,
                height: 44,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x82000000),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Positioned(
              left: 51,
              top: 790,
              child: SizedBox(
                width: 162,
                child: Text(
                  'Quản trị viên',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: const Color(0xFF534C4C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 569,
              child: SizedBox(
                width: 187,
                child: Text(
                  'Vị trí',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 595,
              child: Container(
                width: 354,
                height: 44,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x82000000),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: 610,
              child: SizedBox(
                width: 162,
                child: Text(
                  'Chuyên gia',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: const Color(0xFF534C4C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 26,
              top: 882,
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
              top: 882,
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
                    color: const Color(0xFFFD9C9C),
                    width: 173,
                    height: 58,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 71,
              top: 902,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {},
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Text(
                    'Cập nhật',
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
              top: 902,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {},
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Text(
                    'Xoá',
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
              left: 98,
              top: 58,
              child: Text(
                'Thông tin tài khoản',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 39,
              top: 63,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {},
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
                          left: 4,
                          top: 4,
                          child: Image.network(
                            'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2F27779bc9b3ca41161ea5511599390cdd.png',
                            width: 16,
                            height: 16,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
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
