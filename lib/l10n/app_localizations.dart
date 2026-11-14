import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In vi, this message translates to:
  /// **'TechTrail'**
  String get appTitle;

  /// No description provided for @tabCareerMap.
  ///
  /// In vi, this message translates to:
  /// **'Khám phá nghề nghiệp'**
  String get tabCareerMap;

  /// No description provided for @tabActivities.
  ///
  /// In vi, this message translates to:
  /// **'Trạm trải nghiệm'**
  String get tabActivities;

  /// No description provided for @tabJournal.
  ///
  /// In vi, this message translates to:
  /// **'Nhật ký'**
  String get tabJournal;

  /// No description provided for @tabProfile.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ'**
  String get tabProfile;

  /// No description provided for @tabAccount.
  ///
  /// In vi, this message translates to:
  /// **'Cá nhân'**
  String get tabAccount;

  /// No description provided for @careerMapGreeting.
  ///
  /// In vi, this message translates to:
  /// **'Xin chào, {name} 👋'**
  String careerMapGreeting(String name);

  /// No description provided for @groupInfoMemberCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} thành viên'**
  String groupInfoMemberCount(int count);

  /// No description provided for @groupInfoTitle.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin nhóm'**
  String get groupInfoTitle;

  /// No description provided for @groupInfoTagline.
  ///
  /// In vi, this message translates to:
  /// **'Khám phá nghề nghiệp - Kiến tạo tương lai'**
  String get groupInfoTagline;

  /// No description provided for @groupInfoCopyright.
  ///
  /// In vi, this message translates to:
  /// **'© 2026 TechTrail. Bản quyền thuộc về nhóm phát triển.'**
  String get groupInfoCopyright;

  /// No description provided for @groupInfoCourseSection.
  ///
  /// In vi, this message translates to:
  /// **'THÔNG TIN MÔN HỌC / ĐỒ ÁN'**
  String get groupInfoCourseSection;

  /// No description provided for @groupInfoCourseName.
  ///
  /// In vi, this message translates to:
  /// **'Phát triển ứng dụng Di động'**
  String get groupInfoCourseName;

  /// No description provided for @groupInfoLecturerLabel.
  ///
  /// In vi, this message translates to:
  /// **'GIẢNG VIÊN HƯỚNG DẪN'**
  String get groupInfoLecturerLabel;

  /// No description provided for @groupInfoClassSemesterLabel.
  ///
  /// In vi, this message translates to:
  /// **'LỚP HỌC PHẦN / KỲ'**
  String get groupInfoClassSemesterLabel;

  /// No description provided for @groupInfoMembersTitle.
  ///
  /// In vi, this message translates to:
  /// **'THÀNH VIÊN NHÓM'**
  String get groupInfoMembersTitle;

  /// No description provided for @groupInfoTechnologiesTitle.
  ///
  /// In vi, this message translates to:
  /// **'CÔNG NGHỆ SỬ DỤNG'**
  String get groupInfoTechnologiesTitle;

  /// No description provided for @groupInfoLeaderRole.
  ///
  /// In vi, this message translates to:
  /// **'Trưởng nhóm'**
  String get groupInfoLeaderRole;

  /// No description provided for @groupInfoMemberRole.
  ///
  /// In vi, this message translates to:
  /// **'Thành viên'**
  String get groupInfoMemberRole;

  /// No description provided for @groupInfoStudentIdLabel.
  ///
  /// In vi, this message translates to:
  /// **'MSSV:'**
  String get groupInfoStudentIdLabel;

  /// No description provided for @groupInfoTaskLabel.
  ///
  /// In vi, this message translates to:
  /// **'♙ Phụ trách:'**
  String get groupInfoTaskLabel;

  /// No description provided for @groupInfoTaskLeader.
  ///
  /// In vi, this message translates to:
  /// **'Phân tích, quản lý và Backend'**
  String get groupInfoTaskLeader;

  /// No description provided for @groupInfoTaskUiUx.
  ///
  /// In vi, this message translates to:
  /// **'UI/UX và tính năng'**
  String get groupInfoTaskUiUx;

  /// No description provided for @groupInfoTaskIntegration.
  ///
  /// In vi, this message translates to:
  /// **'Thực tế và tích hợp'**
  String get groupInfoTaskIntegration;

  /// No description provided for @groupInfoUiFramework.
  ///
  /// In vi, this message translates to:
  /// **'Khung giao diện'**
  String get groupInfoUiFramework;

  /// No description provided for @groupInfoProgrammingLanguage.
  ///
  /// In vi, this message translates to:
  /// **'Ngôn ngữ lập trình'**
  String get groupInfoProgrammingLanguage;

  /// No description provided for @groupInfoStateManagement.
  ///
  /// In vi, this message translates to:
  /// **'Quản lý trạng thái'**
  String get groupInfoStateManagement;

  /// No description provided for @groupInfoArchitecture.
  ///
  /// In vi, this message translates to:
  /// **'Kiến trúc'**
  String get groupInfoArchitecture;

  /// No description provided for @careerMapSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Khám phá con đường nghề nghiệp IT phù hợp'**
  String get careerMapSubtitle;

  /// No description provided for @searchHint.
  ///
  /// In vi, this message translates to:
  /// **'Tìm kiếm nghề nghiệp IT, kỹ năng...'**
  String get searchHint;

  /// No description provided for @filterAll.
  ///
  /// In vi, this message translates to:
  /// **'Tất cả'**
  String get filterAll;

  /// No description provided for @viewDetail.
  ///
  /// In vi, this message translates to:
  /// **'Xem chi tiết'**
  String get viewDetail;

  /// No description provided for @activityParticipantCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} người'**
  String activityParticipantCount(int count);

  /// No description provided for @activityViewDetails.
  ///
  /// In vi, this message translates to:
  /// **'Xem hoạt động'**
  String get activityViewDetails;

  /// No description provided for @skillsMore.
  ///
  /// In vi, this message translates to:
  /// **'+{count} kỹ năng'**
  String skillsMore(int count);

  /// No description provided for @noResults.
  ///
  /// In vi, this message translates to:
  /// **'Không tìm thấy ngành phù hợp'**
  String get noResults;

  /// No description provided for @matchBadge.
  ///
  /// In vi, this message translates to:
  /// **'Phù hợp với bạn'**
  String get matchBadge;

  /// No description provided for @ratingVeryFit.
  ///
  /// In vi, this message translates to:
  /// **'Rất phù hợp'**
  String get ratingVeryFit;

  /// No description provided for @learnersFollowing.
  ///
  /// In vi, this message translates to:
  /// **'Hơn {count} bạn trẻ đang đi theo lộ trình này'**
  String learnersFollowing(int count);

  /// No description provided for @statSalary.
  ///
  /// In vi, this message translates to:
  /// **'Mức lương'**
  String get statSalary;

  /// No description provided for @statDemand.
  ///
  /// In vi, this message translates to:
  /// **'Nhu cầu'**
  String get statDemand;

  /// No description provided for @statWorkMode.
  ///
  /// In vi, this message translates to:
  /// **'Hình thức làm việc'**
  String get statWorkMode;

  /// No description provided for @dailyWorkTitle.
  ///
  /// In vi, this message translates to:
  /// **'Công việc hằng ngày'**
  String get dailyWorkTitle;

  /// No description provided for @realisticTag.
  ///
  /// In vi, this message translates to:
  /// **'Thực tế'**
  String get realisticTag;

  /// No description provided for @roadmapTitle.
  ///
  /// In vi, this message translates to:
  /// **'Lộ trình học tập'**
  String get roadmapTitle;

  /// No description provided for @roadmapStageCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} chặng chuyên sâu'**
  String roadmapStageCount(int count);

  /// No description provided for @stageLabel.
  ///
  /// In vi, this message translates to:
  /// **'CHẶNG'**
  String get stageLabel;

  /// No description provided for @stageTagFoundation.
  ///
  /// In vi, this message translates to:
  /// **'Nền tảng'**
  String get stageTagFoundation;

  /// No description provided for @stageTagCore.
  ///
  /// In vi, this message translates to:
  /// **'Cốt lõi'**
  String get stageTagCore;

  /// No description provided for @stageTagApplied.
  ///
  /// In vi, this message translates to:
  /// **'Ứng dụng'**
  String get stageTagApplied;

  /// No description provided for @stageTagAdvanced.
  ///
  /// In vi, this message translates to:
  /// **'Nâng cao'**
  String get stageTagAdvanced;

  /// No description provided for @stageDuration.
  ///
  /// In vi, this message translates to:
  /// **'Thời lượng: {value}'**
  String stageDuration(String value);

  /// No description provided for @experienceTitle.
  ///
  /// In vi, this message translates to:
  /// **'Trạm trải nghiệm'**
  String get experienceTitle;

  /// No description provided for @experienceSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Thử trước khi chọn định hướng IT'**
  String get experienceSubtitle;

  /// No description provided for @experienceSearchHint.
  ///
  /// In vi, this message translates to:
  /// **'Tìm hoạt động, nghề nghiệp, kỹ năng...'**
  String get experienceSearchHint;

  /// No description provided for @experienceFilterSoftSkill.
  ///
  /// In vi, this message translates to:
  /// **'Kỹ năng mềm'**
  String get experienceFilterSoftSkill;

  /// No description provided for @experienceNoResults.
  ///
  /// In vi, this message translates to:
  /// **'Không tìm thấy hoạt động phù hợp'**
  String get experienceNoResults;

  /// No description provided for @experienceNoResultsHint.
  ///
  /// In vi, this message translates to:
  /// **'Thử thay đổi từ khóa hoặc bộ lọc nhé.'**
  String get experienceNoResultsHint;

  /// No description provided for @activityDetailTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chi tiết hoạt động'**
  String get activityDetailTitle;

  /// No description provided for @activityHeroEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'HỌC TẬP QUA TRẢI NGHIỆM'**
  String get activityHeroEyebrow;

  /// No description provided for @activityHeroHeadline.
  ///
  /// In vi, this message translates to:
  /// **'KHÁM PHÁ · THỰC HÀNH · PHÁT TRIỂN'**
  String get activityHeroHeadline;

  /// No description provided for @activityHeroStatus.
  ///
  /// In vi, this message translates to:
  /// **'SẴN SÀNG'**
  String get activityHeroStatus;

  /// No description provided for @activityField.
  ///
  /// In vi, this message translates to:
  /// **'LĨNH VỰC'**
  String get activityField;

  /// No description provided for @activityDifficulty.
  ///
  /// In vi, this message translates to:
  /// **'ĐỘ KHÓ'**
  String get activityDifficulty;

  /// No description provided for @activityDuration.
  ///
  /// In vi, this message translates to:
  /// **'THỜI LƯỢNG'**
  String get activityDuration;

  /// No description provided for @activityPracticalContent.
  ///
  /// In vi, this message translates to:
  /// **'Nội dung thực hành'**
  String get activityPracticalContent;

  /// No description provided for @activityStepCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} bước'**
  String activityStepCount(int count);

  /// No description provided for @activityToolsEnvironment.
  ///
  /// In vi, this message translates to:
  /// **'Công cụ & Môi trường'**
  String get activityToolsEnvironment;

  /// No description provided for @activityRelatedCareers.
  ///
  /// In vi, this message translates to:
  /// **'Nghề nghiệp liên quan'**
  String get activityRelatedCareers;

  /// No description provided for @activityObjective.
  ///
  /// In vi, this message translates to:
  /// **'Mục tiêu hoạt động'**
  String get activityObjective;

  /// No description provided for @activityTypeSoftSkill.
  ///
  /// In vi, this message translates to:
  /// **'KỸ NĂNG MỀM'**
  String get activityTypeSoftSkill;

  /// No description provided for @activityNicheSoftSkill.
  ///
  /// In vi, this message translates to:
  /// **'Kỹ năng mềm'**
  String get activityNicheSoftSkill;

  /// No description provided for @activityNicheInformationTechnology.
  ///
  /// In vi, this message translates to:
  /// **'Công nghệ thông tin'**
  String get activityNicheInformationTechnology;

  /// No description provided for @activityNicheCybersecurity.
  ///
  /// In vi, this message translates to:
  /// **'An toàn thông tin'**
  String get activityNicheCybersecurity;

  /// No description provided for @activityNicheSystemsNetworks.
  ///
  /// In vi, this message translates to:
  /// **'Hệ thống & mạng'**
  String get activityNicheSystemsNetworks;

  /// No description provided for @activityDifficultyBeginner.
  ///
  /// In vi, this message translates to:
  /// **'Cơ bản'**
  String get activityDifficultyBeginner;

  /// No description provided for @activityDifficultyIntermediate.
  ///
  /// In vi, this message translates to:
  /// **'Trung bình'**
  String get activityDifficultyIntermediate;

  /// No description provided for @activityDifficultyAdvanced.
  ///
  /// In vi, this message translates to:
  /// **'Nâng cao'**
  String get activityDifficultyAdvanced;

  /// No description provided for @activityRegistered.
  ///
  /// In vi, this message translates to:
  /// **'ĐÃ ĐĂNG KÝ'**
  String get activityRegistered;

  /// No description provided for @activityRegister.
  ///
  /// In vi, this message translates to:
  /// **'ĐĂNG KÝ THAM GIA'**
  String get activityRegister;

  /// No description provided for @updateSuccess.
  ///
  /// In vi, this message translates to:
  /// **'Cập nhật thông tin thành công'**
  String get updateSuccess;

  /// No description provided for @selectLanguage.
  ///
  /// In vi, this message translates to:
  /// **'Chọn ngôn ngữ'**
  String get selectLanguage;

  /// No description provided for @vietnamese.
  ///
  /// In vi, this message translates to:
  /// **'Tiếng Việt'**
  String get vietnamese;

  /// No description provided for @english.
  ///
  /// In vi, this message translates to:
  /// **'Tiếng Anh'**
  String get english;

  /// No description provided for @accountNotFound.
  ///
  /// In vi, this message translates to:
  /// **'Không tìm thấy tài khoản'**
  String get accountNotFound;

  /// No description provided for @profileMajorNotUpdated.
  ///
  /// In vi, this message translates to:
  /// **'Chưa cập nhật'**
  String get profileMajorNotUpdated;

  /// No description provided for @profileAccountInformation.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin tài khoản'**
  String get profileAccountInformation;

  /// No description provided for @profileHeaderTitle.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ cá nhân'**
  String get profileHeaderTitle;

  /// No description provided for @profileHeaderSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Khám phá · Trải nghiệm · Định hướng'**
  String get profileHeaderSubtitle;

  /// No description provided for @profileFullName.
  ///
  /// In vi, this message translates to:
  /// **'Họ và tên'**
  String get profileFullName;

  /// No description provided for @profilePhoneNumber.
  ///
  /// In vi, this message translates to:
  /// **'Số điện thoại'**
  String get profilePhoneNumber;

  /// No description provided for @profileClassName.
  ///
  /// In vi, this message translates to:
  /// **'Lớp / Khóa'**
  String get profileClassName;

  /// No description provided for @profileMajor.
  ///
  /// In vi, this message translates to:
  /// **'Ngành học'**
  String get profileMajor;

  /// No description provided for @profileEditButton.
  ///
  /// In vi, this message translates to:
  /// **'Chỉnh sửa hồ sơ'**
  String get profileEditButton;

  /// No description provided for @profileLogoutButton.
  ///
  /// In vi, this message translates to:
  /// **'Đăng xuất'**
  String get profileLogoutButton;

  /// No description provided for @profileEditClassLabel.
  ///
  /// In vi, this message translates to:
  /// **'Lớp'**
  String get profileEditClassLabel;

  /// No description provided for @profileCancel.
  ///
  /// In vi, this message translates to:
  /// **'Hủy'**
  String get profileCancel;

  /// No description provided for @profileSaveChanges.
  ///
  /// In vi, this message translates to:
  /// **'Lưu thay đổi'**
  String get profileSaveChanges;

  /// No description provided for @profileFullNameRequired.
  ///
  /// In vi, this message translates to:
  /// **'Họ tên không được để trống.'**
  String get profileFullNameRequired;

  /// No description provided for @itProfileDefaultName.
  ///
  /// In vi, this message translates to:
  /// **'Người dùng'**
  String get itProfileDefaultName;

  /// No description provided for @itProfileCareerDirection.
  ///
  /// In vi, this message translates to:
  /// **'Định hướng nghề nghiệp'**
  String get itProfileCareerDirection;

  /// No description provided for @itProfileCareerDirectionEmpty.
  ///
  /// In vi, this message translates to:
  /// **'Chưa có kết quả định hướng nghề nghiệp.'**
  String get itProfileCareerDirectionEmpty;

  /// No description provided for @itProfileAssessmentResult.
  ///
  /// In vi, this message translates to:
  /// **'Kết quả đánh giá'**
  String get itProfileAssessmentResult;

  /// No description provided for @itProfileAssessmentEmpty.
  ///
  /// In vi, this message translates to:
  /// **'Hoàn thành bài đánh giá để xem mức độ phù hợp với các lĩnh vực IT.'**
  String get itProfileAssessmentEmpty;

  /// No description provided for @itProfileStrengths.
  ///
  /// In vi, this message translates to:
  /// **'Điểm mạnh của bạn'**
  String get itProfileStrengths;

  /// No description provided for @itProfileStrengthsEmpty.
  ///
  /// In vi, this message translates to:
  /// **'Điểm mạnh cá nhân sẽ được hiển thị sau khi có dữ liệu đánh giá.'**
  String get itProfileStrengthsEmpty;

  /// No description provided for @itProfileTitle.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ định hướng nghề nghiệp'**
  String get itProfileTitle;

  /// No description provided for @itProfileSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ năng lực và định hướng nghề nghiệp'**
  String get itProfileSubtitle;

  /// No description provided for @language.
  ///
  /// In vi, this message translates to:
  /// **'Ngôn ngữ'**
  String get language;

  /// No description provided for @journalAlreadyWrittenInList.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đã viết nhật ký cho hoạt động này.'**
  String get journalAlreadyWrittenInList;

  /// No description provided for @journalEmptyTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chưa có hoạt động nào'**
  String get journalEmptyTitle;

  /// No description provided for @journalEmptyDescription.
  ///
  /// In vi, this message translates to:
  /// **'Hãy đăng ký tham gia hoạt động tại Trạm trải nghiệm. Sau đó bạn có thể viết nhật ký và ghi lại những điều đã học được.'**
  String get journalEmptyDescription;

  /// No description provided for @journalLoginRequired.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng đăng nhập để xem nhật ký.'**
  String get journalLoginRequired;

  /// No description provided for @journalHistory.
  ///
  /// In vi, this message translates to:
  /// **'Lịch sử của bạn'**
  String get journalHistory;

  /// No description provided for @journalActivityCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} hoạt động'**
  String journalActivityCount(int count);

  /// No description provided for @journalTitle.
  ///
  /// In vi, this message translates to:
  /// **'Nhật ký thực chiến'**
  String get journalTitle;

  /// No description provided for @journalSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Ghi lại trải nghiệm – Kiến tạo định hướng'**
  String get journalSubtitle;

  /// No description provided for @journalRatingRequired.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng đánh giá mức độ hứng thú và độ khó.'**
  String get journalRatingRequired;

  /// No description provided for @journalAlreadyWritten.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đã viết nhật ký cho hoạt động này rồi.'**
  String get journalAlreadyWritten;

  /// No description provided for @journalAlreadySubmitted.
  ///
  /// In vi, this message translates to:
  /// **'Nhật ký này đã được gửi trước đó.'**
  String get journalAlreadySubmitted;

  /// No description provided for @journalSubmitSuccess.
  ///
  /// In vi, this message translates to:
  /// **'Gửi nhật ký thành công!'**
  String get journalSubmitSuccess;

  /// No description provided for @journalCurrentActivity.
  ///
  /// In vi, this message translates to:
  /// **'HOẠT ĐỘNG ĐANG THAM GIA'**
  String get journalCurrentActivity;

  /// No description provided for @journalActivityTypeSoftSkill.
  ///
  /// In vi, this message translates to:
  /// **'Kỹ năng mềm'**
  String get journalActivityTypeSoftSkill;

  /// No description provided for @journalWrittenOn.
  ///
  /// In vi, this message translates to:
  /// **'Đã viết nhật ký · {date}'**
  String journalWrittenOn(String date);

  /// No description provided for @journalNotWritten.
  ///
  /// In vi, this message translates to:
  /// **'Bạn chưa viết nhật ký cho hoạt động này'**
  String get journalNotWritten;

  /// No description provided for @journalReviewed.
  ///
  /// In vi, this message translates to:
  /// **'Đã đánh giá'**
  String get journalReviewed;

  /// No description provided for @journalWrite.
  ///
  /// In vi, this message translates to:
  /// **'Viết nhật ký'**
  String get journalWrite;

  /// No description provided for @journalDifficultyTitle.
  ///
  /// In vi, this message translates to:
  /// **'Mức độ khó khăn'**
  String get journalDifficultyTitle;

  /// No description provided for @journalDifficultyEasy.
  ///
  /// In vi, this message translates to:
  /// **'Dễ'**
  String get journalDifficultyEasy;

  /// No description provided for @journalDifficultyEasyDescription.
  ///
  /// In vi, this message translates to:
  /// **'Có thể tự thực hiện'**
  String get journalDifficultyEasyDescription;

  /// No description provided for @journalDifficultyFit.
  ///
  /// In vi, this message translates to:
  /// **'Vừa sức'**
  String get journalDifficultyFit;

  /// No description provided for @journalDifficultyFitDescription.
  ///
  /// In vi, this message translates to:
  /// **'Phù hợp với năng lực hiện tại'**
  String get journalDifficultyFitDescription;

  /// No description provided for @journalDifficultyHard.
  ///
  /// In vi, this message translates to:
  /// **'Khó'**
  String get journalDifficultyHard;

  /// No description provided for @journalDifficultyHardDescription.
  ///
  /// In vi, this message translates to:
  /// **'Cần thêm thời gian thực hành'**
  String get journalDifficultyHardDescription;

  /// No description provided for @journalNoteTitle.
  ///
  /// In vi, this message translates to:
  /// **'Cảm nhận của bạn'**
  String get journalNoteTitle;

  /// No description provided for @journalNoteHint.
  ///
  /// In vi, this message translates to:
  /// **'Chia sẻ những điều bạn học được...'**
  String get journalNoteHint;

  /// No description provided for @journalRatingTitle.
  ///
  /// In vi, this message translates to:
  /// **'Mức độ hứng thú'**
  String get journalRatingTitle;

  /// No description provided for @journalRatingNotRated.
  ///
  /// In vi, this message translates to:
  /// **'Chưa đánh giá'**
  String get journalRatingNotRated;

  /// No description provided for @journalRatingStars.
  ///
  /// In vi, this message translates to:
  /// **'{count}/5 sao'**
  String journalRatingStars(int count);

  /// No description provided for @journalRegistered.
  ///
  /// In vi, this message translates to:
  /// **'Đã đăng ký'**
  String get journalRegistered;

  /// No description provided for @journalCompletedCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} nhật ký'**
  String journalCompletedCount(int count);

  /// No description provided for @journalCompleted.
  ///
  /// In vi, this message translates to:
  /// **'Đã hoàn thành'**
  String get journalCompleted;

  /// No description provided for @journalSubmitButton.
  ///
  /// In vi, this message translates to:
  /// **'GỬI PHẢN HỒI  →'**
  String get journalSubmitButton;

  /// No description provided for @groupInfoCardSection.
  ///
  /// In vi, this message translates to:
  /// **'THÔNG TIN NHÓM'**
  String get groupInfoCardSection;

  /// No description provided for @groupInfoCardTitle.
  ///
  /// In vi, this message translates to:
  /// **'Nhóm TechTrail'**
  String get groupInfoCardTitle;

  /// No description provided for @groupInfoCardSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Xem thành viên và công nghệ sử dụng'**
  String get groupInfoCardSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
