class CompetitionModel {
  String? responseStatus;
  OKContentCompetition? oKContent;
  String? failContent;

  CompetitionModel({this.responseStatus, this.oKContent, this.failContent});

  CompetitionModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContent = json['OKContent'] != null
        ? new OKContentCompetition.fromJson(json['OKContent'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContent != null) {
      data['OKContent'] = this.oKContent!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OKContentCompetition {
  List<Items>? items;

  OKContentCompetition({this.items});

  OKContentCompetition.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? imageUrl;
  String? title;
  String? dayTime;
  String? nation;
  String? status;

  Items({this.imageUrl, this.title, this.dayTime, this.nation, this.status});

  Items.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    dayTime = json['dayTime'];
    nation = json['nation'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['dayTime'] = this.dayTime;
    data['nation'] = this.nation;
    data['status'] = this.status;
    return data;
  }
}
