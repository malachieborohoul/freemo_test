import 'package:flutter/material.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/models/country.dart';

class SearchCountriesSreen extends StatefulWidget {
  static const routeName = '/search-countries';

  const SearchCountriesSreen({super.key, });


  @override
  State<SearchCountriesSreen> createState() => _SearchCountriesSreenState();
}

class _SearchCountriesSreenState extends State<SearchCountriesSreen> {
  TextEditingController searchTermController = TextEditingController();
  List<Country> searchResults = [];
  List<Country> listView = [];
 late Future<List<Country>> countries;
  late List<Country> countryList = [];

 void getAllCountries() {
    countries = countryService.getAllCountries(context);
    countries.then((value) {
      setState(() {
        countryList = value;
      });
    });
  }


  @override
  void initState() {
    getAllCountries();
    super.initState();
  }


  List<Country> searchItems(String searchTerm) {
    if (searchTerm.isEmpty) {
      return countryList;
    }

    return countryList.where((country) {
      return country.name.toLowerCase().contains(searchTerm.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    searchTermController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    listView =
        searchTermController.text.isEmpty ? countryList : searchResults;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.background,
      appBar:AppBar(
        scrolledUnderElevation: 0,
                  backgroundColor: AppColors.background,

        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            size: AppPadding.smallSpacer,
            color: AppColors.primary,
            weight: 0.05,
          ),
        ),
        title: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: size.width,
              child:    TextField(
                    style: const TextStyle(
                      color: AppColors.onBackground,
                      fontFamily: sourceSans,
                    ),
                    controller: searchTermController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Search by country name ",
                      hintStyle: const TextStyle(
                        color: AppColors.gray,
                        fontFamily: sourceSans,
                      ),
                      filled: true,
                      fillColor: AppColors.background,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: AppColors.defaultBorder,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.primary,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchResults = searchItems(value);
                      });
                    },
                  ),
         
            )),
      ), 

     
        body: SafeArea(
            child: Container(
          color: AppColors.background,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.miniSpacer),
            child: Column(
              children: [
               
             
                Expanded(
                  child:  ListView.builder(
                          itemCount: listView.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    AppColors.primary.withOpacity(0.2),
                                child: Text(listView[i].flag),
                              ),
                              title: Text(
                                listView[i].name,
                                style: const TextStyle(
                                  color: AppColors.onBackground,
                                ),
                              ),
                              subtitle: Text(
                                listView[i].phoneCode,
                                style: const TextStyle(
                                  color: AppColors.gray,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context,listView[i]);
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
