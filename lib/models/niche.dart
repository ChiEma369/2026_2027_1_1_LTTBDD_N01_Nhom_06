/// Khối ngành lớn (5 khối)
class CareerField {
  final String id;
  final String name;
  final String shortName;
  const CareerField({
    required this.id,
    required this.name,
    this.shortName = '',
  });
}

/// Ngách nghề thuộc một khối ngành
class Niche {
  final String id;
  final String fieldId;
  final String name;
  final String shortDescription;
  final bool isPriority;
  final String? jobDescription;
  final List<String> roadmap;

  const Niche({
    required this.id,
    required this.fieldId,
    required this.name,
    required this.shortDescription,
    this.isPriority = false,
    this.jobDescription,
    this.roadmap = const [],
  });
}
