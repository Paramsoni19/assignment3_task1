import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Navigation Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  String email = '';
  String rollNo = '';
  String phoneNo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldSample(
              onChangedName: (value) {
                setState(() {
                  name = value;
                });
              },
              onChangedEmail: (value) {
                setState(() {
                  email = value;
                });
              },
              onChangedRollNo: (value) {
                setState(() {
                  rollNo = value;
                });
              },
              onChangedPhoneNo: (value) {
                setState(() {
                  phoneNo = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                var userDetails = 'Name: $name\nEmail: $email\nRoll no: $rollNo\nPhone no: $phoneNo';
                var message = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return SecondPage(userDetails: userDetails);
                }));
                
                print(message);
                userLogoutPopup(name);
                clearFields();
              },
              child: const Text('Show Details'),
            ),
          ],
        ),
      ),
    );

  
}
void clearFields() {
  setState(() {
    name = '';
    email = '';
    rollNo = '';
    phoneNo = '';
  });
  }

  void userLogoutPopup(String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User $username Logged out'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.userDetails}) : super(key: key);
  final String userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User Details:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              userDetails,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "Returned from SecondPage");
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldSample extends StatelessWidget {
  const TextFieldSample({
    Key? key,
    required this.onChangedName,
    required this.onChangedEmail,
    required this.onChangedRollNo,
    required this.onChangedPhoneNo,
  }) : super(key: key);

  final Function(String) onChangedName;
  final Function(String) onChangedEmail;
  final Function(String) onChangedRollNo;
  final Function(String) onChangedPhoneNo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          TextField(
            onChanged: onChangedName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: onChangedEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: onChangedRollNo,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Roll No',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: onChangedPhoneNo,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone No',
            ),
          ),
        ],
      ),
    );
  }
}
