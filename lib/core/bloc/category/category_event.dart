import 'package:equatable/equatable.dart';
import '../../models/category_model.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategories extends CategoryEvent {
  const LoadCategories();
}

class SelectCategory extends CategoryEvent {
  final CategoryModel? category;

  const SelectCategory(this.category);

  @override
  List<Object?> get props => [category];
}
