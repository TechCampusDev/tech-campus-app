import 'package:tcapp/models/user_profile/user_profile.dart';

/// メンバーの一覧
final allMembers = [
  const UserProfile(
    id: '_',
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
    imageUrl: '_',
  ),
];
