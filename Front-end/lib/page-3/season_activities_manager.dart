import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/season_activities.dart';
import 'package:myapp/page-3/season_deseases.dart';
import 'package:myapp/page-3/season_employees.dart';
import 'package:myapp/page-3/season_fertilizer.dart';
import 'package:myapp/page-3/season_images.dart';
import 'package:myapp/page-3/season_pesticides.dart';

class SeasonActivitiesManager extends StatelessWidget {
  const SeasonActivitiesManager({super.key});

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
                top: 0,
                child: Container(
                  width: 412,
                  height: 1018,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=9a0d5a0b-162d-40fd-ace8-8486303c41ec',
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
                top: 0,
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
                top: 154,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeasonFertilizer(),
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
                left: 202,
                top: 200,
                child: SizedBox(
                  width: 135,
                  height: 31,
                  child: Text(
                    'Bón phân',
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
                left: 52,
                top: 297,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeasonPesticides(),
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
                left: 202,
                top: 343,
                child: SizedBox(
                  width: 135,
                  height: 31,
                  child: Text(
                    'Phun thuốc',
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
                left: 52,
                top: 441,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeasonImages(),
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
                left: 202,
                top: 487,
                child: SizedBox(
                  width: 135,
                  height: 31,
                  child: Text(
                    'Hình ảnh',
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
                left: 52,
                top: 586,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeasonDeseases(),
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
                left: 202,
                top: 632,
                child: SizedBox(
                  width: 135,
                  height: 31,
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
                          builder: (context) => SeasonEmployee(),
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
                left: 202,
                top: 776,
                child: SizedBox(
                  width: 135,
                  height: 31,
                  child: Text(
                    'Nhân viên',
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
                left: 52,
                top: 874,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeasonActivities(),
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
                left: 202,
                top: 920,
                child: SizedBox(
                  width: 135,
                  height: 31,
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
              Positioned(
                left: 97,
                top: 908,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F8ef2e93582deae0cbb4d8328b5579604c905d832to-do-list%201.png?alt=media&token=1387c0a8-ea17-47c1-b81d-9fdd3af8fb8e',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 765,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Fdb5333a290aa498f0f1f3d5b7432249940d4c139employees%201.png?alt=media&token=114425eb-6403-4582-8ec9-79a0f1e320e3',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 619,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F1d7cc7ac0124c2a1c4a67b434619f78b6608147ediseases%201.png?alt=media&token=36dc503f-bab7-4181-bd15-627ea28beceb',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 475,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F38e81027ac7fefd074ef620312a7a7d34b08e27egallery%201.png?alt=media&token=6dbf3deb-7054-42bc-b266-6eb4c704ac29',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 331,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F04b4eb3562c54b6be9e1bceb79cebcb6ccac702bpesticide%20(1)%201.png?alt=media&token=931ea233-1bcd-43fc-a8bc-4f5e3ee57296',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 188,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F393aa66f71b9f420713181b1014fb42603f366a0fertilizer%20(1)%201.png?alt=media&token=bd481885-3ba0-4373-8950-34dec8048099',
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
                    onTap: () {},
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
                left: 115,
                top: 65,
                child: Text(
                  'Thông tin mùa vụ',
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
    );
  }
}
