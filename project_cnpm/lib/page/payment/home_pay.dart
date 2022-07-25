import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Thanh Toán'),
          onPressed: () async{
            var request = BraintreeDropInRequest(
              // chèn key paypal
              tokenizationKey: 'sandbox_243r7pxg_y5rkw4rg4cpz4rz3',
              collectDeviceData: true,
              paypalRequest: BraintreePayPalRequest(
                amount: '10.00',
                displayName: 'Ha Yen',
              ),
              cardEnabled: true
            );
            BraintreeDropInResult? result =
                await BraintreeDropIn.start(request);
            if(result != null) {
              print(result.paymentMethodNonce.description);
              print(result.paymentMethodNonce.nonce);
            }
          },
        ),
      ),
    );
  }
  }

