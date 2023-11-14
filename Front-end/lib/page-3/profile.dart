import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add-pages.dart';
import 'expert-manager-page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: -13,
                child: Container(
                  width: 412,
                  height: 915,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        '',
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
                top: -13,
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
                top: 15,
                child: Image.asset(
                  '',
                  width: 360,
                  height: 198,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: -167,
                top: 195,
                child: Image.asset(
                  '',
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
                  child: Image.asset(
                    '',
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
                top: 395,
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
                top: 421,
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
                top: 436,
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
                top: 483,
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
                top: 509,
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
                top: 524,
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
                top: 661,
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
                top: 687,
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
                top: 702,
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
                top: 571,
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
                top: 597,
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
                top: 612,
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
                        child: Image.asset(
                          '',
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
                left: 99,
                top: 65,
                child: Text(
                  'Thông tin cá nhân',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 826,
                child: Container(
                  width: 390,
                  height: 56,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFA96),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Positioned(
                left: 171,
                top: 787,
                child: Image.asset(
                  '',
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 176,
                top: 792,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AddPages(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xFFC5FFBC),
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 810,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddPages(),
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
                            left: 5,
                            top: 5,
                            child: Image.asset(
                              '',
                              width: 14,
                              height: 14,
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
                left: 27,
                top: 838,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ExpertManagerPage(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 4,
                            top: 3,
                            child: Image.asset(
                              '',
                              width: 23,
                              height: 25,
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
                left: 256,
                top: 840,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                            top: 2,
                            child: Image.asset(
                              '',
                              width: 21,
                              height: 23,
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
                left: 123,
                top: 840,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                            top: 2,
                            child: Image.asset(
                              '',
                              width: 21,
                              height: 23,
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
                left: 347,
                top: 840,
                child: Container(
                  width: 29,
                  height: 29,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 344,
                top: 837,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(17),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xFFBC00FF),
                      width: 34,
                      height: 34,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 347,
                top: 840,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            '',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
