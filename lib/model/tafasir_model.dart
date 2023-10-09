class TafasirModel {
  List<Tafasir>? tafasir;

  TafasirModel({this.tafasir});

  TafasirModel.fromJson(Map<String, dynamic> json) {
    if (json['tafsir'] != null) {
      tafasir = <Tafasir>[];
      json['tafsir'].forEach((v) {
        tafasir!.add(Tafasir.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tafasir != null) {
      data['tafsir'] = tafasir!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tafasir {
  int? id;
  String? name;
  String? url;

  Tafasir({this.id, this.name, this.url});

  Tafasir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
