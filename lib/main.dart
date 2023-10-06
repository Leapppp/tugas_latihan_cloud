import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo User Interface',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GroupListScreen(),
    );
  }
}

class GroupListScreen extends StatelessWidget {
  final List<String> groupNames = ['Rafael', 'Mia', 'Jessica'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KELOMPOK 3'),
      ),
      body: ListView.builder(
        itemCount: groupNames.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${groupNames[index]}'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MemberDetailsScreen(groupName: groupNames[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MemberDetailsScreen extends StatelessWidget {
  final String groupName;

  const MemberDetailsScreen({required this.groupName});

  @override
  Widget build(BuildContext context) {
    // Dummy data for member details
    Map<String, String> memberDetails = {
      'Rafael': 'Rafael Pangestu\nNIM: 32210070\nTanggal Lahir: 31/08/2003',
      'Mia': 'Mia\nNIM: 32210073\nTanggal Lahir: 06/07/2003',
      'Jessica': 'Jessica Angelina\nNIM: 32210106\nTanggal Lahir: 16/10/2003',
    };

    String details = memberDetails[groupName] ?? 'Details not found';

    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata $groupName'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            details,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}