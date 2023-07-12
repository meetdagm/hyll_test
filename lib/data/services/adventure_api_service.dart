import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:hyll_test_project/data/model/adventure_list.dart';

class AdventureAPIService {
  Future<AdventureList> fetchAdventuresFromPrevAdventure(
      AdventureList prevAdventure) async {
    String apiUrl;
    if (prevAdventure.nextPageURL == "") {
      apiUrl = 'https://api.hyll.com/api/adventures/';
    } else {
      apiUrl = prevAdventure.nextPageURL;
    }
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      var adventureList = AdventureList.fromJson(decodedResponse);
      return adventureList;
    } else {
      throw Exception('Failed to load adventures @ endpoint : $apiUrl');
    }
  }
}
