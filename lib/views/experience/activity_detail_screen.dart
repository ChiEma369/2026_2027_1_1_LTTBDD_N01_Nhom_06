import 'package:flutter/material.dart';
import 'package:tech_trail/l10n/app_localizations.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/data/repositories/activity_repository.dart';
import 'package:tech_trail/data/mock/mock_niches.dart';
import 'package:tech_trail/widgets/career_map/niche_card.dart';
import 'package:tech_trail/views/career_map/niche_detail_screen.dart';
import 'package:tech_trail/data/repositories/auth_repository.dart';

class ActivityDetailScreen extends StatefulWidget {
  final Activity activity;
  final ActivityRepository repository;

  const ActivityDetailScreen({
    super.key,
    required this.activity,
    required this.repository,
  });
  @override
  State<ActivityDetailScreen> createState() =>
      _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  String get _userId => AuthRepository.instance.currentUser?.id ?? '';
  bool _isBookmarked = false;
  bool get _isRegistered =>
      widget.repository.isRegistered(_userId, widget.activity.id);
  void _registerActivity() {
    if (_userId.isEmpty) return;
    if (_isRegistered) return;
    final success = widget.repository.registerActivity(
      _userId,
      widget.activity.id,
    );
    if (success) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: Column(
          children: [_buildHeroHeader(context), _buildMainContent()],
        ),
      ),
      bottomNavigationBar: _buildBottomCTA(),
    );
  }

  Widget _buildMainContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 110),
      decoration: const BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        border: Border(top: BorderSide(color: AppColors.teal100)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tay nắm trang trí
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.teal300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildActivityOverview(),
        ],
      ),
    );
  }

  Widget _buildActivityOverview() {
    final activity = widget.activity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Loại hoạt động và đánh giá
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.teal100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _getActivityTypeLabel(activity.type),
                style: AppText.s(
                  11,
                  w: FontWeight.w700,
                  color: AppColors.teal900,
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.star_rounded,
              size: 17,
              color: Color(0xFFF4B740),
            ),
            const SizedBox(width: 3),
            Text(
              activity.rating.toStringAsFixed(1),
              style: AppText.s(12, w: FontWeight.w700),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.people_outline,
              size: 16,
              color: AppColors.muted,
            ),
            const SizedBox(width: 3),
            Text(
              '${activity.participantCount}',
              style: AppText.s(11, color: AppColors.muted),
            ),
          ],
        ),
        // Tiêu đề hoạt động
        Text(
          activity.title,
          style: AppText.s(
            24,
            w: FontWeight.w800,
            color: AppColors.text,
          ),
        ),

        const SizedBox(height: 20),

        // Ba thẻ thông tin
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                icon: nicheIcon(activity.nicheId ?? ''),
                label: 'LĨNH VỰC',
                value: _getNicheLabel(activity.nicheId),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildInfoCard(
                icon: Icons.signal_cellular_alt_rounded,
                label: 'ĐỘ KHÓ',
                value: _getDifficultyLabel(activity.difficulty),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildInfoCard(
                icon: Icons.schedule_rounded,
                label: 'THỜI LƯỢNG',
                value: activity.duration,
              ),
            ),
          ],
        ),
        // Mục tiêu hoạt động
        if (activity.objective.trim().isNotEmpty) ...[
          const SizedBox(height: 28),
          _buildObjectiveSection(),
        ],

        // Nội dung thực hành
        if (activity.lessons.isNotEmpty) ...[
          const SizedBox(height: 28),
          _buildLessonsSection(),
        ],
        if (activity.tools.isNotEmpty) ...[
          const SizedBox(height: 28),
          _buildToolsSection(),
        ],
        if (activity.relatedCareer.trim().isNotEmpty) ...[
          const SizedBox(height: 28),
          _buildRelatedCareerSection(),
        ],
      ],
    );
  }

  Widget _buildLessonsSection() {
    final lessons = widget.activity.lessons;

    if (lessons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.menu_book_rounded,
              size: 21,
              color: AppColors.teal700,
            ),
            const SizedBox(width: 9),
            Text(
              'Nội dung thực hành',
              style: AppText.s(
                17,
                w: FontWeight.w800,
                color: AppColors.teal900,
              ),
            ),
            const Spacer(),
            Text(
              '${lessons.length} bước',
              style: AppText.s(
                11,
                w: FontWeight.w600,
                color: AppColors.muted,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        ...List.generate(
          lessons.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildLessonCard(lessons[index], index + 1),
          ),
        ),
      ],
    );
  }

  Widget _buildToolsSection() {
    final tools = widget.activity.tools;

    if (tools.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.build_rounded,
              size: 21,
              color: AppColors.teal700,
            ),
            const SizedBox(width: 9),
            Text(
              'Công cụ & Môi trường',
              style: AppText.s(
                17,
                w: FontWeight.w800,
                color: AppColors.teal900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 9,
          runSpacing: 9,
          children: tools.map((tool) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.divider),
              ),
              child: Text(
                tool,
                style: AppText.s(
                  12,
                  w: FontWeight.w600,
                  color: AppColors.teal700,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRelatedCareerSection() {
    final activity = widget.activity;
    final career = activity.relatedCareer.trim();
    final nicheId = activity.relatedCareerNicheId;
    final description = activity.relatedCareerDescription.trim();

    if (career.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.work_outline_rounded,
              size: 21,
              color: AppColors.teal700,
            ),
            const SizedBox(width: 9),
            Text(
              'Nghề nghiệp liên quan',
              style: AppText.s(
                17,
                w: FontWeight.w800,
                color: AppColors.teal900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              if (nicheId == null || nicheId.isEmpty) return;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => NicheDetailScreen(
                    nicheId: nicheId,
                    onOpenExperience: (_) {
                      Navigator.of(context)
                          .popUntil((route) => route.isFirst);
                    },
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.divider),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.teal100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.work_rounded,
                      color: AppColors.teal700,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          career,
                          style: AppText.s(
                            14,
                            w: FontWeight.w700,
                            color: AppColors.teal900,
                          ),
                        ),
                        if (description.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            description,
                            style: AppText.s(
                              12,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.muted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLessonCard(ActivityLesson lesson, int index) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.teal100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$index',
                  style: AppText.s(
                    12,
                    w: FontWeight.w800,
                    color: AppColors.teal700,
                  ),
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Text(
                  lesson.title,
                  style: AppText.s(
                    14,
                    w: FontWeight.w700,
                    color: AppColors.teal900,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.schedule_rounded,
                size: 14,
                color: AppColors.muted,
              ),
              const SizedBox(width: 3),
              Text(
                lesson.duration,
                style: AppText.s(
                  10,
                  w: FontWeight.w600,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 41),
            child: Text(
              lesson.description,
              style: AppText.s(12, color: AppColors.muted),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObjectiveSection() {
    final objective = widget.activity.objective.trim();

    if (objective.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.track_changes_rounded,
              size: 21,
              color: AppColors.teal700,
            ),
            const SizedBox(width: 9),
            Text(
              'Mục tiêu hoạt động',
              style: AppText.s(
                17,
                w: FontWeight.w800,
                color: AppColors.teal900,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider),
          ),
          child: Text(
            objective,
            style: AppText.s(13, color: AppColors.muted),
          ),
        ),
      ],
    );
  }

  String _getActivityTypeLabel(ActivityType type) {
    return switch (type) {
      ActivityType.miniProject => 'MINI PROJECT',
      ActivityType.workshop => 'WORKSHOP',
      ActivityType.seminar => 'SEMINAR',
      ActivityType.softSkill => 'KỸ NĂNG MỀM',
    };
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      height: 112,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
        boxShadow: [
          BoxShadow(
            color: AppColors.teal900.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 23, color: AppColors.teal700),
          const SizedBox(height: 9),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppText.s(
              8,
              w: FontWeight.w700,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppText.s(
              11,
              w: FontWeight.w700,
              color: AppColors.teal900,
            ),
          ),
        ],
      ),
    );
  }

  String _getNicheLabel(String? nicheId) {
    if (nicheId == null) return 'Kỹ năng mềm';

    final niches = mockNiches.where((item) => item.id == nicheId);

    if (niches.isEmpty) return 'Công nghệ thông tin';

    return switch (nicheId) {
      'web' => 'Web',
      'mobile' => 'Mobile',
      'backend' => 'Backend',
      'desktop-game' => 'Desktop/Game',
      'ai-ml' => 'AI / ML',
      'data-analyst' => 'Data Analyst',
      'data-engineer' => 'Data Engineer',
      'security' => 'An toàn thông tin',
      'qa-tester' => 'QA / Tester',
      'cloud-devops' => 'Cloud / DevOps',
      'sys-net-admin' => 'Hệ thống & mạng',
      'ba' => 'Business Analyst',
      'pm' => 'Project Manager',
      'po' => 'Product Owner',
      _ => niches.first.name,
    };
  }

  String _getDifficultyLabel(ActivityDifficulty difficulty) {
    return switch (difficulty) {
      ActivityDifficulty.beginner => 'Cơ bản',
      ActivityDifficulty.intermediate => 'Trung bình',
      ActivityDifficulty.advanced => 'Nâng cao',
    };
  }

  Widget _buildBottomCTA() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: const Border(
            top: BorderSide(color: AppColors.divider),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.teal900.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildBookmarkButton(),
            const SizedBox(width: 12),
            Expanded(child: _buildRegisterButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarkButton() {
    return SizedBox(
      width: 48,
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            _isBookmarked = !_isBookmarked;
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.tealSoft,
          side: const BorderSide(color: AppColors.teal100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Icon(
          _isBookmarked
              ? Icons.bookmark_rounded
              : Icons.bookmark_border_rounded,
          color: AppColors.teal700,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      height: 48,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isRegistered
                ? [
                    AppColors.green,
                    AppColors.green.withValues(alpha: 0.8),
                  ]
                : [AppColors.teal900, AppColors.teal700],
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: ElevatedButton.icon(
          onPressed: _isRegistered ? null : _registerActivity,
          icon: Icon(
            _isRegistered
                ? Icons.check_circle_rounded
                : Icons.event_available_rounded,
            size: 20,
          ),
          label: Text(
            _isRegistered ? 'ĐÃ ĐĂNG KÝ' : 'ĐĂNG KÝ THAM GIA',
            style: AppText.s(
              14,
              w: FontWeight.w700,
              color: AppColors.white,
              letterSpacing: 0.4,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            foregroundColor: AppColors.white,
            disabledForegroundColor: AppColors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 283),
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      decoration: const BoxDecoration(color: AppColors.teal900),
      child: Column(
        children: [
          // Thanh điều hướng
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.white,
                    size: 20,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white.withValues(
                      alpha: 0.1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: AppColors.white.withValues(
                          alpha: 0.15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(width: 40),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            l10n.activityHeroEyebrow,
            style: AppText.s(
              10,
              w: FontWeight.w700,
              color: const Color(0xFF5EB0C8),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            l10n.activityHeroHeadline,
            textAlign: TextAlign.center,
            style: AppText.s(
              11,
              w: FontWeight.w600,
              color: AppColors.bg,
            ),
          ),

          const SizedBox(height: 12),

          _buildTechnologyIllustration(),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFF34D399),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                l10n.activityHeroStatus,
                style: AppText.s(
                  9,
                  w: FontWeight.w600,
                  color: const Color(0xFF9FD3E3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechnologyIllustration() {
    return SizedBox(
      width: 280,
      height: 112,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Quầng sáng nền
          Container(
            width: 170,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0x332A7387),
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x442A7387),
                  blurRadius: 35,
                  spreadRadius: 8,
                ),
              ],
            ),
          ),

          // Laptop trung tâm
          Positioned(
            bottom: 4,
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 76,
                  decoration: BoxDecoration(
                    color: AppColors.teal900,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: const Color(0xFF5EB0C8),
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.code_rounded,
                      size: 42,
                      color: Color(0xFF9FD3E3),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 7,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9FD3E3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),

          // Biểu tượng dữ liệu
          Positioned(
            top: 5,
            left: 35,
            child: _buildFloatingIcon(
              Icons.data_object,
              const Color(0xFF6EE7B7),
            ),
          ),

          // Biểu tượng công nghệ
          Positioned(
            top: 0,
            right: 35,
            child: _buildFloatingIcon(
              Icons.memory_rounded,
              const Color(0xFFFBBF24),
            ),
          ),

          Positioned(
            bottom: 18,
            right: 10,
            child: _buildFloatingIcon(
              Icons.analytics_outlined,
              const Color(0xFF93C5FD),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingIcon(IconData icon, Color color) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.teal900,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Icon(icon, size: 20, color: color),
    );
  }
}
