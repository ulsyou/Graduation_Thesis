import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/season_activities.dart';
import 'package:myapp/page-3/season_deseases.dart';
import 'package:myapp/page-3/season_detail.dart';
import 'package:myapp/page-3/season_employees.dart';
import 'package:myapp/page-3/season_fertilizer.dart';
import 'package:myapp/page-3/season_images.dart';
import 'package:myapp/page-3/season_pesticides.dart';

class SeasonActivitiesManager extends StatefulWidget {
  final Map<String, dynamic> seasonData;

  SeasonActivitiesManager({required this.seasonData});

  @override
  _SeasonActivitiesManagerState createState() => _SeasonActivitiesManagerState();
}

class _SeasonActivitiesManagerState extends State<SeasonActivitiesManager> {
  void navigateToSeasonFertilizer() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeasonFertilizer(seasonData: widget.seasonData),
      ),
    );
  }

  void navigateToSeasonPesticides() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeasonPesticides(seasonData: widget.seasonData),
      ),
    );
  }

  void navigateToSeasonImages() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeasonImages(seasonData: widget.seasonData),
      ),
    );
  }

  void navigateToSeasonDeseases() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeasonDeseases(seasonData: widget.seasonData),
      ),
    );
  }

  void navigateToSeasonEmployee() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeasonEmployee(seasonData: widget.seasonData),
      ),
    );
  }

  void navigateToSeasonActivities() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeasonActivities(seasonData: widget.seasonData),
      ),
    );
  }

  void navigateToSeasonDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeasonDetail(seasonData: widget.seasonData),
      ),
    );
  }
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
                      image: AssetImage(
                        'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
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
                    onTap: navigateToSeasonFertilizer,
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
                    onTap: navigateToSeasonPesticides,
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
                    onTap: navigateToSeasonImages,
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
                    onTap: navigateToSeasonDeseases,
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
                    onTap: navigateToSeasonEmployee,
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
                    onTap: navigateToSeasonActivities,
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
                child: Image.asset(
                  'assets/page-1/images/to-do-list-1.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 765,
                child: Image.asset(
                  'assets/page-1/images/employees-1.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 619,
                child: Image.asset(
                  'assets/page-1/images/diseases-1.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 475,
                child: Image.asset(
                  'assets/page-1/images/gallery-1.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 331,
                child: Image.asset(
                  'assets/page-1/images/pesticide-1-1.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 97,
                top: 188,
                child: Image.asset(
                  'assets/page-1/images/fertilizer-1-1.png',
                  width: 60,
                  height: 60,
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
                        child: Image.asset(
                          'assets/page-1/images/mask-group.png',
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
                    onTap: navigateToSeasonDetail,
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
