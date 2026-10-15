abstract class DataService {
  Future<dynamic> getData({
    required String endPoint,
    Map<String, dynamic>? filters,
  });
}
