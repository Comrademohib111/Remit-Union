import 'package:flutter/material.dart';


class TransactionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction List'),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Transaction',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Recent Transactions
            const Text(
              'Recent Transaction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildRecentTransactionTile("UA", "Uzair Awan", "RU1236547879"),
                const SizedBox(width: 10),
                _buildRecentTransactionTile("AZ", "Aqib Zahid", "RU1230578979"),
              ],
            ),
            const SizedBox(height: 20),

            // Other Transactions
            const Text(
              'Other Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionItem(
                      "UA", "Uzair Awan", "RU1236547879", "In-process", Colors.green),
                  _buildTransactionItem(
                      "AA", "Attique Awan", "RU1236547123", "Compliance Hold", Colors.orange),
                  _buildTransactionItem(
                      "IA", "Inam Ali", "RU1236547124", "Rejected", Colors.red),
                  _buildTransactionItem(
                      "AZ", "Aqib Zahid", "RU1236547125", "Received", Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactionTile(String initials, String name, String id) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text(initials),
            ),
            const SizedBox(height: 8),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(id, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String initials, String name, String id, String status, Color statusColor) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(initials),
      ),
      title: Text(name),
      subtitle: Text(id),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(status, style: TextStyle(color: statusColor)),
          Text('45.10 GBP', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
