

import 'dart:convert';

class Article {
  final String title;

  final String body;



  




  Article({
    required this.title,
    required this.body,
    
    
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      
  
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source));
}
