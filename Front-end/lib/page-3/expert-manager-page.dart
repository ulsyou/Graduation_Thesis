import 'dart:math';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'add-pages.dart';
import 'catatalog-list.dart';
import 'crop_prediction.dart';
import 'profile.dart';
import 'season-list.dart';

class ExpertManagerPage extends StatefulWidget {
  final bool isNavigatedFromOtherPage;

  ExpertManagerPage({Key? key, this.isNavigatedFromOtherPage = false}) : super(key: key);

  @override
  _ExpertManagerPageState createState() => _ExpertManagerPageState();
}

class _ExpertManagerPageState extends State<ExpertManagerPage> {
  String cityName = '';
  bool isLoading = true;
  String error = '';
  String tempC = '';
  String uv = '';
  String humidity = '';
  String condition = '';
  String icon = '';
  Timer? timer;

  @override
  void initState() {
     super.initState();
    if (widget.isNavigatedFromOtherPage) {
      isLoading = false;
    }
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          error = 'User denied permission to access the device location';
          isLoading = false;
        });
        return;
      }
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('Position: $position');
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      print('Placemarks: $placemarks');
      cityName = placemarks[0].administrativeArea!;
      startFetchingData(cityName);
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  Future<Map<String, dynamic>> fetchWeatherData(String cityName) async {
    print('Fetching weather data for $cityName');
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=1376e706c2e540de91173325231911&q=$cityName&aqi=no&lang=vi'));

    if (response.statusCode == 200) {
      String responseBody = convert.utf8.decode(response.bodyBytes);
      print('Response body: $responseBody');

      Map<String, dynamic> data = convert.jsonDecode(responseBody);
      print('Decoded data: $data');

      double tempC = data['current']['temp_c'] ?? 0.0;
      String condition = data['current']['condition']['text'] ?? '';
      int humidity = data['current']['humidity'] ?? 0;
      double uv = data['current']['uv'] ?? 0.0;
      String icon = data['current']['condition']['icon'] ?? '';
      return {
        'tempC': tempC,
        'condition': condition,
        'humidity': humidity,
        'uv': uv,
        'icon': icon,
      };
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void startFetchingData(String cityName) {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      try {
        Map<String, dynamic> weatherData = await fetchWeatherData(cityName);
        setState(() {
          tempC = weatherData['tempC'].toString();
          uv = weatherData['uv'].toString();
          humidity = weatherData['humidity'].toString();
          condition = weatherData['condition'];
          icon = 'http:${weatherData['icon']}';
          isLoading = false;
        });
      } catch (e) {
        error = e.toString();
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
                left: 210,
                top: 87,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xFFF4FFB5),
                      width: 190,
                      height: 190,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 247,
                top: 127,
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Text(
                    ' $tempC°C',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else if (error != '')
                Center(child: Text('Error: $error'))
              else
                Positioned(
                  left: 215,
                  top: 97,
                  child: SizedBox(
                    width: 300,
                    height: 26,
                    child: Text(
                      cityName,
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
                left: 235,
                top: 249,
                child: SizedBox(
                  width: 25,
                  height: 19,
                  child: Text(
                    'UV',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 324,
                top: 250,
                child: SizedBox(
                  height: 18,
                  child: Text(
                    '$uv',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 235,
                top: 230,
                child: SizedBox(
                  width: 49,
                  height: 21,
                  child: Text(
                    'Độ ẩm ',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 319,
                top: 230,
                child: SizedBox(
                  width: 41,
                  height: 19,
                  child: Text(
                    '$humidity%',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 222,
                top: 204,
                child: SizedBox(
                  width: 200,
                  height: 20,
                  child: Text(
                    condition,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 210,
                top: 150,
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(icon),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 87,
                child: Container(
                  width: 190,
                  height: 190,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xBFFFD05C),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 87,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/page-1/images/yuki-ho-ygqbbzemmi-unsplash-1-bg.png',
                          ),
                          fit: BoxFit.none,
                          alignment: Alignment.topCenter,
                          scale: 10,
                        ),
                        border: Border.all(
                          color: const Color(0x7FFFF5A3),
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 86,
                top: 251,
                child: SizedBox(
                  width: 116,
                  height: 23,
                  child: Text(
                    'Season name',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 100,
                child: SizedBox(
                  width: 79,
                  height: 23,
                  child: Text(
                    'RC002',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 214,
                top: 598,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CatalogList(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 273,
                top: 623,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CatalogList(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 74,
                      height: 20,
                      child: Text(
                        'Danh mục',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 231,
                top: 620,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 5,
                        top: 2,
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 16.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 515,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Seasons(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 530,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Seasons(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 80,
                      height: 38,
                      child: Text(
                        'Theo dõi mùa vụ',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 537,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Seasons(),
                                ),
                              );
                            },
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 13.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 598,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
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
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 148,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 612,
                child: Material(
                  type: MaterialType.transparency,
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
                    child: SizedBox(
                      width: 85,
                      height: 37,
                      child: Text(
                        'Dự đoán năng suất',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 75,
                top: 622,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
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
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 14.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 214,
                top: 515,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 274,
                top: 539,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 68,
                      height: 20,
                      child: Text(
                        'Thống kê',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 232,
                top: 536,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
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
                            child: Image.asset(
                              'assets/page-1/images/Group 15.png',
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
                left: 131,
                top: 681,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xCCFFFFFF),
                      width: 150,
                      height: 71,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 176,
                top: 705,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: SizedBox(
                      width: 90,
                      height: 20,
                      child: Text(
                        'Việc cần làm',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 141,
                top: 702,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Group 17.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 13,
                top: 303,
                child: Text(
                  'Công việc cần làm',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 140,
                top: 235,
                child: Transform.rotate(
                  angle: 270 * pi / 180,
                  child: Container(
                    width: 133,
                    height: 354,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0x78FFFFFF),
                          Color(0x80FFFFFF),
                          Color(0x20FFFFFF),
                          Color(0x02FFFFFF)
                        ],
                        stops: [0, 0.01, 1, 1],
                        transform: GradientRotation(169 * pi / 180),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29,
                top: 366,
                child: Container(
                  width: 7,
                  height: 38,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.shade700,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 355,
                child: SizedBox(
                  width: 226,
                  child: Text(
                    'Đo độ ẩm của mẫu ruộng RF00002',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 224,
                top: 421,
                child: SizedBox(
                  width: 119,
                  child: Text(
                    'Thời gian thực hiện',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 421,
                child: SizedBox(
                  width: 97,
                  child: Text(
                    'Người tham gia',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 443,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/page-1/images/f4568d422a6c0ec14a0567d726b1ac9096212c2a-1.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 257,
                top: 443,
                child: SizedBox(
                  width: 73,
                  child: Text(
                    '20/20/2023',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 228,
                top: 441,
                child: Container(
                  width: 23,
                  height: 20,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 3,
                        top: 2,
                        child: Image.asset(
                          'assets/page-1/images/Calendar.png',
                          width: 17,
                          height: 17,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 116,
                top: 386,
                child: SizedBox(
                  width: 147,
                  child: Text(
                    'Thực hiện bla bla lần đo',
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 53,
                top: 386,
                child: SizedBox(
                  width: 55,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Noto Sans',
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        const TextSpan(text: 'Ghi chú:'),
                        TextSpan(
                          text: ' ',
                          style: GoogleFonts.getFont(
                            'Noto Sans',
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 425,
                top: 364,
                child: Container(
                  width: 6,
                  height: 38,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.shade700,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 447,
                top: 353,
                child: Text(
                  'Đo độ ẩm của mẫu ruộng RF00002',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 599,
                top: 419,
                child: Text(
                  'Thời gian thực hiện',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Positioned(
                left: 447,
                top: 419,
                child: Text(
                  'Người tham gia',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Positioned(
                left: 448,
                top: 439,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/page-1/images/f4568d422a6c0ec14a0567d726b1ac9096212c2a-1.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 628,
                top: 441,
                child: Text(
                  '20/20/2023',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Positioned(
                left: 608,
                top: 439,
                child: Container(
                  width: 20,
                  height: 20,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 3,
                        top: 2,
                        child: Image.asset(
                          'assets/page-1/images/Calendar.png',
                          width: 15,
                          height: 17,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 502,
                top: 384,
                child: Text(
                  'Thực hiện bla bla lần đo',
                  style: GoogleFonts.getFont(
                    'Noto Sans',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Positioned(
                left: 446,
                top: 384,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: GoogleFonts.getFont(
                      'Noto Sans',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      const TextSpan(text: 'Ghi chú:'),
                      TextSpan(
                        text: ' ',
                        style: GoogleFonts.getFont(
                          'Noto Sans',
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 826,
                child: Container(
                  width: 390,
                  height: 56,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFA96),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Positioned(
                left: 171,
                top: 787,
                child: Image.asset(
                  'assets/page-1/images/Ellipse 1.png',
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 176,
                top: 792,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddPages(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      color: const Color(0xFFC5FFBC),
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 810,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddPages(),
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
                            child: Image.asset(
                              'assets/page-1/images/Group 1.png',
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
                left: 27,
                top: 838,
                child: Container(
                  width: 30,
                  height: 30,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 4,
                        top: 3,
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Home.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 256,
                top: 840,
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
                        top: 2,
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Noti.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 123,
                top: 840,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Material(
                          type: MaterialType.transparency,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: const MaterialStatePropertyAll<Color>(
                              Color(0x0c7f7f7f),
                            ),
                            child: Ink(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/page-1/images/Calendar.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 347,
                top: 840,
                child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              Positioned(
                left: 347,
                top: 840,
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
                    },
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Color(0x0c7f7f7f),
                    ),
                    child: Ink(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/page-1/images/avt.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
