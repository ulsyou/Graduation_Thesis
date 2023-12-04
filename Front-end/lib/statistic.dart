import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatisticsDashboard extends StatefulWidget {
  @override
  _StatisticsDashboardState createState() => _StatisticsDashboardState();
}

class _StatisticsDashboardState extends State<StatisticsDashboard> {
  Map<String, dynamic>? statistics; // Make statistics nullable

  @override
  void initState() {
    super.initState();
    fetchStatistics();
  }

  fetchStatistics() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/statistics'));

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        statistics = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics Dashboard'),
      ),
      body: statistics == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: statistics!.length, // Use null-aware access
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(statistics!.keys
                      .elementAt(index)), // Use null-aware access
                  subtitle: Text(statistics!.values
                      .elementAt(index)
                      .toString()), // Use null-aware access
                );
              },
            ),
    );
  }
}
