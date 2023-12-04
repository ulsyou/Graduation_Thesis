import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-3/season_image_add.dart';

class Image_season_choose extends StatelessWidget {
  final File? imageFile;
  final Map<String, dynamic> seasonData;
  const Image_season_choose(
      {Key? key, this.imageFile, required this.seasonData})
      : super(key: key);

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
                  left: 24,
                  top: 205,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FbBi0N1EZ1GlEm38rYJyr%2Ff4568d422a6c0ec14a0567d726b1ac9096212c2aRectangle%2032.png?alt=media&token=786e3384-b0be-408a-8d0a-7be34f7f6ab6',
                      width: 365,
                      height: 264,
                      fit: BoxFit.cover,
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
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => updateSeason(
                        //       seasonData: seasonData,
                        //     ),
                        //   ),
                        // );
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
                            builder: (context) => Image_season(
                              seasonData: seasonData,
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
                  left: 110,
                  top: 65,
                  child: Text(
                    'Hình ảnh mùa vụ',
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
