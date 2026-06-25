class CatData {
  final String id;
  final String name;
  final String description;
  final String rarity;
  final String? imageUrl;
  final String location;
  final DateTime foundAt;
  final int dexNumber;

  CatData({
    required this.id,
    required this.name,
    required this.description,
    required this.rarity,
    this.imageUrl,
    required this.location,
    required this.foundAt,
    required this.dexNumber,
  });
}

// Dummy data for UI preview
final List<CatData> dummyCats = [
  CatData(
    id: '1',
    name: 'Lord Meowington',
    description: 'Menguasai parkiran minimarket sejak 2024.',
    rarity: 'Epic',
    location: 'Bandar Lampung',
    foundAt: DateTime.now().subtract(const Duration(days: 2)),
    dexNumber: 217,
  ),
  CatData(
    id: '2',
    name: 'Sir Oyen',
    description: 'Spesialis tidur di atas motor warung kopi.',
    rarity: 'Common',
    location: 'Jakarta Selatan',
    foundAt: DateTime.now().subtract(const Duration(days: 5)),
    dexNumber: 3,
  ),
  CatData(
    id: '3',
    name: 'Putri Belang',
    description: 'Putri cantik pemilik gang RT 04.',
    rarity: 'Rare',
    location: 'Bandung',
    foundAt: DateTime.now().subtract(const Duration(days: 1)),
    dexNumber: 42,
  ),
  CatData(
    id: '4',
    name: 'Kapten Kumis',
    description: 'Diduga ketua geng kucing komplek perumahan.',
    rarity: 'Uncommon',
    location: 'Surabaya',
    foundAt: DateTime.now().subtract(const Duration(hours: 3)),
    dexNumber: 18,
  ),
  CatData(
    id: '5',
    name: 'Miko Oren',
    description: 'Satu-satunya kucing yang bisa membuka kulkas.',
    rarity: 'Legendary',
    location: 'Yogyakarta',
    foundAt: DateTime.now().subtract(const Duration(days: 10)),
    dexNumber: 1,
  ),
  CatData(
    id: '6',
    name: 'Si Abu Tidur',
    description: 'Rekor tidur 22 jam sehari, tanpa henti.',
    rarity: 'Common',
    location: 'Medan',
    foundAt: DateTime.now().subtract(const Duration(days: 7)),
    dexNumber: 55,
  ),
];
