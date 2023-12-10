import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:myapp/page-3/season_diseases.dart';

class Disease_harm extends StatefulWidget {
  final Map<String, dynamic> seasonData;
  Disease_harm({required this.seasonData, Key? key}) : super(key: key);

  @override
  _Disease_harmState createState() => _Disease_harmState();
}

class _Disease_harmState extends State<Disease_harm> {
  DateTime? selectedstartDate;
  DateTime? selectedendDate;
  List<String> diseaseNames = [];
  String selectedDisease = '';
  String selectedTimes = 'Trương hạt';

  Future<void> _selectDate(BuildContext context, DateTime selectedDate,
      Function(DateTime) onSelect) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        onSelect(picked);
      });
    }
  }

  Future<List<String>> fetchDiseaseFromMongoDB() async {
    final mongo.Db mongoClient =
        await mongo.Db.create('mongodb://10.0.2.2:27017/Graduation_Thesis');
    await mongoClient.open();

    final collection = mongoClient.collection('diseases');
    final List<Map<String, dynamic>> documents =
        await collection.find().toList();

    final List<String> diseaseNames =
        documents.map((doc) => doc['diseaseName'] as String).toSet().toList();

    await mongoClient.close();

    return diseaseNames;
  }

  @override
  void initState() {
    super.initState();
    fetchDiseaseFromMongoDB().then((diseases) {
      setState(() {
        diseaseNames = diseases;
        selectedDisease = diseaseNames.isNotEmpty ? diseases[0] : '';
      });
    });
  }

  Future<void> addDiseaseSeason() async {
    final String apiUrl = 'http://10.0.2.2:5000/harm-disease/Harm';
    String cropSeasonCode = widget.seasonData['cropSeasonCode'];
    String employeeCode = widget.seasonData['employeeCode'];
    if (cropSeasonCode != null) {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'cropSeasonCode': cropSeasonCode,
          'times': selectedTimes,
          'employeeCode': employeeCode,
          'diseaseName': selectedDisease,
          'startDate': selectedstartDate!.toIso8601String(),
          'endDate': selectedendDate!.toIso8601String(),
        }),
      );
      if (response.statusCode == 201) {
        print('fertilizer use add successful');
      } else {
        print('Request failed with status ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }
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
                  left: 41,
                  top: 160,
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
                  left: 48,
                  top: 164,
                  child: Text(
                    'Mã mẫu ruộng:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 167,
                  child: Text(
                    widget.seasonData['cropSeasonCode'],
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 217,
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
                  left: 48,
                  top: 221,
                  child: Text(
                    'Mã nhân viên:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 224,
                  child: Text(
                    widget.seasonData['employeeCode'] = 'RC0002',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 268,
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
                  left: 48,
                  top: 272,
                  child: Text(
                    'Tên bệnh dịch:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 261,
                  child: FutureBuilder<List<String>>(
                    future: fetchDiseaseFromMongoDB(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      }

                      if (snapshot.hasError) {
                        return Text('Đã xảy ra lỗi: ${snapshot.error}');
                      }

                      List<String> diseaseNamesNames = snapshot.data ?? [];

                      return DropdownButton<String>(
                        value:
                            selectedDisease.isNotEmpty ? selectedDisease : null,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedDisease = newValue;
                            });
                          }
                        },
                        items: diseaseNamesNames
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 43,
                  top: 320,
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
                  top: 324,
                  child: Text(
                    'Lần bị bệnh:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 257,
                  top: 327,
                  child: Text(
                    '5',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 43,
                  top: 377,
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
                  top: 381,
                  child: Text(
                    'Giai đoạn phát triển:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 257,
                  top: 370,
                  child: DropdownButton<String>(
                    value: selectedTimes,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedTimes = newValue;
                        });
                      }
                    },
                    items: <String>[
                      'Trương hạt',
                      'Nảy mầm',
                      'Đẻ nhánh',
                      'Lóng thân',
                      'Trổ bông',
                      'Thụ tinh',
                      'Chín sữa',
                      'Chín sáp',
                      'Chín hoàn toàn'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  left: 42,
                  top: 434,
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
                  left: 49,
                  top: 438,
                  child: Text(
                    'Ngày bắt đầu',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 256,
                  top: 441,
                  child: Material(
                    type: MaterialType.transparency,
                    child: GestureDetector(
                      onTap: () {
                        _selectDate(
                            context, selectedstartDate ?? DateTime.now(),
                            (DateTime newDate) {
                          setState(() {
                            selectedstartDate = newDate;
                          });
                        });
                      },
                      child: Text(
                        selectedstartDate != null
                            ? '${selectedstartDate!.day}/${selectedstartDate!.month}/${selectedstartDate!.year}'
                            : 'Chọn ngày',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xb57e7e7e),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 491,
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
                  left: 48,
                  top: 495,
                  child: Text(
                    'Ngày kết thúc',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 498,
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context, selectedendDate ?? DateTime.now(),
                          (DateTime newDate) {
                        setState(() {
                          selectedendDate = newDate;
                        });
                      });
                    },
                    child: Text(
                      selectedendDate != null
                          ? '${selectedendDate!.day}/${selectedendDate!.month}/${selectedendDate!.year}'
                          : 'Chọn ngày',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xb57e7e7e),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 785,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        addDiseaseSeason().then((_) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SeasonDiseases(seasonData: widget.seasonData),
                            ),
                          );
                        });
                      },
                      overlayColor:
                          MaterialStateProperty.all<Color>(Color(0x0c7f7f7f)),
                      child: Container(
                        width: 141,
                        height: 47,
                        color: const Color(0xFFFFF9C7),
                        child: Center(
                          child: Text(
                            'Thêm',
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
                  left: 229,
                  top: 785,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SeasonDiseases(
                              seasonData: widget.seasonData,
                            ),
                          ),
                        );
                      },
                      child: Ink(
                        color: const Color(0xFFFF3838),
                        width: 141,
                        height: 47,
                        child: Center(
                          child: Text(
                            'Huỷ',
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
                  left: 0,
                  top: 0,
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
                                SeasonDiseases(seasonData: widget.seasonData),
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
                  left: 89,
                  top: 65,
                  child: Text(
                    'Tình trạng bệnh dịch',
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
      ),
    );
  }
}
