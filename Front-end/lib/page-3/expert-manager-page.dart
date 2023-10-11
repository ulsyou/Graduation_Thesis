import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'add-pages.dart';
import 'catatalog-list.dart';
import 'profile.dart';
import 'season-list.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

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
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=7a92c1f8-65b9-4acd-a447-6f3945cfad3d',
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
                  height: 15,
                  child: Text(
                    'Trời nắng',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 220,
                top: 164,
                child: Container(
                  width: 43,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fefa2cf5a1d7b9e01f29bf7c83b014121c2d853b7clear%201.png?alt=media&token=e1dba562-ffb3-4871-a63b-4522a0c7f831',
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 87,
                child: Container(
                  width: 183,
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
                left: 12,
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
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%202.png?alt=media&token=a6db3ebb-d014-4c75-9980-97b22f1c9d06',
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
                              width: 19,
                              height: 23,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F3156ca24236488201a17688cc92422c8.png',
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
                top: 527,
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
                        left: 2,
                        top: 4,
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
                              width: 23,
                              height: 21,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fbc4960ca4324aef0f8cfe9e8928920b5.png',
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
                        left: 1,
                        top: 7,
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 26,
                              height: 14,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F7487ed79c4842fbeacde3b459035350f.png',
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
                            left: 2,
                            top: 2,
                            child: Image.network(
                              'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F3e2fd43a3dc3e8e02443dc6d9f1c73f3.png',
                              width: 23,
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
                        left: 5,
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
                              width: 18,
                              height: 23,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F272fed6bb7eac3d46f456232099590f5.png',
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
                left: 156,
                top: 214,
                child: Transform.rotate(
                  angle: 270 * pi / 180,
                  child: Container(
                    width: 133,
                    height: 386,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xC0FFFFFF),
                          Color(0xCCFFFFFF),
                          Color(0xCCFFFFFF),
                          Color(0x04FFFFFF),
                          Color(0x00FFFFFF)
                        ],
                        stops: [0, 0, 0, 1, 1],
                        transform: GradientRotation(90 * pi / 180),
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
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2af4568d422a6c0ec14a0567d726b1ac9096212c2a%202.png?alt=media&token=c7f11398-a619-4fcf-b952-524a03aa8060',
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
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fa558837414ef5cc2661cbceb591ffdbc.png',
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
                left: 531,
                top: 233,
                child: Transform.rotate(
                  angle: 270 * pi / 180,
                  child: Container(
                    width: 133,
                    height: 344,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xC1FFFDDA),
                          Color(0xCCFFFFFF),
                          Color(0xCCFFFFFF),
                          Color(0x04FFFFFF),
                          Color(0x00FFFFFF)
                        ],
                        stops: [0, 0, 0, 1, 1],
                      ),
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
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2af4568d422a6c0ec14a0567d726b1ac9096212c2a%202.png?alt=media&token=f71d7625-5523-47ad-a864-9cda950a12cd',
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
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fb586571915a54b6a0f3a7c4f9ddf20c3.png',
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
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Ffbb3d25c2395735df03b840624e4392a.png',
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
                            child: Image.network(
                              'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fb3e9c2f4ae02858e93b665c13e511eda.png',
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
                              width: 23,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Ff3f8b5f2aa5550001fbe8ff225cbfe60.png',
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
                              width: 21,
                              height: 23,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F8605ce849738c37961c79693c5c8445f.png',
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
                              width: 21,
                              height: 23,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fd157653d1a0bacbffb4fc447e9e787a3.png',
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
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2af4568d422a6c0ec14a0567d726b1ac9096212c2a%201.png?alt=media&token=45915c8d-8f47-4a04-9478-c5ac65a06f24',
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
