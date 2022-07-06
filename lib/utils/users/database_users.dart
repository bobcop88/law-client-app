import 'package:new_client_app/utils/users/user_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseUsers {
  final String uid;

  DatabaseUsers({required this.uid});

  // Profile user Creation and Read

  final CollectionReference userProfile =
      FirebaseFirestore.instance.collection('clients');

  Future completeUserProfile(String firstName, String lastName, int dateOfBirth,
      String nationality, String documentNumber, String phoneNumber) async {
    final docUser = userProfile.doc(uid);

    final userCompleteProfile = UserCompleteProfile(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      nationality: nationality,
      documentNumber: documentNumber,
      phoneNumber: phoneNumber,
    );

    final json = userCompleteProfile.toJson();
    await docUser.update(json);
  }
}
