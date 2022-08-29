class CourseModel {
  String? responseStatus;
  OKContentCourse? oKContent;
  String? failContent;

  CourseModel({this.responseStatus, this.oKContent, this.failContent});

  CourseModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContent = json['OKContent'] != null
        ? new OKContentCourse.fromJson(json['OKContent'])
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

class OKContentCourse {
  List<Items>? items;

  OKContentCourse({this.items});

  OKContentCourse.fromJson(Map<String, dynamic> json) {
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
  String? lessons;
  String? classStatus;
  String? subTitle;
  String? status;
  String? price;
  String? poins;
  String? student;

  Items(
      {this.imageUrl,
      this.title,
      this.lessons,
      this.classStatus,
      this.subTitle,
      this.status,
      this.price,
      this.poins,
      this.student});

  Items.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    lessons = json['lessons'];
    classStatus = json['classStatus'];
    subTitle = json['subTitle'];
    status = json['status'];
    price = json['price'];
    poins = json['poins'];
    student = json['student'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['lessons'] = this.lessons;
    data['classStatus'] = this.classStatus;
    data['subTitle'] = this.subTitle;
    data['status'] = this.status;
    data['price'] = this.price;
    data['poins'] = this.poins;
    data['student'] = this.student;
    return data;
  }
}
