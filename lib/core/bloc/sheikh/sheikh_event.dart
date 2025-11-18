import 'package:equatable/equatable.dart';
import '../../models/sheikh_model.dart';

abstract class SheikhEvent extends Equatable {
  const SheikhEvent();

  @override
  List<Object?> get props => [];
}

class LoadSheikhs extends SheikhEvent {
  const LoadSheikhs();
}

class LoadFeaturedSheikhs extends SheikhEvent {
  const LoadFeaturedSheikhs();
}

class LoadSheikhsByCategory extends SheikhEvent {
  final String categoryId;

  const LoadSheikhsByCategory(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class SelectSheikh extends SheikhEvent {
  final SheikhModel? sheikh;

  const SelectSheikh(this.sheikh);

  @override
  List<Object?> get props => [sheikh];
}
