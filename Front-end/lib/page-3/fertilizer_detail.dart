import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-3/fertilizers.dart';

class FertilizerDetail extends StatefulWidget {
  final Map<String, dynamic> fertilizerData;

  FertilizerDetail({required this.fertilizerData});

  @override
  _FertilizerDetail createState() => _FertilizerDetail();
}

class _FertilizerDetail extends State<FertilizerDetail> {
  bool isHidden = true;
  List<Map<String, dynamic>> fertilizers = [];

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
  Future<void> deleteFertilizer() async {
    final fertilizerId = widget.fertilizerData['_id'];
    final apiUrl = Uri.parse(
        'http://10.0.2.2:5000/fertilizer/delete/fertilizer/$fertilizerId');

    try {
      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          fertilizers
              .removeWhere((fertilizer) => fertilizer['_id'] == fertilizerId);
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Fertilizer()),
        );
      } else {
        print('Failed to delete fertilizer: ${response.statusCode}');
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting fertilizer: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 1062,
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
                  height: 1062,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                      ),
                      fit: BoxFit.none,
                      alignment: Alignment.centerLeft,
                      opacity: 0.7,
                      scale: 2.7,
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
                  height: 1062,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0x84FFFDF4),
                  ),
                ),
              ),
              Positioned(
                left: 47,
                top: 149,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.fertilizerData['image'],
                    width: 318,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 380,
                child: Container(
                  width: 412,
                  height: 682,
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
                top: 346,
                child: Container(
                  width: 364,
                  height: 716,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0x4CF5FFD9),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 698,
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
                left: 48,
                top: 703,
                child: Text(
                  'Hướng dẫn:',
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
                top: 705,
                child: Text(
                  widget.fertilizerData['instructions'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 745,
                child: Container(
                  width: 328,
                  height: 150,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 755,
                child: SizedBox(
                  width: 275,
                  height: 27,
                  child: Text(
                    'Thành phần dinh dưỡng (%):',
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
                left: 148,
                top: 864,
                child: SizedBox(
                  width: 48,
                  height: 26,
                  child: Text(
                    'Khác:',
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
                left: 148,
                top: 808,
                child: SizedBox(
                  width: 38,
                  height: 26,
                  child: Text(
                    'Kali:',
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
                left: 148,
                top: 836,
                child: SizedBox(
                  height: 26,
                  child: Text(
                    'Lân:',
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
                left: 148,
                top: 780,
                child: SizedBox(
                  width: 48,
                  height: 26,
                  child: Text(
                    'Đạm:',
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
                left: 311,
                top: 783,
                child: SizedBox(
                  width: 27,
                  height: 22,
                  child: Text(
                    widget.fertilizerData['nutrients']['kali'] ?? 'N/A',
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
                left: 311,
                top: 809,
                child: SizedBox(
                  width: 27,
                  height: 22,
                  child: Text(
                    widget.fertilizerData['nutrients']['nitro'] ?? 'N/A',
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
                left: 311,
                top: 838,
                child: SizedBox(
                  width: 27,
                  height: 22,
                  child: Text(
                    widget.fertilizerData['nutrients']['phosphate'] ?? 'N/A',
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
                left: 311,
                top: 866,
                child: SizedBox(
                  width: 27,
                  height: 22,
                  child: Text(
                    widget.fertilizerData['nutrients']['others'] ?? 'N/A',
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
                left: 41,
                top: 539,
                child: Container(
                  width: 328,
                  height: 148,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 544,
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
              Positioned(
                left: 50,
                top: 575,
                child: SizedBox(
                  width: 310,
                  height: 103,
                  child: Text(
                    widget.fertilizerData['instructions'] ?? 'N/A',
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
                left: 41,
                top: 476,
                child: Container(
                  width: 328,
                  height: 52,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 490,
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
                left: 197,
                top: 482,
                child: SizedBox(
                  width: 145,
                  child: Text(
                    widget.fertilizerData['supplier'] ?? 'N/A',
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
                left: 41,
                top: 416,
                child: Container(
                  width: 328,
                  height: 49,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xCCFFFFFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 429,
                child: Text(
                  'Tên phân bón:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 203,
                top: 421,
                child: SizedBox(
                  width: 145,
                  child: Text(
                    widget.fertilizerData['fertilizerName'] ?? 'N/A',
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
                left: 41,
                top: 370,
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
                left: 48,
                top: 374,
                child: Text(
                  'Mã phân bón:',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 244,
                top: 377,
                child: Text(
                  widget.fertilizerData['fertilizerCode'] ?? 'N/A',
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
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fc812d1126cec9c4a866c5d413962a12e.png',
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
                left: 35,
                top: 66,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Fertilizer(),
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
                left: 98,
                top: 65,
                child: Text(
                  'Thông tin phân bón',
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
                top: 970,
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
                top: 970,
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
                            deleteFertilizer();
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
                                      deleteFertilizer();
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
