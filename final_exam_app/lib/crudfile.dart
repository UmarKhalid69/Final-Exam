import 'package:cloud_firestore/cloud_firestore.dart';

late String username, useremail, userphone;

  getUserName(name) {
    username = name;
  }

  getUserEmail(email) {
    useremail = email;
  }

  getUserNumber(phone) {
    userphone = phone;
  }

  create() {
    print('Created');

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('FinalUsers').doc(username);

    // create map
    Map<String, dynamic> user = {
      'username': username,
      'useremail': useremail,
      'userphone': userphone,
    };

    documentReference.set(user).whenComplete(() {
      print('$username created');
    });
  }