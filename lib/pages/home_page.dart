import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Define the pages for each tab
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Profile Page'),
  ];

  // Function to handle tab change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded( // Prevents overflow
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Options(),
                    BannerWidget(), // Renamed Banner class to BannerWidget to avoid conflicts with the Flutter Banner class
                    Recent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(), // Place bottom navigation here
    );
  }

  // Method to create BottomNavigationBar
  Widget bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.only(top: 29, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mando",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Pathway,",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "What would you like to do today?",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Adding wallet information separately
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wallet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "\$2100",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildOption(Icons.call_received, "Request"),
          _buildOption(Icons.add, "Add money"),
          _buildOption(Icons.book, "Passbook"),
          _buildOption(Icons.call_made, "Pay"),
        ],
      ),
    );
  }

  // Reusable widget for the option buttons
  Widget _buildOption(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          height: 70,
          width: 70,
          child: Icon(icon, color: Colors.brown, size: 40),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Introducing",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Virtual Banking",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Start your Digital Saving \nAccount today!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 30,
          bottom: 0,
          top: 0,
          child: Image.asset("assets/images/—Pngtree—cartoon man walking with mobile_4538451.png"),
        ),
      ],
    );
  }
}

class Recent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Recents",
          style: TextStyle(fontSize: 20),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRecentItem(Icons.food_bank, "Food"),
              _buildRecentItem(Icons.receipt, "Bill"),
              _buildRecentItem(Icons.attach_money_rounded, "Loan"),
              _buildRecentItem(Icons.local_hospital, "Hospital"),
            ],
          ),
        ),
      ],
    );
  }

  // Reusable widget for the recent items
  Widget _buildRecentItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          height: 70,
          width: 70,
          child: Icon(icon, color: Colors.brown, size: 40),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
