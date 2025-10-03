import 'package:anybuddy_test/widgets/teams_avatars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamsIndicator extends StatelessWidget {
  const TeamsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OverlappingAvatars(
              avatars: [
                "assets/images/avatar1.jpg",
                "assets/images/avatar2.jpg",
                "assets/images/avatar3.jpg",
                "assets/images/avatar4.jpg",
                "assets/images/avatar5.jpg",
                "assets/images/avatar6.jpg",
                "assets/images/avatar7.jpg",
              ],
              extraCount: 226,
            ),
            Row(
              children: [
                Text(
                  "240",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  "/10000",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 12),

        // Progression
        LinearProgressIndicator(
          value: 240 / 10000,
          minHeight: 6,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          backgroundColor: Colors.grey.shade300,
          color: const Color(0xFF00C853),
        ),
      ],
    );
  }
}
