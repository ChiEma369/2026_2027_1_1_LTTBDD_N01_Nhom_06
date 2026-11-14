import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/data/repositories/activity_repository.dart';
import 'package:tech_trail/data/repositories/auth_repository.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';
import 'package:tech_trail/models/user_acc.dart';
import 'package:tech_trail/utils/app_theme.dart';
import 'package:tech_trail/l10n/app_localizations.dart';

import 'activity_journal_view.dart';
import '../../widgets/journal/journal_header.dart';
import '../../widgets/journal/activity_journal_card.dart';

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  ActivityRepository get _repository => context.read<ActivityRepository>();
  UserAccount? get _user => AuthRepository.instance.currentUser;
  // Mở trang viết nhật ký cho hoạt động được chọn.
  Future<void> _openJournal(Activity activity) async {
    final l10n = AppLocalizations.of(context);
    final user = _user;

    if (user == null) return;

    // Không cho viết lại nhật ký đã gửi.
    if (_repository.hasFeedback(user.id, activity.id)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.journalAlreadyWrittenInList)));

      setState(() {});
      return;
    }

    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ActivityJournalView(activity: activity, userId: user.id),
      ),
    );

    if (!mounted) return;

    // Cập nhật giao diện sau khi gửi nhật ký thành công.
    if (result == true) {
      setState(() {});
    }
  }

  // Giao diện khi chưa có hoạt động.
  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          const Icon(
            Icons.menu_book_outlined,
            color: AppColors.teal500,
            size: 45,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.journalEmptyTitle,
            style: AppText.s(14, w: FontWeight.w700),
          ),
          const SizedBox(height: 7),
          Text(
            l10n.journalEmptyDescription,

            textAlign: TextAlign.center,
            style: AppText.s(11, color: AppColors.muted, height: 1.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final repository = context.watch<ActivityRepository>();
    final user = _user;
    if (user == null) {
      return Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(
          child: Text(
            l10n.journalLoginRequired,
            style: AppText.s(13, color: AppColors.muted),
          ),
        ),
      );
    }

    // Chỉ lấy hoạt động đã đăng ký của tài khoản hiện tại.
    final registeredIds = repository.registeredActivityIds(user.id).toSet();

    final registeredActivities = repository.activities
        .where((activity) => registeredIds.contains(activity.id))
        .toList();
    //Chỉ lấy nhật ký của tài khoản hiện tại
    final userFeedbacks = repository.feedbacksOf(user.id);

    // Ghép nhật ký với hoạt động tương ứng.
    final feedbackByActivity = {
      for (final feedback in userFeedbacks) feedback.activityId: feedback,
    };

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            JournalHeader(
              activityCount: registeredActivities.length,
              completedCount: userFeedbacks.length,
            ),

            Expanded(
              child: registeredActivities.isEmpty
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: _buildEmptyState(),
                    )
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.history,
                              color: AppColors.teal700,
                              size: 19,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                l10n.journalHistory,
                                style: AppText.s(15, w: FontWeight.w700),
                              ),
                            ),
                            Text(
                              l10n.journalActivityCount(
                                registeredActivities.length,
                              ),
                              style: AppText.s(10, color: AppColors.muted),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        ...registeredActivities.map((activity) {
                          final ActivityFeedback? feedback =
                              feedbackByActivity[activity.id];

                          return ActivityJournalCard(
                            activity: activity,
                            feedback: feedback,
                            onTap: () => _openJournal(activity),
                          );
                        }),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
