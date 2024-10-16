///
/// @Project name    : maple_story_book
/// @Class           : world_name.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 24..
/// Description      :
///

enum WorldName {
  skania('스카니아'),
  bera('베라'),
  luna('루나'),
  zenith('제니스'),
  croa('크로아'),
  union('유니온'),
  elysium('엘리시움'),
  enosis('이노시스'),
  red('레드'),
  aurora('오로라'),
  arcane('아케인'),
  nova('노바'),
  reboot('리부트1'),
  reboot2('리부트2'),
  bunning('버닝1'),
  bunning2('버닝2'),
  bunning3('버닝3');

  final String name;

  const WorldName(this.name);

  static WorldName getWorldName(String name) {
    switch (name) {
      case 'skania':
        return WorldName.skania;
      case 'bera':
        return WorldName.bera;
      case 'luna':
        return WorldName.luna;
      case 'zenith':
        return WorldName.zenith;
      case 'croa':
        return WorldName.croa;
      case 'union':
        return WorldName.union;
      case 'elysium':
        return WorldName.elysium;
      case 'enosis':
        return WorldName.enosis;
      case 'red':
        return WorldName.red;
      case 'aurora':
        return WorldName.aurora;
      case 'arcane':
        return WorldName.arcane;
      case 'nova':
        return WorldName.nova;
      case 'reboot':
        return WorldName.reboot;
      case 'reboot2':
        return WorldName.reboot2;
      case 'bunning':
        return WorldName.bunning;
      case 'bunning2':
        return WorldName.bunning2;
      case 'bunning3':
        return WorldName.bunning3;

      default:
        throw Exception('Invalid WorldName : $name');
    }
  }
}
