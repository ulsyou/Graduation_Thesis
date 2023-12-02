import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myapp/page-3/season_activities_manager.dart';

import 'season-list.dart';

class SeasonDetail extends StatefulWidget {
  final Map<String, dynamic> seasonData;

  SeasonDetail({required this.seasonData});

  @override
  _SeasonDetailState createState() => _SeasonDetailState();
}

class _SeasonDetailState extends State<SeasonDetail> {
  List<Map<String, dynamic>> seasons = [];
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

  // Hàm gọi API để xóa mùa vụ
  Future<void> deleteSeason() async {
    final seasonId = widget.seasonData['_id'];
    final apiUrl = Uri.parse(
        'http://10.0.2.2:5000/crops-season/delete/crop-season/$seasonId');

    try {
      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          seasons.removeWhere((season) => season['_id'] == seasonId);
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Seasons()),
        );
      } else {
        print('Failed to delete season: ${response.statusCode}');
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting season: $error');
    }
  }

  void navigateToSeasonActivitiesManager() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SeasonActivitiesManager(seasonData: widget.seasonData),
      ),
    );
  }

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
                left: 49,
                top: 158,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.seasonData['image'],
                    width: 318,
                    height: 180,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 706,
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
                left: 51,
                top: 710,
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
                left: 249,
                top: 710,
                child: SizedBox(
                  height: 26,
                  child: Text(
                    formatDate(widget.seasonData['harvestDate']),
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
                left: 44,
                top: 659,
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
                left: 51,
                top: 664,
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
                left: 249,
                top: 664,
                child: Text(
                  formatDate(widget.seasonData['plantingDate']),
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 613,
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
                left: 51,
                top: 618,
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
                left: 249,
                top: 618,
                child: Text(
                  widget.seasonData['yield']?.toString() ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 566,
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
                left: 51,
                top: 571,
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
                left: 249,
                top: 571,
                child: Text(
                  widget.seasonData['fieldSample'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 519,
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
                left: 51,
                top: 524,
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
                left: 249,
                top: 524,
                child: Text(
                  widget.seasonData['riceVariety'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 472,
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
                left: 51,
                top: 477,
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
                left: 249,
                top: 477,
                child: Text(
                  widget.seasonData['seasonType'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 425,
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
                left: 51,
                top: 430,
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
                left: 249,
                top: 430,
                child: Text(
                  widget.seasonData['cropSeasonName'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 379,
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
                left: 51,
                top: 383,
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
                left: 249,
                top: 383,
                child: Text(
                  widget.seasonData['cropSeasonCode'] ?? 'N/A',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 115,
                top: 772,
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
                left: 275,
                top: 772,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: navigateToSeasonActivitiesManager,
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
                            child: Image.asset(
                              'assets/page-1/images/Group 32.png',
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
                left: 43,
                top: 829,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      // Add your onTap logic here
                    },
                    overlayColor:
                        MaterialStateProperty.all<Color>(Color(0x0c7f7f7f)),
                    child: Container(
                      width: 141,
                      height: 47,
                      color: const Color(0xFFFFF9C7),
                      child: Center(
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
                    onTap: () {
                      showPositioned();
                    },
                    child: Ink(
                      color: const Color(0xFFFF3838),
                      width: 141,
                      height: 47,
                      child: Center(
                        child: Text(
                          'Xoá',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 47,
                top: 352,
                child: Container(
                  width: 318,
                  height: 211,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      if (!isHidden)
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 318,
                            height: 211,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: const Color(0xE5FFD79C),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      if (!isHidden)
                        Positioned(
                          left: 42,
                          top: 62,
                          child: Text(
                            'Xác nhận xóa ?',
                            style: GoogleFonts.getFont(
                              'Noto Sans',
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (!isHidden)
                        GestureDetector(
                          onTap: () {
                            deleteSeason();
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                left: 43,
                                top: 133,
                                child: Material(
                                  type: MaterialType.transparency,
                                  borderRadius: BorderRadius.circular(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Ink(
                                    color: const Color(0xFF65FF3F),
                                    width: 84,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 140,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () {
                                      print('InkWell tapped');
                                      deleteSeason();
                                    },
                                    overlayColor:
                                        const MaterialStatePropertyAll<Color>(
                                      Color(0x0c7f7f7f),
                                    ),
                                    child: Text(
                                      'Xác nhận',
                                      style: GoogleFonts.getFont(
                                        'Noto Sans',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!isHidden)
                        GestureDetector(
                          onTap: () {
                            hidePositioned();
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                left: 183,
                                top: 133,
                                child: Material(
                                  type: MaterialType.transparency,
                                  borderRadius: BorderRadius.circular(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Ink(
                                    color: const Color(0xFFD9D9D9),
                                    width: 84,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 208,
                                top: 139,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    'Hủy',
                                    style: GoogleFonts.getFont(
                                      'Noto Sans',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                          builder: (context) => Seasons(),
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
                left: 115,
                top: 65,
                child: SizedBox(
                  width: 240,
                  child: Text(
                    'Thông tin mùa vụ',
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
