import 'package:get/get.dart';
import 'package:tes_transisi_app/model/user.dart';
import 'package:tes_transisi_app/network/network_helper.dart';

class DetailEmployeeController extends GetxController {
  final DioClient client = DioClient();
  var isLoading = false.obs;
  User? userModel;
  String? userID ;

  @override
  void onInit()  {
    super.onInit();
    userID = Get.arguments;
    if (userID != null) getData();
  }

  @override
  void onClose() {}

  Future getData() async {
    isLoading(true);
    var res = await client.fetchDataSpesific(idUser: userID ?? '');
    if (res != null) {
      userModel = res;
    }
    isLoading(false);
  }
}
