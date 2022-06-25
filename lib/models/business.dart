class Business {
  int? id;
  String? logo;
  String? logoUrl;
  String? businessName;
  String? businessCategoryName;
  String? businessCategoryId;
  String? businessCore;

  Business(
      {this.id,
        this.logo,
        this.logoUrl,
        this.businessName,
        this.businessCategoryName,
        this.businessCategoryId,
        this.businessCore});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    logoUrl = json['logoUrl'];
    businessName = json['businessName'];
    businessCategoryName = json['businessCategoryName'];
    businessCategoryId = json['businessCategoryId'];
    businessCore = json['businessCore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo'] = logo;
    data['logoUrl'] = logoUrl;
    data['businessName'] = businessName;
    data['businessCategoryName'] = businessCategoryName;
    data['businessCategoryId'] = businessCategoryId;
    data['businessCore'] = businessCore;
    return data;
  }
}

