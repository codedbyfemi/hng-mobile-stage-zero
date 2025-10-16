class Skill {
  final String name;
  final String category;

  Skill({required this.name, required this.category});
}

class SkillCategory {
  final String title;
  final List<Skill> skills;

  SkillCategory({required this.title, required this.skills});
}