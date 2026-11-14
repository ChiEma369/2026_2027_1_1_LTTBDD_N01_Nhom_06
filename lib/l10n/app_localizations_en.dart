// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TechTrail';

  @override
  String get tabCareerMap => 'Career Map';

  @override
  String get tabActivities => 'Experience Hub';

  @override
  String get tabJournal => 'Journal';

  @override
  String get tabProfile => 'Profile';

  @override
  String get tabAccount => 'Account';

  @override
  String careerMapGreeting(String name) {
    return 'Hello, $name 👋';
  }

  @override
  String groupInfoMemberCount(int count) {
    return '$count members';
  }

  @override
  String get groupInfoTitle => 'Group Information';

  @override
  String get groupInfoTagline => 'Explore Careers - Build the Future';

  @override
  String get groupInfoCopyright =>
      '© 2026 TechTrail. All rights reserved by the development team.';

  @override
  String get groupInfoCourseSection => 'COURSE / PROJECT INFORMATION';

  @override
  String get groupInfoCourseName => 'Mobile Application Development';

  @override
  String get groupInfoLecturerLabel => 'INSTRUCTOR';

  @override
  String get groupInfoClassSemesterLabel => 'CLASS / SEMESTER';

  @override
  String get groupInfoMembersTitle => 'TEAM MEMBERS';

  @override
  String get groupInfoTechnologiesTitle => 'TECHNOLOGIES USED';

  @override
  String get groupInfoLeaderRole => 'Team Leader';

  @override
  String get groupInfoMemberRole => 'Member';

  @override
  String get groupInfoStudentIdLabel => 'Student ID:';

  @override
  String get groupInfoTaskLabel => '♙ Responsible for:';

  @override
  String get groupInfoTaskLeader => 'Analysis, Management and Backend';

  @override
  String get groupInfoTaskUiUx => 'UI/UX and Features';

  @override
  String get groupInfoTaskIntegration => 'Practical Work and Integration';

  @override
  String get groupInfoUiFramework => 'UI Framework';

  @override
  String get groupInfoProgrammingLanguage => 'Programming Language';

  @override
  String get groupInfoStateManagement => 'State Management';

  @override
  String get groupInfoArchitecture => 'Architecture';

  @override
  String get careerMapSubtitle => 'Discover the right IT career path for you';

  @override
  String get searchHint => 'Search IT careers, skills...';

  @override
  String get filterAll => 'All';

  @override
  String get viewDetail => 'View details';

  @override
  String activityParticipantCount(int count) {
    return '$count participants';
  }

  @override
  String get activityViewDetails => 'View activity';

  @override
  String skillsMore(int count) {
    return '+$count skills';
  }

  @override
  String get noResults => 'No matching careers found';

  @override
  String get matchBadge => 'A good match for you';

  @override
  String get ratingVeryFit => 'Very suitable';

  @override
  String learnersFollowing(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'More than $countString young learners are following this path';
  }

  @override
  String get statSalary => 'Salary';

  @override
  String get statDemand => 'Job demand';

  @override
  String get statWorkMode => 'Work arrangement';

  @override
  String get dailyWorkTitle => 'Daily responsibilities';

  @override
  String get realisticTag => 'Real-world';

  @override
  String get roadmapTitle => 'Learning roadmap';

  @override
  String roadmapStageCount(int count) {
    return '$count learning stages';
  }

  @override
  String get stageLabel => 'STAGE';

  @override
  String get stageTagFoundation => 'Foundation';

  @override
  String get stageTagCore => 'Core';

  @override
  String get stageTagApplied => 'Applied';

  @override
  String get stageTagAdvanced => 'Advanced';

  @override
  String stageDuration(String value) {
    return 'Duration: $value';
  }

  @override
  String get experienceTitle => 'Experience Hub';

  @override
  String get experienceSubtitle => 'Try before choosing your IT career path';

  @override
  String get experienceSearchHint => 'Search activities, careers, skills...';

  @override
  String get experienceFilterSoftSkill => 'Soft Skills';

  @override
  String get experienceNoResults => 'No matching activities found';

  @override
  String get experienceNoResultsHint => 'Try changing your keyword or filter.';

  @override
  String get activityDetailTitle => 'Activity Details';

  @override
  String get activityHeroEyebrow => 'LEARN THROUGH EXPERIENCE';

  @override
  String get activityHeroHeadline => 'EXPLORE · PRACTICE · GROW';

  @override
  String get activityHeroStatus => 'READY';

  @override
  String get activityField => 'FIELD';

  @override
  String get activityDifficulty => 'DIFFICULTY';

  @override
  String get activityDuration => 'DURATION';

  @override
  String get activityPracticalContent => 'Practical Steps';

  @override
  String activityStepCount(int count) {
    return '$count steps';
  }

  @override
  String get activityToolsEnvironment => 'Tools & Environment';

  @override
  String get activityRelatedCareers => 'Related Careers';

  @override
  String get activityObjective => 'Activity Objectives';

  @override
  String get activityTypeSoftSkill => 'SOFT SKILLS';

  @override
  String get activityNicheSoftSkill => 'Soft Skills';

  @override
  String get activityNicheInformationTechnology => 'Information Technology';

  @override
  String get activityNicheCybersecurity => 'Cybersecurity';

  @override
  String get activityNicheSystemsNetworks => 'Systems & Networks';

  @override
  String get activityDifficultyBeginner => 'Beginner';

  @override
  String get activityDifficultyIntermediate => 'Intermediate';

  @override
  String get activityDifficultyAdvanced => 'Advanced';

  @override
  String get activityRegistered => 'REGISTERED';

  @override
  String get activityRegister => 'REGISTER NOW';

  @override
  String get updateSuccess => 'Information updated successfully';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get vietnamese => 'Vietnamese';

  @override
  String get english => 'English';

  @override
  String get accountNotFound => 'Account not found';

  @override
  String get profileMajorNotUpdated => 'Not updated yet';

  @override
  String get profileAccountInformation => 'Account Information';

  @override
  String get profileHeaderTitle => 'Personal Profile';

  @override
  String get profileHeaderSubtitle => 'Explore · Experience · Orient';

  @override
  String get profileFullName => 'Full name';

  @override
  String get profilePhoneNumber => 'Phone number';

  @override
  String get profileClassName => 'Class / Cohort';

  @override
  String get profileMajor => 'Major';

  @override
  String get profileEditButton => 'Edit Profile';

  @override
  String get profileLogoutButton => 'Log out';

  @override
  String get profileEditClassLabel => 'Class';

  @override
  String get profileCancel => 'Cancel';

  @override
  String get profileSaveChanges => 'Save Changes';

  @override
  String get profileFullNameRequired => 'Full name cannot be empty.';

  @override
  String get itProfileDefaultName => 'User';

  @override
  String get itProfileCareerDirection => 'Career Direction';

  @override
  String get itProfileCareerDirectionEmpty =>
      'No career direction results yet.';

  @override
  String get itProfileAssessmentResult => 'Assessment Results';

  @override
  String get itProfileAssessmentEmpty =>
      'Complete the assessment to see how well you match different IT fields.';

  @override
  String get itProfileStrengths => 'Your Strengths';

  @override
  String get itProfileStrengthsEmpty =>
      'Your personal strengths will appear once assessment data is available.';

  @override
  String get itProfileTitle => 'IT Profile';

  @override
  String get itProfileSubtitle => 'Competency Profile and Career Orientation';

  @override
  String get language => 'Language';

  @override
  String get journalAlreadyWrittenInList =>
      'You have already written a journal for this activity.';

  @override
  String get journalEmptyTitle => 'No activities yet';

  @override
  String get journalEmptyDescription =>
      'Register for an activity in the Experience Hub. Then you can write a journal to record what you have learned.';

  @override
  String get journalLoginRequired => 'Please log in to view your journal.';

  @override
  String get journalHistory => 'Your history';

  @override
  String journalActivityCount(int count) {
    return '$count activities';
  }

  @override
  String get journalTitle => 'Activity Journal';

  @override
  String get journalSubtitle =>
      'Record your experiences – Shape your career path';

  @override
  String get journalRatingRequired =>
      'Please rate your interest and the difficulty level.';

  @override
  String get journalAlreadyWritten =>
      'You have already written a journal for this activity.';

  @override
  String get journalAlreadySubmitted =>
      'This journal has already been submitted.';

  @override
  String get journalSubmitSuccess => 'Journal submitted successfully!';

  @override
  String get journalCurrentActivity => 'CURRENT ACTIVITY';

  @override
  String get journalActivityTypeSoftSkill => 'Soft Skills';

  @override
  String journalWrittenOn(String date) {
    return 'Journal written · $date';
  }

  @override
  String get journalNotWritten =>
      'You have not written a journal for this activity';

  @override
  String get journalReviewed => 'Reviewed';

  @override
  String get journalWrite => 'Write journal';

  @override
  String get journalDifficultyTitle => 'Difficulty level';

  @override
  String get journalDifficultyEasy => 'Easy';

  @override
  String get journalDifficultyEasyDescription =>
      'Can be completed independently';

  @override
  String get journalDifficultyFit => 'Manageable';

  @override
  String get journalDifficultyFitDescription =>
      'Suitable for your current abilities';

  @override
  String get journalDifficultyHard => 'Difficult';

  @override
  String get journalDifficultyHardDescription => 'Requires more practice time';

  @override
  String get journalNoteTitle => 'Your thoughts';

  @override
  String get journalNoteHint => 'Share what you have learned...';

  @override
  String get journalRatingTitle => 'Interest level';

  @override
  String get journalRatingNotRated => 'Not rated';

  @override
  String journalRatingStars(int count) {
    return '$count/5 stars';
  }

  @override
  String get journalRegistered => 'Registered';

  @override
  String journalCompletedCount(int count) {
    return '$count journals';
  }

  @override
  String get journalCompleted => 'Completed';

  @override
  String get journalSubmitButton => 'SUBMIT FEEDBACK  →';

  @override
  String get groupInfoCardSection => 'GROUP INFORMATION';

  @override
  String get groupInfoCardTitle => 'TechTrail Team';

  @override
  String get groupInfoCardSubtitle => 'View team members and technologies used';
}
