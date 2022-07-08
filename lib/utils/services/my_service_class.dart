class UserMyServices {
  final String serviceName;
  final String currentState;
  final String doc1Status;
  final String doc2Status;
  final int creationDate;
  final String emailUser;
  final String userId;
  final String doc1Url;
  final String doc2Url;

  UserMyServices({
    required this.currentState,
    required this.serviceName,
    required this.doc1Status,
    required this.doc2Status,
    required this.creationDate,
    required this.emailUser,
    required this.userId,
    required this.doc1Url,
    required this.doc2Url,
  });

  Map<String, dynamic> toJson() => {
        'currentState': currentState,
        'serviceName': serviceName,
        'doc1Status': doc1Status,
        'doc2Status': doc2Status,
        'creationDate': creationDate,
        'emailUser': emailUser,
        'userId': userId,
        'doc1Url': doc1Url,
        'doc2Url': doc2Url,
      };

  static UserMyServices fromJson(Map<String, dynamic> json) => UserMyServices(
        currentState: json['currentState'],
        serviceName: json['serviceName'],
        doc1Status: json['doc1Status'],
        doc2Status: json['doc2Status'],
        creationDate: json['creationDate'],
        emailUser: json['emailUser'],
        userId: json['userId'],
        doc1Url: json['doc1Url'],
        doc2Url: json['doc2Url'],
      );
}
