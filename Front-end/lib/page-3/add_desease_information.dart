import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-3/add-pages.dart';

class AddDesease extends StatefulWidget {
  @override
  _AddDeseaseState createState() => _AddDeseaseState();
}

class _AddDeseaseState extends State<AddDesease> {
  TextEditingController diseaseNameController = TextEditingController();
  TextEditingController harmController = TextEditingController();
  TextEditingController environmentController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String? imagePath;
  File? image;

  Future<void> addDisease(File? image) async {
    final String apiUrl = 'http://10.0.2.2:5000/disease/create/disease';

    if (image != null) {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['diseaseName'] = diseaseNameController.text
        ..fields['harm'] = harmController.text
        ..fields['environment'] = environmentController.text
        ..fields['time'] = timeController.text
        ..fields['classification'] = selectedClassification
        ..files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      var response = await request.send();
      if (response.statusCode == 201) {
        print('Disease created successful');
      } else {
        print('Request failed with status ${response.statusCode}');
      }
    }
  }

  String selectedClassification = 'Côn trùng';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        fit: BoxFit.none,
                        alignment: Alignment.centerLeft,
                        opacity: 0.7,
                        scale: 3,
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
                    height: 949,
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
                  left: 0,
                  top: 376,
                  child: Container(
                    width: 412,
                    height: 573,
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
                  top: 347,
                  child: Container(
                    width: 364,
                    height: 602,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0x4CF5FFD9),
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 655,
                  child: Container(
                    width: 328,
                    height: 152,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 660,
                  child: Text(
                    'Tác hại:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 53,
                  top: 670,
                  child: SizedBox(
                    width: 305,
                    child: TextFormField(
                      controller: harmController,
                      decoration: InputDecoration(
                        hintText: 'Nhập tác hại',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xb57e7e7e),
                        ),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 600,
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
                  top: 605,
                  child: Text(
                    'Thời điểm xuất hiện:',
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
                  top: 593,
                  child: SizedBox(
                    width: 305,
                    child: TextFormField(
                      controller: timeController,
                      decoration: InputDecoration(
                        hintText: 'Nhập thời điểm',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xb57e7e7e),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 501,
                  child: Container(
                    width: 328,
                    height: 79,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 53,
                  top: 524,
                  child: SizedBox(
                    width: 305,
                    child: TextFormField(
                      controller: environmentController,
                      decoration: InputDecoration(
                        hintText: 'Môi trường',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xb57e7e7e),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 47,
                  top: 506,
                  child: Text(
                    'Môi trường phát triển:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 375,
                  child: Container(
                    width: 328,
                    height: 51,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 47,
                  top: 389,
                  child: Text(
                    'Tên dịch bệnh:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 200,
                  top: 377,
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: diseaseNameController,
                      decoration: InputDecoration(
                        hintText: 'Nhập tên bệnh dịch',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xb57e7e7e),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 446,
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
                  top: 450,
                  child: Text(
                    'Phân loại:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 223,
                  top: 440,
                  child: DropdownButton<String>(
                    value: selectedClassification,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedClassification = newValue;
                        });
                      }
                    },
                    items: <String>[
                      'Côn trùng',
                      'Dịch bệnh',
                      'Nấm hại',
                      'Sâu bệnh',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xb57e7e7e),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  left: 43,
                  top: 845,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        addDisease(image).then((_) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPages(),
                            ),
                          );
                        });
                      },
                      overlayColor: const MaterialStatePropertyAll<Color>(
                        Color(0x0c7f7f7f),
                      ),
                      child: Ink(
                        color: const Color(0xFF6BFF53),
                        width: 141,
                        height: 47,
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
                  left: 231,
                  top: 845,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPages(),
                          ),
                        );
                      },
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
                  left: 285,
                  top: 857,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPages(),
                          ),
                        );
                      },
                      overlayColor: const MaterialStatePropertyAll<Color>(
                        Color(0x0c7f7f7f),
                      ),
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
                            builder: (context) => AddPages(),
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
                  left: 113,
                  top: 65,
                  child: Text(
                    'Thêm dịch bệnh',
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
