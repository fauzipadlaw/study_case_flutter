class Category {
  String? code;
  String? name;

  Category({
    this.code,
    this.name,
  });

  Category.fromJson(Map<String, dynamic> json) {
    code = json['paramCode'];
    name = json['paramName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paramCode'] = code;
    data['paramName'] = name;

    return data;
  }
}
