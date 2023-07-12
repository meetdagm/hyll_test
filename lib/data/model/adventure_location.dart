import 'package:hyll_test_project/shared/backend_constants.dart';

class AdventureLocation {
  String name;
  String subTitle;
  String distance;
  String imageUrl;

  AdventureLocation({
    required this.name,
    required this.subTitle,
    required this.distance,
    required this.imageUrl,
  });

  factory AdventureLocation.fromJson(dynamic locationJson) {
    return AdventureLocation(
      name: locationJson[kname] ?? "NULL",
      subTitle: locationJson[ksubTitle] ?? "NULL",
      distance: locationJson[kdistance] ?? "NULL",
      imageUrl: locationJson[kimageUrl] ?? "NULL",
    );
  }
}
