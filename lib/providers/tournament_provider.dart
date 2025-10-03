import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/tournament.dart';
import '../services/tournament_service.dart';

// Service
final tournamentServiceProvider = Provider((ref) => TournamentService());

// Tournament data
final tournamentProvider = FutureProvider<Tournament>((ref) async {
  final service = ref.watch(tournamentServiceProvider);
  return service.loadTournament();
});

// Selected filter ("Tous" par défaut)
final cityFilterProvider = StateProvider<String>((ref) => "Tous");

// Selected category (première par défaut)
final selectedCategoryProvider = StateProvider<int?>((ref) => 0);