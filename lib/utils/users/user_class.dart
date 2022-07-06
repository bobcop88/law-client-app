class UserModel {
  final String id;
  final String email;
  final String isVerified;
  final int dateCreation;

  UserModel({
    required this.id,
    required this.email,
    required this.isVerified,
    required this.dateCreation,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'isVerified': isVerified,
        'dateCreation': dateCreation,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        isVerified: json['isVerified'],
        dateCreation: json['dateCreation'],
      );
}

class UserCompleteProfile {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int dateOfBirth;
  final String nationality;
  final String documentNumber;

  UserCompleteProfile(
      {required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.nationality,
      required this.documentNumber,
      required this.phoneNumber});

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'nationality': nationality,
        'documentNumber': documentNumber,
        'phoneNumber': phoneNumber,
      };

  static UserCompleteProfile fromJson(Map<String, dynamic> json) =>
      UserCompleteProfile(
        firstName: json['firstName'],
        lastName: json['lastName'],
        dateOfBirth: json['dateOfBirth'],
        nationality: json['nationality'],
        documentNumber: json['documentNumber'],
        phoneNumber: json['phoneNumber'],
      );
}

class UserAllDetails {
  final String id;
  final String email;
  final String phoneNumber;
  final String isVerified;
  final int dateCreation;
  final String firstName;
  final String lastName;
  final int dateOfBirth;
  final String nationality;
  final String documentNumber;

  UserAllDetails({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.isVerified,
    required this.dateCreation,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.nationality,
    required this.documentNumber,
  });

  static UserAllDetails fromJson(Map<String, dynamic> json) => UserAllDetails(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      isVerified: json['isVerified'],
      dateCreation: json['dateCreation'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      nationality: json['nationality'],
      documentNumber: json['documentNumber']);
}
