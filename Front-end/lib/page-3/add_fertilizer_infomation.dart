import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'add-pages.dart';

class AddFertilizer extends StatefulWidget {
  @override
  _AddFertilizerState createState() => _AddFertilizerState();
}

class _AddFertilizerState extends State<AddFertilizer> {
  TextEditingController fertilizerNameController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  TextEditingController usageController = TextEditingController();
  TextEditingController kaliController = TextEditingController();
  TextEditingController nitroController = TextEditingController();
  TextEditingController phosphateController = TextEditingController();
  TextEditingController othersController = TextEditingController();
  String? imagePath;
  File? image;

  Future<void> addFertilizer(File? image) async {
    final String apiUrl = 'http://10.0.2.2:5000/fertilizer/create/fertilizer';

    if (image != null) {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['fertilizerName'] = fertilizerNameController.text
        ..fields['supplier'] = supplierController.text
        ..fields['instructions'] = instructionsController.text
        ..fields['usage'] = usageController.text
        ..fields['nutrients[kali]'] = kaliController.text
        ..fields['nutrients[nitro]'] = nitroController.text
        ..fields['nutrients[phosphate]'] = phosphateController.text
        ..fields['nutrients[others]'] = othersController.text
        ..files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      var response = await request.send();
      if (response.statusCode == 201) {
        print('Fertilizer created successful');
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
          height: 1000,
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
                    height: 1000,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                        ),
                        fit: BoxFit.none,
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
                    height: 1000,
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
                  top: 380,
                  child: Container(
                    width: 412,
                    height: 682,
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
                  top: 346,
                  child: Container(
                    width: 364,
                    height: 716,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0x4CF5FFD9),
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
                Positioned(
                  left: 41,
                  top: 668,
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
                  top: 673,
                  child: Text(
                    'Hướng dẫn:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 190,
                  top: 660,
                  child: SizedBox(
                    width: 145,
                    child: TextFormField(
                      controller: usageController,
                      decoration: InputDecoration(
                        hintText: 'Nhập hướng dẫn',
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
                  left: 41,
                  top: 715,
                  child: Container(
                    width: 328,
                    height: 180,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 725,
                  child: SizedBox(
                    width: 275,
                    height: 27,
                    child: Text(
                      'Thành phần dinh dưỡng (%):',
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
                  left: 148,
                  top: 860,
                  child: SizedBox(
                    width: 48,
                    height: 26,
                    child: Text(
                      'Khác:',
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
                  left: 148,
                  top: 785,
                  child: SizedBox(
                    width: 38,
                    height: 26,
                    child: Text(
                      'Kali:',
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
                  left: 148,
                  top: 823,
                  child: SizedBox(
                    height: 26,
                    child: Text(
                      'Lân:',
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
                  left: 148,
                  top: 750,
                  child: SizedBox(
                    width: 48,
                    height: 26,
                    child: Text(
                      'Đạm:',
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
                    left: 260,
                    top: 773,
                    child: SizedBox(
                      width: 145,
                      child: TextFormField(
                        controller: kaliController,
                        decoration: InputDecoration(
                          hintText: 'Nhập Kali',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xb57e7e7e),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    )),
                Positioned(
                  left: 260,
                  top: 738,
                  child: SizedBox(
                    width: 145,
                    child: TextFormField(
                      controller: nitroController,
                      decoration: InputDecoration(
                        hintText: 'Nhập Đạm',
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
                  left: 260,
                  top: 810,
                  child: SizedBox(
                    width: 145,
                    child: TextFormField(
                      controller: phosphateController,
                      decoration: InputDecoration(
                        hintText: 'Nhập Lân',
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
                  left: 260,
                  top: 846,
                  child: SizedBox(
                    width: 145,
                    child: TextFormField(
                      controller: othersController,
                      decoration: InputDecoration(
                        hintText: 'Khác',
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
                  left: 41,
                  top: 505,
                  child: Container(
                    width: 328,
                    height: 148,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 514,
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
                Positioned(
                  left: 50,
                  top: 527,
                  child: SizedBox(
                    width: 310,
                    height: 103,
                    child: TextFormField(
                      controller: instructionsController,
                      decoration: InputDecoration(
                        hintText: 'Nhập công dụng',
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
                  top: 440,
                  child: Container(
                    width: 328,
                    height: 52,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 455,
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
                  left: 197,
                  top: 442,
                  child: SizedBox(
                    width: 145,
                    child: TextFormField(
                      controller: supplierController,
                      decoration: InputDecoration(
                        hintText: 'Nhập nhà cung cấp',
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
                  left: 41,
                  top: 380,
                  child: Container(
                    width: 328,
                    height: 49,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 393,
                  child: Text(
                    'Tên phân bón:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 203,
                  top: 380,
                  child: SizedBox(
                    width: 145,
                    child: TextFormField(
                      controller: fertilizerNameController,
                      decoration: InputDecoration(
                        hintText: 'Nhập tên phân bón',
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
                  top: 915,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        addFertilizer(image).then((_) {
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
                  top: 915,
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
                  top: 927,
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
                  left: 98,
                  top: 65,
                  child: Text(
                    'Thông tin phân bón',
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
