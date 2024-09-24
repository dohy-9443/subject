enum SkillGrade {
  zero(0),
  one(1),
  onePointFive(1.5),
  two(2),
  twoPointFive(2.5),
  three(3),
  four(4),
  hyperPassive('hyperpassive'),
  hyperActive('hyperactive'),
  five(5),
  six(6);

  final dynamic name;

  const SkillGrade(this.name);

  static SkillGrade getSkillGrade(String name) {
    switch (name) {
      case 'zero':
        return SkillGrade.zero;
      case 'one':
        return SkillGrade.one;
      case 'onePointFive':
        return SkillGrade.onePointFive;
      case 'two':
        return SkillGrade.two;
      case 'twoPointFive':
        return SkillGrade.twoPointFive;
      case 'three':
        return SkillGrade.three;
      case 'four':
        return SkillGrade.four;
      case 'hyperPassive':
        return SkillGrade.hyperPassive;
      case 'hyperActive':
        return SkillGrade.hyperActive;
      case 'five':
        return SkillGrade.five;
      case 'six':
        return SkillGrade.six;
      default:
        throw Exception('Invalid SkillName : $name');
    }
  }
}

