part of 'consulting_cubit.dart';

@immutable
abstract class ConsultingState {}

class ConsultingInitial extends ConsultingState {}

class ExpertsLoaded extends ConsultingState {
  final List<Expert> experts;

  ExpertsLoaded(this.experts);
}

class FieldsLoaded extends ConsultingState {
  final List<Field> fields;

  FieldsLoaded(this.fields);
}

