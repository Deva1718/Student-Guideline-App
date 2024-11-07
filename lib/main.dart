import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> departments = [
    'Information Technology',
    'Computer Science Engineering',
    'AI and Data Science',
    'AI and Machine Learning',
    'Mechanical Engineering',
    'Electrical Engineering',
    'Communication Engineering',
    'BioTechnology',
    'Chemical Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: const Color.fromARGB(255, 14, 194, 194),
      ),
      drawer: NavigationDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(207, 29, 255, 229),
              const Color.fromARGB(255, 56, 244, 193),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Select Your Department',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: departments.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DomainSelectionScreen(
                                department: departments[index]),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 194, 240, 88),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        departments[index],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Student123"),
            accountEmail: Text("student@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Add profile picture here
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Community'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DomainSelectionScreen extends StatelessWidget {
  final String department;

  DomainSelectionScreen({required this.department});

  final Map<String, List<String>> departmentDomains = {
    'Information Technology': [
      'Programming Skills',
      'Database Management',
      'Networking',
      'Software Engineering',
      'Cloud Computing',
      'Data Science',
    ],
    'Computer Science Engineering': [
      'Programming Skills',
      'Artificial Intelligence',
      'Web Development',
      'Cybersecurity',
      'Machine Learning',
      'Cloud Computing',
    ],
    'AI and Data Science': [
      'Programming Skills',
      'Data Analysis',
      'Machine Learning',
      'Data Visualization',
      'Statistics',
    ],
    'AI and Machine Learning': [
      'Programming Skills',
      'Database Management',
      'Networking',
      'Software Engineering',
      'Cloud Computing',
      'Data Science',
    ],
    'Mechanical Engineering': [
      'Programming Skills',
      'Thermodynamics',
      'Robotics',
      'Fluid Mechanics',
      'Automotive Engineering',
      'Aerospace Materials',
    ],
    'Electrical Engineering': [
      'Programming Skills',
      'Circuit Analysis',
      'Digital Systems',
      'Electromagnetics',
      'Power Systems',
      'Control Systems',
    ],
    'Communication Engineering': [
      'Programming Skills',
      'Signal Processing',
      'Wireless Communication',
      'Networking',
      'Control Systems',
      'Digital Systems',
    ],
    'BioTechnology': [
      'Programming Skills',
      'Biomaterials',
      'Medical Imaging',
      'Biomechanics',
      'Tissue Engineering',
      'Bioinformatics',
    ],
    'Chemical Engineering': [
      'Programming Skills',
      'Process Design',
      'Thermodynamics',
      'Reaction Engineering',
      'Separation Processes',
      'Chemical Reaction Engineering',
    ],
    // ... (other domains) m
  };

  @override
  Widget build(BuildContext context) {
    List<String> domains = departmentDomains[department] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Domains in $department'),
        backgroundColor: const Color.fromARGB(255, 22, 70, 104),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, const Color.fromARGB(255, 36, 49, 226)],
          ),
        ),
        child: ListView.builder(
          itemCount: domains.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DomainDetailScreen(
                        domain: domains[index],
                        description: getDomainDescription(domains[index]),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 93, 201, 234),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  domains[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String getDomainDescription(String domain) {
    switch (domain) {
      case 'Programming Skills':
        return 'use Skillrack and Leetcode platforms to improve your skills.';
      case 'Database Management':
        return 'Focuses on the design, implementation, and management of databases.';
      case 'Networking':
        return 'Covers the principles of network architecture, protocols, and security.';
      case 'Software Engineering':
        return 'Involves the application of engineering principles to software development.';
      case 'Cloud Computing':
        return 'Examines cloud technologies and service models for computing resources.';
      case 'Data Science':
        return 'Combines statistical analysis, machine learning, and data visualization.';
      case 'Artificial Intelligence':
        return 'Studies the development of intelligent agents and machine learning.';
      case 'Web Development':
        return 'Involves the creation and maintenance of websites and web applications.';
      case 'Cybersecurity':
        return 'Focuses on protecting systems and networks from cyber threats.';
      case 'Machine Learning':
        return 'Involves algorithms that allow computers to learn from data.';
      case 'Thermodynamics':
        return 'Studies the principles of heat transfer and energy conversion.';
      case 'Robotics':
        return 'Focuses on the design and operation of robots and automated systems.';
      case 'Fluid Mechanics':
        return 'Examines the behavior of fluids at rest and in motion.';
      case 'Automotive Engineering':
        return 'Involves the design and production of vehicles.';
      case 'Circuit Analysis':
        return 'Studies the behavior of electrical circuits.';
      case 'Digital Systems':
        return 'Covers the principles of digital circuit design and applications.';
      case 'Electromagnetics':
        return 'Examines electric and magnetic fields and their applications.';
      case 'Power Systems':
        return 'Focuses on the generation, transmission, and distribution of electrical power.';
      case 'Control Systems':
        return 'Studies systems that manage, command, and regulate behaviors.';
      case 'Signal Processing':
        return 'Involves the analysis and manipulation of signals.';
      case 'Wireless Communication':
        return 'Focuses on communication technologies without physical connections.';
      case 'Biomaterials':
        return 'Studies materials used in medical applications and implants.';
      case 'Medical Imaging':
        return 'Involves techniques for creating images of the body for clinical purposes.';
      case 'Biomechanics':
        return 'Applies principles of mechanics to biological systems.';
      case 'Tissue Engineering':
        return 'Involves the creation of artificial organs and tissues.';
      case 'Bioinformatics':
        return 'Combines biology, computer science, and information technology.';
      case 'Process Design':
        return 'Focuses on the design and optimization of chemical processes.';
      case 'Thermodynamics':
        return 'Studies energy, heat, and work within chemical systems.';
      case 'Reaction Engineering':
        return 'Involves the design and optimization of chemical reactors.';
      case 'Separation Processes':
        return 'Covers techniques to separate components of mixtures.';
      case 'Chemical Reaction Engineering':
        return 'Studies the kinetics and design of chemical reactions.';
      // Add more descriptions as needed
      default:
        return 'No description available.';
    }
  }
}

class DomainDetailScreen extends StatelessWidget {
  final String domain;
  final String description;

  DomainDetailScreen({required this.domain, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(domain),
        backgroundColor: const Color.fromARGB(255, 22, 70, 104),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, const Color.fromARGB(255, 36, 49, 226)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                domain,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'MENTORSHIP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Example of sample content
              Text(
                'Ask Questions Anytime: Students can easily submit their doubts or queries to mentors directly through the app, allowing for quick access to support and guidance on academic or personal challenges.\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackForm(domain: domain),
                    ),
                  );
                },
                child: Text('Give Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackForm extends StatelessWidget {
  final String domain;

  FeedbackForm({required this.domain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback for $domain'),
        backgroundColor: const Color.fromARGB(255, 14, 194, 194),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please provide your feedback for the $domain domain:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your feedback...',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle feedback submission logic
                Navigator.pop(context);
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 14, 194, 194),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, const Color.fromARGB(255, 36, 49, 226)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profile_picture.png'), // Add profile picture here
              ),
              SizedBox(height: 20),
              Text(
                'Name: Student123',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                'Email: student@example.com',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Skills:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Chip(label: Text('Python')),
              Chip(label: Text('Flutter')),
              Chip(label: Text('Machine Learning')),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle edit profile action
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: const Color.fromARGB(255, 14, 194, 194),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, const Color.fromARGB(255, 36, 49, 226)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: Text('Receive Notifications'),
                value: true, // Replace with actual state
                onChanged: (bool value) {
                  // Handle notification toggle
                },
              ),
              Divider(),
              Text(
                'Change Password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle change password action
                },
                child: Text('Change Password'),
              ),
              Divider(),
              Text(
                'Privacy Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Profile Visibility'),
                subtitle: Text('Public / Private'),
                trailing: Switch(
                  value: true, // Replace with actual state
                  onChanged: (bool value) {
                    // Handle privacy toggle
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
        backgroundColor: const Color.fromARGB(255, 14, 194, 194),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, const Color.fromARGB(255, 36, 49, 226)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discussion Forum',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Replace with actual discussion count
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Discussion Topic $index'),
                      subtitle: Text('Last updated: 10 minutes ago'),
                      onTap: () {
                        // Handle navigation to discussion details
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle join community action
                },
                child: Text('Join a Community'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle post question action
                },
                child: Text('Post a Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
