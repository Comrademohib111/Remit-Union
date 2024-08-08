import 'package:flutter/material.dart';

class Beneficiary {
  final String initials;
  final String name;

  Beneficiary({required this.initials, required this.name});
}

class BeneficiaryListPage extends StatefulWidget {
  @override
  _BeneficiaryListPageState createState() => _BeneficiaryListPageState();
}

class _BeneficiaryListPageState extends State<BeneficiaryListPage> {
  final List<Beneficiary> beneficiaries = [
    Beneficiary(initials: 'HK', name: 'Hammmad Khan'),
    Beneficiary(initials: 'MW', name: 'Munim Waleed'),
    Beneficiary(initials: 'SN', name: 'Saad Nadeem'),
    Beneficiary(initials: 'SA', name: 'Syed Adeel'),
    Beneficiary(initials: 'SK', name: 'Shehryar Khan'),
  ];

  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add your action here for each button tap
    switch (index) {
      case 0:
      // Navigate to Dashboard
        print('Dashboard tapped');
        break;
      case 1:
      // Navigate to Recipients
        print('Recipients tapped');
        break;
      case 2:
      // Navigate to Send
        print('Send tapped');
        break;
      case 3:
      // Navigate to Documents
        print('Documents tapped');
        break;
      case 4:
      // Navigate to Settings
        print('Settings tapped');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Beneficiary List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Beneficiary',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle add beneficiary action
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Beneficiary'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: beneficiaries.length,
                itemBuilder: (context, index) {
                  final beneficiary = beneficiaries[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(beneficiary.initials),
                    ),
                    title: Text(beneficiary.name),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle beneficiary tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Recipients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Send',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.black87,
        onTap: _onBottomNavItemTapped,
      ),
    );
  }
}
