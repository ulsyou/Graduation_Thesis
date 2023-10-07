import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/rice_strains.dart';

class RiceStrainDetail extends StatelessWidget {
  const RiceStrainDetail({super.key});

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
                    'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2F179800e3ecb133fbb531b822ceb94009dc1a8493yuki-ho-_YGqbbZEmMI-unsplash%201.png?alt=media&token=e0c65e56-9a06-4bc0-98ba-fe3cd0a7fd06',
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
            left: 0,
            top: 373,
            child: Container(
              width: 412,
              height: 542,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Color(0x4CEAFFB1),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 346,
            child: Container(
              width: 364,
              height: 569,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0x4CF5FFD9),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ),
          Positioned(
            left: 45,
            top: 149,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FTeD8q4fMRDdW3VSyJEbH%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2aRectangle%2033.png?alt=media&token=870ef55d-668b-4282-981c-873a3207df50',
                width: 318,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 539,
            child: Container(
              width: 328,
              height: 192,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 544,
            child: Text(
              'Đặc tính:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 49,
            top: 575,
            child: SizedBox(
              width: 310,
              height: 147,
              child: Text(
                'Chiều cao cây 95 - 100 cm, lá đòng hơi to bản, đứng, đẻ nhánh khỏe, tập trung, gọn khóm. Giống VNR20 thấp cây chống đổ tốt, chịu thâm canh, chống chịu trung bình với một số sâu bệnh hại chính, phạm vi thích ứng rộng. Năng suất trung bình 7,0- 7,5 tấn/ha, thâm canh đạt 8,0- 8,5 tấn/ha.',
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
            left: 40,
            top: 475,
            child: Container(
              width: 328,
              height: 53,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 490,
            child: Text(
              'Nhà cung cấp:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 188,
            top: 482,
            child: SizedBox(
              width: 178,
              child: Text(
                'Công ty cổ phần tập đoàn giống cây trồng Việt Nam',
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
            left: 40,
            top: 416,
            child: Container(
              width: 328,
              height: 48,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 428,
            child: SizedBox(
              height: 24,
              child: Text(
                'Tên giống lúa:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 191,
            top: 420,
            child: SizedBox(
              width: 159,
              height: 39,
              child: Text(
                'Giống lúa thuần năng suất chất lượng VNR20',
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
            left: 40,
            top: 370,
            child: Container(
              width: 328,
              height: 35,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 374,
            child: Text(
              'Mã giống lúa:',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 258,
            top: 377,
            child: Text(
              'RC00002',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 337,
            top: 854,
            child: Container(
              width: 24,
              height: 24,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
            ),
          ),
          Positioned(
            left: 326,
            top: 851,
            child: Image.network(
              'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fcdee8630b6a5f6a443dda5106daafabc.png',
              width: 0,
              height: 30,
              fit: BoxFit.contain,
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
                      'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fb321c41cffe9bedffce10c943759ce90.png',
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
                      builder: (context) => RiceStrains(),
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
            left: 92,
            top: 65,
            child: Text(
              'Thông tin giống lúa',
              style: GoogleFonts.getFont(
                'Noto Sans',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 43,
            top: 829,
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
                  color: const Color(0xFFFFF9C7),
                  width: 141,
                  height: 47,
                ),
              ),
            ),
          ),
          Positioned(
            left: 78,
            top: 841,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                overlayColor: const MaterialStatePropertyAll<Color>(
                  Color(0x0c7f7f7f),
                ),
                child: Text(
                  'Cập nhật',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 231,
            top: 829,
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
                  color: const Color(0xFFFF3838),
                  width: 141,
                  height: 47,
                ),
              ),
            ),
          ),
          Positioned(
            left: 341,
            top: 841,
            child: Container(
              width: 24,
              height: 24,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 2,
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
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2F463e314fadee8c2dcb74cc8452af9f34.png',
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
            left: 248,
            top: 838,
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
                  color: Colors.white,
                  width: 59,
                  height: 30,
                ),
              ),
            ),
          ),
          Positioned(
            left: 262,
            top: 841,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                overlayColor: const MaterialStatePropertyAll<Color>(
                  Color(0x0c7f7f7f),
                ),
                child: Text(
                  'Xoá',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 325,
            top: 838,
            child: Image.network(
              'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FTeD8q4fMRDdW3VSyJEbH%2Fcdee8630b6a5f6a443dda5106daafabc.png',
              width: 4,
              height: 30,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
