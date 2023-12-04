import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/season_pesticides.dart';

class Pesticide_use extends StatelessWidget {
  final Map<String, dynamic> seasonData;
  Pesticide_use({required this.seasonData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 1050,
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
                    height: 1050,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png'),
                        fit: BoxFit.fill,
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
                    height: 1050,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Color(0x84FFFDF4),
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 160,
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
                  top: 164,
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
                  left: 255,
                  top: 167,
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
                  left: 41,
                  top: 217,
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
                  top: 221,
                  child: Text(
                    'Mã nhân viên:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 224,
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
                  left: 43,
                  top: 270,
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
                  top: 274,
                  child: Text(
                    'Lần phun thuốc:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 257,
                  top: 277,
                  child: Text(
                    '5',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 43,
                  top: 327,
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
                  top: 331,
                  child: Text(
                    'Giai đoạn phát triển:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 257,
                  top: 334,
                  child: Text(
                    'Trổ bông',
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
                  top: 384,
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
                  top: 388,
                  child: Text(
                    'Ngày bắt đầu',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 256,
                  top: 391,
                  child: Text(
                    '2023-12-12',
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
                  top: 441,
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
                  top: 445,
                  child: Text(
                    'Ngày kết thúc',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 448,
                  child: Text(
                    '2023-12-12',
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
                  top: 501,
                  child: Container(
                    width: 412,
                    height: 414,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  left: 6,
                  top: 568,
                  child: Container(
                    width: 400,
                    height: 35,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xE5FFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 31,
                  top: 575,
                  child: Text(
                    'Chess 50WG',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 330,
                  top: 575,
                  child: SizedBox(
                    width: 28,
                    child: Text(
                      '50',
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
                  left: -1,
                  top: 501,
                  child: Container(
                    width: 412,
                    height: 52,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFDFFAA),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 957,
                  child: Container(
                    width: 141,
                    height: 47,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9C7),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 957,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => updateSeason(
                        //       seasonData: seasonData,
                        //     ),
                        //   ),
                        // );
                      },
                      overlayColor:
                          MaterialStateProperty.all<Color>(Color(0x0c7f7f7f)),
                      child: Container(
                        width: 141,
                        height: 47,
                        color: const Color(0xFFFFF9C7),
                        child: Center(
                          child: Text(
                            'Thêm',
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
                  left: 229,
                  top: 957,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Ink(
                        color: const Color(0xFFFF3838),
                        width: 141,
                        height: 47,
                        child: Center(
                          child: Text(
                            'Huỷ',
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
                  left: 61,
                  top: 516,
                  child: Text(
                    'Tên phân bón',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 308,
                  top: 515,
                  child: Text(
                    'Số lượng',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 149,
                  top: 879,
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
                        color: const Color(0xFF96FF85),
                        width: 114,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 196,
                  top: 882,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {},
                      overlayColor: const MaterialStatePropertyAll<Color>(
                        Color(0x0c7f7f7f),
                      ),
                      child: Text(
                        'Thêm',
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
                Positioned(
                  left: 160,
                  top: 880,
                  child: Material(
                    type: MaterialType.transparency,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         SeasonFertilizer(seasonData: seasonData),
                        //   ),
                        // );
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
                              child: Image.asset(
                                'assets/page-1/images/Group 1.png',
                                width: 20,
                                height: 20,
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
                    decoration: BoxDecoration(
                      color: Color(0xfffffa96),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 360,
                        height: 115,
                        child: Image.asset(
                          'assets/page-1/images/mask-group.png',
                          width: 360,
                          height: 115,
                        ),
                      ),
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
                                SeasonPesticides(seasonData: seasonData),
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
                  left: 101,
                  top: 65,
                  child: Text(
                    'Phun thuốc bảo vệ',
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
      ),
    );
  }
}
