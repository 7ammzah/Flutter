import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_layer/models/field.dart';

class CategoriesController {
  Future<Field> getCategories() async {
    final response = await http.get(
        Uri.parse('https://56d4-178-171-207-67.eu.ngrok.io/api/getAllFields'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Field.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load categories.');
    }
  }
}
