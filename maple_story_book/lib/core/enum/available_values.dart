///
/// @Project name    : maple_story_book
/// @Class           : available_value.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 24..
/// Description      : 
///

// 초보자
enum Beginner { all }

// 모험가 전사
enum AdventurerWarrior {
  all,
  swordman,
  fighter, page, spearman,
  crusader, knight, berserker,
  hero, paladin, darkKnight,
}

// 모험가 마법사
enum AdventurerWizard {
  all,
  magician,
  wizardFirePoison, wizardLightningIce, cleric,
  mageFirePoison, mageLightningIce, priest,
  archMageFirePoison, archMageLightningIce, bishop,
}

// 모험가 궁수
enum AdventurerBowman {
  all,
  archer,
  hunter, shooter,
  ranger, sniper,
  bowMaster, marksman,
  archerPathfinder,
  ancientArcher,
  chaser,
  pathfinder,
}

// 모험가 도적
enum AdventurerThief {
  all,
  rogue,
  assassin, thief,
  hermit, thiefMaster,
  nightLord, shadower,
  semiDualler,
  dualler,
  dualMaster,
  slasher,
  dualBlade,
}

// 모험가 해적
enum AdventurerPirate {
  all,
  pirate,
  inFighter, gunslinger, cannonShooter,
  buccaneer, valkyrie, cannonBlaster,
  viper, captain, cannonMaster
}

// 기사단
enum Order {
  all,
  noblesse,
  soulMaster,
  flameWizard,
  windbreaker,
  nightWalker,
  striker,
  mikhail,
}

// 아란
enum Aran { all }

// 에반
enum Evan { all }

// 레지스탕스
enum Resistance {
  all,
  citizen,
  battleMage,
  wildHunter,
  mechanic,
  demonSlayer,
  demonAvenger,
  xenon,
  blaster,
}

// 메르세데스
enum Mercedes { all }

// 팬텀
enum Phantom { all }

// 루미너스
enum Luminous { all }

// 카이저
enum Kaiser { all }

// 엔젤릭 버스터
enum AngelicBuster { all }

// 초월자
enum TranscendentPerson {
  all,
  zero,
}

// 은월 영어 표기 명이 Shade 라서 안이쁨
enum Eunwol { all }

// 프렌즈 월드
enum FriendsWorld {
  all,
  kinesis,
}

// 카데나
enum Cadena { all }

// 일리움
enum Illium { all }

// 아크
enum Ark { all }

// 호영
enum Hoyoung { all }

// 아델
enum Adele { all }

// 카인
enum Kain { all }

// 라라
enum Lara { all }

// 칼리
enum Khali { all }


class AvailableValues {

  static final Map<dynamic, String> values = {
    // 초보자
    Beginner.all : '초보자-전체 전직',

    // 전사
    AdventurerWarrior.all: "전사-전체 전직",
    AdventurerWarrior.swordman: "전사-검사",
    AdventurerWarrior.fighter: "전사-파이터",
    AdventurerWarrior.page: "전사-페이지",
    AdventurerWarrior.spearman: "전사-스피어맨",
    AdventurerWarrior.crusader: "전사-크루세이더",
    AdventurerWarrior.knight: "전사-나이트",
    AdventurerWarrior.berserker: "전사-버서커",
    AdventurerWarrior.hero: "전사-히어로",
    AdventurerWarrior.paladin: "전사-팔라딘",
    AdventurerWarrior.darkKnight: "전사-다크나이트",

    // 마법사
    AdventurerWizard.all: "마법사-전체 전직",
    AdventurerWizard.magician: "마법사-매지션",
    AdventurerWizard.wizardFirePoison: "마법사-위자드(불,독)",
    AdventurerWizard.wizardLightningIce: "마법사-위자드(썬,콜)",
    AdventurerWizard.cleric: "마법사-클레릭",
    AdventurerWizard.mageFirePoison: "마법사-메이지(불,독)",
    AdventurerWizard.mageLightningIce: "마법사-메이지(썬,콜)",
    AdventurerWizard.priest: "마법사-프리스트",
    AdventurerWizard.archMageFirePoison: "마법사-아크메이지(불,독)",
    AdventurerWizard.archMageLightningIce: "마법사-아크메이지(썬,콜)",
    AdventurerWizard.bishop: "마법사-비숍",

    //궁수
    AdventurerBowman.all: "궁수-전체 전직",
    AdventurerBowman.archer: "궁수-아처",
    AdventurerBowman.hunter: "궁수-헌터",
    AdventurerBowman.shooter: "궁수-사수",
    AdventurerBowman.ranger: "궁수-레인저",
    AdventurerBowman.sniper: "궁수-저격수",
    AdventurerBowman.bowMaster: "궁수-보우마스터",
    AdventurerBowman.marksman: "궁수-신궁",
    AdventurerBowman.archerPathfinder: "궁수-아처(패스파인더)",
    AdventurerBowman.ancientArcher: "궁수-에인션트아처",
    AdventurerBowman.chaser: "궁수-체이서",
    AdventurerBowman.pathfinder: "궁수-패스파인더",

    // 도적
    AdventurerThief.all: "도적-전체 전직",
    AdventurerThief.rogue: "도적-로그",
    AdventurerThief.assassin: "도적-어쌔신",
    AdventurerThief.thief: "도적-시프",
    AdventurerThief.hermit: "도적-허밋",
    AdventurerThief.thiefMaster: "도적-시프마스터",
    AdventurerThief.nightLord: "도적-나이트로드",
    AdventurerThief.shadower: "도적-섀도어",
    AdventurerThief.semiDualler: "도적-세미듀어러",
    AdventurerThief.dualler: "도적-듀어러",
    AdventurerThief.dualMaster: "도적-듀얼마스터",
    AdventurerThief.slasher: "도적-슬래셔",
    AdventurerThief.dualBlade: "도적-듀얼블레이더",

    // 해적
    AdventurerPirate.all: "해적-전체 전직",
    AdventurerPirate.pirate: "해적-해적",
    AdventurerPirate.inFighter: "해적-인파이터",
    AdventurerPirate.gunslinger: "해적-건슬링거",
    AdventurerPirate.cannonShooter: "해적-캐논슈터",
    AdventurerPirate.buccaneer: "해적-버커니어",
    AdventurerPirate.valkyrie: "해적-발키리",
    AdventurerPirate.cannonBlaster: "해적-캐논블래스터",
    AdventurerPirate.viper: "해적-바이퍼",
    AdventurerPirate.captain: "해적-캡틴",
    AdventurerPirate.cannonMaster: "해적-캐논마스터",

    // 기사단
    Order.all: "기사단-전체 전직",
    Order.noblesse: "기사단-노블레스",
    Order.soulMaster: "기사단-소울마스터",
    Order.flameWizard: "기사단-플레임위자드",
    Order.windbreaker: "기사단-윈드브레이커",
    Order.nightWalker: "기사단-나이트워커",
    Order.striker: "기사단-스트라이커",
    Order.mikhail: "기사단-미하일",

    // 아란
    Aran.all: "아란-전체 전직",

    // 에반
    Evan.all: "에반-전체 전직",

    // 레지스탕스
    Resistance.all: "레지스탕스-전체 전직",
    Resistance.citizen: "레지스탕스-시티즌",
    Resistance.battleMage: "레지스탕스-배틀메이지",
    Resistance.wildHunter: "레지스탕스-와일드헌터",
    Resistance.mechanic: "레지스탕스-메카닉",
    Resistance.demonSlayer: "레지스탕스-데몬슬레이어",
    Resistance.demonAvenger: "레지스탕스-데몬어벤져",
    Resistance.xenon: "레지스탕스-제논",
    Resistance.blaster: "레지스탕스-블래스터",

    // 메르세데스
    Mercedes.all: "메르세데스-전체 전직",

    // 팬텀
    Phantom.all: "팬텀-전체 전직",

    // 루미너스
    Luminous.all: "루미너스-전체 전직",

    // 카이저
    Kaiser.all: "카이저-전체 전직",

    // 엔젤릭버스터
    AngelicBuster.all: "엔젤릭버스터-전체 전직",

    // 초월자
    TranscendentPerson.all: "초월자-전체 전직",
    TranscendentPerson.zero: "초월자-제로",

    // 은월
    Eunwol.all: "은월-전체 전직",

    // 프렌즈 월드
    FriendsWorld.all: "프렌즈 월드-전체 전직",
    FriendsWorld.kinesis: "프렌즈 월드-키네시스",

    // 카데나
    Cadena.all: "카데나-전체 전직",

    // 일리움
    Illium.all: "일리움-전체 전직",

    // 아크
    Ark.all: "아크-전체 전직",

    // 호영
    Hoyoung.all: "호영-전체 전직",

    // 아델
    Adele.all: "아델-전체 전직",

    // 카인
    Kain.all: "카인-전체 전직",

    // 라라
    Lara.all: "라라-전체 전직",

    // 칼리
    Khali.all: "칼리-전체 전직",
  };

  static List<String> names() => values.values.map((e) => e).toList();
}

