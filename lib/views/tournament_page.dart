import 'package:anybuddy_test/widgets/tournament_description_ui.dart';
import 'package:anybuddy_test/widgets/category_selection_ui.dart';
import 'package:anybuddy_test/widgets/header_ui.dart';
import 'package:anybuddy_test/widgets/tag.dart';
import 'package:anybuddy_test/widgets/teams_indicator_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TournamentPage extends ConsumerWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            
            const Header(),

            // Container blanc
            Container(
              margin: const EdgeInsets.only(top: 260), // chevauche le header
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Padel Royale 2026",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Du 26 février au 26 mai 2026",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Section équipes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Équipes",
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              "Voir tous",
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF00C853),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        const TeamsIndicator(),

                        const SizedBox(height: 30),

                        // Boutons
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFF2CDF62),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 15),
                              ),
                              child: Text(
                                "Inscrire mon équipe",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFF94A3B8),
                                foregroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 15),
                              ),
                              child: Text(
                                "Partager",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                          height: 60,
                        ),

                        // Description section
                        Row(
                          children: [
                            Text("Description",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Infos icônes
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/balle.svg",
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text("Padel, inscription par équipe",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF94A3B8),
                                )),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/marker.svg",
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text("Toute la France (10 villes)",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF94A3B8),
                                )),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/chart.svg",
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            const Wrap(
                              spacing: 8,
                              children: [
                                Tag(
                                  label: "P25",
                                ),
                                Tag(
                                  label: "P100",
                                ),
                                Tag(
                                  label: "P250",
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: Text("Niveau 4 à niveau 6",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF94A3B8),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        const TournamentDescription(),

                        Divider(color: Colors.grey[300], thickness: 1),

                        // Prix
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text("Prix",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "🔥 Une chance de jouer à Roland Garros en phase finale nationale pour les meilleurs de chaque ville.",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                "👑 1 000€ pour les winners de Padel Royale.",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                "🎁 Des T-shirts et autres surprises aux meilleurs.",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Divider(color: Colors.grey[300], thickness: 1),

                        // Inscriptions
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text("Inscriptions",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                                "40€ par équipe (20€ par joueur)\n"
                                "Fin des inscriptions le 1er février 2026.",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const CategorySelection(),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 246),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF00C853)),
                ),
                child: Text(
                  "INSCRIPTION EN COURS",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF00C853),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF2CDF62),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Inscrire mon équipe ",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "40€",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
