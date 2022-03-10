import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? uid;
  final String? profImage;
  final String? postUrl;
  final String? postId;
  final String? username;
  final datePublished;
  final String? description;
  final likes;

  Post({
    required this.uid,
    required this.profImage,
    required this.postUrl,
    required this.postId,
    required this.username,
    required this.datePublished,
    required this.description,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'profImage': profImage,
        'postUrl': postUrl,
        'postId': postId,
        'username': username,
        'datePublished': datePublished,
        'description': description,
        'likes': likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      uid: snapshot['uid'],
      profImage: snapshot['profImage'],
      postUrl: snapshot['postUrl'],
      postId: snapshot['postId'],
      username: snapshot['username'],
      datePublished: snapshot['datePublished'],
      description: snapshot['description'],
      likes: snapshot['likes'],
    );
  }
}
