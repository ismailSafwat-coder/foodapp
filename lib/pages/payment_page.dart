import 'package:ecommercerapp/pages/delivaryprogress_page.dart';
import 'package:ecommercerapp/widget/mybuttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void userTapPay() {
    // Ensure formKey is not null and validate the form.
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      // Show confirmation dialog after validation.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Payment'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Card Holder Name: $cardHolderName"),
                  Text("Card Number: $cardNumber"),
                  Text("Expiry Date: $expiryDate"),
                  Text("CVV Code: $cvvCode"),
                ],
              ),
            ),
            actions: [
              // 'Yes' button confirms payment and proceeds
              TextButton(
                onPressed: () {
                  // Close dialog and proceed (maybe to a payment success page)
                  Navigator.pop(context);
                  // Navigate to a different page (like payment confirmation)
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DelivaryprogressPage()));
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
              // 'Cancel' button closes the dialog
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ],
          );
        },
      );
    } else {
      // Show some feedback if the form isn't validated.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all required fields.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          'payment page',
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey),
            Container(
              margin: const EdgeInsets.only(right: 15, left: 15, top: 50),
              child: Mybuttom(
                text: 'pay now',
                onTap: userTapPay,
              ),
            )
          ],
        ),
      ),
    );
  }
}
