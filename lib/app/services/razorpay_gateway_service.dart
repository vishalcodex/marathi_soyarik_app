// import 'dart:developer';

// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class RazorpayPG {
//   Razorpay _razorpay = Razorpay();
//   static late RazorpayPG? _instance = null;

//   static RazorpayPG get getInstance {
//     _instance ??= RazorpayPG();
//     return _instance!;
//   }

//   razorpayPayment(
//     String orderID,
//     // Function _handlePaymentSuccess,
//     // Function _handlePaymentError,
//     // Function _handleExternalWallet,
//   ) async {
//     String? contact = "8459510732";
//     String? email = "vishal.codesk@gmail.com";

//     String amt = (1 * 100).toStringAsFixed(2);

//     if (contact != '' && email != '') {
//       try {
//         //create a razorpayOrder for capture payment automatically

//         // var response = await ApiBaseHelper()
//         //     .postAPICall(createRazorpayOrder, {'order_id': orderID});
//         var razorpayOrderID = "ORDER_ID"; //response['data']['id'];

//         var options = {
//           "key": "",
//           "amount": amt,
//           "name": "Vishal Shinde",
//           'prefill': {"contact": contact, "email": email},
//           'order_id': razorpayOrderID,
//         };
//         _razorpay = Razorpay();
//         _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//         _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//         _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//         _razorpay.open(options);
//       } catch (e) {
//         log(e.toString());
//       }
//     } else {}
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {}

//   void _handlePaymentError(PaymentFailureResponse response) {
//     // var getdata = json.decode(response.message!);
//     log(response.message!);
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {}
// }
