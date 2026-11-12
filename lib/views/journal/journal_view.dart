import 'package:flutter/material.dart';

import 'package:tech_trail/data/app_repository.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';
import 'package:tech_trail/models/user_acc.dart';
import 'package:tech_trail/utils/app_theme.dart';

import 'activity_journal_view.dart';
import 'widgets/journal_header.dart';
import 'widgets/activity_journal_card.dart';

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  final AppRepository _repository = AppRepository.instance;

  UserAccount? get _user => _repository.currentUser;

  // Mở trang viết nhật ký cho hoạt động được chọn.
  Future<void> _openJournal(Activity activity) async {
    final user = _user;

    if (user == null) return;

    // Không cho viết lại nhật ký đã gửi.
    if (_repository.hasFeedback(user.id, activity.id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bạn đã viết nhật ký cho hoạt động này.')),
      );

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
            'Chưa có hoạt động nào',
            style: AppText.s(14, w: FontWeight.w700),
          ),
          const SizedBox(height: 7),
          Text(
            'Hãy đăng ký tham gia hoạt động tại Trạm trải nghiệm. '
            'Sau đó bạn có thể viết nhật ký và ghi lại những điều đã học được.',
            textAlign: TextAlign.center,
            style: AppText.s(11, color: AppColors.muted, height: 1.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _user;

    if (user == null) {
      return Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(
          child: Text(
            'Vui lòng đăng nhập để xem nhật ký.',
            style: AppText.s(13, color: AppColors.muted),
          ),
        ),
      );
    }

    // Chỉ lấy hoạt động đã đăng ký của tài khoản hiện tại.
    final registeredIds = _repository.registeredActivityIds(user.id).toSet();

    final registeredActivities = _repository.activities
        .where((activity) => registeredIds.contains(activity.id))
        .toList();

    // Chỉ lấy nhật ký của tài khoản hiện tại.
    final userFeedbacks = _repository.feedbacksOf(user.id);

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
                                'Lịch sử của bạn',
                                style: AppText.s(15, w: FontWeight.w700),
                              ),
                            ),
                            Text(
                              '${registeredActivities.length} hoạt động',
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
