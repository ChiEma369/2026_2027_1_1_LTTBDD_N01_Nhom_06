
import 'package:tech_trail/data/mock/mock_niches.dart';
import 'package:tech_trail/data/mock/mock_niche_details.dart';
import 'package:tech_trail/models/niche.dart';
import 'package:tech_trail/models/niche_detail.dart';

class CareerMapRepository {
  List<CareerField> get fields => mockFields;

  List<Niche> get niches => mockNiches;

  List<Niche> get featuredNiches => mockNiches
      .where((niche) => mockNicheDetails.containsKey(niche.id))
      .toList();

  Niche? nicheById(String id) {
    for (final niche in mockNiches) {
      if (niche.id == id) return niche;
    }
    return null;
  }

  NicheDetail? detailOf(String nicheId) {
    return mockNicheDetails[nicheId];
  }
}