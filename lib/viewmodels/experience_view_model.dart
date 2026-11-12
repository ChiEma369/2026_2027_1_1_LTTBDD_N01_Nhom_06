import 'package:flutter/material.dart';
import 'package:tech_trail/data/repositories/activity_repository.dart';
import 'package:tech_trail/models/activity.dart';
import 'package:tech_trail/data/mock/mock_niches.dart';

class ExperienceViewModel extends ChangeNotifier {
  final ActivityRepository _repository;

  ExperienceViewModel(this._repository);

  ActivityType? _selectedType;
  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  ActivityType? get selectedType => _selectedType;
  String _getCareerName(String? nicheId) {
    for (final niche in mockNiches) {
      if (niche.id == nicheId) {
        return '${niche.name} ${niche.shortDescription}';
      }
    }
    return '';
  }

  // Danh sách hoạt động sau khi lọc.
  List<Activity> get filteredActivities {
    final query = _searchQuery.trim().toLowerCase();

    return _repository.activities.where((activity) {
      final matchesType =
          _selectedType == null || activity.type == _selectedType;

      final careerName = _getCareerName(activity.nicheId);

      final searchableContent = [
        activity.title,
        activity.description,
        activity.objective,
        activity.relatedCareer,
        activity.relatedCareerDescription,
        careerName,
        ...activity.tools,
      ].join(' ').toLowerCase();

      final matchesQuery =
          query.isEmpty ||
          (query.length <= 2
              ? searchableContent
                    .split(RegExp(r'[\s/(),.-]+'))
                    .contains(query)
              : searchableContent.contains(query));
      return matchesType && matchesQuery;
    }).toList();
  }

  // Thay đổi bộ lọc.
  void selectType(ActivityType? type) {
    _selectedType = type;
    notifyListeners();
  }

  // Tìm kiếm hoạt động.
  void searchActivities(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
