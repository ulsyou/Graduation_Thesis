import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-3/catatalog-list.dart';
import 'package:myapp/page-3/fertilizer_detail.dart';
import 'package:myapp/utils.dart';

class Fertilizer extends StatefulWidget {
  @override
  _FertilizerState createState() => _FertilizerState();
}

class _FertilizerState extends State<Fertilizer> {
  List<dynamic> fertilizers = [];
  String searchQuery = '';
  List<dynamic> filteredFertilizer = [];
  FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    fetchFertilizer();
  }

  Future<void> fetchFertilizer() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/fertilizer/fertilizer'));

    if (response.statusCode == 200) {
      setState(() {
        fertilizers = json.decode(response.body);
        filteredFertilizer = fertilizers;
      });
    } else {
      print('Failed to fetch fertilizers: ${response.statusCode}');
    }
  }

  void performSearch(String searchText) {
    setState(() {
      searchQuery = searchText;
      filteredFertilizer = fertilizers.where((fertilizers) {
        return fertilizers['cropSeasonName']
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();
    });
    searchFocus.requestFocus();
  }

  void resetSearch() {
    setState(() {
      searchQuery = '';
      filteredFertilizer = fertilizers;
    });
    searchFocus.unfocus();
  }

  void navigateToFertilizerDetail(Map<String, dynamic> fertilizerData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FertilizerDetail(
          fertilizerData: fertilizerData,
        ),
      ),
    );
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
                  top: 0 * fem,
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
                        itemCount: filteredFertilizer.length,
                        itemBuilder: (context, index) {
                          final fertilizers = filteredFertilizer[index];
                          EdgeInsets margin = EdgeInsets.symmetric(vertical: 0);
                          if (index == 0) {
                            margin = EdgeInsets.only(top: 130 * fem);
                          }
                          return InkWell(
                            onTap: () {
                              navigateToFertilizerDetail(fertilizers);
                            },
                            child: Container(
                              margin: margin,
                              width: double.infinity,
                              height: 160 * fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 1 * fem,
                                    top: 0 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 311 * fem,
                                        height: 130 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30 * fem),
                                            gradient: LinearGradient(
                                              begin: Alignment(1.217, -0.146),
                                              end: Alignment(-1.379, 0.131),
                                              colors: <Color>[
                                                Color(0xffffffff),
                                                Color(0x00fffacd)
                                              ],
                                              stops: <double>[0, 1],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0 * fem,
                                    top: 15 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 165 * fem,
                                        height: 100 * fem,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20 * fem),
                                          child: Image.network(
                                            fertilizers['image'],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 175 * fem,
                                    top: 9 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 200 * fem,
                                        height: 25 * fem,
                                        child: Text(
                                          '${fertilizers['fertilizerName']}',
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 18 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 175 * fem,
                                    top: 84 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 200 * fem,
                                        height: 20 * fem,
                                        child: Text(
                                          'Nhà cung cấp:',
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 175 * fem,
                                    top: 40 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 94 * fem,
                                        height: 20 * fem,
                                        child: Text(
                                          'Mã phân bón:',
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 190 * fem,
                                    top: 65 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 100 * fem,
                                        height: 17 * fem,
                                        child: Text(
                                          '${fertilizers['fertilizerCode']}',
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 13 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 190 * fem,
                                    top: 107 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 100 * fem,
                                        height: 17 * fem,
                                        child: Text(
                                          '${fertilizers['supplier']}',
                                          style: SafeGoogleFont(
                                            'Noto Sans',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3625 * ffem / fem,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 306 * fem,
                                    top: 24 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 6 * fem,
                                        height: 50 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xff60ff00),
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.circular(50 * fem),
                                              bottomLeft:
                                                  Radius.circular(50 * fem),
                                            ),
                                          ),
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
                                      builder: (context) => CatalogList(),
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
                                'Phân bón',
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
                  left: 72,
                  top: 845,
                  child: SizedBox(
                    width: 69,
                    child: Text(
                      'Tìm kiếm',
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: const Color(0xFF919191),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
