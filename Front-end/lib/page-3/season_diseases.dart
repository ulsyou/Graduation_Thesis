import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myapp/page-3/season_activities_manager.dart';
import 'package:myapp/page-3/season_disease_check.dart';

import '../utils.dart';

class SeasonDiseases extends StatefulWidget {
  final Map<String, dynamic> seasonData;

  SeasonDiseases({required this.seasonData, Key? key}) : super(key: key);

  @override
  _SeasonDiseasesState createState() => _SeasonDiseasesState();
}

class _SeasonDiseasesState extends State<SeasonDiseases> {
  List<dynamic> seasondiseases = [];
  String searchQuery = '';
  List<dynamic> filteredSeasonDiseases = [];
  FocusNode searchFocus = FocusNode();

  String formatDate(String date) {
    if (date != null && date != 'N/A') {
      DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.sssZ");
      DateTime dateTime = inputFormat.parseUtc(date);
      DateFormat outputFormat = DateFormat('dd/MM/yyyy');
      return outputFormat.format(dateTime);
    } else {
      return 'N/A';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSeasonDiseases();
  }

  Future<void> fetchSeasonDiseases() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/harm-disease/Harm'));

    if (response.statusCode == 200) {
      setState(() {
        seasondiseases = json.decode(response.body);
        filteredSeasonDiseases = seasondiseases;
      });
      print('Season diseases: $seasondiseases');
    } else {
      print('Failed to fetch season: ${response.statusCode}');
    }
  }

  Future<void> deleteDiseaseHarm(String id) async {
    final apiUrl = Uri.parse('http://10.0.2.2:5000/harm-disease/Harm/$id');

    try {
      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        fetchSeasonDiseases();
      } else {
        print('Failed to delete disease use: ${response.statusCode}');
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting disease use: $error');
    }
  }

  void performSearch(String searchText) {
    setState(() {
      searchQuery = searchText;
      filteredSeasonDiseases = seasondiseases.where((season) {
        return season['cropSeasonName']
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();
    });
    searchFocus.requestFocus();
  }

  void resetSearch() {
    setState(() {
      searchQuery = '';
      filteredSeasonDiseases = seasondiseases;
    });
    searchFocus.unfocus();
  }

  void navigateToSeasonDetail(Map<String, dynamic> seasonData) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => SeasonDetail(
    //       seasonData: seasonData,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 412;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 915 * fem,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0 * fem,
                  top: 50 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        71 * fem, 0 * fem, 29 * fem, 0 * fem),
                    width: 412 * fem,
                    height: 915 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x99000000)),
                      color: Color(0x84FFFDF4),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      ),
                    ),
                    child: ListView.builder(
                        itemCount: filteredSeasonDiseases.length,
                        itemBuilder: (context, index) {
                          final seasonDisease = filteredSeasonDiseases[index];
                          EdgeInsets margin = EdgeInsets.symmetric(vertical: 0);
                          if (index == 0) {
                            margin = EdgeInsets.only(top: 130 * fem);
                          }
                          return InkWell(
                            onTap: () {
                              // navigateToSeasonDetail(season);
                            },
                            child: Container(
                              margin: margin,
                              width: double.infinity,
                              height: 160 * fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 1 * fem,
                                    top: 10 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 341,
                                        height: 150,
                                        child: Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xCCFFFFFF),
                                                Color(0x00FFFFFF)
                                              ],
                                              transform: GradientRotation(
                                                  180 * pi / 180),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 120,
                                    top: 10,
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
                                    left: 160,
                                    top: 10,
                                    child: SizedBox(
                                      height: 32,
                                      child: Text(
                                        seasonDisease['time_have']
                                                ?.toString() ??
                                            'N/A',
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
                                    left: 0,
                                    top: 30,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        'Bệnh:',
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
                                    left: 50,
                                    top: 30,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        seasonDisease['diseaseName'],
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
                                    left: 0,
                                    top: 60,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        'Ngày phát hiện:',
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
                                    left: 115,
                                    top: 60,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        formatDate(seasonDisease['startDate'] ??
                                            'N/A'),
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
                                    left: 0,
                                    top: 90,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        'Ngày hết:',
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
                                    left: 75,
                                    top: 90,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        formatDate(
                                            seasonDisease['endDate'] ?? 'N/A'),
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
                                    left: 0,
                                    top: 120,
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
                                    left: 85,
                                    top: 120,
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
                                    left: 280,
                                    top: 10,
                                    child: PopupMenuButton<String>(
                                      onSelected: (String result) async {
                                        if (result == 'Update') {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => UpdatePage()),
                                          // );
                                        } else if (result == 'Delete') {
                                          deleteDiseaseHarm(
                                              seasondiseases[index]['_id']);
                                        }
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[
                                        const PopupMenuItem<String>(
                                          value: 'Update',
                                          child: Text('Cập nhật'),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'Delete',
                                          child: Text('Xoá'),
                                        ),
                                      ],
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
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Positioned(
                  left: 0 * fem,
                  top: 0 * fem,
                  child: Container(
                    width: 412 * fem,
                    height: 127 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Container(
                            width: 412 * fem,
                            height: 127 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xfffffa96),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20 * fem),
                                bottomLeft: Radius.circular(20 * fem),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 360 * fem,
                                height: 115 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/mask-group.png',
                                  width: 360 * fem,
                                  height: 115 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 35.4800109863 * fem,
                          top: 66 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 24 * fem,
                              height: 24 * fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SeasonActivitiesManager(
                                              seasonData: widget.seasonData),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Image.asset(
                                  'assets/page-1/images/Group 25.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 150 * fem,
                          top: 66 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 200 * fem,
                              height: 33 * fem,
                              child: Text(
                                'Bệnh dịch',
                                style: SafeGoogleFont(
                                  'Noto Sans',
                                  fontSize: 24 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0 * fem,
                  top: 120 * fem,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width - 16,
                      child: TextField(
                        onChanged: (value) {
                          searchQuery = value;
                          filteredSeasonDiseases =
                              seasondiseases.where((season) {
                            return season['cropSeasonName']
                                .toLowerCase()
                                .contains(searchQuery.toLowerCase());
                          }).toList();
                        },
                        decoration: InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
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
                                Disease_harm(seasonData: widget.seasonData),
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
                                Disease_harm(seasonData: widget.seasonData),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
