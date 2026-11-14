/// Khối ngành lớn (5 khối)
class CareerField {
  final String id;
  final String nameVi;
  final String nameEn;
  final String shortNameVi;
  final String shortNameEn;

  const CareerField({
    required this.id,
    required this.nameVi,
    required this.nameEn,
    this.shortNameVi = '',
    this.shortNameEn = '',
  });

  // Tên nhóm ngành luôn sử dụng thuật ngữ tiếng Anh
  String get name => nameEn;
  String get shortName => shortNameEn;

  String nameOf(String languageCode) => nameEn;
  String shortNameOf(String languageCode) => shortNameEn;
}

/// Ngách nghề thuộc một khối ngành
class Niche {
  final String id;
  final String fieldId;

  final String nameVi;
  final String nameEn;

  final String shortDescriptionVi;
  final String shortDescriptionEn;

  final bool isPriority;

  final String? jobDescriptionVi;
  final String? jobDescriptionEn;

  final List<String> roadmapVi;
  final List<String> roadmapEn;

  const Niche({
    required this.id,
    required this.fieldId,
    required this.nameVi,
    required this.nameEn,
    required this.shortDescriptionVi,
    required this.shortDescriptionEn,
    this.isPriority = false,
    this.jobDescriptionVi,
    this.jobDescriptionEn,
    this.roadmapVi = const [],
    this.roadmapEn = const [],
  });
  // Tên ngách nghề luôn sử dụng thuật ngữ tiếng Anh
  String get name => nameEn;
  String nameOf(String languageCode) => nameEn;

  // Tương thích với code cũ
  String get shortDescription => shortDescriptionVi;
  String? get jobDescription => jobDescriptionVi;
  List<String> get roadmap => roadmapVi;

  String shortDescriptionOf(String languageCode) =>
      languageCode == 'en' ? shortDescriptionEn : shortDescriptionVi;

  String? jobDescriptionOf(String languageCode) =>
      languageCode == 'en' ? jobDescriptionEn : jobDescriptionVi;

  List<String> roadmapOf(String languageCode) =>
      languageCode == 'en' ? roadmapEn : roadmapVi;
}
