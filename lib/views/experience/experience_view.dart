import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/data/repositories/activity_repository.dart';
import 'package:tech_trail/viewmodels/experience_view_model.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/widgets/experience/activity_card.dart';
import 'package:provider/provider.dart';

import 'activity_detail_screen.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key, this.nicheId});

  final String? nicheId;

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  late final ActivityRepository _repository;
  late final ExperienceViewModel _viewModel;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();

    _repository = context.read<ActivityRepository>();
    _viewModel = ExperienceViewModel(_repository);
    _viewModel.setNicheFilter(widget.nicheId);
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant ExperienceView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.nicheId != widget.nicheId) {
      _viewModel.setNicheFilter(widget.nicheId);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _viewModel,
          builder: (context, child) {
            final activities = _viewModel.filteredActivities;
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.teal900,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 23, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hàng tiêu đề và nút tìm kiếm
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.experienceTitle,
                                style: AppText.s(
                                  24,
                                  w: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                l10n.experienceSubtitle,
                                style: AppText.s(
                                  12,
                                  w: FontWeight.w500,
                                  color: AppColors.teal300,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.teal700,
                                width: 1,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                _searchFocusNode.requestFocus();
                              },
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.search,
                                size: 20,
                                color: AppColors.teal300,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Thanh tìm kiếm hoạt động và nghề nghiệp
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 16,
                              color: AppColors.teal700,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                focusNode: _searchFocusNode,
                                cursorColor: AppColors.teal700,
                                cursorWidth: 2,
                                onChanged: (value) {
                                  _viewModel.searchActivities(value);
                                },
                                style: AppText.s(12, color: AppColors.text),
                                decoration: InputDecoration(
                                  hintText: l10n.experienceSearchHint,
                                  hintStyle: AppText.s(
                                    12,
                                    color: AppColors.muted,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 34,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildFilterChip(l10n.filterAll, null),
                            const SizedBox(width: 8),
                            _buildFilterChip(
                              'Mini-project',
                              ActivityType.miniProject,
                            ),
                            const SizedBox(width: 8),
                            _buildFilterChip('Workshop', ActivityType.workshop),
                            const SizedBox(width: 8),
                            _buildFilterChip('Seminar', ActivityType.seminar),
                            const SizedBox(width: 8),
                            _buildFilterChip(
                              l10n.experienceFilterSoftSkill,
                              ActivityType.softSkill,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: activities.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 52,
                                  color: AppColors.muted,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  l10n.experienceNoResults,
                                  style: AppText.s(
                                    15,
                                    w: FontWeight.w600,
                                    color: AppColors.text,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  l10n.experienceNoResultsHint,
                                  style: AppText.s(12, color: AppColors.muted),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 20),
                            itemCount: activities.length,
                            itemBuilder: (context, index) {
                              final activity = activities[index];

                              return ActivityCard(
                                activity: activity,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ActivityDetailScreen(
                                            activity: activity,
                                            repository: _repository,
                                          ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, ActivityType? type) {
    final isSelected = _viewModel.selectedType == type;

    return GestureDetector(
      onTap: () {
        _viewModel.selectType(type);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.teal300 : AppColors.teal700,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.teal500, width: 1),
        ),
        child: Text(
          label,
          style: AppText.s(
            12,
            w: FontWeight.w600,
            color: isSelected ? AppColors.teal900 : AppColors.white,
          ),
        ),
      ),
    );
  }
}
