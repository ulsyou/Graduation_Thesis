import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-3/add-pages.dart';
import 'package:permission_handler/permission_handler.dart';

class AddField extends StatefulWidget {
  @override
  _AddFieldState createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  TextEditingController onwerNameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  String selectedSoilType = 'Đất phù sa ven sông';
  String? imagePath;
  File? image;
  bool isPositionedVisible = true;

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isDenied) {}
  }

  @override
  Future<void> addField(File? image) async {
    final String apiUrl = 'http://10.0.2.2:5000/field/create/fieldSample';

    if (image != null) {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['owner'] = onwerNameController.text
        ..fields['classification'] = selectedSoilType
        ..fields['province'] = stateController.text
        ..fields['area'] = areaController.text
        ..fields['longitude'] = longitudeController.text
        ..fields['latitude'] = latitudeController.text
        ..files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      var response = await request.send();
      if (response.statusCode == 201) {
        print('Season created successful');
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
                  left: 0,
                  top: 374,
                  child: Container(
                    width: 412,
                    height: 541,
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
                    height: 568,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(0x4CF5FFD9),
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
                Positioned(
                  left: 42,
                  top: 553,
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
                  top: 558,
                  child: Text(
                    'Vị trí:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 115,
                  top: 560,
                  child: Text(
                    'Kinh độ: ${longitudeController.text}',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 245,
                  top: 560,
                  child: Text(
                    'Vĩ độ: ${latitudeController.text}',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                isPositionedVisible
                    ? Positioned(
                        left: 320,
                        top: 545,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.location_on),
                              onPressed: () async {
                                await _requestLocationPermission();
                                Position position = await _getCurrentLocation();
                                setState(() {
                                  longitudeController.text =
                                      position.longitude.toStringAsFixed(2);
                                  latitudeController.text =
                                      position.latitude.toStringAsFixed(2);
                                  isPositionedVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Positioned(
                  left: 42,
                  top: 507,
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
                  top: 512,
                  child: Text(
                    'Tỉnh/Thành phố:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 208,
                  top: 500,
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: stateController,
                      decoration: InputDecoration(
                        hintText: 'Nhập tỉnh/thành phố',
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
                  top: 415,
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
                  top: 420,
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
                  left: 180,
                  top: 408,
                  child: DropdownButton<String>(
                    value: selectedSoilType,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedSoilType = newValue;
                        });
                      }
                    },
                    items: <String>[
                      'Đất phù sa ven sông',
                      'Đất phù sa xa sông',
                      'Đất nhiễm mặn',
                      'Đất nhiễm phèn',
                      'Đất nhiễm mặn + phèn',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  left: 42,
                  top: 461,
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
                  top: 466,
                  child: Text(
                    'Diện tích(ha):',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 221,
                  top: 455,
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: areaController,
                      decoration: InputDecoration(
                        hintText: 'Nhập diện tích',
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
                  top: 369,
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
                  top: 373,
                  child: Text(
                    'Chủ sở hữu:',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 210,
                  top: 362,
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: onwerNameController,
                      decoration: InputDecoration(
                        hintText: 'Nhập chủ sở hữu',
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
                  top: 825,
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        addField(image).then((_) {
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
                  top: 825,
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
                  top: 837,
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
                  left: 115,
                  top: 65,
                  child: SizedBox(
                    width: 240,
                    child: Text(
                      'Thêm mẫu ruộng',
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
