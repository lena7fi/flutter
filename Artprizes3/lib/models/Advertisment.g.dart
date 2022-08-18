// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Advertisment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertisment _$AdvertismentFromJson(Map<String, dynamic> json) {
  return Advertisment()
    ..uuid = json['uuid'] as String
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..created = json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String)
    ..Code = json['Code'] as String
    ..Image = json['Image'] as String
    ..updated = json['updated'] == null
        ? null
        : DateTime.parse(json['updated'] as String)
    ..active = json['active'] as bool
    ..url = json['url'] as String
    ..showOnMobile = json['showOnMobile'] as bool
    ..mobileBGColor = json['mobileBGColor'] as String
    ..mobileTextColour = json['mobileTextColour'] as String
    ..artprize_id = json['artprize_id'] as int
    ..advert_artwork = json['advert_artwork'] as String
    ..fromDate = json['fromDate'] == null
        ? null
        : DateTime.parse(json['fromDate'] as String)
    ..toDate =
        json['toDate'] == null ? null : DateTime.parse(json['toDate'] as String)
    ..category = json['category'] as String
    ..prizeid = json['prizeid'] as int
    ..ExhibitionBannerImage = json['ExhibitionBannerImage'] as String
    ..PrizeBannerImage = json['PrizeBannerImage'] as String
    ..ExhibitionBannerDateFrom = json['ExhibitionBannerDateFrom'] == null
        ? null
        : DateTime.parse(json['ExhibitionBannerDateFrom'] as String)
    ..ExhibitionBannerDateTo = json['ExhibitionBannerDateTo'] == null
        ? null
        : DateTime.parse(json['ExhibitionBannerDateTo'] as String);
}

Map<String, dynamic> _$AdvertismentToJson(Advertisment instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'name': instance.name,
      'created': instance.created?.toIso8601String(),
      'Code': instance.Code,
      'Image': instance.Image,
      'updated': instance.updated?.toIso8601String(),
      'active': instance.active,
      'url': instance.url,
      'showOnMobile': instance.showOnMobile,
      'mobileBGColor': instance.mobileBGColor,
      'mobileTextColour': instance.mobileTextColour,
      'artprize_id': instance.artprize_id,
      'advert_artwork': instance.advert_artwork,
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'category': instance.category,
      'prizeid': instance.prizeid,
      'ExhibitionBannerImage': instance.ExhibitionBannerImage,
      'PrizeBannerImage': instance.PrizeBannerImage,
      'ExhibitionBannerDateFrom':
          instance.ExhibitionBannerDateFrom?.toIso8601String(),
      'ExhibitionBannerDateTo':
          instance.ExhibitionBannerDateTo?.toIso8601String(),
    };
