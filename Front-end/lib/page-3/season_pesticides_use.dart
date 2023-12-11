import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:myapp/page-3/season_pesticides.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pesticide_use extends StatefulWidget {
  final Map<String, dynamic> seasonData;
  Pesticide_use({required this.seasonData, Key? key}) : super(key: key);

  @override
  _Pesticide_useState createState() => _Pesticide_useState();
}

class _Pesticide_useState extends State<Pesticide_use> {
  TextEditingController quantityPesticide = TextEditingController();
  DateTime? selectedstartDate;
  DateTime? selectedendDate;
  List<String> pesticideNames = [];
  String selectedPesticide = '';
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

  Future<List<String>> fetchPesticideFromMongoDB() async {
    final mongo.Db mongoClient =
        await mongo.Db.create('mongodb://10.0.2.2:27017/Graduation_Thesis');
    await mongoClient.open();

    final collection = mongoClient.collection('pesticides');
    final List<Map<String, dynamic>> documents =
        await collection.find().toList();

    final List<String> pesticideNames =
        documents.map((doc) => doc['pesticideName'] as String).toSet().toList();

    await mongoClient.close();

    return pesticideNames;
  }

  @override
  void initState() {
    super.initState();
    fetchPesticideFromMongoDB().then((pesticides) {
      setState(() {
        pesticideNames = pesticides;
        selectedPesticide = pesticideNames.isNotEmpty ? pesticides[0] : '';
      });
    });
  }

  Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataString = prefs.getString('userData') ?? '{}';
    return jsonDecode(userDataString) as Map<String, dynamic> ?? {};
  }

  Future<void> addPesticideSeason() async {
    final String apiUrl = 'http://10.0.2.2:5000/use-pesticide/UsePesticide';
    String cropSeasonCode = widget.seasonData['cropSeasonCode'];
    Map<String, dynamic> userData = await getUserData();
    String employeeCode = userData?['user']['employeeCode'] ?? 'Unknown';
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
          'pesticides': [
            {
              'pesticideName': selectedPesticide,
              'quantity': int.parse(quantityPesticide.text),
            },
          ],
          'startDate': selectedstartDate!.toIso8601String(),
          'endDate': selectedendDate!.toIso8601String(),
        }),
      );
      if (response.statusCode == 201) {
        print('pesticide use add successful');
      } else {
        print('Request failed with status ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getUserData(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        print('snapshot.data: ${snapshot.data}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Map<String, dynamic>? userData = snapshot.data;
          return Material(
            child: SingleChildScrollView(
              child: Container(
                width: 412,
                height: 1050,
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
                          height: 1050,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png'),
                              fit: BoxFit.fill,
                              alignment: Alignment.centerLeft,
                              opacity: 0.7,
                              scale: 2.7,
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
                          height: 1050,
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
                          userData?['user']['employeeCode'] ?? 'Unknown',
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
                        top: 270,
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
                        top: 274,
                        child: Text(
                          'Lần phun thuốc:',
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
                        top: 277,
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
                        top: 327,
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
                        top: 331,
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
                        left: 250,
                        top: 319,
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
                        top: 384,
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
                        top: 388,
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
                        top: 391,
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
                        top: 441,
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
                        top: 445,
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
                        top: 448,
                        child: GestureDetector(
                          onTap: () {
                            _selectDate(
                                context, selectedendDate ?? DateTime.now(),
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
                        left: 0,
                        top: 501,
                        child: Container(
                          width: 412,
                          height: 414,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 568,
                        child: Container(
                          width: 400,
                          height: 35,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: const Color(0xE5FFFFFF),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 31,
                        top: 558,
                        child: FutureBuilder<List<String>>(
                          future: fetchPesticideFromMongoDB(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            }

                            if (snapshot.hasError) {
                              return Text('Đã xảy ra lỗi: ${snapshot.error}');
                            }

                            List<String> pesticideNames = snapshot.data ?? [];

                            return DropdownButton<String>(
                              value: selectedPesticide.isNotEmpty
                                  ? selectedPesticide
                                  : null,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedPesticide = newValue;
                                  });
                                }
                              },
                              items: pesticideNames
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
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
                        left: 290,
                        top: 558,
                        child: SizedBox(
                          width: 100,
                          child: TextFormField(
                            controller: quantityPesticide,
                            decoration: InputDecoration(
                              hintText: 'Nhập số lượng',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xb57e7e7e),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -1,
                        top: 501,
                        child: Container(
                          width: 412,
                          height: 52,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFDFFAA),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 957,
                        child: Container(
                          width: 141,
                          height: 47,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF9C7),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 957,
                        child: Material(
                          type: MaterialType.transparency,
                          borderRadius: BorderRadius.circular(25),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              addPesticideSeason().then((_) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SeasonPesticides(
                                        seasonData: widget.seasonData),
                                  ),
                                );
                              });
                            },
                            overlayColor: MaterialStateProperty.all<Color>(
                                Color(0x0c7f7f7f)),
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
                        top: 957,
                        child: Material(
                          type: MaterialType.transparency,
                          borderRadius: BorderRadius.circular(25),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SeasonPesticides(
                                      seasonData: widget.seasonData),
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
                        left: 61,
                        top: 516,
                        child: Text(
                          'Tên phân bón',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 308,
                        top: 515,
                        child: Text(
                          'Số lượng',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 149,
                        top: 879,
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
                              color: const Color(0xFF96FF85),
                              width: 114,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 196,
                        top: 882,
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Text(
                              'Thêm',
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
                        left: 160,
                        top: 880,
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         SeasonFertilizer(seasonData: seasonData),
                              //   ),
                              // );
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
                                    child: Image.asset(
                                      'assets/page-1/images/Group 1.png',
                                      width: 20,
                                      height: 20,
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
                                  builder: (context) => SeasonPesticides(
                                      seasonData: widget.seasonData),
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
                        left: 101,
                        top: 65,
                        child: Text(
                          'Phun thuốc bảo vệ',
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
      },
    );
  }
}
