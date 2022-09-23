class Data {
  int? id;
  String? title;
  String? thumbnail;
  String? decscription;
  String? thumbnailone;
  String? decscriptionone;
  String? thumbnailtwo;
  String? descriptiontwo;
  String? thumbnailthree;
  String? descriptionthree;
  String? created_at;
  String? updated_at;

  Data({
    this.id,
    this.title,
    this.thumbnail,
    this.decscription,
    this.thumbnailone,
    this.decscriptionone,
    this.thumbnailtwo,
    this.descriptiontwo,
    this.thumbnailthree,
    this.descriptionthree,
    this.created_at,
    this.updated_at,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      decscription: json['decscription'],
      thumbnailone: json['thumbnailone'],
      decscriptionone: json['decscriptionone'],
      thumbnailtwo: json['thumbnailtwo'],
      descriptiontwo: json['descriptiontwo'],
      thumbnailthree: json['thumbnailthree'],
      descriptionthree: json['descriptionthree'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
