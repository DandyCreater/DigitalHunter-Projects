class MenuModel {
  String? responseStatus;
  OKContentMenu? oKContent;
  String? failContent;

  MenuModel({this.responseStatus, this.oKContent, this.failContent});

  MenuModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContent = json['OKContent'] != null
        ? new OKContentMenu.fromJson(json['OKContent'])
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

class OKContentMenu {
  List<Items>? items;

  OKContentMenu({this.items});

  OKContentMenu.fromJson(Map<String, dynamic> json) {
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

  Items({this.imageUrl, this.title});

  Items.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    return data;
  }
}
