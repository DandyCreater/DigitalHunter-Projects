class CarouselModel {
  String? responseStatus;
  OKContentCarousel? oKContent;
  String? failContent;

  CarouselModel({this.responseStatus, this.oKContent, this.failContent});

  CarouselModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContent = json['OKContent'] != null
        ? new OKContentCarousel.fromJson(json['OKContent'])
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

class OKContentCarousel {
  List<Items>? items;

  OKContentCarousel({this.items});

  OKContentCarousel.fromJson(Map<String, dynamic> json) {
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
  String? imageUrl;

  Items({this.title, this.imageUrl});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
