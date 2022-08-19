// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelItem {
  String? name;
  String? url;
  ModelItem({
    this.name,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory ModelItem.fromMap(Map<String, dynamic> map) {
    return ModelItem(
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelItem.fromJson(String source) =>
      ModelItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
