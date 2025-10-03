import 'package:json_annotation/json_annotation.dart';

part 'tournament.g.dart';

@JsonSerializable()
class Tournament {
  final String id;
  final String name;
  final String dateStart;
  final String dateEnd;
  final int teamsCount;
  final int teamsCap;
  final List<String> cityFilters;
  final List<CityCategory> cities;

  Tournament({
    required this.id,
    required this.name,
    required this.dateStart,
    required this.dateEnd,
    required this.teamsCount,
    required this.teamsCap,
    required this.cityFilters,
    required this.cities,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => _$TournamentFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}

@JsonSerializable()
class CityCategory {
  final String city;
  final String levelText;
  final String badge;
  final int slotsLeft;
  final bool recommended;
  final bool levelGap;
  final int price;

  CityCategory({
    required this.city,
    required this.levelText,
    required this.badge,
    required this.slotsLeft,
    required this.recommended,
    required this.levelGap,
    required this.price,
  });

  factory CityCategory.fromJson(Map<String, dynamic> json) => _$CityCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CityCategoryToJson(this);
}