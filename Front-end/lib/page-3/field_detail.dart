import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fields_samples.dart';

class FieldDetail extends StatefulWidget {
  const FieldDetail({super.key});

  @override
  _FieldDetail createState() => _FieldDetail();
}

class _FieldDetail extends State<FieldDetail> {
  bool isHidden = true;

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
                  image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=d20ea3b2-61c5-4390-b688-9375e5e2cba4',
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
            left: 47,
            top: 148,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2aRectangle%2032.png?alt=media&token=a88a2d24-4798-490d-83a1-f5954c685896',
                width: 318,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 374,
            child: Container(
              width: 412,
              height: 541,
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
              height: 568,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0x4CF5FFD9),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ),
          Positioned(
            left: 42,
            top: 599,
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
            top: 604,
            child: Text(
              'Tỉnh/Thành phố:',
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
            top: 606,
            child: SizedBox(
              width: 114,
              height: 26,
              child: Text(
                'TP Hồ Chí Minh',
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
            top: 553,
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
            top: 558,
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
            left: 209,
            top: 560,
            child: Text(
              'RC00002',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Positioned(
            left: 287,
            top: 560,
            child: Text(
              'RC00002',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Positioned(
            left: 42,
            top: 507,
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
            top: 512,
            child: Text(
              'Diện tích (ha):',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 268,
            top: 513,
            child: Text(
              '10000',
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
              'Chủ sở hữu:',
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
            top: 422,
            child: Text(
              'Trần Văn Anh',
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
            top: 461,
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
            top: 466,
            child: Text(
              'Phân loại:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 211,
            top: 468,
            child: Text(
              'Đất phù sa ven sông',
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
              'Mã mẫu ruộng:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 260,
            top: 376,
            child: Text(
              'RC00002',
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
                  ),
                  Positioned(
                    left: 86,
                    top: 66,
                    child: Text(
                      'Thông tin mẫu ruộng',
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
            left: 31,
            top: 66,
            child: Material(
              type: MaterialType.transparency,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Fields(),
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
                        left: 4,
                        top: 4,
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F27779bc9b3ca41161ea5511599390cdd.png',
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
          ),
          Positioned(
            left: 43,
            top: 770,
            child: Material(
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(25),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // Add your onTap logic here
                },
                overlayColor: MaterialStateProperty.all<Color>(Color(0x0c7f7f7f)),
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
            top: 770,
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
                      onTap: () {},
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
                                onTap: () {},
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
