import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'place.g.dart';

@JsonSerializable()
class Place extends INetworkModel<Place>{
  @JsonKey(name: "html_attributions")
  final List<dynamic>? htmlAttributions;
  @JsonKey(name: "results")
  final List<Result>? results;
  @JsonKey(name: "status")
  final String? status;

  const Place({
    this.htmlAttributions,
    this.results,
    this.status,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  @override
  Place fromJson(Map<String, dynamic> json) {
    return Place.fromJson(json);
  }
}

@JsonSerializable()
class Result extends INetworkModel<Result> {
  @JsonKey(name: "business_status")
  final String? businessStatus;
  @JsonKey(name: "geometry")
  final Geometry? geometry;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "icon_background_color")
  final String? iconBackgroundColor;
  @JsonKey(name: "icon_mask_base_uri")
  final String? iconMaskBaseUri;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "photos")
  final List<Photo>? photos;
  @JsonKey(name: "place_id")
  final String? placeId;
  @JsonKey(name: "plus_code")
  final PlusCode? plusCode;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "reference")
  final String? reference;
  @JsonKey(name: "scope")
  final String? scope;
  @JsonKey(name: "types")
  final List<String>? types;
  @JsonKey(name: "user_ratings_total")
  final int? userRatingsTotal;
  @JsonKey(name: "vicinity")
  final String? vicinity;
  @JsonKey(name: "opening_hours")
  final OpeningHours? openingHours;

  const Result({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
    this.openingHours,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  Result fromJson(Map<String, dynamic> json) {
    return Result.fromJson(json);
  }
}

@JsonSerializable()
class Geometry extends INetworkModel<Geometry> {
  @JsonKey(name: "location")
  final Location? location;
  @JsonKey(name: "viewport")
  final Viewport? viewport;

  const Geometry({
    this.location,
    this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  @override
  Geometry fromJson(Map<String, dynamic> json) {
    return Geometry.fromJson(json);
  }
}

@JsonSerializable()
class Location extends INetworkModel<Location> {
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lng")
  final double? lng;

  const Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  Location fromJson(Map<String, dynamic> json) {
    return Location.fromJson(json);
  }
}

@JsonSerializable()
class Viewport  extends INetworkModel<Viewport> {
  @JsonKey(name: "northeast")
  final Location? northeast;
  @JsonKey(name: "southwest")
  final Location? southwest;

  const Viewport({
    this.northeast,
    this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) => _$ViewportFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ViewportToJson(this);

  @override
  Viewport fromJson(Map<String, dynamic> json) {
    return Viewport.fromJson(json);
  }
}

@JsonSerializable()
class OpeningHours  extends INetworkModel<OpeningHours> {
  @JsonKey(name: "open_now")
  final bool? openNow;

  const OpeningHours({
    this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) => _$OpeningHoursFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);

  @override
  OpeningHours fromJson(Map<String, dynamic> json) {
    return OpeningHours.fromJson(json);
  }
}

@JsonSerializable()
class Photo  extends INetworkModel<Photo> {
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "html_attributions")
  final List<String>? htmlAttributions;
  @JsonKey(name: "photo_reference")
  final String? photoReference;
  @JsonKey(name: "width")
  final int? width;

  const Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  Photo fromJson(Map<String, dynamic> json) {
    return Photo.fromJson(json);
  }
}

@JsonSerializable()
class PlusCode extends INetworkModel<PlusCode> {
    @override
  fromJson(Map<String, dynamic> json) {
    return PlusCode.fromJson(json);
  }

@JsonKey(name: "compound_code")
  final String? compoundCode;
  @JsonKey(name: "global_code")
  final String? globalCode;

  const PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  factory PlusCode.fromJson(Map<String, dynamic> json) => _$PlusCodeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);
}
