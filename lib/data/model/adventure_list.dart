import 'package:hyll_test_project/data/model/adventure.dart';
import 'package:hyll_test_project/shared/backend_constants.dart';

class AdventureList {
  String nextPageURL;
  List<Adventure> _adventureCollection;
  AdventureList({
    required this.nextPageURL,
    List<Adventure> adventureCollection = const [],
  }) : _adventureCollection = adventureCollection;

  int get adventuresCount => _adventureCollection.length;

  Adventure getAdventureAtIndex(int index) {
    return _adventureCollection[index];
  }

  List<Adventure> get getAdventureList => _adventureCollection;

  factory AdventureList.Empty() {
    return AdventureList(
      nextPageURL: "",
      adventureCollection: [],
    );
  }

  factory AdventureList.fromJson(dynamic json) {
    return AdventureList(
      nextPageURL: json[knext] ?? "NULL",
      adventureCollection: List.from(
        (json[kdata] as List<dynamic>).map(
          (adventureJson) => Adventure.fromJson(adventureJson),
        ),
      ),
    );
  }
}
