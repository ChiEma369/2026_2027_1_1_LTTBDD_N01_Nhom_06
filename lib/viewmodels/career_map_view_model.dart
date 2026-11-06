import 'package:flutter/foundation.dart';
import 'package:tech_trail/models/niche.dart';
import 'package:tech_trail/data/repositories/app_repository.dart';

class CareerMapViewModel extends ChangeNotifier {
  CareerMapViewModel(this._repo);

  final AppRepository _repo;
  String _query = '';
  String? _selectedFieldId;

  String get query => _query;
  String? get selectedFieldId => _selectedFieldId;
  List<CareerField> get fields => _repo.fields;

  List<Niche> get niches {
    final q = _query.trim().toLowerCase();
    return _repo.featuredNiches.where((n) {
      if (_selectedFieldId != null && n.fieldId != _selectedFieldId)
        return false;
      if (q.isEmpty) return true;
      final d = _repo.detailOf(n.id);
      final haystack = [
        n.name,
        n.shortDescription,
        d?.displayName ?? '',
        d?.tagline ?? '',
        ...?d?.skills,
      ].join(' ').toLowerCase();
      return haystack.contains(q);
    }).toList();
  }

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void selectField(String? fieldId) {
    if (fieldId == _selectedFieldId) return;
    _selectedFieldId = fieldId;
    notifyListeners();
  }
}
