import 'package:flutter/material.dart';

class ThemeTestPage extends StatefulWidget {
  const ThemeTestPage({Key? key}) : super(key: key);

  @override
  State<ThemeTestPage> createState() => _ThemeTestPageState();
}

class _ThemeTestPageState extends State<ThemeTestPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController(text: 'aaaaaa');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Welcome'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 15),
              TextField(
                controller: _nameController,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('TextButton'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.security_sharp),
              ),
              const Card(
                child: Text('This is a Card widget'),
              ),
              const ListTile(
                leading: FlutterLogo(),
                title: Text('This is title'),
                subtitle: Text('This is subtitle'),
                trailing: Icon(Icons.arrow_right),
              ),
              const CircularProgressIndicator.adaptive(),
              const LinearProgressIndicator(),
              const RefreshProgressIndicator(),
              Checkbox(value: false, onChanged: (value) {}),
              Checkbox(value: true, onChanged: (value) {}),
              Radio<bool>(
                  value: false, groupValue: null, onChanged: (value) {}),
              Radio<bool>(value: true, groupValue: null, onChanged: (value) {}),
              Container(
                height: 200,
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      ListTile(
                        title: Text('AAAAA'),
                      ),
                      ListTile(
                        title: Text('AAAAA'),
                      ),
                      ListTile(
                        title: Text('AAAAA'),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              const Text(
                'aaa',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
    );
  }
}
