import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-3/rice_strains.dart';

class RiceStrainDetail extends StatefulWidget {
  final Map<String, dynamic> strainData;

  RiceStrainDetail({required this.strainData});

  @override
  _RiceStrainDetailState createState() => _RiceStrainDetailState();
}

class _RiceStrainDetailState extends State<RiceStrainDetail> {
  bool isHidden = true;
  List<Map<String, dynamic>> strains = [];

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
  Future<void> deleteStrain() async {
    final strainId = widget.strainData['_id'];
    final apiUrl = Uri.parse(
        'http://10.0.2.2:5000/rice-strain/delete/riceStrain/$strainId');

    try {
      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          strains.removeWhere((strain) => strain['_id'] == strainId);
        });
      } else {
        print('Failed to delete strain: ${response.statusCode}');
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting strain: $error');
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
                  fit: BoxFit.none,
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
            left: 0,
            top: 373,
            child: Container(
              width: 412,
              height: 542,
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
              height: 569,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0x4CF5FFD9),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ),
          Positioned(
            left: 45,
            top: 149,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                widget.strainData['image'],
                width: 318,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 539,
            child: Container(
              width: 328,
              height: 192,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 544,
            child: Text(
              'Đặc tính:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 49,
            top: 575,
            child: SizedBox(
              width: 310,
              height: 147,
              child: Text(
                widget.strainData['characteristics'] ?? 'N/A',
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
            left: 40,
            top: 475,
            child: Container(
              width: 328,
              height: 53,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 47,
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
            left: 188,
            top: 490,
            child: SizedBox(
              width: 178,
              child: Text(
                widget.strainData['supplier'] ?? 'N/A',
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
            left: 40,
            top: 416,
            child: Container(
              width: 328,
              height: 48,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 428,
            child: SizedBox(
              height: 24,
              child: Text(
                'Tên giống lúa:',
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
            left: 191,
            top: 430,
            child: SizedBox(
              width: 159,
              height: 39,
              child: Text(
                widget.strainData['strainName'] ?? 'N/A',
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
            left: 40,
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
            left: 47,
            top: 374,
            child: Text(
              'Mã giống lúa:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 250,
            top: 377,
            child: Text(
              widget.strainData['strainCode'] ?? 'N/A',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 337,
            top: 854,
            child: Container(
              width: 24,
              height: 24,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
            ),
          ),
          Positioned(
            left: 326,
            top: 851,
            child: Image.network(
              'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fcdee8630b6a5f6a443dda5106daafabc.png',
              width: 0,
              height: 30,
              fit: BoxFit.contain,
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
                      'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fb321c41cffe9bedffce10c943759ce90.png',
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
                      builder: (context) => RiceStrains(),
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
            left: 92,
            top: 65,
            child: Text(
              'Thông tin giống lúa',
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
            top: 829,
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
            top: 829,
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
                        deleteStrain();
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
                                  deleteStrain();
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
    );
  }
}
