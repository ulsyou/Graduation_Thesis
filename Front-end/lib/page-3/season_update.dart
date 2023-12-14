import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:myapp/page-3/season_detail.dart';

class SeasonDetailUpdate extends StatefulWidget {
  final Map<String, dynamic> seasonData;

  SeasonDetailUpdate({required this.seasonData});

  @override
  _SeasonDetailUpdateState createState() => _SeasonDetailUpdateState();
}

class _SeasonDetailUpdateState extends State<SeasonDetailUpdate> {
  late Map<String, dynamic> updatedSeasonData;
  TextEditingController cropSeasonNameController = TextEditingController();
  TextEditingController yieldController = TextEditingController();
  DateTime? selectedGieoSaDate;
  DateTime? selectedThuHoachDate;
  List<String> riceStrains = [];
  List<String> fieldSamples = [];
  String selectedRice = '';
  String selectedFieldSample = '';
  String selectedSeasonType = '';
  String? imagePath;
  File? image;

  String formatDate(String date) {
    if (date != null && date != 'N/A') {
      DateTime dateTime =
          DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(date, true);
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } else {
      return 'N/A';
    }
  }

  Future<DateTime?> _selectDate(
    BuildContext context,
    DateTime selectedDate,
  ) async {
    Completer<DateTime?> completer = Completer();

    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((picked) {
      if (picked != null && picked != selectedDate) {
        completer.complete(picked);
      } else {
        completer.completeError("Date selection canceled");
      }
    });

    return completer.future;
  }

  Future<List<String>> fetchRiceStrainsFromMongoDB() async {
    final mongo.Db mongoClient =
        await mongo.Db.create('mongodb://10.0.2.2:27017/Graduation_Thesis');
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
    final mongo.Db mongoClient =
        await mongo.Db.create('mongodb://10.0.2.2:27017/Graduation_Thesis');
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
    updatedSeasonData = widget.seasonData;
    selectedSeasonType = widget.seasonData['seasonType'] ?? 'Vụ mùa';
    selectedGieoSaDate =
        DateTime.tryParse(widget.seasonData['plantingDate']) ?? DateTime.now();
    selectedThuHoachDate =
        DateTime.tryParse(widget.seasonData['harvestDate']) ?? DateTime.now();
    selectedRice = widget.seasonData['strainName'] ?? '';
    selectedFieldSample = widget.seasonData['fieldCode'] ?? '';

    fetchRiceStrainsFromMongoDB().then((strains) {
      setState(() {
        riceStrains = strains;
        selectedRice = riceStrains.isNotEmpty ? riceStrains[0] : '';
      });
    });

    fetchFieldSamplesFromMongoDB().then((samples) {
      setState(() {
        fieldSamples = samples;
        selectedFieldSample = fieldSamples.isNotEmpty ? fieldSamples[0] : '';
      });
    });
    print("Initial selectedFieldSample: $selectedFieldSample");
    print("Initial selectedRice: $selectedRice");
  }

  Future<Map<String, dynamic>> getSeasonData(String id) async {
    final String apiUrl = 'http://10.0.2.2:5000/crops-season/crop-season/$id';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load season data');
    }
  }

  Future<bool> updateSeason(String id, File? image) async {
    try {
      final String apiUrl =
          'http://10.0.2.2:5000/crops-season/update/crop-season/$id';

      var request = http.MultipartRequest('PATCH', Uri.parse(apiUrl))
        ..fields['cropSeasonName'] = cropSeasonNameController.text
        ..fields['seasonType'] = selectedSeasonType
        ..fields['yield'] = yieldController.text
        ..fields['fieldCode'] = selectedFieldSample
        ..fields['strainName'] = selectedRice
        ..fields['plantingDate'] = selectedGieoSaDate != null
            ? selectedGieoSaDate!.toIso8601String()
            : widget.seasonData['plantingDate']
        ..fields['harvestDate'] = selectedThuHoachDate != null
            ? selectedThuHoachDate!.toIso8601String()
            : widget.seasonData['harvestDate'];

      if (image != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      } else {
        request.fields['image'] = widget.seasonData['image'];
      }

      var response = await request.send().timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        print('Season updated successfully');
        updatedSeasonData = await getSeasonData(id);
        return true; // Indicate success
      } else {
        print('Request failed with status ${response.statusCode}');
        return false; // Indicate failure
      }
    } catch (e) {
      print('An error occurred: $e');
      return false; // Indicate failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  child: InkWell(
                    onTap: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          image = File(pickedFile.path);
                        });
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.hardEdge,
                      child: image != null
                          ? Image.file(
                              File(image!.path),
                              width: 318,
                              height: 180,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/page-1/images/Group 46.png',
                              width: 318,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
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
                  child: Material(
                    type: MaterialType.transparency,
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await _selectDate(
                          context,
                          selectedThuHoachDate ?? DateTime.now(),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            selectedThuHoachDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                        selectedThuHoachDate != null
                            ? '${selectedThuHoachDate!.day}/${selectedThuHoachDate!.month}/${selectedThuHoachDate!.year}'
                            : formatDate(widget.seasonData['harvestDate'])
                                .toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
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
                  child: Material(
                    type: MaterialType.transparency,
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await _selectDate(
                          context,
                          selectedGieoSaDate ?? DateTime.now(),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            selectedGieoSaDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                        selectedGieoSaDate != null
                            ? '${selectedGieoSaDate!.day}/${selectedGieoSaDate!.month}/${selectedGieoSaDate!.year}'
                            : formatDate(widget.seasonData['plantingDate'])
                                .toString(),
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
                  top: 605,
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: yieldController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Noto Sans',
                        ),
                        border: InputBorder.none,
                      ),
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
                  left: 229,
                  top: 560,
                  child: Container(
                    width: 200,
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            value: selectedFieldSample,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedFieldSample = newValue;
                                });
                              }
                            },
                            items: fieldSamples
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        if (selectedRice
                            .isEmpty) // Display the text only when the dropdown is not actively being changed
                          Text(
                            widget.seasonData['strainName'] ?? 'N/A',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
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
                  left: 229,
                  top: 515,
                  child: Container(
                    width: 200,
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            value: selectedRice,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedRice = newValue;
                                });
                              }
                            },
                            items: riceStrains
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        if (selectedRice.isEmpty)
                          Text(
                            widget.seasonData['strainName'] ?? 'N/A',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
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
                  top: 468,
                  child: Container(
                    width: 120,
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF000000),
                            ),
                          ),
                        );
                      }).toList(),
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
                  top: 418,
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: cropSeasonNameController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Noto Sans',
                        ),
                        border: InputBorder.none,
                      ),
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
                  left: 43,
                  top: 829,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () async {
                        final id = widget.seasonData['_id'];

                        bool success = await updateSeason(id, image);

                        if (success) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SeasonDetail(seasonData: updatedSeasonData),
                            ),
                          );
                        }
                      },
                      overlayColor:
                          MaterialStateProperty.all<Color>(Color(0x0c7f7f7f)),
                      child: Container(
                        width: 141,
                        height: 47,
                        color: const Color(0xFFFFF9C7),
                        child: Center(
                          child: Text(
                            'Xác nhận',
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                SeasonDetail(seasonData: widget.seasonData),
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
                            builder: (context) =>
                                SeasonDetail(seasonData: widget.seasonData),
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
                      'Cập nhật mùa vụ',
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
      ),
    );
  }
}
