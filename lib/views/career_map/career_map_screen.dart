import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/data/repositories/app_repository.dart';
import 'package:tech_trail/viewmodels/career_map_view_model.dart';
import 'package:tech_trail/views/career_map/niche_detail_screen.dart';
import 'package:tech_trail/widgets/career_map_header.dart';
import 'package:tech_trail/widgets/niche_card.dart';

class CareerMapScreen extends StatelessWidget {
  const CareerMapScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (c) => CareerMapViewModel(c.read<AppRepository>()),
    child: const _CareerMapView(),
  );
}

class _CareerMapView extends StatelessWidget {
  const _CareerMapView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final vm = context.watch<CareerMapViewModel>();
    final repo = context.read<AppRepository>();
    final niches = vm.niches;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const CareerMapHeader(name: 'bạn'),
          Expanded(
            child: niches.isEmpty
                ? Center(child: Text(l10n.noResults))
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: niches.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, i) {
                      final detail = repo.detailOf(niches[i].id);
                      if (detail == null) return const SizedBox.shrink();
                      return NicheCard(
                        detail: detail,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => NicheDetailScreen(
                              nicheId: detail.nicheId,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
