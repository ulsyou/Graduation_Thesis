import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'expert-manager-page.dart';

class AddPages extends StatelessWidget {
  const AddPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 1186,
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
                  height: 1226,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=c53f978a-1ef7-4c54-8990-dbb4e7d0c3e7',
                      ),
                      fit: BoxFit.none,
                      alignment: Alignment.centerLeft,
                      opacity: 0.7,
                      scale: 2.5,
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
                  height: 1189,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Color(0x84FFFDF4),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 1024,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                left: 206,
                top: 1070,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 166,
                      child: Text(
                        'Thêm Hoạt động',
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
                top: 1061,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fa4b842cfe3a494a83e3dbae5656ac3632bc4ff9bactivities%201.png?alt=media&token=3144bda1-a3f1-4a6b-98e5-6c529cc68334',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 880,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                left: 206,
                top: 916,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 178,
                      height: 56,
                      child: Text(
                        'Thêm Thuốc trị\nbệnh dịch',
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
                top: 919,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F368bcd77cf3f7e8e861f61bc717d5070233604e2pesticide%201.png?alt=media&token=a423802b-6b95-46a8-8877-5472a31bb4b4',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 736,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                left: 206,
                top: 782,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 178,
                      height: 32,
                      child: Text(
                        'Thêm Mẫu ruộng',
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
                top: 772,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F3b1ac47e8dc0b8987fc5e018e44d9fa7526baef0fields%201.png?alt=media&token=a00257d4-6d60-443e-93ca-2183d0647812',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 593,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                left: 206,
                top: 638,
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
                        'Thêm Bệnh dịch',
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
                top: 628,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F52c64d3e85714cd434ab199c946650a0ed52239apests%201.png?alt=media&token=313486bd-f6d1-444e-bd1d-fe994b16d319',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 447,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                left: 206,
                top: 494,
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
                        'Thêm Phân bón',
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
                top: 485,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fcf79d1bcfa5c98308e4ccfe714e7f849837c73b3fertilizer%201.png?alt=media&token=4ca7868b-65b7-469f-a7d0-345e7413b751',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 304,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                left: 206,
                top: 348,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 165,
                      height: 31,
                      child: Text(
                        'Thêm Giống lúa',
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
                top: 338,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fccd0df66955b662a32371d0542f78a132edb86b3wheat%201.png?alt=media&token=cf310051-5fdb-46e7-9c0d-f734f90160a2',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 52,
                top: 155,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                left: 206,
                top: 201,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 139,
                      height: 32,
                      child: Text(
                        'Thêm Mùa vụ',
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
                top: 182,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Ff7bfd09b9815049130c6185f7a6c9df935919e73farm%201.png?alt=media&token=b12df145-2461-4732-8073-5ab1be3057d9',
                          ),
                          fit: BoxFit.cover,
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
                left: -115,
                top: -118,
                child: Image.network(
                  'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F9161031e032af46204bba98fdcd3ce94.png',
                  width: 351,
                  height: 254,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 131,
                top: 65,
                child: SizedBox(
                  width: 183,
                  child: Text(
                    'Thêm Dữ liệu',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
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
                          builder: (context) => const ExpertManagerPage(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Container(
                      width: 27,
                      height: 24,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 5,
                            top: 4,
                            child: Image.network(
                              'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F7e9b99d902585a934e5cc929b2656cae.png',
                              width: 18,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
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
