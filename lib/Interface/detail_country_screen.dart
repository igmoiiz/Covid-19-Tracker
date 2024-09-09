// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:covid_19_application/Components/reusable_row.dart';
import 'package:flutter/material.dart';

class DetailCountryScreen extends StatefulWidget {
  String name;
  final image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailCountryScreen({
    super.key,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.test,
  });

  @override
  State<DetailCountryScreen> createState() => _DetailCountryScreenState();
}

class _DetailCountryScreenState extends State<DetailCountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.067),
                  child: Card(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(widget.image),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 20),
                        ReusableRow(
                            title: 'Name of Country', value: widget.name),
                        ReusableRow(
                            title: 'Total Cases',
                            value: widget.totalCases.toString()),
                        ReusableRow(
                            title: 'Total Tests Performed',
                            value: widget.test.toString()),
                        ReusableRow(
                            title: 'Total Death',
                            value: widget.totalDeaths.toString()),
                        ReusableRow(
                            title: 'Total Recovered',
                            value: widget.totalRecovered.toString()),
                        ReusableRow(
                            title: 'Currently Active',
                            value: widget.active.toString()),
                        ReusableRow(
                            title: 'Critical Cases',
                            value: widget.critical.toString()),
                        ReusableRow(
                            title: 'Recovered Today',
                            value: widget.todayRecovered.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
