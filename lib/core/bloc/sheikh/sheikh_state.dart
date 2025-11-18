import 'package:equatable/equatable.dart';
import '../../models/sheikh_model.dart';

class SheikhState extends Equatable {
  final List<SheikhModel> allSheikhs;
  final List<SheikhModel> featuredSheikhs;
  final List<SheikhModel> filteredSheikhs;
  final SheikhModel? selectedSheikh;

  const SheikhState({
    this.allSheikhs = const [],
    this.featuredSheikhs = const [],
    this.filteredSheikhs = const [],
    this.selectedSheikh,
  });

  SheikhState copyWith({
    List<SheikhModel>? allSheikhs,
    List<SheikhModel>? featuredSheikhs,
    List<SheikhModel>? filteredSheikhs,
    SheikhModel? selectedSheikh,
  }) {
    return SheikhState(
      allSheikhs: allSheikhs ?? this.allSheikhs,
      featuredSheikhs: featuredSheikhs ?? this.featuredSheikhs,
      filteredSheikhs: filteredSheikhs ?? this.filteredSheikhs,
      selectedSheikh: selectedSheikh ?? this.selectedSheikh,
    );
  }

  @override
  List<Object?> get props => [allSheikhs, featuredSheikhs, filteredSheikhs, selectedSheikh];
}
