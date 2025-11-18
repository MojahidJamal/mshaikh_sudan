/// Model representing a Sheikh (Islamic scholar/reciter)
class SheikhModel {
  final String id;
  final String name;
  final String imagePath;
  final String categoryId; // Links to category
  final String description;
  final bool isFeatured; // For "أبرز المشايخ"

  SheikhModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.categoryId,
    required this.description,
    this.isFeatured = false,
  });

  /// Sample data - Replace with real data from API or local storage
  static List<SheikhModel> getSampleSheikhs() {
    return [
      // Recitations
      SheikhModel(
        id: 'sheikh_1',
        name: 'الشيخ عبد الباسط عبد الصمد',
        imagePath: 'assets/images/person.jpg',
        categoryId: 'recitations',
        description: 'قارئ مصري مشهور',
        isFeatured: true,
      ),
      SheikhModel(
        id: 'sheikh_2',
        name: 'الشيخ محمد صديق المنشاوي',
        imagePath: 'assets/images/person.jpg',
        categoryId: 'recitations',
        description: 'قارئ مصري',
        isFeatured: true,
      ),
      SheikhModel(
        id: 'sheikh_3',
        name: 'الشيخ ماهر المعيقلي',
        imagePath: 'assets/images/person.jpg',
        categoryId: 'recitations',
        description: 'إمام الحرم المكي',
        isFeatured: true,
      ),

      // Lectures
      SheikhModel(
        id: 'sheikh_4',
        name: 'الشيخ محمد حسان',
        imagePath: 'assets/images/person.jpg',
        categoryId: 'lectures',
        description: 'داعية إسلامي',
        isFeatured: false,
      ),
      SheikhModel(
        id: 'sheikh_5',
        name: 'الشيخ نبيل العوضي',
        imagePath: 'assets/images/person.jpg',
        categoryId: 'lectures',
        description: 'داعية كويتي',
        isFeatured: false,
      ),

      // Adhkar
      SheikhModel(
        id: 'sheikh_6',
        name: 'الشيخ مشاري العفاسي',
        imagePath: 'assets/images/person.jpg',
        categoryId: 'adhkar',
        description: 'إمام وقارئ كويتي',
        isFeatured: false,
      ),
    ];
  }

  /// Get sheikhs by category
  static List<SheikhModel> getSheikhsByCategory(String categoryId) {
    return getSampleSheikhs()
        .where((sheikh) => sheikh.categoryId == categoryId)
        .toList();
  }

  /// Get featured sheikhs
  static List<SheikhModel> getFeaturedSheikhs() {
    return getSampleSheikhs().where((sheikh) => sheikh.isFeatured).toList();
  }
}
