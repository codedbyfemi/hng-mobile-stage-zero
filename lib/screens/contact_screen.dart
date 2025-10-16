import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitted = false;

  void _submitForm() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _messageController.text.isNotEmpty) {
      setState(() => _isSubmitted = true);
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isSubmitted = false);
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Message sent successfully!')),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 24),

          // Contact Information
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
              children: [
                _buildContactItem(
                  Icons.email,
                  'Email',
                  'oluwafemiolatunji6002@gmail.com',
                  context,
                ),
                SizedBox(height: 16),
                _buildContactItem(
                  Icons.phone,
                  'Phone',
                  '+(234) 906 962 7222',
                  context,
                ),
                SizedBox(height: 16),
                _buildContactItem(
                  Icons.location_on,
                  'Location',
                  'Lagos Nigeria',
                  context,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Contact Form
          Text(
            'Send me a Message',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Your name',
            ),
          ),
          SizedBox(height: 12),

          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'your.email@example.com',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 12),

          TextField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              hintText: 'Your message...',
            ),
            maxLines: 4,
          ),
          SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                _isSubmitted ? '✓ Message Sent!' : 'Send Message',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 24),

          // Social Links
          Text(
            'Follow Me',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(Icons.code, () => _launchURL('https://github.com/codedbyfemi')),
              SizedBox(width: 12),
              _buildSocialButton(Icons.business, () => _launchURL('https://www.linkedin.com/in/oluwafemiolatunji')),
              SizedBox(width: 12),
              _buildSocialButton(Icons.email, () => _launchEmail('oluwafemiolatunji6002@gmail.com')),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    BuildContext context,
    [VoidCallback? onTap]
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF3B82F6), size: 24),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Color(0xFFF3F4F6)
              : Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? Color(0xFFE5E7EB)
                : Color(0xFF334155),
          ),
        ),
        child: Icon(icon, color: Color(0xFF3B82F6), size: 20),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}