/// Model representing a main category in the app
/// Categories: تلاوات (Recitations), محاضرات (Lectures), أذكار (Adhkar)
class CategoryModel {
  final String id;
  final String nameAr;
  final String description;
  final String iconPath;

  CategoryModel({
    required this.id,
    required this.nameAr,
    required this.description,
    required this.iconPath,
  });

  /// Static list of all available categories
  static List<CategoryModel> getAllCategories() {
    return [
      CategoryModel(
        id: 'recitations',
        nameAr: 'تلاوات',
        description: 'تلاوات القرآن الكريم',
        iconPath: 'assets/icons/quran.svg',
      ),
      CategoryModel(
        id: 'lectures',
        nameAr: 'محاضرات',
        description: 'محاضرات ودروس إسلامية',
        iconPath: 'assets/icons/lecture.svg',
      ),
      CategoryModel(
        id: 'adhkar',
        nameAr: 'أذكار',
        description: 'أذكار وأدعية',
        iconPath: 'assets/icons/adhkar.svg',
      ),
    ];
  }
}
