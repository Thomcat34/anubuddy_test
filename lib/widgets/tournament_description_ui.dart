import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TournamentDescription extends StatefulWidget {
  const TournamentDescription({super.key});

  @override
  State<TournamentDescription> createState() => _TournamentDescriptionState();
}

class _TournamentDescriptionState extends State<TournamentDescription> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    const fullText =
        "Padel Royale, c’est le plus grand tournoi amateur de padel en France. "
        "10 000 paires s’affrontent dans toute la France (Paris, Lille, Bordeaux, Lyon, Marseille, Toulouse, "
        "Nantes, Strasbourg, Rennes, Montpellier) des phases locales jusqu’à une grande finale nationale à Paris. "
        "Une seule équipe soulèvera la couronne 👑\n\n"
        "👉 Étape 1 – Les phases locales\n"
        "Chaque ville devient une arène. Les équipes s’affrontent dans leur club pour décrocher leur billet vers l’étape suivante.";

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Texte repliable ---
          AnimatedCrossFade(
            firstChild: Text(
              fullText,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            secondChild: Text(
              fullText,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            crossFadeState:
                _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),

          const SizedBox(height: 8),

          // --- Bouton afficher plus/moins ---
          Center(
            child: TextButton(
              onPressed: () {
                setState(() => _expanded = !_expanded);
              },
              child: Text(
                _expanded ? "Afficher moins" : "Afficher plus",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
