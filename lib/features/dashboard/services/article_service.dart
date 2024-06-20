import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freemo_test/constants/error_handling.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:freemo_test/models/article.dart';
import 'package:http/http.dart' as http;



class ArticleService {


  Future<List<Article>> getAllArticles(BuildContext context) async {
    List<Article> articleList = [];


    try {
     
      http.Response res = await http.get(
        Uri.parse('$uri/posts'),
       
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            

            // Map on books and add in Hive

            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              // Add in articleList
              articleList.add(
                Article.fromMap(
                  jsonDecode(res.body)[i],
                ),
              );

              
            }
          },
          onFailed: () {});


         
    } catch (e) {
      showSnackBar(context, "Something went wrong");
    }
    return articleList;
  }

   
}
