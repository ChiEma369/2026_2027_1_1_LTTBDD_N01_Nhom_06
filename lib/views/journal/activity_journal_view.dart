import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_trail/data/repositories/activity_repository.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/models/feedback.dart';
import 'package:tech_trail/utils/app_theme.dart';

import '../../widgets/journal/journal_rating.dart';
import '../../widgets/journal/journal_difficulty.dart';
import '../../widgets/journal/journal_note_field.dart';
import '../../widgets/journal/journal_submit_button.dart';

class ActivityJournalView extends StatefulWidget {
  final Activity activity;
  final String userId;

  const ActivityJournalView({
    super.key,
    required this.activity,
    required this.userId,
  });

  @override
  State<ActivityJournalView> createState() =>
      _ActivityJournalViewState();
}

class _ActivityJournalViewState extends State<ActivityJournalView> {
  ActivityRepository get _repository =>
      context.read<ActivityRepository>();
  final TextEditingController _noteController =
      TextEditingController();

  int _interestRating = 0;
  Difficulty? _difficulty;

  bool _isSubmitting = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  // Gửi nhật ký.
  Future<void> _submitFeedback() async {
    // Kiểm tra dữ liệu bắt buộc.
    if (_interestRating == 0 || _difficulty == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Vui lòng đánh giá mức độ hứng thú và độ khó.',
          ),
        ),
      );
      return;
    }

    // Kiểm tra nhật ký đã tồn tại hay chưa.
    if (_repository.hasFeedback(widget.userId, widget.activity.id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bạn đã viết nhật ký cho hoạt động này rồi.'),
        ),
      );

      Navigator.pop(context, true);
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    // Lưu nhật ký gắn với đúng userId và activityId.
    final feedback = _repository.addFeedback(
      userId: widget.userId,
      activityId: widget.activity.id,
      interestRating: _interestRating,
      difficulty: _difficulty!,
      note: _noteController.text.trim(),
    );

    if (!mounted) return;

    // Nếu phát hiện nhật ký đã được gửi trước đó.
    if (feedback == null) {
      setState(() {
        _isSubmitting = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nhật ký này đã được gửi trước đó.'),
        ),
      );

      Navigator.pop(context, true);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Gửi nhật ký thành công!')),
    );

    // Trả kết quả về trang danh sách.
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            // Thanh tiêu đề.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              decoration: const BoxDecoration(
                color: AppColors.teal900,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Nhật ký thực chiến',
                      textAlign: TextAlign.center,
                      style: AppText.s(
                        16,
                        w: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // Nội dung biểu mẫu.
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thông tin hoạt động đang viết nhật ký.
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: AppShadows.card,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'HOẠT ĐỘNG ĐANG THAM GIA',
                            style: AppText.s(
                              9,
                              w: FontWeight.w700,
                              color: AppColors.teal700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.activity.title,
                            style: AppText.s(15, w: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.activity.description,
                            style: AppText.s(
                              11,
                              color: AppColors.muted,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Đánh giá mức độ hứng thú.
                    JournalRating(
                      rating: _interestRating,
                      onChanged: (value) {
                        setState(() {
                          _interestRating = value;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    // Đánh giá mức độ khó.
                    JournalDifficulty(
                      difficulty: _difficulty,
                      onChanged: (value) {
                        setState(() {
                          _difficulty = value;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    // Nhập cảm nhận.
                    JournalNoteField(controller: _noteController),

                    const SizedBox(height: 20),

                    // Nút gửi.
                    JournalSubmitButton(
                      isSubmitting: _isSubmitting,
                      onPressed: _submitFeedback,
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
