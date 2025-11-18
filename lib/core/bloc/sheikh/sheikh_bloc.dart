import 'package:flutter_bloc/flutter_bloc.dart';
import 'sheikh_event.dart';
import 'sheikh_state.dart';
import '../../models/sheikh_model.dart';

class SheikhBloc extends Bloc<SheikhEvent, SheikhState> {
  SheikhBloc() : super(const SheikhState()) {
    on<LoadSheikhs>(_onLoadSheikhs);
    on<LoadFeaturedSheikhs>(_onLoadFeaturedSheikhs);
    on<LoadSheikhsByCategory>(_onLoadSheikhsByCategory);
    on<SelectSheikh>(_onSelectSheikh);
  }

  void _onLoadSheikhs(LoadSheikhs event, Emitter<SheikhState> emit) {
    final sheikhs = SheikhModel.getSampleSheikhs();
    emit(state.copyWith(allSheikhs: sheikhs));
  }

  void _onLoadFeaturedSheikhs(LoadFeaturedSheikhs event, Emitter<SheikhState> emit) {
    final featuredSheikhs = SheikhModel.getFeaturedSheikhs();
    emit(state.copyWith(featuredSheikhs: featuredSheikhs));
  }

  void _onLoadSheikhsByCategory(LoadSheikhsByCategory event, Emitter<SheikhState> emit) {
    final filteredSheikhs = SheikhModel.getSheikhsByCategory(event.categoryId);
    emit(state.copyWith(filteredSheikhs: filteredSheikhs));
  }

  void _onSelectSheikh(SelectSheikh event, Emitter<SheikhState> emit) {
    emit(state.copyWith(selectedSheikh: event.sheikh));
  }
}
