import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:freemo_test/models/country.dart';



class CountryService {


  Future<List<Country>> getAllCountries(BuildContext context) async {
    List<Country> countryList = [];


    try {
     
      String res = await rootBundle.loadString('assets/countries.json');


            for (int i = 0; i < jsonDecode(res).length; i++) {
              // Add in countryList
              countryList.add(
                Country.fromMap(
                  jsonDecode(res)[i],
                ),
              );

             
            }
    } catch (e) {
      showSnackBar(context, "Something went wrong");
    }
    return countryList;
  }

   
}
