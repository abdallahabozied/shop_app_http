class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(
      {required this.userId,
      required this.id,
      required this.body,
      required this.title});

  factory Post.fromJson(Map<String, dynamic> _map) {
    Post _post = Post(
        userId: _map["userId"]?? 0,
        id: _map["id"] ?? 0,
        title: _map["title"] ?? "",
        body: _map["body"]?? "");
    return _post;
  }
}
