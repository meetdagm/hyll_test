import 'dart:convert';

import 'package:hyll_test_project/data/model/adventure_location.dart';
import 'package:hyll_test_project/shared/backend_constants.dart';

import 'content.dart';

class Adventure {
  int id;
  String status;
  String title;
  AdventureLocation areaLocation;
  AdventureLocation startingLocation;
  List tags;
  List<Content> contentCollection;
  String primaryDescription;
  String description;
  int bucketListCount;

  Adventure({
    required this.id,
    required this.status,
    required this.title,
    required this.areaLocation,
    required this.startingLocation,
    required this.tags,
    required this.contentCollection,
    required this.description,
    required this.primaryDescription,
    required this.bucketListCount,
  });

  factory Adventure.fromJson(dynamic adventureJson) {
    return Adventure(
      id: adventureJson[kid] ?? "NULL",
      status: adventureJson[kstatus] ?? "NULL",
      title: adventureJson[ktitle] ?? "NULL",
      areaLocation: AdventureLocation.fromJson(adventureJson[kareaLocation]),
      startingLocation:
          AdventureLocation.fromJson(adventureJson[kstartingLocation]),
      tags: adventureJson[ktags] ?? ["NO TAGS"],
      primaryDescription: adventureJson[kprimaryDescription],
      description: adventureJson[kdescription],
      bucketListCount: adventureJson[kbucketListCount] ?? 0,
      contentCollection: List.from(
        (adventureJson[kcontents] as List)
            .map(
              (contentJson) => Content.fromJson(
                contentJson,
              ),
            )
            .where((content) => content.contentType == ContentType.IMAGE),
      ),
    );
  }
}
