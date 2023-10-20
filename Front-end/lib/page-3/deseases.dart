import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'catatalog-list.dart';
import 'desease_detail.dart';

class Deseases extends StatelessWidget {
  const Deseases({super.key});

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
                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=d069fb45-7a2b-4cba-b22d-7aaf1e84d722',
                  ),
                  fit: BoxFit.none,
                  alignment: Alignment.centerLeft,
                  opacity: 0.7,
                  scale: 1.8,
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
            left: 72,
            top: 140,
            child: Material(
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DeseaseDetail(),
                    ),
                  );
                },
                overlayColor: const MaterialStatePropertyAll<Color>(
                  Color(0x0c7f7f7f),
                ),
                child: Ink(
                  width: 311,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFFFFF), Color(0x00FFFACD)],
                      transform: GradientRotation(180 * pi / 180),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 57,
            top: 156,
            child: Material(
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {},
                overlayColor: const MaterialStatePropertyAll<Color>(
                  Color(0x0c7f7f7f),
                ),
                child: Ink(
                  width: 165,
                  height: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2aRectangle%2026.png?alt=media&token=fabec4b1-c2f8-4058-aabf-e5bc2eb734a8',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 239,
            top: 149,
            child: Text(
              'Tên bệnh dịch',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 239,
            top: 224,
            child: Text(
              'Loại bệnh dịch:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 239,
            top: 180,
            child: Text(
              'Mã bệnh dịch:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 287,
            top: 205,
            child: Text(
              'RC00002',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: const Color(0xFF777777),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 287,
            top: 247,
            child: Text(
              'Vụ mùa',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: const Color(0xFF777777),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 377,
            top: 181,
            child: Transform.rotate(
              angle: 180 * pi / 180,
              child: Container(
                width: 6,
                height: 50,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Color(0xFF60FF00),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
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
            left: 35,
            top: 66,
            child: Material(
              type: MaterialType.transparency,
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
            left: 147,
            top: 65,
            child: Text(
              'Bệnh dịch',
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
