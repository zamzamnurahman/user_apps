class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post({this.id, this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  toJson(Post newPost) {
    return {
      'id': newPost.id,
      "userId": newPost.userId,
      "title": newPost.title,
      "body": newPost.body,
    };
  }
}
