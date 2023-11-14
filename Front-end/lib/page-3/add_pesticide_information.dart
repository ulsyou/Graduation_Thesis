// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mongo_dart/mongo_dart.dart' as mongo;
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http_parser/http_parser.dart';
// import 'dart:io';
// import 'add-pages.dart';
//
// class AddPesticide extends StatefulWidget {
//   @override
//   _AddPesticideState createState() => _AddPesticideState();
// }
//
// class _AddPesticideState extends State<AddPesticide> {
//   TextEditingController pesticideNameController = TextEditingController();
//   TextEditingController functionController = TextEditingController();
//   TextEditingController supplierController = TextEditingController();
//   TextEditingController treatingDiseasesController = TextEditingController();
//   TextEditingController ingredientsController = TextEditingController();
//   TextEditingController usageInstructionsController = TextEditingController();
//   String? imagePath;
//   File? image;
//
//   @override
//   void initState() {
//     super.initState();
//     Future<void> addPesticide(File? image) async {
//       final String apiUrl =
//           'http://10.0.2.2:5000/crops-season/create/crop-season';
//
//       if (image != null) {
//         var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
//           ..fields['pesticideName'] = pesticideNameController.text
//           ..fields['seasonType'] = functionController.text
//           ..fields['supplier'] = supplierController.text
//           ..fields['fieldSample'] = treatingDiseasesController.text
//           ..fields['ingredients'] = ingredientsController.text
//           ..fields['usageInstructions'] = usageInstructionsController.text
//           ..files.add(await http.MultipartFile.fromPath(
//             'image',
//             image.path,
//             contentType: MediaType('image', 'jpeg'),
//           ));
//         var response = await request.send();
//         if (response.statusCode == 201) {
//           print('Season created successful');
//         } else {
//           print('Request failed with status ${response.statusCode}');
//         }
//       }
//     }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: 412,
//           height: 1180,
//           clipBehavior: Clip.hardEdge,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//           ),
//           child: SizedBox(
//             width: double.infinity,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Container(
//                     width: 412,
//                     height: 1180,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage(
//                           'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
//                         ),
//                         fit: BoxFit.none,
//                         alignment: Alignment.centerLeft,
//                         opacity: 0.7,
//                         scale: 2.4,
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
//                     height: 1180,
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
//                   left: 0,
//                   top: 387,
//                   child: Container(
//                     width: 412,
//                     height: 793,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(
//                       color: Color(0x4CEAFFB1),
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(35),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 24,
//                   top: 347,
//                   child: Container(
//                     width: 364,
//                     height: 833,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0x4CF5FFD9),
//                       borderRadius: BorderRadius.circular(35),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 43,
//                   top: 461,
//                   child: Container(
//                     width: 328,
//                     height: 76,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0xCCFFFFFF),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 50,
//                   top: 466,
//                   child: Text(
//                     'Đặc trị:',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 91,
//                   top: 491,
//                   child: SizedBox(
//                     width: 247,
//                     child: Text(
//                       'Sâu đục thân bướm 2 chấm hại lúa\nSâu cuốn lá nhỏ hại lúa',
//                       style: GoogleFonts.getFont(
//                         'Noto Sans',
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 42,
//                   top: 870,
//                   child: Container(
//                     width: 328,
//                     height: 159,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0xCCFFFFFF),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 50,
//                   top: 875,
//                   child: Text(
//                     'Hướng dẫn sử dụng:',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 56,
//                   top: 903,
//                   child: SizedBox(
//                     width: 298,
//                     height: 118,
//                     child: Text(
//                       'Khi thấy rầy mới xuất hiện, pha 1 gói Chess 20g vào bình 25 lít và phun đều cả cây. Lượng nước phun cho một Hecta thông thường khoảng 400 – 500 lít. Thời gian cách ly: ngừng phun thuốc trước khi thu hoạch 7 ngày.',
//                       style: GoogleFonts.getFont(
//                         'Noto Sans',
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 42,
//                   top: 668,
//                   child: Container(
//                     width: 328,
//                     height: 187,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0xCCFFFFFF),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 50,
//                   top: 673,
//                   child: SizedBox(
//                     width: 97,
//                     height: 26,
//                     child: Text(
//                       'Công dụng:',
//                       style: GoogleFonts.getFont(
//                         'Noto Sans',
//                         color: Colors.black,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 56,
//                   top: 697,
//                   child: SizedBox(
//                     width: 306,
//                     height: 153,
//                     child: Text(
//                       'Ches 50WG tác động làm ngăn cản sự di chuyển và chích hút ở côn trùng thông qua quá trình can thiệp vào sự tương tác giữa các dây thần kinh điều khiển cơ,dẫn đến rối loạn và mất khả năng di chuyển đặc biệt là ở chân sau. Đồng thời, ngăn cản việc đưa vòi chích hút vaofmoo thực vật, gây hiện tượng ngán ăn, cuối cùng côn trùng',
//                       style: GoogleFonts.getFont(
//                         'Noto Sans',
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 42,
//                   top: 594,
//                   child: Container(
//                     width: 328,
//                     height: 63,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0xCCFFFFFF),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 50,
//                   top: 598,
//                   child: SizedBox(
//                     height: 24,
//                     child: Text(
//                       'Thành phần:',
//                       style: GoogleFonts.getFont(
//                         'Noto Sans',
//                         color: Colors.black,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 57,
//                   top: 627,
//                   child: SizedBox(
//                     width: 296,
//                     height: 23,
//                     child: Text(
//                       'Chlorantraniliprole: 5%(w/w), phụ gia: 95%',
//                       style: GoogleFonts.getFont(
//                         'Noto Sans',
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 43,
//                   top: 548,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0xCCFFFFFF),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 50,
//                   top: 553,
//                   child: Text(
//                     'Nhà cung cấp:',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 191,
//                   top: 555,
//                   child: Text(
//                     'Công ty Du Pont Việt Nam',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 42,
//                   top: 415,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0xCCFFFFFF),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 49,
//                   top: 420,
//                   child: Text(
//                     'Tên thuốc:',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 190,
//                   top: 422,
//                   child: Text(
//                     'DuponTMprevathon 5SC',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 42,
//                   top: 369,
//                   child: Container(
//                     width: 328,
//                     height: 35,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       color: const Color(0xCCFFFFFF),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 49,
//                   top: 373,
//                   child: Text(
//                     'Mã thuốc:',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 252,
//                   top: 374,
//                   child: Text(
//                     'RC00002',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
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
//                   left: 31,
//                   top: 66,
//                   child: Material(
//                     type: MaterialType.transparency,
//                     clipBehavior: Clip.antiAlias,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => AddPages(),
//                           ),
//                         );
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
//                   left: 118,
//                   top: 65,
//                   child: Text(
//                     'Thông tin thuốc',
//                     style: GoogleFonts.getFont(
//                       'Noto Sans',
//                       color: Colors.black,
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
