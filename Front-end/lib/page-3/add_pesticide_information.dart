import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'add-pages.dart';

class AddPesticide extends StatefulWidget {
  @override
  _AddPesticideState createState() => _AddPesticideState();
}

class _AddPesticideState extends State<AddPesticide> {
  TextEditingController pesticideNameController = TextEditingController();
  TextEditingController functionController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController usageInstructionsController = TextEditingController();
  String? imagePath;
  File? image;
  Map<String, bool> treatingDiseases = {
    "Bệnh khô vằn": false,
    "Rầy nâu": false,
    "Sâu đục thân": false,
    "Sâu cuốn lá": false,
    "Lùn xoắn là": false,
    "Bệnh đạo ôn": false,
    "Bệnh đốm nâu": false,
  };

  Future<void> addPesticide(File? image) async {
    final String apiUrl = 'http://10.0.2.2:5000/pesticide/create/pesticide';
    if (image != null) {
      List<String> selectedDiseases = treatingDiseases.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['pesticideName'] = pesticideNameController.text
        ..fields['function'] = functionController.text
        ..fields['supplier'] = supplierController.text
        ..fields['ingredients'] = ingredientsController.text
        ..fields['usageInstructions'] = usageInstructionsController.text
        ..files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ));

      for (var disease in selectedDiseases) {
        request.fields['treatingDiseases'] = selectedDiseases.join(',');
      }

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      if (response.statusCode == 201) {
        print('Pesticide created successfully');
      } else {
        print('Request failed with status ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 1300,
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
                    height: 1300,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                        ),
                        fit: BoxFit.fill,
                        alignment: Alignment.centerLeft,
                        opacity: 0.7,
                        scale: 2.4,
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
                    height: 1300,
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
                  top: 387,
                  child: Container(
                    width: 412,
                    height: 1300,
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
                    height: 1300,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0x4CF5FFD9),
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
                Positioned(
                  left: 43,
                  top: 431,
                  child: Container(
                    width: 328,
                    height: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 436,
                  child: Text(
                    'Đặc trị:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 51,
                  top: 438,
                  child: SizedBox(
                    width: 320,
                    height: 600,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      children: treatingDiseases.keys.map((String key) {
                        return new CheckboxListTile(
                          title: new Text(key),
                          value: treatingDiseases[key],
                          onChanged: (bool? value) {
                            setState(() {
                              treatingDiseases[key] = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Positioned(
                  left: 42,
                  top: 1020,
                  child: Container(
                    width: 328,
                    height: 159,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 1020,
                  child: Text(
                    'Hướng dẫn sử dụng:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 71,
                  top: 1027,
                  child: SizedBox(
                    width: 298,
                    height: 118,
                    child: TextFormField(
                      controller: usageInstructionsController,
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nhập hướng dẫn sử dụng',
                        hintStyle: TextStyle(
                          color: Color(0xb57e7e7e),
                        ),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                ),
                Positioned(
                  left: 42,
                  top: 820,
                  child: Container(
                    width: 328,
                    height: 187,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 820,
                  child: SizedBox(
                    width: 97,
                    height: 26,
                    child: Text(
                      'Công dụng:',
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
                  left: 71,
                  top: 827,
                  child: SizedBox(
                    width: 306,
                    height: 153,
                    child: SizedBox(
                      width: 298,
                      height: 118,
                      child: TextFormField(
                        controller: functionController,
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Nhập công dụng',
                          hintStyle: TextStyle(
                            color: Color(0xb57e7e7e),
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 42,
                  top: 740,
                  child: Container(
                    width: 328,
                    height: 63,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 740,
                  child: SizedBox(
                    height: 24,
                    child: Text(
                      'Thành phần:',
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
                  left: 71,
                  top: 747,
                  child: SizedBox(
                    width: 247,
                    child: TextFormField(
                      controller: ingredientsController,
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nhập thành phần',
                        hintStyle: TextStyle(
                          color: Color(0xb57e7e7e),
                        ),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                ),
                Positioned(
                  left: 43,
                  top: 692,
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
                  top: 695,
                  child: Text(
                    'Nhà cung cấp:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 180,
                  top: 684,
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: supplierController,
                      decoration: InputDecoration(
                        hintText: 'Nhập tên nhà cung cấp',
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
                  left: 42,
                  top: 385,
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
                  top: 390,
                  child: Text(
                    'Tên thuốc:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 380,
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: pesticideNameController,
                      decoration: InputDecoration(
                        hintText: 'Nhập tên thuốc',
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
                  left: 43,
                  top: 1200,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        addPesticide(image).then((_) {
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
                  top: 1200,
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
                  top: 1210,
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
                  left: 95,
                  top: 65,
                  child: SizedBox(
                    width: 350,
                    child: Text(
                      'Thêm thuốc trị bệnh',
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
