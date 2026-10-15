// To parse this JSON data, do
//
//     final destinationSummary = destinationSummaryFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'destination_summary.g.dart';

@JsonSerializable()
class DestinationSummary {
  @JsonKey(name: "pages")
  List<Page>? pages;

  DestinationSummary({this.pages});

  factory DestinationSummary.fromJson(Map<String, dynamic> json) =>
      _$DestinationSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationSummaryToJson(this);
}

@JsonSerializable()
class Page {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "key")
  String? key;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "excerpt")
  String? excerpt;
  @JsonKey(name: "matched_title")
  dynamic matchedTitle;
  @JsonKey(name: "anchor")
  dynamic anchor;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "thumbnail")
  Thumbnail? thumbnail;

  Page({
    this.id,
    this.key,
    this.title,
    this.excerpt,
    this.matchedTitle,
    this.anchor,
    this.description,
    this.thumbnail,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}

@JsonSerializable()
class Thumbnail {
  @JsonKey(name: "mimetype")
  String? mimetype;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "height")
  int? height;
  @JsonKey(name: "duration")
  dynamic duration;
  @JsonKey(name: "url")
  String? url;

  Thumbnail({this.mimetype, this.width, this.height, this.duration, this.url});

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}
