import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/season_diseases.dart';

class Disease_harm extends StatelessWidget {
  final Map<String, dynamic> seasonData;

  Disease_harm({required this.seasonData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
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
                  left: 41,
                  top: 268,
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
                  top: 272,
                  child: Text(
                    'Tên bệnh dịch:',
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
                  top: 275,
                  child: Text(
                    'Bệnh khô vằn',
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
                  top: 320,
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
                  top: 324,
                  child: Text(
                    'Lần bị bệnh:',
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
                  top: 327,
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
                  top: 377,
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
                  top: 381,
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
                  top: 384,
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
                  top: 434,
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
                  top: 438,
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
                  top: 441,
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
                  left: 48,
                  top: 495,
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
                  top: 498,
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
                  top: 785,
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
                  top: 785,
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
                                SeasonDiseases(seasonData: seasonData),
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
                  left: 89,
                  top: 65,
                  child: Text(
                    'Tình trạng bệnh dịch',
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
