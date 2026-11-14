// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'TechTrail';

  @override
  String get tabCareerMap => 'Khám phá nghề nghiệp';

  @override
  String get tabActivities => 'Trạm trải nghiệm';

  @override
  String get tabJournal => 'Nhật ký';

  @override
  String get tabProfile => 'Hồ sơ';

  @override
  String get tabAccount => 'Cá nhân';

  @override
  String careerMapGreeting(String name) {
    return 'Xin chào, $name 👋';
  }

  @override
  String groupInfoMemberCount(int count) {
    return '$count thành viên';
  }

  @override
  String get groupInfoTitle => 'Thông tin nhóm';

  @override
  String get groupInfoTagline => 'Khám phá nghề nghiệp - Kiến tạo tương lai';

  @override
  String get groupInfoCopyright =>
      '© 2026 TechTrail. Bản quyền thuộc về nhóm phát triển.';

  @override
  String get groupInfoCourseSection => 'THÔNG TIN MÔN HỌC / ĐỒ ÁN';

  @override
  String get groupInfoCourseName => 'Phát triển ứng dụng Di động';

  @override
  String get groupInfoLecturerLabel => 'GIẢNG VIÊN HƯỚNG DẪN';

  @override
  String get groupInfoClassSemesterLabel => 'LỚP HỌC PHẦN / KỲ';

  @override
  String get groupInfoMembersTitle => 'THÀNH VIÊN NHÓM';

  @override
  String get groupInfoTechnologiesTitle => 'CÔNG NGHỆ SỬ DỤNG';

  @override
  String get groupInfoLeaderRole => 'Trưởng nhóm';

  @override
  String get groupInfoMemberRole => 'Thành viên';

  @override
  String get groupInfoStudentIdLabel => 'MSSV:';

  @override
  String get groupInfoTaskLabel => '♙ Phụ trách:';

  @override
  String get groupInfoTaskLeader => 'Phân tích, quản lý và Backend';

  @override
  String get groupInfoTaskUiUx => 'UI/UX và tính năng';

  @override
  String get groupInfoTaskIntegration => 'Thực tế và tích hợp';

  @override
  String get groupInfoUiFramework => 'Khung giao diện';

  @override
  String get groupInfoProgrammingLanguage => 'Ngôn ngữ lập trình';

  @override
  String get groupInfoStateManagement => 'Quản lý trạng thái';

  @override
  String get groupInfoArchitecture => 'Kiến trúc';

  @override
  String get careerMapSubtitle => 'Khám phá con đường nghề nghiệp IT phù hợp';

  @override
  String get searchHint => 'Tìm kiếm nghề nghiệp IT, kỹ năng...';

  @override
  String get filterAll => 'Tất cả';

  @override
  String get viewDetail => 'Xem chi tiết';

  @override
  String activityParticipantCount(int count) {
    return '$count người';
  }

  @override
  String get activityViewDetails => 'Xem hoạt động';

  @override
  String skillsMore(int count) {
    return '+$count kỹ năng';
  }

  @override
  String get noResults => 'Không tìm thấy ngành phù hợp';

  @override
  String get matchBadge => 'Phù hợp với bạn';

  @override
  String get ratingVeryFit => 'Rất phù hợp';

  @override
  String learnersFollowing(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Hơn $countString bạn trẻ đang đi theo lộ trình này';
  }

  @override
  String get statSalary => 'Mức lương';

  @override
  String get statDemand => 'Nhu cầu';

  @override
  String get statWorkMode => 'Hình thức làm việc';

  @override
  String get dailyWorkTitle => 'Công việc hằng ngày';

  @override
  String get realisticTag => 'Thực tế';

  @override
  String get roadmapTitle => 'Lộ trình học tập';

  @override
  String roadmapStageCount(int count) {
    return '$count chặng chuyên sâu';
  }

  @override
  String get stageLabel => 'CHẶNG';

  @override
  String get stageTagFoundation => 'Nền tảng';

  @override
  String get stageTagCore => 'Cốt lõi';

  @override
  String get stageTagApplied => 'Ứng dụng';

  @override
  String get stageTagAdvanced => 'Nâng cao';

  @override
  String stageDuration(String value) {
    return 'Thời lượng: $value';
  }

  @override
  String get experienceTitle => 'Trạm trải nghiệm';

  @override
  String get experienceSubtitle => 'Thử trước khi chọn định hướng IT';

  @override
  String get experienceSearchHint => 'Tìm hoạt động, nghề nghiệp, kỹ năng...';

  @override
  String get experienceFilterSoftSkill => 'Kỹ năng mềm';

  @override
  String get experienceNoResults => 'Không tìm thấy hoạt động phù hợp';

  @override
  String get experienceNoResultsHint => 'Thử thay đổi từ khóa hoặc bộ lọc nhé.';

  @override
  String get activityDetailTitle => 'Chi tiết hoạt động';

  @override
  String get activityHeroEyebrow => 'HỌC TẬP QUA TRẢI NGHIỆM';

  @override
  String get activityHeroHeadline => 'KHÁM PHÁ · THỰC HÀNH · PHÁT TRIỂN';

  @override
  String get activityHeroStatus => 'SẴN SÀNG';

  @override
  String get activityField => 'LĨNH VỰC';

  @override
  String get activityDifficulty => 'ĐỘ KHÓ';

  @override
  String get activityDuration => 'THỜI LƯỢNG';

  @override
  String get activityPracticalContent => 'Nội dung thực hành';

  @override
  String activityStepCount(int count) {
    return '$count bước';
  }

  @override
  String get activityToolsEnvironment => 'Công cụ & Môi trường';

  @override
  String get activityRelatedCareers => 'Nghề nghiệp liên quan';

  @override
  String get activityObjective => 'Mục tiêu hoạt động';

  @override
  String get activityTypeSoftSkill => 'KỸ NĂNG MỀM';

  @override
  String get activityNicheSoftSkill => 'Kỹ năng mềm';

  @override
  String get activityNicheInformationTechnology => 'Công nghệ thông tin';

  @override
  String get activityNicheCybersecurity => 'An toàn thông tin';

  @override
  String get activityNicheSystemsNetworks => 'Hệ thống & mạng';

  @override
  String get activityDifficultyBeginner => 'Cơ bản';

  @override
  String get activityDifficultyIntermediate => 'Trung bình';

  @override
  String get activityDifficultyAdvanced => 'Nâng cao';

  @override
  String get activityRegistered => 'ĐÃ ĐĂNG KÝ';

  @override
  String get activityRegister => 'ĐĂNG KÝ THAM GIA';

  @override
  String get updateSuccess => 'Cập nhật thông tin thành công';

  @override
  String get selectLanguage => 'Chọn ngôn ngữ';

  @override
  String get vietnamese => 'Tiếng Việt';

  @override
  String get english => 'Tiếng Anh';

  @override
  String get accountNotFound => 'Không tìm thấy tài khoản';

  @override
  String get profileMajorNotUpdated => 'Chưa cập nhật';

  @override
  String get profileAccountInformation => 'Thông tin tài khoản';

  @override
  String get profileHeaderTitle => 'Hồ sơ cá nhân';

  @override
  String get profileHeaderSubtitle => 'Khám phá · Trải nghiệm · Định hướng';

  @override
  String get profileFullName => 'Họ và tên';

  @override
  String get profilePhoneNumber => 'Số điện thoại';

  @override
  String get profileClassName => 'Lớp / Khóa';

  @override
  String get profileMajor => 'Ngành học';

  @override
  String get profileEditButton => 'Chỉnh sửa hồ sơ';

  @override
  String get profileLogoutButton => 'Đăng xuất';

  @override
  String get profileEditClassLabel => 'Lớp';

  @override
  String get profileCancel => 'Hủy';

  @override
  String get profileSaveChanges => 'Lưu thay đổi';

  @override
  String get profileFullNameRequired => 'Họ tên không được để trống.';

  @override
  String get itProfileDefaultName => 'Người dùng';

  @override
  String get itProfileCareerDirection => 'Định hướng nghề nghiệp';

  @override
  String get itProfileCareerDirectionEmpty =>
      'Chưa có kết quả định hướng nghề nghiệp.';

  @override
  String get itProfileAssessmentResult => 'Kết quả đánh giá';

  @override
  String get itProfileAssessmentEmpty =>
      'Hoàn thành bài đánh giá để xem mức độ phù hợp với các lĩnh vực IT.';

  @override
  String get itProfileStrengths => 'Điểm mạnh của bạn';

  @override
  String get itProfileStrengthsEmpty =>
      'Điểm mạnh cá nhân sẽ được hiển thị sau khi có dữ liệu đánh giá.';

  @override
  String get itProfileTitle => 'Hồ sơ định hướng nghề nghiệp';

  @override
  String get itProfileSubtitle => 'Hồ sơ năng lực và định hướng nghề nghiệp';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get journalAlreadyWrittenInList =>
      'Bạn đã viết nhật ký cho hoạt động này.';

  @override
  String get journalEmptyTitle => 'Chưa có hoạt động nào';

  @override
  String get journalEmptyDescription =>
      'Hãy đăng ký tham gia hoạt động tại Trạm trải nghiệm. Sau đó bạn có thể viết nhật ký và ghi lại những điều đã học được.';

  @override
  String get journalLoginRequired => 'Vui lòng đăng nhập để xem nhật ký.';

  @override
  String get journalHistory => 'Lịch sử của bạn';

  @override
  String journalActivityCount(int count) {
    return '$count hoạt động';
  }

  @override
  String get journalTitle => 'Nhật ký thực chiến';

  @override
  String get journalSubtitle => 'Ghi lại trải nghiệm – Kiến tạo định hướng';

  @override
  String get journalRatingRequired =>
      'Vui lòng đánh giá mức độ hứng thú và độ khó.';

  @override
  String get journalAlreadyWritten =>
      'Bạn đã viết nhật ký cho hoạt động này rồi.';

  @override
  String get journalAlreadySubmitted => 'Nhật ký này đã được gửi trước đó.';

  @override
  String get journalSubmitSuccess => 'Gửi nhật ký thành công!';

  @override
  String get journalCurrentActivity => 'HOẠT ĐỘNG ĐANG THAM GIA';

  @override
  String get journalActivityTypeSoftSkill => 'Kỹ năng mềm';

  @override
  String journalWrittenOn(String date) {
    return 'Đã viết nhật ký · $date';
  }

  @override
  String get journalNotWritten => 'Bạn chưa viết nhật ký cho hoạt động này';

  @override
  String get journalReviewed => 'Đã đánh giá';

  @override
  String get journalWrite => 'Viết nhật ký';

  @override
  String get journalDifficultyTitle => 'Mức độ khó khăn';

  @override
  String get journalDifficultyEasy => 'Dễ';

  @override
  String get journalDifficultyEasyDescription => 'Có thể tự thực hiện';

  @override
  String get journalDifficultyFit => 'Vừa sức';

  @override
  String get journalDifficultyFitDescription => 'Phù hợp với năng lực hiện tại';

  @override
  String get journalDifficultyHard => 'Khó';

  @override
  String get journalDifficultyHardDescription => 'Cần thêm thời gian thực hành';

  @override
  String get journalNoteTitle => 'Cảm nhận của bạn';

  @override
  String get journalNoteHint => 'Chia sẻ những điều bạn học được...';

  @override
  String get journalRatingTitle => 'Mức độ hứng thú';

  @override
  String get journalRatingNotRated => 'Chưa đánh giá';

  @override
  String journalRatingStars(int count) {
    return '$count/5 sao';
  }

  @override
  String get journalRegistered => 'Đã đăng ký';

  @override
  String journalCompletedCount(int count) {
    return '$count nhật ký';
  }

  @override
  String get journalCompleted => 'Đã hoàn thành';

  @override
  String get journalSubmitButton => 'GỬI PHẢN HỒI  →';

  @override
  String get groupInfoCardSection => 'THÔNG TIN NHÓM';

  @override
  String get groupInfoCardTitle => 'Nhóm TechTrail';

  @override
  String get groupInfoCardSubtitle => 'Xem thành viên và công nghệ sử dụng';
}
