import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
  required VoidCallback onFailed,
}) {
  switch (response.statusCode) {
    case 200 || 201:
      onSuccess();
      break;
    case 400:
      onFailed();
      showSnackBar(context, jsonDecode(response.body));
      break;
    case 403:
      onFailed();
      showSnackBar(context, jsonDecode(response.body));
      break;
    case 500:
      onFailed();
      showSnackBar(context, jsonDecode(response.body));

      break;
    default:
      onFailed();
      showSnackBar(context, jsonDecode(response.body));
      break;
  }
}
