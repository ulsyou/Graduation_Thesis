import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/Prediction_Decision_tree.dart';
import 'package:myapp/page-3/Prediction_Linear_Regression.dart';
import 'package:myapp/page-3/Prediction_Random_Forest.dart';
import 'package:myapp/page-3/crop_prediction_img.dart';
import 'package:myapp/page-3/expert-manager-page.dart';

class RicePrediction extends StatelessWidget {
  const RicePrediction({super.key});

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
              top: 631,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_3(),
                      ),
                    );
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
              left: 206,
              top: 668,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_3(),
                      ),
                    );
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: SizedBox(
                    width: 157,
                    height: 56,
                    child: Text(
                      'Thuật toán rừng ngẫu nhiên',
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
              top: 478,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_2(),
                      ),
                    );
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
              left: 203,
              top: 515,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_2(),
                      ),
                    );
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: SizedBox(
                    width: 132,
                    height: 58,
                    child: Text(
                      'Thuật toán hồi quy tuyến tính',
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
              top: 325,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_1(),
                      ),
                    );
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
              left: 206,
              top: 362,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_1(),
                      ),
                    );
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: SizedBox(
                    width: 143,
                    height: 54,
                    child: Text(
                      'Thuật toán cây quyết định',
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
              top: 172,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImagePrediction(),
                      ),
                    );
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
              left: 206,
              top: 218,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImagePrediction(),
                      ),
                    );
                  },
                  overlayColor: const MaterialStatePropertyAll<Color>(
                    Color(0x0c7f7f7f),
                  ),
                  child: SizedBox(
                    width: 166,
                    height: 31,
                    child: Text(
                      'Sử dụng hình ảnh',
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
              top: 184,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImagePrediction(),
                      ),
                    );
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
                          'assets/page-1/images/gallery-1.png',
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
              top: 643,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_1(),
                      ),
                    );
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
                          'assets/page-1/images/Rectangle 47.png',
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
              top: 490,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_2(),
                      ),
                    );
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
                          'assets/page-1/images/Rectangle 48.png',
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
              top: 337,
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Prediction_3(),
                      ),
                    );
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
                          'assets/page-1/images/Rectangle 49.png',
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
                        builder: (context) =>
                            ExpertManagerPage(isNavigatedFromOtherPage: true),
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
              left: 108,
              top: 65,
              child: Text(
                'Dự đoán năng suất',
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
