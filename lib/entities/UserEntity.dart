class UserEntity {
  int id;
  String firstName;
  String lastName;
  String username;

  UserEntity({this.id, this.firstName, this.lastName, this.username});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username
    };
  }
}
