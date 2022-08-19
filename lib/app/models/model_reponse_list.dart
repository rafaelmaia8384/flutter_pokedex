// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'model_item.dart';

class ModelResponseList {
  int? count;
  String? next;
  String? previous;
  List<ModelItem?>? results;

  ModelResponseList({this.count, this.next, this.previous, this.results});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': results?.map((x) => x?.toMap()).toList(),
    };
  }

  factory ModelResponseList.fromMap(Map<String, dynamic> map) {
    return ModelResponseList(
      count: map['count'] != null ? map['count'] as int : null,
      next: map['next'] != null ? map['next'] as String : null,
      previous: map['previous'] != null ? map['previous'] as String : null,
      results: map['results'] != null
          ? List<ModelItem?>.from(
              (map['results'] as List<ModelItem>).map<ModelItem?>(
                (x) => ModelItem?.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelResponseList.fromJson(String source) =>
      ModelResponseList.fromMap(json.decode(source) as Map<String, dynamic>);
}
