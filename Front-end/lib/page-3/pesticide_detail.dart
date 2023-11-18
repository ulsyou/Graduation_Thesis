import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-3/pesticides.dart';

class PesticideDetail extends StatefulWidget {
  final Map<String, dynamic> pesticideData;

  PesticideDetail({required this.pesticideData});

  @override
  _PesticideDetail createState() => _PesticideDetail();
}

class _PesticideDetail extends State<PesticideDetail> {
  bool isHidden = true;
  List<Map<String, dynamic>> pesticides = [];

// Hàm để hiển thị phần xác nhận xóa
  void showPositioned() {
    setState(() {
      isHidden = false;
    });
  }

// Hàm để ẩn phần xác nhận xóa
  void hidePositioned() {
    setState(() {
      isHidden = true;
    });
  }

  // Hàm gọi API để xóa
  Future<void> deletePesticide() async {
    final pesticideId = widget.pesticideData['_id'];
    final apiUrl = Uri.parse(
        'http://10.0.2.2:5000/pesticide/delete/pesticide/$pesticideId');

    try {
      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          pesticides
              .removeWhere((pesticide) => pesticide['_id'] == pesticideId);
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Pesticide()),
        );
      } else {
        print('Failed to delete pesticide: ${response.statusCode}');
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting pesticide: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 1180,
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
                  height: 1180,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                      ),
                      fit: BoxFit.none,
                      alignment: Alignment.centerLeft,
                      opacity: 0.7,
                      scale: 2.4,
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
                  height: 1180,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0x84FFFDF4),
                  ),
                ),
              ),
              Positioned(
                left: 47,
                top: 148,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.pesticideData['image'],
                    width: 318,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 387,
                child: Container(
                  width: 412,
                  height: 793,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0x4CEAFFB1),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 347,
                child: Container(
                  width: 364,
                  height: 833,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0x4CF5FFD9),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
              Positioned(
                left: 43,
                top: 461,
                child: Container(
                  width: 328,
                  height: 76,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 466,
                child: Text(
                  'Đặc trị:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 75,
                top: 495,
                child: SizedBox(
                  width: 247,
                  child: Text(
                    widget.pesticideData['treatingDiseases'] is List
                        ? (widget.pesticideData['treatingDiseases'] as List).join(', ')
                        : widget.pesticideData['treatingDiseases'] ?? 'N/A',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 870,
                child: Container(
                  width: 328,
                  height: 159,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 875,
                child: Text(
                  'Hướng dẫn sử dụng:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 56,
                top: 903,
                child: SizedBox(
                  width: 298,
                  height: 118,
                  child: Text(
                    widget.pesticideData['usageInstructions'] ?? 'N/A',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 668,
                child: Container(
                  width: 328,
                  height: 187,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 673,
                child: SizedBox(
                  width: 97,
                  height: 26,
                  child: Text(
                    'Công dụng:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 56,
                top: 697,
                child: SizedBox(
                  width: 306,
                  height: 153,
                  child: Text(
                    widget.pesticideData['function'] ?? 'N/A',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 594,
                child: Container(
                  width: 328,
                  height: 63,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 598,
                child: SizedBox(
                  height: 24,
                  child: Text(
                    'Thành phần:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 627,
                child: SizedBox(
                  width: 296,
                  height: 23,
                  child: Text(
                    widget.pesticideData['ingredients'] ?? 'N/A',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 43,
                top: 548,
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
                left: 50,
                top: 553,
                child: Text(
                  'Nhà cung cấp:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 191,
                top: 555,
                child: Text(
                  widget.pesticideData['supplier'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 415,
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
                left: 49,
                top: 420,
                child: Text(
                  'Tên thuốc:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 190,
                top: 422,
                child: Text(
                  widget.pesticideData['pesticideName'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 369,
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
                left: 49,
                top: 373,
                child: Text(
                  'Mã thuốc:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 245,
                top: 374,
                child: Text(
                  widget.pesticideData['pesticideCode'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
                    color: Color(0xFFFFFA96),
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
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F1979e4809a9158f955c1fd7b58386847.png',
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
                          builder: (context) => Pesticide(),
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
                left: 118,
                top: 65,
                child: Text(
                  'Thông tin thuốc',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 43,
                top: 1090,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      // Add your onTap logic here
                    },
                    overlayColor:
                        MaterialStateProperty.all<Color>(Color(0x0c7f7f7f)),
                    child: Container(
                      width: 141,
                      height: 47,
                      color: const Color(0xFFFFF9C7),
                      child: Center(
                        child: Text(
                          'Cập nhật',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 231,
                top: 1090,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      showPositioned();
                    },
                    child: Ink(
                      color: const Color(0xFFFF3838),
                      width: 141,
                      height: 47,
                      child: Center(
                        child: Text(
                          'Xoá',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 47,
                top: 352,
                child: Container(
                  width: 318,
                  height: 211,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      if (!isHidden)
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 318,
                            height: 211,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: const Color(0xE5FFD79C),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      if (!isHidden)
                        Positioned(
                          left: 42,
                          top: 62,
                          child: Text(
                            'Xác nhận xóa ?',
                            style: GoogleFonts.getFont(
                              'Noto Sans',
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (!isHidden)
                        GestureDetector(
                          onTap: () {
                            deletePesticide();
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                left: 43,
                                top: 133,
                                child: Material(
                                  type: MaterialType.transparency,
                                  borderRadius: BorderRadius.circular(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Ink(
                                    color: const Color(0xFF65FF3F),
                                    width: 84,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 140,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () {
                                      deletePesticide();
                                    },
                                    overlayColor:
                                        const MaterialStatePropertyAll<Color>(
                                      Color(0x0c7f7f7f),
                                    ),
                                    child: Text(
                                      'Xác nhận',
                                      style: GoogleFonts.getFont(
                                        'Noto Sans',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!isHidden)
                        GestureDetector(
                          onTap: () {
                            hidePositioned();
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                left: 183,
                                top: 133,
                                child: Material(
                                  type: MaterialType.transparency,
                                  borderRadius: BorderRadius.circular(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Ink(
                                    color: const Color(0xFFD9D9D9),
                                    width: 84,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 208,
                                top: 139,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    'Hủy',
                                    style: GoogleFonts.getFont(
                                      'Noto Sans',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
    );
  }
}
