import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add-pages.dart';
import 'catatalog-list.dart';
import 'profile.dart';
import 'season-list.dart';

class ExpertManagerPage extends StatelessWidget {
  const ExpertManagerPage({super.key});

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
                left: 210,
                top: 87,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 190,
                      height: 190,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 247,
                top: 127,
                child: SizedBox(
                  width: 78,
                  height: 38,
                  child: Text(
                    ' 24°C',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 227,
                top: 97,
                child: SizedBox(
                  width: 77,
                  height: 26,
                  child: Text(
                    'Hà Nội',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 235,
                top: 249,
                child: SizedBox(
                  width: 25,
                  height: 19,
                  child: Text(
                    'UV',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 324,
                top: 250,
                child: SizedBox(
                  height: 18,
                  child: Text(
                    '8',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 235,
                top: 230,
                child: SizedBox(
                  width: 49,
                  height: 21,
                  child: Text(
                    'Độ ẩm ',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 319,
                top: 230,
                child: SizedBox(
                  width: 41,
                  height: 19,
                  child: Text(
                    '41%',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 222,
                top: 204,
                child: SizedBox(
                  width: 81,
                  height: 20,
                  child: Text(
                    'Trời nắng',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 220,
                top: 164,
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/page-1/images/clear-1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                        blurRadius: 25,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 87,
                child: Container(
                  width: 190,
                  height: 190,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xBFFFD05C),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 87,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                          ),
                          fit: BoxFit.none,
                          alignment: Alignment.topCenter,
                          scale: 10,
                        ),
                        border: Border.all(
                          color: const Color(0x7FFFF5A3),
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 86,
                top: 251,
                child: SizedBox(
                  width: 116,
                  height: 23,
                  child: Text(
                    'Season name',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 100,
                child: SizedBox(
                  width: 79,
                  height: 23,
                  child: Text(
                    'RC002',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 214,
                top: 598,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CatalogList(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 273,
                top: 623,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CatalogList(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 74,
                      height: 20,
                      child: Text(
                        'Danh mục',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 231,
                top: 620,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 5,
                        top: 2,
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 16.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 515,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Seasons(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 530,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Seasons(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 80,
                      height: 38,
                      child: Text(
                        'Theo dõi mùa vụ',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 537,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Seasons(),
                                ),
                              );
                            },
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 13.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 598,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 148,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 615,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 85,
                      height: 37,
                      child: Text(
                        'Dự đoán năng suất',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 75,
                top: 622,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 14.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 214,
                top: 515,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 274,
                top: 539,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 68,
                      height: 20,
                      child: Text(
                        'Thống kê',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 232,
                top: 536,
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
                            child: Image.asset(
                              'assets/page-1/images/Group 15.png',
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
                left: 131,
                top: 681,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 176,
                top: 705,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 90,
                      height: 20,
                      child: Text(
                        'Việc cần làm',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 141,
                top: 702,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 17.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 13,
                top: 303,
                child: Text(
                  'Công việc cần làm',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 140,
                top: 235,
                child: Transform.rotate(
                  angle: 270 * pi / 180,
                  child: Container(
                    width: 133,
                    height: 354,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0x78FFFFFF),
                          Color(0x80FFFFFF),
                          Color(0x20FFFFFF),
                          Color(0x02FFFFFF)
                        ],
                        stops: [0, 0.01, 1, 1],
                        transform: GradientRotation(169 * pi / 180),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29,
                top: 366,
                child: Container(
                  width: 7,
                  height: 38,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.shade700,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 355,
                child: SizedBox(
                  width: 226,
                  child: Text(
                    'Đo độ ẩm của mẫu ruộng RF00002',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 224,
                top: 421,
                child: SizedBox(
                  width: 119,
                  child: Text(
                    'Thời gian thực hiện',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 421,
                child: SizedBox(
                  width: 97,
                  child: Text(
                    'Người tham gia',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 443,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/page-1/images/f4568d422a6c0ec14a0567d726b1ac9096212c2a-1.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 257,
                top: 443,
                child: SizedBox(
                  width: 73,
                  child: Text(
                    '20/20/2023',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 228,
                top: 441,
                child: Container(
                  width: 23,
                  height: 20,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 3,
                        top: 2,
                        child: Image.asset(
                          'assets/page-1/images/Calendar.png',
                          width: 17,
                          height: 17,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 116,
                top: 386,
                child: SizedBox(
                  width: 147,
                  child: Text(
                    'Thực hiện bla bla lần đo',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 53,
                top: 386,
                child: SizedBox(
                  width: 55,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        const TextSpan(text: 'Ghi chú:'),
                        TextSpan(
                          text: ' ',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 425,
                top: 364,
                child: Container(
                  width: 6,
                  height: 38,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.shade700,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 447,
                top: 353,
                child: Text(
                  'Đo độ ẩm của mẫu ruộng RF00002',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 599,
                top: 419,
                child: Text(
                  'Thời gian thực hiện',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Positioned(
                left: 447,
                top: 419,
                child: Text(
                  'Người tham gia',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Positioned(
                left: 448,
                top: 439,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/page-1/images/f4568d422a6c0ec14a0567d726b1ac9096212c2a-1.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 628,
                top: 441,
                child: Text(
                  '20/20/2023',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Positioned(
                left: 608,
                top: 439,
                child: Container(
                  width: 20,
                  height: 20,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 3,
                        top: 2,
                        child: Image.asset(
                          'assets/page-1/images/Calendar.png',
                          width: 15,
                          height: 17,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 502,
                top: 384,
                child: Text(
                  'Thực hiện bla bla lần đo',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Positioned(
                left: 446,
                top: 384,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      const TextSpan(text: 'Ghi chú:'),
                      TextSpan(
                        text: ' ',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
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
                  'assets/page-1/images/Ellipse 1.png',
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
                          builder: (context) => const AddPages(),
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
                          builder: (context) => const AddPages(),
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
                            child: Image.asset(
                              'assets/page-1/images/Group 1.png',
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
                left: 27,
                top: 838,
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
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Home.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 256,
                top: 840,
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
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Noti.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 123,
                top: 840,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Calendar.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 347,
                top: 840,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(14),
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
                            'assets/page-1/images/avt.png',
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
