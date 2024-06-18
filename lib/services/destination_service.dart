import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_plane/handlers/log_utility.dart';
import 'package:my_plane/models/destination_model.dart';

class DestinationSerivice {
  CollectionReference destination =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> getDestinations() async {
    try {
      QuerySnapshot result =
          await destination.where('status', isEqualTo: 'popular').get();
      List<DestinationModel> destinations = result.docs
          .map((e) =>
              DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      LogUtility.logSuccess("Success get destinations: $destinations");

      return destinations;
    } catch (e) {
      LogUtility.logError("Error get destinations: $e");
      rethrow;
    }
  }

  Future<List<DestinationModel>> getDestinationNew() async {
    try {
      QuerySnapshot result =
          await destination.where('status', isEqualTo: 'new').get();
      List<DestinationModel> destinations = result.docs
          .map((e) =>
              DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      LogUtility.logSuccess("Success get destinations: $destinations");

      return destinations;
    } catch (e) {
      LogUtility.logError("Error get destinations: $e");
      rethrow;
    }
  }
}
