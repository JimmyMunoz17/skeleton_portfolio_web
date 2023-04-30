import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';
import '../model/data_contact.dart';

//https://pub.dev/packages/gsheets/example
class ApiGoogleSheets {
  //credenciales de google Sheets google cloud platform
  static const _credentials = r''' 
  {
  "type": "service_account",
  "project_id": "",
  "private_key_id": "",
  "private_key": "",
  "client_email": "",
  "client_id": "",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": ""
}
  ''';
  //URL Id hoja de calculo google sheets
  static const _spreadSheetId = 'url';
  //Conexión con la credencial de google Sheets
  static final _connectionGSheets = GSheets(_credentials);
  // Nombre de la hoja de cálculo
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      //conexión con la hoja de cálculo de google sheets
      final spreadsheet = await _connectionGSheets.spreadsheet(_spreadSheetId);
      //Obtine el nombre de la hoja de cálculo
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Contact');
      //Información de la primera fila en google Sheets
      final firstRow = DataContactFields.getDataFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  //Obtener la hoja de calculo por el Nombre
  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      //retorna resultado hoja de cálculo por su nombre
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  //Guardar la información Google Sheets
  static Future insertData(List<Map<String, dynamic>> dataRowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(dataRowList);
  }
}
