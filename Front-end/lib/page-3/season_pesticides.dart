import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/season_activities_manager.dart';

class SeasonPesticides extends StatelessWidget {
  final Map<String, dynamic> seasonData;
  SeasonPesticides({required this.seasonData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=7d997d9f-55b7-48e9-beb1-ef6ee74b1f7e',
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
            left: 40,
            top: 143,
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
            left: 180,
            top: 142,
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
          Positioned(
            left: 227,
            top: 142,
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
          Positioned(
            left: 78,
            top: 171,
            child: Text(
              'Thuốc:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 142,
            top: 171,
            child: Text(
              'Chess 50WG',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 78,
            top: 194,
            child: Text(
              'Liều lượng (ml/ha):',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 230,
            top: 194,
            child: Text(
              '50',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 78,
            top: 217,
            child: Text(
              'Ngày phun:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 194,
            top: 217,
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
          Positioned(
            left: 78,
            top: 240,
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
          Positioned(
            left: 225,
            top: 240,
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
          Positioned(
            left: 78,
            top: 263,
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
          Positioned(
            left: 169,
            top: 263,
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
          Positioned(
            left: 356,
            top: 147,
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
                        left: 11,
                        top: 4,
                        child: Image.network(
                          'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fc2299194a340c55bdec0af648a6babc5.png',
                          width: 2,
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
                      'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F1979e4809a9158f955c1fd7b58386847.png',
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
            left: 141,
            top: 65,
            child: Text(
              'Phun thuốc',
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
    );
  }
}
