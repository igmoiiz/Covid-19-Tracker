import 'dart:convert';

import 'package:covid_19_application/Models/CovidModel.dart';
import 'package:covid_19_application/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  //  future methods to fetch data from the api
  //  fetching data for overall records of covid
  Future<CovidModel> getWorldCovidRecords() async {
    final response = await http.get(Uri.parse(ApplicationUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return CovidModel.fromJson(data);
    } else {
      throw Exception(
          'Error While Loading Please Check Your Internet Connection and Try Again!');
    }
  } //  fetching data for record of covid for individual countries

  Future<List<dynamic>> getCountriesCovidRecords() async {
    final response = await http.get(Uri.parse(ApplicationUrl.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'Error While Loading Please Check Your Internet Connection and Try Again!');
    }
  }
}
