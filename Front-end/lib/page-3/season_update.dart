// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:mongo_dart/mongo_dart.dart' as mongo;
// import 'package:http_parser/http_parser.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// import 'season-list.dart';
//
// class updateSeason extends StatefulWidget {
//   final Map<String, dynamic> seasonData;
//
//   updateSeason({required this.seasonData});
//
//   @override
//   _UpdateSeasonState createState() => _UpdateSeasonState();
// }
//
// class _UpdateSeasonState extends State<updateSeason> {
//   TextEditingController cropSeasonNameController = TextEditingController();
//   TextEditingController yieldController = TextEditingController();
//   DateTime selectedGieoSaDate = DateTime.now();
//   DateTime selectedThuHoachDate = DateTime.now();
//   List<String> riceStrains = [];
//   List<String> fieldSamples = [];
//   String selectedRice = '';
//   String selectedFieldSample = '';
//   String selectedSeasonType = 'Vụ mùa';
//
//   Future<void> _selectDate(BuildContext context, DateTime selectedDate,
//       Function(DateTime) onSelect) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         onSelect(picked);
//       });
//     }
//   }
//
//   void updateSelectedFieldSample(String newValue) {
//     setState(() {
//       selectedFieldSample = newValue;
//     });
//   }
//
//   void updateSelectedRiceStrain(String newValue) {
//     setState(() {
//       selectedRice = newValue;
//     });
//   }
//
//   void updateSelectedGieoSaDate(DateTime newDate) {
//     setState(() {
//       selectedGieoSaDate = newDate;
//     });
//   }
//
//   void updateSelectedThuHoachDate(DateTime newDate) {
//     setState(() {
//       selectedThuHoachDate = newDate;
//     });
//   }
//
//   Future<List<String>> fetchRiceStrainsFromMongoDB() async {
//     final mongo.Db mongoClient = await mongo.Db.create(
//         'mongodb+srv://admin:admin@cluster0.pyqy143.mongodb.net/');
//     await mongoClient.open();
//
//     final collection = mongoClient.collection('ricestrains');
//     final List<Map<String, dynamic>> documents =
//         await collection.find().toList();
//
//     final List<String> riceStrains =
//         documents.map((doc) => doc['strainName'] as String).toSet().toList();
//
//     await mongoClient.close();
//
//     return riceStrains;
//   }
//
//   Future<List<String>> fetchFieldSamplesFromMongoDB() async {
//     final mongo.Db mongoClient = await mongo.Db.create(
//         'mongodb+srv://admin:admin@cluster0.pyqy143.mongodb.net/');
//     await mongoClient.open();
//
//     final collection = mongoClient.collection('fieldsamples');
//     final List<Map<String, dynamic>> documents =
//         await collection.find().toList();
//
//     final List<String> fieldSamples =
//         documents.map((doc) => doc['fieldCode'] as String).toSet().toList();
//
//     await mongoClient.close();
//
//     return fieldSamples;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromMongoDB();
//   }
//
//   Future<void> fetchDataFromMongoDB() async {
//     riceStrains = await fetchRiceStrainsFromMongoDB();
//     fieldSamples = await fetchFieldSamplesFromMongoDB();
//
//     setState(() {
//       selectedFieldSample = fieldSamples.isNotEmpty ? fieldSamples[0] : '';
//       selectedRice = riceStrains.isNotEmpty ? riceStrains[0] : '';
//     });
//   }
//
//   Future<void> updateSeason(File? image) async {
//     final seasonID = widget.seasonData['_id'];
//     final url =
//         'http://10.0.2.2:5000/crops-season/update/crop-season/$seasonID';
//
//     if (image != null) {
//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
//         ..fields['cropSeasonName'] = cropSeasonNameController.text
//         ..fields['seasonType'] = selectedSeasonType
//         ..fields['yield'] = yieldController.text
//         ..fields['fieldSample'] = selectedFieldSample
//         ..fields['riceVariety'] = selectedRice
//         ..fields['plantingDate'] = selectedGieoSaDate!.toIso8601String()
//         ..fields['harvestDate'] = selectedThuHoachDate!.toIso8601String()
//         ..files.add(await http.MultipartFile.fromPath(
//           'image',
//           image.path,
//           contentType: MediaType('image', 'jpeg'),
//         ));
//       final response = await http.patch(
//         Uri.parse(url),
//         body: requestBody,
//       );
//
//       if (response.statusCode == 200) {
//         print('Season update successfully');
//       } else {
//         print('Error in update season: ${response.body}');
//       }
//     }
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             width: 412,
//             height: 915,
//             clipBehavior: Clip.hardEdge,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Container(
//                     width: 412,
//                     height: 915,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage(
//                           'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
//                         ),
//                         fit: BoxFit.none,
//                         alignment: Alignment.centerLeft,
//                         opacity: 0.7,
//                         scale: 3.1,
//                       ),
//                       border: Border.all(),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Container(
//                     width: 412,
//                     height: 915,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(
//                       color: Color(0x84FFFDF4),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 49,
//                   top: 158,
//                   child: InkWell(
//                     onTap: () async {
//                       final pickedFile = await ImagePicker()
//                           .pickImage(source: ImageSource.gallery);
//                       if (pickedFile != null) {
//                         setState(() {
//                           image = File(pickedFile.path);
//                         });
//                       }
//                     },
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       clipBehavior: Clip.hardEdge,
//                       child: image != null
//                           ? Image.file(
//                         File(image!.path),
//                         width: 318,
//                         height: 180,
//                         fit: BoxFit.cover,
//                       )
//                           : Image.asset(
//                         'assets/page-1/images/Group 46.png',
//                         width: 318,
//                         height: 180,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 44,
//                   top: 659,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 328,
//                             height: 35,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               color: const Color(0xCCFFFFFF),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 7,
//                           top: 5,
//                           child: Text(
//                             'Ngày thu hoạch:',
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 205,
//                           top: 5,
//                           child: Material(
//                             type: MaterialType.transparency,
//                             child: GestureDetector(
//                               onTap: () {
//                                 _selectDate(context,
//                                     selectedThuHoachDate ?? DateTime.now(),
//                                         (DateTime newDate) {
//                                       setState(() {
//                                         selectedThuHoachDate = newDate;
//                                       });
//                                     });
//                               },
//                               child: Text(
//                                 selectedThuHoachDate != null
//                                     ? '${selectedThuHoachDate!
//                                     .day}/${selectedThuHoachDate!
//                                     .month}/${selectedThuHoachDate!.year}'
//                                     : 'Chọn ngày',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xb57e7e7e),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 44,
//                   top: 613,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 328,
//                             height: 35,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               color: const Color(0xCCFFFFFF),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 7,
//                           top: 5,
//                           child: Text(
//                             'Ngày giao sạ:',
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 205,
//                           top: 5,
//                           child: Material(
//                             type: MaterialType.transparency,
//                             child: GestureDetector(
//                               onTap: () {
//                                 _selectDate(
//                                     context,
//                                     selectedGieoSaDate ?? DateTime.now(),
//                                         (DateTime newDate) {
//                                       setState(() {
//                                         selectedGieoSaDate = newDate;
//                                       });
//                                     });
//                               },
//                               child: Text(
//                                 selectedGieoSaDate != null
//                                     ? '${selectedGieoSaDate!
//                                     .day}/${selectedGieoSaDate!
//                                     .month}/${selectedGieoSaDate!.year}'
//                                     : 'Chọn ngày',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xb57e7e7e),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 44,
//                   top: 566,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 328,
//                             height: 35,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               color: const Color(0xCCFFFFFF),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 7,
//                           top: 5,
//                           child: Text(
//                             'Năng suất:',
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 160,
//                           top: -6,
//                           child: Container(
//                             width: 200,
//                             child: TextFormField(
//                               controller: yieldController,
//                               decoration: InputDecoration(
//                                 hintText: 'Nhập năng suất',
//                                 hintStyle: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xb57e7e7e),
//                                 ),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 44,
//                   top: 519,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 328,
//                             height: 35,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               color: const Color(0xCCFFFFFF),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 7,
//                           top: 5,
//                           child: Text(
//                             'Mẫu ruộng:',
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 195,
//                           top: -6,
//                           child: FutureBuilder<List<String>>(
//                             future: fetchFieldSamplesFromMongoDB(),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return Container();
//                               }
//
//                               if (snapshot.hasError) {
//                                 return Text('Đã xảy ra lỗi: ${snapshot.error}');
//                               }
//
//                               List<String> fieldSamples = snapshot.data ?? [];
//
//                               return DropdownButton<String>(
//                                 value: selectedFieldSample.isNotEmpty
//                                     ? selectedFieldSample
//                                     : null,
//                                 onChanged: (String? newValue) {
//                                   if (newValue != null) {
//                                     setState(() {
//                                       selectedFieldSample = newValue;
//                                     });
//                                   }
//                                 },
//                                 items: fieldSamples.map<
//                                     DropdownMenuItem<String>>(
//                                         (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(
//                                           value,
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       );
//                                     }).toList(),
//                               );
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 44,
//                   top: 472,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 328,
//                             height: 35,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               color: const Color(0xCCFFFFFF),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 7,
//                           top: 5,
//                           child: Text(
//                             'Giống lúa:',
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 195,
//                           top: -6,
//                           child: FutureBuilder<List<String>>(
//                             future: fetchRiceStrainsFromMongoDB(),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return Container();
//                               }
//
//                               if (snapshot.hasError) {
//                                 return Text('Đã xảy ra lỗi: ${snapshot.error}');
//                               }
//
//                               List<String> riceStrains = snapshot.data ?? [];
//
//                               return DropdownButton<String>(
//                                 value:
//                                 selectedRice.isNotEmpty ? selectedRice : null,
//                                 onChanged: (String? newValue) {
//                                   if (newValue != null) {
//                                     setState(() {
//                                       selectedRice = newValue;
//                                     });
//                                   }
//                                 },
//                                 items: riceStrains.map<
//                                     DropdownMenuItem<String>>(
//                                         (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(
//                                           value,
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       );
//                                     }).toList(),
//                               );
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 44,
//                   top: 425,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 328,
//                             height: 35,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               color: const Color(0xCCFFFFFF),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 7,
//                           top: 5,
//                           child: Text(
//                             'Vụ mùa:',
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 195,
//                           top: -6,
//                           child: DropdownButton<String>(
//                             value: selectedSeasonType,
//                             onChanged: (String? newValue) {
//                               if (newValue != null) {
//                                 setState(() {
//                                   selectedSeasonType = newValue;
//                                 });
//                               }
//                             },
//                             items: <String>[
//                               'Đông xuân',
//                               'Hè thu',
//                               'Vụ mùa',
//                             ].map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF000000),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 44,
//                   top: 379,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                             width: 328,
//                             height: 35,
//                             clipBehavior: Clip.hardEdge,
//                             decoration: BoxDecoration(
//                               color: const Color(0xCCFFFFFF),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 7,
//                           top: 4,
//                           child: Text(
//                             'Tên mùa vụ:',
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 150,
//                           top: -6,
//                           child: Container(
//                             width: 200,
//                             child: TextFormField(
//                               controller: cropSeasonNameController,
//                               decoration: InputDecoration(
//                                 hintText: 'Nhập tên mùa vụ',
//                                 hintStyle: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xb57e7e7e),
//                                 ),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 43,
//                   top: 825,
//                   child: Material(
//                     type: MaterialType.transparency,
//                     borderRadius: BorderRadius.circular(25),
//                     clipBehavior: Clip.antiAlias,
//                     child: InkWell(
//                       onTap: () {
//                         // addSeason(image).then((_) {
//                         //   Navigator.pushReplacement(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //       builder: (context) => AddPages(),
//                         //     ),
//                         //   );
//                         // });
//                       },
//                       overlayColor: const MaterialStatePropertyAll<Color>(
//                         Color(0x0c7f7f7f),
//                       ),
//                       child: Ink(
//                         color: const Color(0xFF6BFF53),
//                         width: 141,
//                         height: 47,
//                         child: Center(
//                           child: Text(
//                             'Thêm',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.getFont(
//                               'Noto Sans',
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 231,
//                   top: 825,
//                   child: Material(
//                     type: MaterialType.transparency,
//                     borderRadius: BorderRadius.circular(25),
//                     clipBehavior: Clip.antiAlias,
//                     child: InkWell(
//                       onTap: () {
//                         // Navigator.pushReplacement(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => AddPages(),
//                         //   ),
//                         // );
//                       },
//                       overlayColor: const MaterialStatePropertyAll<Color>(
//                         Color(0x0c7f7f7f),
//                       ),
//                       child: Ink(
//                         color: const Color(0xFFFF3838),
//                         width: 141,
//                         height: 47,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 285,
//                   top: 837,
//                   child: Material(
//                     type: MaterialType.transparency,
//                     child: InkWell(
//                       onTap: () {
//                         // Navigator.pushReplacement(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => AddPages(),
//                         //   ),
//                         // );
//                       },
//                       overlayColor: const MaterialStatePropertyAll<Color>(
//                         Color(0x0c7f7f7f),
//                       ),
//                       child: Text(
//                         'Huỷ',
//                         style: GoogleFonts.getFont(
//                           'Noto Sans',
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Container(
//                     width: 412,
//                     height: 127,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(
//                       color: Color(0xFFFFFA96),
//                       borderRadius: BorderRadius.vertical(
//                         bottom: Radius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Container(
//                     width: 412,
//                     height: 115,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.vertical(
//                         bottom: Radius.circular(20),
//                       ),
//                     ),
//                     child: Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Positioned(
//                           child: Image.asset(
//                             'assets/page-1/images/mask-group.png',
//                             width: 351,
//                             height: 254,
//                             fit: BoxFit.contain,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 35,
//                   top: 66,
//                   child: Material(
//                     type: MaterialType.transparency,
//                     clipBehavior: Clip.antiAlias,
//                     child: InkWell(
//                       onTap: () {
//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(
//                         //     builder: (context) => AddPages(),
//                         //   ),
//                         // );
//                       },
//                       overlayColor: const MaterialStatePropertyAll<Color>(
//                         Color(0x0c7f7f7f),
//                       ),
//                       child: Container(
//                         width: 28,
//                         height: 28,
//                         clipBehavior: Clip.hardEdge,
//                         decoration: const BoxDecoration(),
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             Positioned(
//                               left: 4,
//                               top: 4,
//                               child: Image.asset(
//                                 'assets/page-1/images/Group 25.png',
//                                 width: 24,
//                                 height: 24,
//                                 fit: BoxFit.contain,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 130,
//                   top: 65,
//                   child: SizedBox(
//                     width: 240,
//                     child: Text(
//                       'Thêm mùa vụ',
//                       style: GoogleFonts.getFont(
//                         'Noto Sans',
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//     }
