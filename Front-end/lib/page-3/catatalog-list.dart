import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/deseases.dart';
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
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=759b48f1-2892-4f97-881d-321d3747aed1',
                      ),
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
                left: 189,
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
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fa4b842cfe3a494a83e3dbae5656ac3632bc4ff9bactivities%201.png?alt=media&token=d2185430-9e50-4b5c-912e-38af2b7b87de',
                  width: 50,
                  height: 45,
                  fit: BoxFit.cover,
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
                          builder: (context) => Pesticides(),
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
                left: 189,
                top: 766,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
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
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F368bcd77cf3f7e8e861f61bc717d5070233604e2pesticide%201.png?alt=media&token=f858c731-397c-4a26-befc-396c2cefba07',
                  width: 50,
                  height: 45,
                  fit: BoxFit.cover,
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
                left: 189,
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
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F3b1ac47e8dc0b8987fc5e018e44d9fa7526baef0fields%201.png?alt=media&token=5b5547bb-ae9e-490a-baa2-2fe5b21139ea',
                  width: 50,
                  height: 45,
                  fit: BoxFit.cover,
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
                          builder: (context) => Deseases(),
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
                left: 189,
                top: 488,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
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
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F52c64d3e85714cd434ab199c946650a0ed52239apests%201.png?alt=media&token=9bfe7e00-89fa-42d8-b769-1492e25443e2',
                  width: 50,
                  height: 45,
                  fit: BoxFit.cover,
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
                          builder: (context) => Fertilizers(),
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
                left: 189,
                top: 344,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
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
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fcf79d1bcfa5c98308e4ccfe714e7f849837c73b3fertilizer%201.png?alt=media&token=c2d9af38-40ba-4cad-85ae-d17849363f50',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
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
                left: 189,
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
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fccd0df66955b662a32371d0542f78a132edb86b3wheat%201.png?alt=media&token=d64f25ba-ffce-4bfe-9c07-ddafc57ac5d7',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
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
                  height: 127,
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
                        left: -115,
                        top: -130,
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F1080b1dc2e243ca97ebafe6066c46942.png',
                          width: 351,
                          height: 281,
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
                          builder: (context) => ExpertManagerPage(),
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
                left: 145,
                top: 65,
                child: SizedBox(
                  width: 140,
                  height: 38,
                  child: Text(
                    'Danh mục ',
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
