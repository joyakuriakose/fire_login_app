import 'package:fire_login_app/presets/api_paths.dart';

import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';

abstract class HomePageServices {
  static Future<ApiResp> getHomeList(int PrmCmpId,int PrmBrId) async {
    dynamic resp;
    await errMAsync(() async {
      resp = await MyDio().get("${ApiPaths.homePage}?PrmCmpId=$PrmCmpId&PrmBrId=$PrmBrId");
    });

    return resp != null
        ? ApiResp(
      ok: true,
      rdata: resp,
      msgs: [
        ApiMsg(
          msg: "",
          msgType: "",
          title: "Success",
        )
      ],
    )
        : ApiResp(
      ok: false,
      rdata: resp,
      msgs: [
        ApiMsg(
          msg: "Server response failed",
          msgType: "0",
          title: "Failed",
        )
      ],
    );
  }
}



