import 'package:flutter/material.dart';
import '../widgets/skill_chip.dart';
import '../models/skill_model.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final skillCategories = [
      SkillCategory(
        title: 'Frontend Development',
        skills: [
          Skill(name: 'Flutter', category: 'frontend'),
        ],
      ),
      SkillCategory(
        title: 'Backend Development',
        skills: [
          Skill(name: 'Node.js', category: 'backend'),
          Skill(name: 'Express', category: 'backend'),
          Skill(name: 'Typescript', category: 'backend'),
          Skill(name: 'Springboot', category: 'backend'),
          Skill(name: 'Java', category: 'backend'),
          Skill(name: 'PostgreSQL', category: 'backend'),
          Skill(name: 'MongoDB', category: 'backend'),
        ],
      ),
      SkillCategory(
        title: 'Tools & Other',
        skills: [
          Skill(name: 'Git', category: 'tools'),
          Skill(name: 'REST APIs', category: 'tools'),
        ],
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 24),

          // Who I Am Section
          _buildSection(
            context,
            title: 'Who I Am',
            content: 'I\'m a full-stack developer passionate about creating elegant solutions to complex problems. With 0.7+ years in the industry, \n\nAlthough, I\'ve not worked with startups, and I haven\'t also established companies to build scalable web applications, my expertise spans across the entire development stack, and I\'m committed to writing clean, maintainable code and delivering exceptional user experiences.',
          ),
          SizedBox(height: 24),

          // Skills
          ...skillCategories.map((category) => _buildSkillCategory(context, category)).toList(),
          SizedBox(height: 24),

          // Experience
          _buildSection(
            context,
            title: 'Experience',
            content: '',
            child: Column(
              children: [
                SizedBox(height: 16),
                _buildExperienceItem(
                  'Full Stack Developer',
                  ' • 2025 - Present',
                  context,
                ),
                SizedBox(height: 16),
                _buildExperienceItem(
                  'Junior Developer',
                  ' • 2025 - Present',
                  context,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, String content = '', Widget? child}) {
    return Container(
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
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3B82F6),
            ),
          ),
          SizedBox(height: 12),
          if (content.isNotEmpty)
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
            ),
          if (child != null) child,
        ],
      ),
    );
  }

  Widget _buildSkillCategory(BuildContext context, SkillCategory category) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16), // space after each category
    child: _buildSection(
      context,
      title: category.title,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: category.skills
            .map((skill) => SkillChip(label: skill.name))
            .toList(),
      ),
    ),
  );
}


  Widget _buildExperienceItem(
      String title, String subtitle, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}