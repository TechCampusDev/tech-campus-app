import 'package:tcapp/gen/assets.gen.dart';
import 'package:tcapp/models/user_profile.dart';

/// メンバーの一覧
final allMembers = [
  UserProfile(
    isPublic: true,
    name: 'yoshiaki（運営）',
    career: ['岐阜大学工学部卒', '可茂IT塾合同会社 代表社員'],
    urls: [
      'https://www.kamo-it.org/member/Yoshi/',
      'https://twitter.com/YoshiakiOshima',
    ],
    profile: '大学2年の時にアプリ開発にハマって在学中に起業し、'
        'オリジナルアプリの制作や委託業務で様々な経験した後、'
        '地元の岐阜を拠点に可茂IT塾を立ち上ました。'
        '後にスキルを習得したメンバーの仕事の受け皿や実績を積む場所として法人化し、'
        '引き続きアプリ開発をしながら可茂IT塾としての新規事業の開発にも取り組んでいます。',
    specialties: [
      'フロントエンド全般',
      '個人開発',
      '起業',
      '節税',
      'Flutter',
      'React',
      'Firebase',
    ],
    compatibilities: [
      '初歩ならどの言語でも',
      '就活',
      'Unity',
      'AR/VR',
      'Rails',
      'Node.js',
      'Web3',
      'Swift',
      'AWS',
      'WordPress',
    ],
    imageUrl: Assets.images.prf0.path,
  ),
  UserProfile(
    isPublic: true,
    name: 'Tomoya（運営）',
    career: ['岐阜県立加茂農林高校卒', '可茂IT塾合同会社'],
    urls: [],
    profile: '美濃加茂市のビジネスコンテストで可茂IT塾代表のyoshiakiさんと出会い、可茂IT塾のメンバーに参画。'
        '可茂IT塾では主に、デザインや新規事業に携わっています。'
        'TechCampusでは、デザイン・広告・マーケティングを勉強しながら担当しています。',
    specialties: [],
    compatibilities: [],
    imageUrl: Assets.images.prf2.path,
  ),
  UserProfile(
    isPublic: true,
    name: 'オカトモ（運営）',
    career: ['株式会社GrooveGear（~2023年9月）', '株式会社Arteryex'],
    urls: [
      'https://twitter.com/1234568aasobso1',
      'https://www.instagram.com/kaguragokamoto/',
    ],
    profile: '歴1年目のひよっこエンジニアです。',
    specialties: [
      '神楽',
      '個人開発',
      'Flutter',
      'Firebase',
      '農業',
      '地域活性化',
    ],
    compatibilities: [
      '就活',
      '転職',
      '郷土芸能',
    ],
    imageUrl: Assets.images.prf3.path,
  ),
];
