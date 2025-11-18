import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_event.dart';
import 'category_state.dart';
import '../../models/category_model.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  void _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) {
    final categories = CategoryModel.getAllCategories();
    emit(state.copyWith(categories: categories));
  }

  void _onSelectCategory(SelectCategory event, Emitter<CategoryState> emit) {
    emit(state.copyWith(selectedCategory: event.category));
  }
}
