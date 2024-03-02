// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AgreementsModel {
  final String title;
  final String assetPath;
  final String namedRoute;

  AgreementsModel({
    required this.title,
    required this.assetPath,
    required this.namedRoute,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'assetPath': assetPath,
      'namedRoute': namedRoute,
    };
  }

  factory AgreementsModel.fromMap(Map<String, dynamic> map) {
    return AgreementsModel(
      title: map['title'] as String,
      assetPath: map['assetPath'] as String,
      namedRoute: map['namedRoute'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgreementsModel.fromJson(String source) =>
      AgreementsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
