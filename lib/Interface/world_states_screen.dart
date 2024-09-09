import 'package:covid_19_application/Interface/countries_list.dart';
import 'package:covid_19_application/Models/CovidModel.dart';
import 'package:covid_19_application/Services/states_services.dart';
import 'package:covid_19_application/Components/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  //animation controller instance
  late final AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  //disposal of animation controller
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  //color palets
  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    final StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              FutureBuilder(
                future: statesServices.getWorldCovidRecords(),
                builder: (context, AsyncSnapshot<CovidModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'TOTAL':
                                double.parse(snapshot.data!.cases!.toString()),
                            'RECOVERED': double.parse(
                                snapshot.data!.recovered!.toString()),
                            'DEATHS':
                                double.parse(snapshot.data!.deaths!.toString()),
                          },
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorList,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            showChartValues: true,
                            showChartValuesOutside: true,
                            showChartValueBackground: true,
                          ),
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                  title: 'TOTAL CASES WORLD-WIDE',
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReusableRow(
                                  title: 'RECOVERED WORLD-WIDE',
                                  value: snapshot.data!.recovered.toString(),
                                ),
                                ReusableRow(
                                  title: 'DEATHS WORLD-WIDE',
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                ReusableRow(
                                  title: 'ACTIVE CASES WORLD-WIDE',
                                  value: snapshot.data!.active.toString(),
                                ),
                                ReusableRow(
                                  title: 'AFFECTED COUNTRIES WORLD-WIDE',
                                  value: snapshot.data!.affectedCountries
                                      .toString(),
                                ),
                                ReusableRow(
                                  title: 'CRITICAL CASES WORLD-WIDE',
                                  value: snapshot.data!.critical.toString(),
                                ),
                                ReusableRow(
                                  title: 'TESTS DONE WORLD-WIDE',
                                  value: snapshot.data!.tests.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CountriesListScreen()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Track Countries',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: animationController,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
