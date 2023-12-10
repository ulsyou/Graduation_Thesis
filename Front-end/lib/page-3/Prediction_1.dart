import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/page-3/Prediction_Decision_tree.dart';
import 'package:myapp/page-3/season_activities_manager.dart';

class Prediction1 extends StatefulWidget {
  final Map<String, dynamic> predictionData;

  Prediction1({required this.predictionData});

  @override
  _Prediction1State createState() => _Prediction1State();
}

class _Prediction1State extends State<Prediction1> {
  List<Map<String, dynamic>> predictions = [];
  String? selectedOption;

  String formatDate(String date) {
    if (date != null && date != 'N/A') {
      DateTime dateTime = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } else {
      return 'N/A';
    }
  }

  bool isHidden = true;

// Hàm để hiển thị phần xác nhận xóa
  void showPositioned() {
    setState(() {
      isHidden = false;
    });
  }

// Hàm để ẩn phần xác nhận xóa
  void hidePositioned() {
    setState(() {
      isHidden = true;
    });
  }

  void navigateToSeasonActivitiesManager() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SeasonActivitiesManager(seasonData: widget.predictionData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 915,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SizedBox(
        width: double.infinity,
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
              top: 745,
              child: Container(
                width: 412,
                height: 170,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Color(0x7FFFF5A3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 127,
              child: Container(
                width: 412,
                height: 408,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Color(0x7FFFFFFF),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 108,
              top: 779,
              child: Text(
                'Kết quả dự đoán',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 53,
              top: 834,
              child: Container(
                width: 308,
                height: 52,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Positioned(
              left: 66,
              top: 848,
              child: Text(
                'Năng suất (t/ha):',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 252,
              top: 848,
              child: Text(
                '100000',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 474,
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
              left: 50,
              top: 478,
              child: Text(
                'Ngày thu hoạch:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 478,
              child: SizedBox(
                height: 26,
                child: Text(
                  formatDate(widget.predictionData['harvestDate']),
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
              left: 43,
              top: 427,
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
              left: 50,
              top: 432,
              child: Text(
                'Ngày gieo sạ:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 432,
              child: Text(
                formatDate(widget.predictionData['plantingDate']),
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 381,
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
              left: 50,
              top: 386,
              child: Text(
                'Năng suất:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 386,
              child: Text(
                widget.predictionData['yield']?.toString() ?? 'N/A',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 334,
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
              left: 50,
              top: 339,
              child: Text(
                'Mẫu ruộng:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 339,
              child: Text(
                widget.predictionData['fieldSample'] ?? 'N/A',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 287,
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
              left: 50,
              top: 292,
              child: Text(
                'Giống lúa:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 292,
              child: Text(
                widget.predictionData['riceVariety'] ?? 'N/A',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 240,
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
              left: 50,
              top: 245,
              child: Text(
                'Vụ mùa:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 245,
              child: Text(
                widget.predictionData['seasonType'] ?? 'N/A',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 193,
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
              left: 50,
              top: 198,
              child: Text(
                'Tên mùa vụ:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 198,
              child: Text(
                widget.predictionData['cropSeasonName'] ?? 'N/A',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 147,
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
              left: 50,
              top: 151,
              child: Text(
                'Mã mùa vụ:',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 151,
              child: Text(
                widget.predictionData['cropSeasonCode'] ?? 'N/A',
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 72,
              top: 634,
              child: Material(
                type: MaterialType.transparency,
                borderRadius: BorderRadius.circular(40),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {},
                  overlayColor: MaterialStateProperty.all<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Ink(
                    color: Color(0xA0D7FF68),
                    width: 268,
                    height: 76,
                    child: Center(
                      child: Text(
                        'Dự đoán',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 120,
              top: 554,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: navigateToSeasonActivitiesManager,
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Text(
                    'Xem thêm chi tiết',
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
              left: 280,
              top: 554,
              child: Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 8,
                      top: 5,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2Fc37d26344f5e268f21afe308d4883e81.png',
                        width: 8,
                        height: 14,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
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
                        builder: (context) => Prediction_1(),
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
              left: 155,
              top: 65,
              child: Text(
                'Dự đoán',
                textAlign: TextAlign.center,
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
    );
  }
}
