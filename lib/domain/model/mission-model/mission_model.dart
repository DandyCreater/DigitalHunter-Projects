class MissionModel {
  String? responseStatus;
  OKContentMission? oKContent;

  MissionModel({this.responseStatus, this.oKContent});

  MissionModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContent = json['OKContent'] != null
        ? new OKContentMission.fromJson(json['OKContent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContent != null) {
      data['OKContent'] = this.oKContent!.toJson();
    }
    return data;
  }
}

class OKContentMission {
  List<Items>? items;

  OKContentMission({this.items});

  OKContentMission.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? star;
  String? coins;
  String? count;
  String? progress;

  Items({this.title, this.star, this.coins, this.count, this.progress});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    star = json['star'];
    coins = json['coins'];
    count = json['count'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['star'] = this.star;
    data['coins'] = this.coins;
    data['count'] = this.count;
    data['progress'] = this.progress;
    return data;
  }
}
