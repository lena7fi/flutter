// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtPrize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtPrize _$ArtPrizeFromJson(Map<String, dynamic> json) {
  return ArtPrize()
    ..uuid = json['uuid'] as String
    ..created = json['created'] as String
    ..id = json['id'] as int
    ..live = json['live'] as bool
    ..title = json['title'] as String
    ..country = json['country'] as String
    ..state = json['state'] as String
    ..city = json['city'] as String
    ..close_date = json['close_date'] as String
    ..ExhibitionStartDate = json['ExhibitionStartDate'] == null
        ? null
        : DateTime.parse(json['ExhibitionStartDate'] as String)
    ..ExhibitionEndDate = json['ExhibitionEndDate'] == null
        ? null
        : DateTime.parse(json['ExhibitionEndDate'] as String)
    ..ApplicationsStartDate = json['ApplicationsStartDate'] == null
        ? null
        : DateTime.parse(json['ApplicationsStartDate'] as String)
    ..prize_type = json['prize_type'] as String
    ..prize_logo = json['prize_logo'] as String
    ..sponsored_start_date = json['sponsored_start_date'] == null
        ? null
        : DateTime.parse(json['sponsored_start_date'] as String)
    ..sponsored_end_date = json['sponsored_end_date'] == null
        ? null
        : DateTime.parse(json['sponsored_end_date'] as String)
    ..sponsored = json['sponsored'] as bool
    ..hidden = json['hidden'] as bool
    ..watched = json['watched'] as bool
    ..IntendedToEnter = json['IntendedToEnter'] as bool
    ..Currency = json['Currency'] as String
    ..PrizeAmount = json['PrizeAmount'] as int
    ..Location = json['Location'] as String
    ..State = json['State'] as String
    ..Country = json['Country'] as String
    ..ViewCount = json['ViewCount'] as int
    ..FollowCount = json['FollowCount'] as int
    ..IntentToEnterCount = json['IntentToEnterCount'] as int
    ..eligibility = json['eligibility'] as String;
}

Map<String, dynamic> _$ArtPrizeToJson(ArtPrize instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'created': instance.created,
      'id': instance.id,
      'live': instance.live,
      'title': instance.title,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'close_date': instance.close_date,
      'ExhibitionStartDate': instance.ExhibitionStartDate?.toIso8601String(),
      'ExhibitionEndDate': instance.ExhibitionEndDate?.toIso8601String(),
      'ApplicationsStartDate':
          instance.ApplicationsStartDate?.toIso8601String(),
      'prize_type': instance.prize_type,
      'prize_logo': instance.prize_logo,
      'sponsored_start_date': instance.sponsored_start_date?.toIso8601String(),
      'sponsored_end_date': instance.sponsored_end_date?.toIso8601String(),
      'sponsored': instance.sponsored,
      'hidden': instance.hidden,
      'watched': instance.watched,
      'IntendedToEnter': instance.IntendedToEnter,
      'Currency': instance.Currency,
      'PrizeAmount': instance.PrizeAmount,
      'Location': instance.Location,
      'State': instance.State,
      'Country': instance.Country,
      'ViewCount': instance.ViewCount,
      'FollowCount': instance.FollowCount,
      'IntentToEnterCount': instance.IntentToEnterCount,
      'eligibility': instance.eligibility,
    };
