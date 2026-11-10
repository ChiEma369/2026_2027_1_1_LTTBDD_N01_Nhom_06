import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/viewmodels/career_map_view_model.dart';

class CareerMapHeader extends StatelessWidget {
  const CareerMapHeader({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final vm = context.watch<CareerMapViewModel>();

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.deepSeaTeal,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.careerMapGreeting(name),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                _RoundIconButton(
                  icon: Icons.notifications_none,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _RoundIconButton(
                  icon: Icons.explore_outlined,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              l10n.careerMapSubtitle,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.frostWhite,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              onChanged: vm.setQuery,
              decoration: InputDecoration(
                hintText: l10n.searchHint,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textMuted,
                ),
                prefixIcon: const Icon(Icons.search, size: 20),
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _FieldChip(
                    label: l10n.filterAll,
                    selected: vm.selectedFieldId == null,
                    onTap: () => vm.selectField(null),
                  ),
                  for (final f in vm.fields)
                    _FieldChip(
                      label: f.shortName,
                      selected: vm.selectedFieldId == f.id,
                      onTap: () => vm.selectField(f.id),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    customBorder: const CircleBorder(),
    child: Container(
      width: 34,
      height: 34,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: AppColors.primary),
    ),
  );
}

class _FieldChip extends StatelessWidget {
  const _FieldChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary
              : AppColors.arcticOceanBlue.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : AppColors.primaryDark,
          ),
        ),
      ),
    ),
  );
}
