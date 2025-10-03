import 'package:anybuddy_test/providers/tournament_provider.dart';
import 'package:anybuddy_test/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySelection extends ConsumerWidget {
  const CategorySelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentAsync = ref.watch(tournamentProvider);
    final filter = ref.watch(cityFilterProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return tournamentAsync.when(
      data: (tournament) {
        final filteredCities = filter == "Tous"
            ? tournament.cities
            : tournament.cities.where((c) => c.city == filter).toList();

        return Column(
          children: [
            // Filtres
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                const SizedBox(width: 12),
                ...tournament.cityFilters.map((city) {
                  final isSelected = city == filter;
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilterChip(
                      showCheckmark: false,
                      side: BorderSide.none,
                      selectedColor: const Color(0xFFE2E8F0),
                      shadowColor: const Color(0xFFE2E8F0),
                      disabledColor: const Color(0xFFE2E8F0),
                      backgroundColor: const Color(0xFFE2E8F0),
                      label: Text(city,
                          overflow: TextOverflow.visible,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color:
                                isSelected ? Colors.black : const Color(0xFF94A3B8),
                          )),
                      selected: isSelected,
                      onSelected: (_) {
                        ref.read(cityFilterProvider.notifier).state = city;
                      },
                    ),
                  );
                }),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text("Sélectionne ta ville et ta catégorie",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: const Color(0xFF94A3B8),
                      )),
                ],
              ),
            ),
            ListView.builder(
              itemCount: filteredCities.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 130),
              itemBuilder: (context, index) {
                final cityCat = filteredCities[index];
                final isSelected = selectedCategory == index;
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Opacity(
                        opacity: cityCat.levelGap ? 0.5 : 1,
                        child: InkWell(
                          onTap: () {
                            cityCat.levelGap
                                ? null
                                : ref
                                    .read(selectedCategoryProvider.notifier)
                                    .state = index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF6F8FB),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF2CDF62)
                                        : Colors.transparent,
                                    width: 3)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 25),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/logo.svg",
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(cityCat.city,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                            color: Colors.black,
                                          )),
                                      Row(
                                        children: [
                                          Text(cityCat.levelText,
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 14,
                                                color: const Color(0xFF94A3B8),
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Tag(
                                            label: cityCat.badge,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/profile.svg",
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("${cityCat.slotsLeft}",
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: const Color(0xFF94A3B8),
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Center(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 24,
                                              backgroundColor: isSelected
                                                  ? const Color(0xFF2CDF62)
                                                  : const Color(0xFF94A3B8),
                                            ),
                                            const CircleAvatar(
                                              radius: 21,
                                              backgroundColor: Colors.white,
                                            ),
                                            Visibility(
                                              visible: isSelected,
                                              child: const CircleAvatar(
                                                radius: 18,
                                                backgroundColor:
                                                    Color(0xFF2CDF62),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: cityCat.recommended,
                      child: Positioned(
                        bottom: 0,
                        right: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF2CDF62),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            child: Text("Recommandé pour toi",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: cityCat.levelGap,
                      child: Positioned(
                        bottom: 0,
                        right: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF94A3B8),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            child: Text("Ecart de niveau",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Erreur: $err")),
    );
  }
}
