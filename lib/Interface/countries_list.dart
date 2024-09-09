import 'package:covid_19_application/Interface/detail_country_screen.dart';
import 'package:covid_19_application/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final TextEditingController searchController = TextEditingController();

  final stateServices = StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search a Country',
                  border: OutlineInputBorder(
                    gapPadding: 6,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: stateServices.getCountriesCovidRecords(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        if (!snapshot.hasData) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          String name = snapshot.data![index]['country'];
                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailCountryScreen(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                          ),
                                        ),
                                      );
                                    },
                                    leading: Image(
                                      height: 50,
                                      width: 70,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]['cases'].toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailCountryScreen(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                          ),
                                        ),
                                      );
                                    },
                                    leading: Image(
                                      height: 50,
                                      width: 70,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]['cases'].toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (name
                              .toUpperCase()
                              .contains(searchController.text.toUpperCase())) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailCountryScreen(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                          ),
                                        ),
                                      );
                                    },
                                    leading: Image(
                                      height: 50,
                                      width: 70,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]['cases'].toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
