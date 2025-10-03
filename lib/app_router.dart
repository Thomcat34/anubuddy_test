import 'package:anybuddy_test/views/tournament_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TournamentPage(),
    ),
  ],
);