abstract class DataService {
  Future<dynamic> getData({
    required String endPoint,
    Map<String, dynamic>? filters,
  });

  Future<dynamic> updateData({
    required String endPoint,
    required Map<String, dynamic> data,
    required String id,
  });

  Future<dynamic> deleteData({required String endPoint, required String id});
}
