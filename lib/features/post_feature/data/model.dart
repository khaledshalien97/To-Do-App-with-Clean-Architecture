class PostDataModel {
  final int id;
  final String title;
  final String body;

  PostDataModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  map(Function(dynamic PostDataEntity) param0) {}
}
