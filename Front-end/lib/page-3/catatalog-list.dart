import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/diseases.dart';
import 'package:myapp/page-3/expert-manager-page.dart';
import 'package:myapp/page-3/pesticides.dart';
import 'package:myapp/page-3/rice_strains.dart';

import 'activities.dart';
import 'fertilizers.dart';
import 'fields_samples.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 1018,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 1,
                child: Container(
                  width: 412,
                  height: 1018,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png'),
                      fit: BoxFit.none,
                      alignment: Alignment.centerLeft,
                      opacity: 0.7,
                      scale: 2.8,
                    ),
                    border: Border.all(),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 1,
                child: Container(
                  width: 412,
                  height: 1018,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0x84FFFDF4),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 874,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Activities(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 333,
                      height: 124,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                          transform: GradientRotation(180 * pi / 180),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 920,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        'Hoạt động',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 911,
                child: Image.asset(
                  'assets/page-1/images/to-do-list-1.png',
                  width: 50,
                  height: 45,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 52,
                top: 730,
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
                    child: Ink(
                      width: 333,
                      height: 124,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                          transform: GradientRotation(180 * pi / 180),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 766,
                child: Material(
                  type: MaterialType.transparency,
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
                    child: SizedBox(
                      width: 100,
                      height: 56,
                      child: Text(
                        'Thuốc trị\nbệnh dịch',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 769,
                child: Image.asset(
                  'assets/page-1/images/pesticide-1-1.png',
                  width: 50,
                  height: 45,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 52,
                top: 586,
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
                    child: Ink(
                      width: 333,
                      height: 124,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                          transform: GradientRotation(180 * pi / 180),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 632,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 100,
                      height: 32,
                      child: Text(
                        'Mẫu ruộng',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 622,
                child: Image.asset(
                  'assets/page-1/images/farm-1.png',
                  width: 50,
                  height: 45,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 52,
                top: 441,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Diseases(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 333,
                      height: 124,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                          transform: GradientRotation(180 * pi / 180),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 488,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Diseases(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 178,
                      height: 30,
                      child: Text(
                        'Bệnh dịch',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 478,
                child: Image.asset(
                  'assets/page-1/images/diseases-1.png',
                  width: 50,
                  height: 45,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 52,
                top: 297,
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
                    child: Ink(
                      width: 333,
                      height: 124,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                          transform: GradientRotation(180 * pi / 180),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 344,
                child: Material(
                  type: MaterialType.transparency,
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
                    child: SizedBox(
                      width: 178,
                      height: 31,
                      child: Text(
                        'Phân bón',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 335,
                child: Image.asset(
                  'assets/page-1/images/fertilizer-1.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 52,
                top: 154,
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
                    child: Ink(
                      width: 333,
                      height: 124,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                          transform: GradientRotation(180 * pi / 180),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 205,
                top: 198,
                child: Material(
                  type: MaterialType.transparency,
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
                    child: SizedBox(
                      width: 165,
                      height: 31,
                      child: Text(
                        'Giống lúa',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 188,
                child: Image.asset(
                  'assets/page-1/images/wheat-1.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
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
                  width: 412,
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
                        child: Image.asset(
                          'assets/page-1/images/mask-group.png',
                          width: 351,
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
                          builder: (context) => ExpertManagerPage(isNavigatedFromOtherPage: true),
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
                left: 145,
                top: 65,
                child: SizedBox(
                  width: 240,
                  child: Text(
                    'Danh mục',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
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
