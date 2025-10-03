import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tag extends StatelessWidget {
  final String label;
  final Color color;

  const Tag({super.key, required this.label, this.color = const Color(0xFF94A3B8)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}