enum WorldImage {
  // Assets.images.skania.path
  skania('assets/images/skania_world.png'),
  bera('assets/images/bera_world.png'),
  luna('assets/images/luna_world.png'),
  zenith('assets/images/zenith_world.png'),
  croa('assets/images/croa_world.png'),
  union('assets/images/union_world.png'),
  elysium('assets/images/elysium_world.png'),
  enosis('assets/images/enosis_world.png'),
  red('assets/images/red_world.png'),
  aurora('assets/images/aurora_world.png'),
  arcane('assets/images/arcane_world.png'),
  nova('assets/images/nova_world.png'),
  reboot('assets/images/reboot_world.png'),
  reboot2('assets/images/reboot_world.png'),
  bunning('assets/images/bunning_world.png'),
  bunning2('assets/images/bunning_world.png'),
  bunning3('assets/images/bunning_world.png');

  final String name;

  const WorldImage(this.name);

  static WorldImage getWorldImage(String name) {
    switch (name) {
      case '스카니아':
        return WorldImage.skania;
      case '베라':
        return WorldImage.bera;
      case '루나':
        return WorldImage.luna;
      case '제니스':
        return WorldImage.zenith;
      case '크로아':
        return WorldImage.croa;
      case '유니온':
        return WorldImage.union;
      case '엘리시움':
        return WorldImage.elysium;
      case '이노시스':
        return WorldImage.enosis;
      case '레드':
        return WorldImage.red;
      case '오로라':
        return WorldImage.aurora;
      case '아케인':
        return WorldImage.arcane;
      case '노바':
        return WorldImage.nova;
      case '리부트':
        return WorldImage.reboot;
      case '리부트2':
        return WorldImage.reboot2;
      case '버닝':
        return WorldImage.bunning;
      case '버닝2':
        return WorldImage.bunning2;
      case '버닝3':
        return WorldImage.bunning3;

      default:
        throw Exception('Invalid WorldName : $name');
    }
  }
}