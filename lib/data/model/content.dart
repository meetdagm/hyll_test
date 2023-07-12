// ignore_for_file: constant_identifier_names

import 'package:hyll_test_project/shared/backend_constants.dart';

class Content {
  String id;
  ContentType contentType;
  ContentMode contentMode;
  String contentUrl;
  bool isHeaderForThePlan;
  bool isPrivate;

  Content({
    required this.id,
    required this.contentType,
    required this.contentMode,
    required this.contentUrl,
    required this.isHeaderForThePlan,
    required this.isPrivate,
  });

  factory Content.fromJson(dynamic json) {
    return Content(
      id: json[kid] ?? "NULL",
      contentType: ContentType.fromJson(json[kcontentType]),
      contentMode: ContentMode.fromJson(json[kcontentMode]),
      contentUrl: json[kcontentUrl] ?? "NULL",
      isHeaderForThePlan: json[kisHeaderForThePlan] ?? "NULL",
      isPrivate: json[kisPrivate] ?? "NULL",
    );
  }
}

enum ContentType {
  IMAGE,
  VIDEO,
  UNKNOWN;

  static ContentType fromJson(String value) {
    try {
      return values.byName(value);
    } catch (e) {
      return ContentType.UNKNOWN;
    }
  }
}

enum ContentMode {
  ADVENTURE_PRIMARY_IMAGE,
  ADVENTURE_GALLERY,
  ADVENTURE_PRIMARY_VIDEO,
  ADVENTURE_STATIC_MAP,
  UNKNOWN;

  static ContentMode fromJson(String value) {
    try {
      return values.byName(value);
    } catch (e) {
      return ContentMode.UNKNOWN;
    }
  }
}
