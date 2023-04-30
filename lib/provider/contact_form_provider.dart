import 'package:flutter/material.dart';

import '../api/api_google_sheets.dart';
import '../model/data_contact.dart';

//Provider form contact
class ContactFormProvider extends ChangeNotifier {
  //llave del manejo de estados
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isRegister = false;
  String name = "";
  String email = "";
  String subject = "";
  String message = "";

  validator() async {
    if (name.isEmpty || email.isEmpty || subject.isEmpty || message.isEmpty) {
      isRegister = false;
      return isRegister;
    } else {
      final dataInsert = {
        DataContactFields.name: name,
        DataContactFields.email: email,
        DataContactFields.subject: subject,
        DataContactFields.message: message,
      };
      await ApiGoogleSheets.insertData([dataInsert]);
      isRegister = true;
      name = "";
      email = "";
      subject = "";
      message = "";
      return isRegister;
    }
  }
}
