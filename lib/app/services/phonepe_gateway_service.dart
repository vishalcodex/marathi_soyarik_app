import 'dart:convert';
// import 'dart:developer' as dev;
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonePePG {
  var result = "";
  String appId = "";
  bool enableLogging = true;
  //
  String callbackUrl = "https://infonexus.in/phonepe/payment/callback";
  String endpoint = "/pg/v1/pay";

  String body = "";
  String checksum = "";
  bool isInitialised = false;
  static PhonePePG? _instance;

  var creds = {
    "PRODUCTION": {
      "env": "PRODUCTION",
      "merch": "M22W6PL1OVYS3",
      "key": "ca16a90b-3370-4f75-a2a9-4a7f0cc5098f",
      "index": 1
    },
    "SANDBOX": {
      "env": "SANDBOX",
      "merch": "PGTESTPAYUAT",
      "key": "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399",
      "index": 1
    },
  };
  var env = "PRODUCTION";
  var ccreds = {
    "env": "SANDBOX",
    "merch": "PGTESTPAYUAT",
    "key": "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399",
    "index": 1
  };

  PhonePePG get getInstance {
    _instance ??= PhonePePG();
    ccreds = creds[env]!;
    return _instance!;
  }

  Future<bool> startPGTransaction(
    BuildContext context,
    String amount,
    int userId,
    String phone,
  ) async {
    if (!isInitialised) {
      return await phonePeInit(context).then((value) async {
        if (value) {
          return await startPGTransaction(context, amount, userId, phone);
        } else {
          return Future.value(false);
        }
      });
    } else {
      body = getChecksum(amount, userId, phone);
      try {
        return await PhonePePaymentSdk.startTransaction(
                body, callbackUrl, checksum, "")
            .then((val) {
          bool isSuccess = false;
          if (val != null) {
            String status = val["status"].toString();
            String error = val["error"].toString();

            if (status == "SUCCESS") {
              result = "Flow Complete status -Success";
              isSuccess = true;
            } else {
              result = "Flow Complete status - $status & error - $error";
              isSuccess = false;
            }
          } else {
            result = "Flow Imcomplete";
            isSuccess = false;
          }
          return isSuccess;
        }).catchError((error) {
          handleError(error);
          return Future.value(false);
        });
      } catch (error) {
        handleError(error);
        return Future.value(false);
      }
    }
    // return Future.value(false);
  }

  void handleError(error) {}

  Future<bool> phonePeInit(BuildContext context) async {
    return await PhonePePaymentSdk.init(ccreds["env"].toString(), appId,
            ccreds["merch"].toString(), enableLogging)
        .then((value) {
      isInitialised = value;
      // PhonePePaymentSdk.getPackageSignatureForAndroid().then((value) {
      //   if (value != null) {
      //     print("ANDROID SIGNATURE: " + value);
      //     dev.log("ANDROID SIGNATURE: " + value);
      //   }
      //   // Utils.globalWarningDialog(
      //   //     context, 'Signature', value!.toString(), true, false, '');
      // });
      return value;
    }).catchError((error) {
      return Future.value(false);
    });
  }

  String getChecksum(String amount, int userId, String phone) {
    var _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    var transactionId = String.fromCharCodes(Iterable.generate(
        15, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

    final reqData = {
      "merchantId": ccreds["merch"],
      "merchantTransactionId": transactionId,
      "merchantUserId": userId,
      "amount": double.parse(amount) * 100,
      "mobileNumber": phone,
      "callbackUrl": callbackUrl,
      "paymentInstrument": {"type": "PAY_PAGE"},
    };
    String base64Body = base64.encode(utf8.encode(json.encode(reqData)));
    checksum =
        "${sha256.convert(utf8.encode(base64Body + endpoint + ccreds["key"].toString())).toString()}###1";

    return base64Body;
  }
}
