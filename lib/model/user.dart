class User {
  final String email;
  final String uid;
  final String fullName;
  final String followers;
  final String following;
  final String username;

  const User({
    required this.email,
    required this.uid,
    required this.fullName,
    required this.followers,
    required this.following,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "fullname": fullName,
        "followers": followers,
        "following": following,
      };
}
