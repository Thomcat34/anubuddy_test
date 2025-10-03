import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/tournament.dart';

class TournamentService {
  Tournament? _tournament;

  Future<Tournament> loadTournament() async {
    if (_tournament != null) return _tournament!;
    final jsonString = await rootBundle.loadString('assets/tournaments.json');
    final jsonData = json.decode(jsonString);
    _tournament = Tournament.fromJson(jsonData);
    return _tournament!;
  }
}