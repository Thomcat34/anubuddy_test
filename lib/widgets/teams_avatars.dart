import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OverlappingAvatars extends StatelessWidget {
  final List<String>? avatars;
  final int extraCount;

  const OverlappingAvatars({
    super.key,
    this.avatars,
    this.extraCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final list = avatars ?? [];

    // Si aucun avatar fourni → on met un dummy par défaut
    final displayAvatars = list.isEmpty
        ? ["assets/dummy_avatar.png"]
        : list;

    // largeur : (n - 1) * offset + diamètre
    final totalWidth = (displayAvatars.length + (extraCount > 0 ? 1 : 0)) * 28 + 24;

    return SizedBox(
      height: 48,
      width: totalWidth.toDouble(),
      child: Stack(
        children: [
          for (int i = 0; i < displayAvatars.length; i++)
            Positioned(
              left: i * 25, // espace horizontal
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage(displayAvatars[i]),
                ),
              ),
            ),
          if (extraCount > 0)
            Positioned(
              left: displayAvatars.length * 25,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: Colors.grey.shade300,
                  child: Text(
                    "+$extraCount",
                    style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                fontSize: 13,
              ),),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}