class PlaceModel {
  int? placeId;
  String? name;
  String? location;
  String? description;
  String? coverPic;
  List<String>? pics;

  PlaceModel(
      {this.placeId,
      this.name,
      this.location,
      this.description,
      this.coverPic,
      this.pics});
}
