// TODO Implement this library.
import 'package:flutter/material.dart';

class TransactionDetails {
  final String date;
  final String time;
  final String fromName;
  final String fromAmount;
  final String toName;
  final String toAmount;
  final String amountDebited;

  TransactionDetails({
    required this.date,
    required this.time,
    required this.fromName,
    required this.fromAmount,
    required this.toName,
    required this.toAmount,
    required this.amountDebited,
  });
}

class TransactionPage extends StatelessWidget {
  final TransactionDetails transactionDetails = TransactionDetails(
    date: "Dec/10/2021",
    time: "09:40 PM",
    fromName: "Comrade Mohib",
    fromAmount: "100 GBP",
    toName: "Muhammad Mohib",
    toAmount: "30,750.00 PKR",
    amountDebited: "102 GBP",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Transaction Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            transactionDetails.time,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white),
                      Text(
                        transactionDetails.date,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'From',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(transactionDetails.fromName),
                      Text(transactionDetails.fromAmount),
                      const SizedBox(height: 10),
                      const Text(
                        'To',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(transactionDetails.toName),
                      Text(transactionDetails.toAmount),
                      const SizedBox(height: 10),
                      const Text(
                        'Amount Debited',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(transactionDetails.amountDebited),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Image.asset('assets/images/profile.png'),
                  const Text('Thanks for using'),
                  const Text('Remit Union Ltd mobile app.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

