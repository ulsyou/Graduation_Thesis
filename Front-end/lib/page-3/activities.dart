import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-3/activites_detail.dart';
import 'package:myapp/page-3/catatalog-list.dart';
import 'package:myapp/utils.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  List<dynamic> activities = [];
  String searchQuery = '';
  List<dynamic> filteredActivities = [];
  FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/activities/activities'));

    if (response.statusCode == 200) {
      setState(() {
        activities = json.decode(response.body);
        filteredActivities = activities;
      });
    } else {
      print('Failed to fetch activities: ${response.statusCode}');
    }
  }

  void performSearch(String searchText) {
    setState(() {
      searchQuery = searchText;
      filteredActivities = activities.where((activities) {
        return activities['cropSeasonName']
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();
    });
    searchFocus.requestFocus();
  }

  void resetSearch() {
    setState(() {
      searchQuery = '';
      filteredActivities = activities;
    });
    searchFocus.unfocus();
  }

  void navigateToActivitiesDetail(Map<String, dynamic> activitesData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ActivitiesDetail(
          activitesData: activitesData,
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
                        itemCount: filteredActivities.length,
                        itemBuilder: (context, index) {
                          final activities = filteredActivities[index];
                          EdgeInsets margin = EdgeInsets.symmetric(vertical: 0);
                          if (index == 0) {
                            margin = EdgeInsets.only(top: 130 * fem);
                          }
                          return InkWell(
                            onTap: () {
                              navigateToActivitiesDetail(activities);
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
                                            activities['image'],
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
                                          '${activities['activitiesName']}',
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
                                    top: 45 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 200 * fem,
                                        height: 20 * fem,
                                        child: Text(
                                          'Mã hoạt động:',
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
                                    top: 70 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 100 * fem,
                                        height: 17 * fem,
                                        child: Text(
                                          '${activities['activitiesCode']}',
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
                                'Hoạt động',
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
