class GalleryModel {
  // Type of Data
  int? id;
  String? url;

// Constructure
  GalleryModel({this.id, this.url});

  // Asal Data
  GalleryModel.formJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

// Mapping Data yang telah diconvert
  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }
}
