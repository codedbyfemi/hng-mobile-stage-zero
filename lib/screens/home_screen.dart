import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile Card
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Color(0xFFF3F4F6)
                  : Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFE5E7EB)
                    : Color(0xFF334155),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text('👨‍💻', style: TextStyle(fontSize: 40)),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Olatunji Oluwafemi',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 8),
                Text(
                  'Full Stack Developer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3B82F6),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Building amazing mobile experiences',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Stats
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              StatCard(value: '3+', label: 'Projects'),
              StatCard(value: '.7+ yrs', label: 'Experience'),
              StatCard(value: '0', label: 'Clients'),
            ],
          ),
          SizedBox(height: 24),

          // Bio
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Color(0xFFF3F4F6)
                  : Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFE5E7EB)
                    : Color(0xFF334155),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(height: 12),
                Text(
                  'Passionate full-stack developer with 0.7+ years of experience. Specialized in Flutter, Node.js, spring boot, and creating beautiful user experiences. Always learning and exploring new technologies.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Quick Links
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL('https://github.com/codedbyfemi'),
                  icon: Icon(Icons.code),
                  label: Text('GitHub'),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}