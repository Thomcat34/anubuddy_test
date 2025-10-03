import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.black, Color(0xFF00C853)],
        ),
      ),
      padding: const EdgeInsets.only(
        top: 60,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/cross.svg",
                height: 20,
              ),
              SvgPicture.asset(
                "assets/icons/logo.svg",
                height: 150,
              ),
              InkWell(
                onTap: () {
                  SharePlus.instance.share(ShareParams(
                      text:
                          "Inscriptions padel royale 2026 : continue vers le lien pour t'inscrire à l'évènement ! https://www.monlien.com"));
                },
                child: SvgPicture.asset(
                  "assets/icons/share.svg",
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
