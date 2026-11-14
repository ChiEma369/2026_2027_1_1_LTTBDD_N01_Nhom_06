import 'package:flutter/material.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/l10n/app_localizations.dart';

class GroupInfoView extends StatelessWidget {
  const GroupInfoView({super.key});

  static const List<Map<String, String>> members = [
    {
      'name': 'Lưu Thị Linh Chi',
      'studentId': '821012845',
      'role': 'leader',
      'task': 'leaderTask',
      'image': 'assets/images/Chi.jpg',
    },
    {
      'name': 'Trương Thị Giỏi',
      'studentId': '821054521',
      'role': 'member',
      'task': 'uiUxTask',
      'image': 'assets/images/Gioi.jpg',
    },
    {
      'name': 'Vũ Thị Hương Giang',
      'studentId': '821087690',
      'role': 'member',
      'task': 'integrationTask',
      'image': 'assets/images/Giang.jpg',
    },
  ];

  static const List<Map<String, String>> technologies = [
    {'name': 'Flutter', 'description': 'uiFramework', 'icon': 'code'},
    {'name': 'Dart', 'description': 'programmingLanguage', 'icon': 'terminal'},
    {'name': 'Provider', 'description': 'stateManagement', 'icon': 'widgets'},
    {'name': 'MVVM', 'description': 'architecture', 'icon': 'architecture'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFC),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
              child: Column(
                children: [
                  _buildProjectInfo(context),
                  const SizedBox(height: 16),
                  _buildMembers(context),
                  const SizedBox(height: 16),
                  _buildTechnologies(context),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context).groupInfoCopyright,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF829BA4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 205,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0B3F4D), Color(0xFF176C7D)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  _headerButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).groupInfoTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _headerButton(icon: Icons.star_border_rounded, onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 52,
              height: 52,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
              ),
              child: Image.asset(
                'assets/images/techtrail_logo.png',
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) =>
                    const Icon(Icons.groups, color: Colors.white, size: 30),
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'TechTrail',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalizations.of(context).groupInfoTagline,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.white.withValues(alpha: 0.13),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 34,
          height: 34,
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }

  Widget _buildProjectInfo(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -12),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.teal900.withValues(alpha: 0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _projectIcon(Icons.menu_book_rounded),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SmallLabel(
                        AppLocalizations.of(context).groupInfoCourseSection,
                      ),
                      SizedBox(height: 3),
                      Text(
                        AppLocalizations.of(context).groupInfoCourseName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF153F4B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _projectDetail(
                    icon: Icons.person_outline,
                    title: AppLocalizations.of(context).groupInfoLecturerLabel,
                    value: 'ThS.Nguyễn Xuân Quế',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _projectDetail(
                    icon: Icons.calendar_month_outlined,
                    title: AppLocalizations.of(context)
                        .groupInfoClassSemesterLabel,
                    value: 'Lập trình cho thiết bị di động-1-1-26(N01)',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _projectIcon(IconData icon) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F6F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: AppColors.teal700, size: 19),
    );
  }

  Widget _projectDetail({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F8F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.teal700),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SmallLabel(title),
                const SizedBox(height: 3),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF244C57),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembers(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.groups_rounded,
              color: Color(0xFF0B4655),
              size: 18,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                AppLocalizations.of(context).groupInfoMembersTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF164B59),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE2F3F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                AppLocalizations.of(context)
                    .groupInfoMemberCount(members.length),
                style: const TextStyle(
                  fontSize: 9,
                  color: Color(0xFF16758A),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        ...members.map((member) => _memberCard(context, member)),
      ],
    );
  }

  Widget _memberCard(BuildContext context, Map<String, String> member) {
    final l10n = AppLocalizations.of(context);
    final isLeader = member['role'] == 'leader';
    final role = isLeader ? l10n.groupInfoLeaderRole : l10n.groupInfoMemberRole;

    final task =
        {
          'leaderTask': l10n.groupInfoTaskLeader,
          'uiUxTask': l10n.groupInfoTaskUiUx,
          'integrationTask': l10n.groupInfoTaskIntegration,
        }[member['task']] ??
        '';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE2F0F3)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.asset(
              member['image']!,
              width: 43,
              height: 43,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 43,
                height: 43,
                color: const Color(0xFFE5F4F6),
                child: const Icon(Icons.person, color: AppColors.teal700),
              ),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        member['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF174653),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: isLeader
                            ? const Color(0xFFFFF1DB)
                            : const Color(0xFFE8F5F7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        role,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          color: isLeader
                              ? const Color(0xFFB87927)
                              : const Color(0xFF398294),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '${l10n.groupInfoStudentIdLabel} ${member['studentId']}',
                  style: const TextStyle(fontSize: 9, color: Color(0xFF68838D)),
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F7F8),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    '♙  ${l10n.groupInfoTaskLabel} $task',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Color(0xFF547782),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnologies(BuildContext context) {
    final icons = <String, IconData>{
      'code': Icons.flutter_dash,
      'terminal': Icons.terminal,
      'widgets': Icons.widgets_outlined,
      'architecture': Icons.architecture,
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE5F0F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.code_rounded, color: AppColors.teal700, size: 17),
              SizedBox(width: 6),
              Text(
                AppLocalizations.of(context).groupInfoTechnologiesTitle,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF174653),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: technologies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 48,
            ),
            itemBuilder: (context, index) {
              final item = technologies[index];
              final l10n = AppLocalizations.of(context);

              final description =
                  {
                    'uiFramework': l10n.groupInfoUiFramework,
                    'programmingLanguage': l10n.groupInfoProgrammingLanguage,
                    'stateManagement': l10n.groupInfoStateManagement,
                    'architecture': l10n.groupInfoArchitecture,
                  }[item['description']] ??
                  '';

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F8F9),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Icon(
                        icons[item['icon']] ?? Icons.code,
                        color: AppColors.teal700,
                        size: 17,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name']!,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF24515D),
                            ),
                          ),
                          Text(
                            description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 8,
                              color: Color(0xFF78929A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SmallLabel extends StatelessWidget {
  final String text;

  const _SmallLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 7,
        fontWeight: FontWeight.w700,
        color: Color(0xFF78939C),
      ),
    );
  }
}
