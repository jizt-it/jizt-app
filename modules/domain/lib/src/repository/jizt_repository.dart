import 'package:domain/domain.dart';

/// JiztRepository contract. The implementation of the repository interface
/// resides in the Data layer (Dependency Inversion).
abstract class JiztRepository {
  Future<Summary> requestSummary(SummaryRequest request);

  Future<Summary?> getSummary(String id);

  Future<List<Summary>> getAllSummaries();

  Stream<List<Summary>> streamAllSummaries();

  Future<void> deleteSummary(String id);
}
