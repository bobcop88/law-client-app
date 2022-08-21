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
  final String field1;
  final String field2;
  final String field3;
  final String field1Status;
  final String field2Status;
  final String field3Status;
  final String rejectedReason;
  final bool rejectedNeedDocument;

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
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field1Status,
    required this.field2Status,
    required this.field3Status,
    required this.rejectedReason,
    required this.rejectedNeedDocument,
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
        'field1': field1,
        'field2': field2,
        'field3': field3,
        'field1Status': field1Status,
        'field2Status': field2Status,
        'field3Status': field3Status,
        'rejectedNeedDocument': rejectedNeedDocument,
        'rejectedReason': rejectedReason,
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
      field1: json['field1'],
      field2: json['field2'],
      field3: json['field3'],
      field1Status: json['field1Status'],
      field2Status: json['field2Status'],
      field3Status: json['field3Status'],
      rejectedReason: json['rejectedReason'],
      rejectedNeedDocument: json['rejectedNeedDocument']);
}

class BusinessServiceClass {
  final String serviceName;
  final String currentState;
  final String field1;
  final String field2;
  final String field3;
  final String field1Status;
  final String field2Status;
  final String field3Status;
  final int creationDate;
  final String emailUser;
  final String userId;

  BusinessServiceClass(
      {required this.serviceName,
      required this.currentState,
      required this.field1,
      required this.field2,
      required this.field3,
      required this.field1Status,
      required this.field2Status,
      required this.field3Status,
      required this.creationDate,
      required this.emailUser,
      required this.userId});

  Map<String, dynamic> toJson() => {
        'currentState': currentState,
        'serviceName': serviceName,
        'field1': field1,
        'field2': field2,
        'field3': field3,
        'field1Status': field1Status,
        'field2Status': field2Status,
        'field3Status': field3Status,
        'creationDate': creationDate,
        'emailUser': emailUser,
        'userId': userId,
      };

  static BusinessServiceClass fromJson(Map<String, dynamic> json) =>
      BusinessServiceClass(
        currentState: json['currentState'],
        serviceName: json['serviceName'],
        field1: json['field1'],
        field2: json['field2'],
        field3: json['field3'],
        field1Status: json['field1Status'],
        field2Status: json['field2Status'],
        field3Status: json['field3Status'],
        creationDate: json['creationDate'],
        emailUser: json['emailUser'],
        userId: json['userId'],
      );
}
