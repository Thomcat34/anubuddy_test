// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      id: json['id'] as String,
      name: json['name'] as String,
      dateStart: json['dateStart'] as String,
      dateEnd: json['dateEnd'] as String,
      teamsCount: (json['teamsCount'] as num).toInt(),
      teamsCap: (json['teamsCap'] as num).toInt(),
      cityFilters: (json['cityFilters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cities: (json['cities'] as List<dynamic>)
          .map((e) => CityCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateStart': instance.dateStart,
      'dateEnd': instance.dateEnd,
      'teamsCount': instance.teamsCount,
      'teamsCap': instance.teamsCap,
      'cityFilters': instance.cityFilters,
      'cities': instance.cities,
    };

CityCategory _$CityCategoryFromJson(Map<String, dynamic> json) => CityCategory(
      city: json['city'] as String,
      levelText: json['levelText'] as String,
      badge: json['badge'] as String,
      slotsLeft: (json['slotsLeft'] as num).toInt(),
      recommended: json['recommended'] as bool,
      levelGap: json['levelGap'] as bool,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$CityCategoryToJson(CityCategory instance) =>
    <String, dynamic>{
      'city': instance.city,
      'levelText': instance.levelText,
      'badge': instance.badge,
      'slotsLeft': instance.slotsLeft,
      'recommended': instance.recommended,
      'levelGap': instance.levelGap,
      'price': instance.price,
    };
