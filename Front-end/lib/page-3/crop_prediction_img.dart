import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'Prediction.dart';

import 'crop_prediction.dart';

class ImagePrediction extends StatefulWidget {
  const ImagePrediction({Key? key}) : super(key: key);

  @override
  _ImagePredictionState createState() => _ImagePredictionState();
}

class _ImagePredictionState extends State<ImagePrediction> {
  File? _imageFile;
  String? _predictionResult;
  double? _yieldGm2;
  double? _yieldTha;

  Future<void> _selectImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _setImage(File(pickedFile.path));
      await uploadImage(_imageFile!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Prediction(
            imageFile: _imageFile,
            predictionResult: _predictionResult,
            yieldGm2: _yieldGm2 ?? 0.0,
            yieldTha: _yieldTha ?? 0.0,
          ),
        ),
      );
    }
  }

  Future<void> _captureImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _setImage(File(pickedFile.path));
      await uploadImage(_imageFile!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Prediction(
            imageFile: _imageFile,
            predictionResult: _predictionResult,
            yieldGm2: _yieldGm2 ?? 0.0,
            yieldTha: _yieldTha ?? 0.0,
          ),
        ),
      );
    }
  }

  void _setImage(File? imageFile) {
    setState(() {
      _imageFile = imageFile;
    });
  }


  Future<void> uploadImage(File imageFile) async {
    final url = 'http://10.0.2.2:3000/processImage';

    Uint8List fileBytes = await imageFile.readAsBytes();

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile.fromBytes('image', fileBytes, filename: 'image.jpg'));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> result = Map<String, dynamic>.from(json.decode(responseBody));

        setState(() {
          _predictionResult = result['result'];
          _yieldGm2 = result['yield_gm2'];
          _yieldTha = result['yield_tha'];
        });
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              left: 39,
              top: 498,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    _captureImage();
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Ink(
                    width: 333,
                    height: 124,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 195,
              top: 545,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    _captureImage();
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: SizedBox(
                    width: 155,
                    height: 31,
                    child: Text(
                      'Ảnh từ chụp ảnh',
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 39,
              top: 268,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    _selectImage();
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Ink(
                    width: 333,
                    height: 124,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xCCFFFFFF), Color(0x00FFFFFF)],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 195,
              top: 314,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    _selectImage();
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: SizedBox(
                    width: 143,
                    height: 31,
                    child: Text(
                      'Ảnh từ thư viện',
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 279,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    _selectImage();
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Ink(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/page-1/images/Rectangle 50.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 510,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {

                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: Ink(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/page-1/images/Rectangle 51.png',
                        ),
                        fit: BoxFit.cover,
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
                width: 360,
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
                      left: -100,
                      top: -118,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2FbBi0N1EZ1GlEm38rYJyr%2Fb321c41cffe9bedffce10c943759ce90.png',
                        width: 307,
                        height: 254,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 31,
              top: 66,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RicePrediction(),
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
                'Sử dụng hình ảnh',
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
    );
  }
}
