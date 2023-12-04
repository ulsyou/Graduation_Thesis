import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/season_activities_manager.dart';
import 'package:myapp/page-3/season_activitities_do.dart';

class SeasonActivities extends StatelessWidget {
  final Map<String, dynamic> seasonData;
  SeasonActivities({required this.seasonData, Key? key}) : super(key: key);

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
                      fit: BoxFit.fill,
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
                left: 0,
                top: 120,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width - 16,
                    child: TextField(
                      onChanged: (value) {
                        // searchQuery = value;
                        // filteredSeasons = seasons.where((season) {
                        //   return season['cropSeasonName']
                        //       .toLowerCase()
                        //       .contains(searchQuery.toLowerCase());
                        // }).toList();
                      },
                      decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 223,
                child: Container(
                  width: 341,
                  height: 150,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                      transform: GradientRotation(180 * pi / 180),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 142,
                top: 222,
                child: SizedBox(
                  height: 32,
                  child: Text(
                    'Phơi đất ',
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
                left: 272,
                top: 222,
                child: SizedBox(
                  width: 34,
                  height: 32,
                  child: Text(
                    '1',
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
                left: 229,
                top: 222,
                child: SizedBox(
                  height: 32,
                  child: Text(
                    'Lần',
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
                left: 59,
                top: 260,
                child: SizedBox(
                  height: 25,
                  child: Text(
                    'Ngày bắt đầu:',
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
                left: 170,
                top: 260,
                child: SizedBox(
                  height: 25,
                  child: Text(
                    '12-05-2023',
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
                left: 59,
                top: 301,
                child: SizedBox(
                  height: 25,
                  child: Text(
                    'Ngày hoàn thành:',
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
                left: 206,
                top: 301,
                child: SizedBox(
                  height: 25,
                  child: Text(
                    '12-05-2023',
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
                left: 59,
                top: 342,
                child: SizedBox(
                  height: 25,
                  child: Text(
                    'Nhân viên:',
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
                left: 150,
                top: 342,
                child: SizedBox(
                  height: 25,
                  child: Text(
                    'Võ Văn Hướng',
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
                left: 356,
                top: 227,
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
                              'assets/page-1/images/Group 43.png',
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
                              SeasonActivitiesManager(seasonData: seasonData),
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
                left: 293,
                top: 800,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(35),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Activities_do(seasonData: seasonData),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xFF7CFF5B),
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 316,
                top: 822,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Activities_do(seasonData: seasonData),
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
                left: 144,
                top: 65,
                child: Text(
                  'Hoạt động',
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
