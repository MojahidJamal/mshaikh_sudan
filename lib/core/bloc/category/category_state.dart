import 'package:equatable/equatable.dart';
import '../../models/category_model.dart';

class CategoryState extends Equatable {
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;

  const CategoryState({
    this.categories = const [],
    this.selectedCategory,
  });

  CategoryState copyWith({
    List<CategoryModel>? categories,
    CategoryModel? selectedCategory,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [categories, selectedCategory];
}
