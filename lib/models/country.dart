

import 'dart:convert';

class Country {
  final String name;

  final String abbreviation;

  final String flag;
  final String phoneCode;

  final int maxPhoneLength;

  




  Country({
    required this.name,
    required this.abbreviation,
    required this.flag,
    required this.phoneCode,
    required this.maxPhoneLength,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'abbreviation': abbreviation,
      'flag': flag,
      'phone_code': phoneCode,
      'max_phone_length': maxPhoneLength,
  
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'] ?? '',
      abbreviation: map['abbreviation'] ?? '',
      flag: map['flag'] ?? '',
      phoneCode: map['phone_code'] ?? '',
      maxPhoneLength: map['max_phone_length'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source));
}
