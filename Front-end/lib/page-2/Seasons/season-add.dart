import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:myapp/utils.dart';

import 'season-manager.dart';

class AddSeason extends StatefulWidget {
  @override
  _AddSeasonState createState() => _AddSeasonState();
}

class _AddSeasonState extends State<AddSeason> {
  TextEditingController cropSeasonNameController = TextEditingController();
  TextEditingController yieldController = TextEditingController();
  TextEditingController plantingDateController = TextEditingController();
  TextEditingController harvestDateController = TextEditingController();
  DateTime selectedGieoSaDate = DateTime.now();
  DateTime selectedThuHoachDate = DateTime.now();
  List<String> riceStrains = [];
  List<String> fieldSamples = [];
  String selectedRole = '';
  String selectedFieldSample = '';
  String selectedRiceStrain = '';

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

  Future<List<String>> fetchRiceStrainsFromMongoDB() async {
    final mongo.Db mongoClient = await mongo.Db.create(
        'mongodb+srv://admin:admin@cluster0.pyqy143.mongodb.net/');
    await mongoClient.open();

    final collection = mongoClient.collection('ricestrains');
    final List<Map<String, dynamic>> documents =
        await collection.find().toList();

    final List<String> riceStrains =
        documents.map((doc) => doc['strainName'] as String).toSet().toList();

    await mongoClient.close();

    return riceStrains;
  }

  Future<List<String>> fetchFieldSamplesFromMongoDB() async {
    final mongo.Db mongoClient = await mongo.Db.create(
        'mongodb+srv://admin:admin@cluster0.pyqy143.mongodb.net/');
    await mongoClient.open();

    final collection = mongoClient.collection('fieldsamples');
    final List<Map<String, dynamic>> documents =
        await collection.find().toList();

    final List<String> fieldSamples =
        documents.map((doc) => doc['fieldCode'] as String).toSet().toList();

    await mongoClient.close();

    return fieldSamples;
  }

  @override
  void initState() {
    super.initState();

    fetchRiceStrainsFromMongoDB().then((strains) {
      setState(() {
        riceStrains = strains;
        selectedRole = riceStrains.isNotEmpty ? riceStrains[0] : '';
      });
    });

    fetchFieldSamplesFromMongoDB().then((samples) {
      setState(() {
        fieldSamples = samples;
        selectedFieldSample = fieldSamples.isNotEmpty ? fieldSamples[0] : '';
      });
    });
  }

  Future<void> addSeason() async {
    final String apiUrl =
        'http://10.0.2.2:5000/crops-season/create/crop-season';

    final response = await http.post(Uri.parse(apiUrl), body: {
      'cropSeasonName': cropSeasonNameController.text,
      'seasonType': selectedSeasonType,
      'yield': yieldController.text,
      'fieldSample': selectedFieldSample,
      'riceVariety': selectedRole,
      'plantingDate': selectedGieoSaDate.toIso8601String(),
      'harvestDate': selectedThuHoachDate.toIso8601String(),
    });

    if (response.statusCode == 201) {
      print('Season create successfully');
    } else {
      print('Error in Create new Season:  ${response.body}');
    }
  }

  String selectedSeasonType = 'Vụ mùa';

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 38 * fem, 0 * fem, 0 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            image: DecorationImage(
              image: AssetImage(
                'assets/page-1/images/wolfgang-hasselmann-ucnhoxas6pq-unsplash-1-bg-vS5.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(19 * fem, 0 * fem, 45 * fem, 33 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeasonManager(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 55 * fem, 3 * fem),
                        width: 24 * fem,
                        height: 24 * fem,
                        child: Image.asset(
                          'assets/page-1/images/arrow-left.png',
                          width: 24 * fem,
                          height: 24 * fem,
                        ),
                      ),
                    ),
                    Text(
                      'Thêm mùa vụ',
                      style: SafeGoogleFont(
                        'Cabin',
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.215 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 21 * fem, 16 * fem, 72 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x8effffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Tên mùa vụ
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          23 * fem, 0 * fem, 151 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 19 * fem, 0 * fem),
                            width: 18 * fem,
                            height: 18 * fem,
                            child: Image.asset(
                              'assets/page-1/images/command.png',
                              width: 18 * fem,
                              height: 18 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: cropSeasonNameController,
                              style: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Tên mùa vụ',
                                hintStyle: TextStyle(
                                  fontSize: 16 * fem,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Mẫu ruộng
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 139 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/users.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: FutureBuilder<List<String>>(
                              future: fetchFieldSamplesFromMongoDB(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                }

                                if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                }

                                List<String> fieldSamples = snapshot.data ?? [];

                                return DropdownButton<String>(
                                  value: selectedFieldSample.isNotEmpty
                                      ? selectedFieldSample
                                      : null,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        selectedFieldSample = newValue;
                                      });
                                    }
                                  },
                                  items: fieldSamples
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 16 * fem,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Giống lúa
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 120 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/users.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: FutureBuilder<List<String>>(
                              future: fetchRiceStrainsFromMongoDB(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                }

                                if (snapshot.hasError) {
                                  return Text(
                                      'Đã xảy ra lỗi: ${snapshot.error}');
                                }

                                List<String> riceStrains = snapshot.data ?? [];

                                return DropdownButton<String>(
                                  value: selectedRole.isNotEmpty
                                      ? selectedRole
                                      : null,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        selectedRole = newValue;
                                      });
                                    }
                                  },
                                  items: riceStrains
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 16 * fem,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Vụ mùa
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 139 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/users.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                              value: selectedSeasonType,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedSeasonType = newValue;
                                  });
                                }
                              },
                              items: <String>[
                                'Đông xuân',
                                'Hè thu',
                                'Vụ mùa',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 16 * fem,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Năng suất
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          23 * fem, 0 * fem, 151 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 19 * fem, 0 * fem),
                            width: 18 * fem,
                            height: 18 * fem,
                            child: Image.asset(
                              'assets/page-1/images/command.png',
                              width: 18 * fem,
                              height: 18 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: yieldController,
                              style: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Năng suất',
                                hintStyle: TextStyle(
                                  fontSize: 16 * fem,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xb57e7e7e),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Ngày gieo sạ
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 25 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 139 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/users.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _selectDate(context, selectedGieoSaDate,
                                    (DateTime newDate) {
                                  selectedGieoSaDate = newDate;
                                });
                              },
                              child: Text(
                                '${selectedGieoSaDate.day}/${selectedGieoSaDate.month}/${selectedGieoSaDate.year}',
                                style: TextStyle(
                                  fontSize: 16 * fem,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Ngày thu hoạch
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 41 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 139 * fem, 0 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffffafa),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25 * fem),
                          bottomRight: Radius.circular(25 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 16 * fem, 0 * fem),
                            width: 24 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/page-1/images/users.png',
                              width: 24 * fem,
                              height: 24 * fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 17 * fem, 0 * fem),
                            width: 1 * fem,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xa384aa88),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _selectDate(context, selectedThuHoachDate,
                                    (DateTime newDate) {
                                  setState(() {
                                    selectedThuHoachDate = newDate;
                                  });
                                });
                              },
                              child: Text(
                                '${selectedThuHoachDate.day}/${selectedThuHoachDate.month}/${selectedThuHoachDate.year}',
                                style: TextStyle(
                                  fontSize: 16 * fem,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Confirm + Cancel
                    Container(
                      width: double.infinity,
                      height: 58 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                addSeason().then((_) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SeasonManager(),
                                    ),
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffffffff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25 * fem),
                                ),
                              ),
                              child: Text(
                                'Xác nhận',
                                style: SafeGoogleFont(
                                  'Cabin',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.215 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16 * fem),
                          // Add some spacing between buttons
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SeasonManager(),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25 * fem),
                                ),
                              ),
                              child: Text(
                                'Hủy bỏ',
                                style: SafeGoogleFont(
                                  'Cabin',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.215 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
