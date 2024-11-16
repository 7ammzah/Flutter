import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/models/expert.dart';
import '../../data_layer/models/field.dart';
import '../../data_layer/repository/experts_repository.dart';

part 'consulting_state.dart';

class ConsultingCubit extends Cubit<ConsultingState> {
  final ExpertsRepository expertsRepository;

  ConsultingCubit(this.expertsRepository) : super(ConsultingInitial());

  List<Expert> experts = [];
  List<Field> fields = [];

  List<Expert> getAllExperts() {
    expertsRepository.getAllExperts().then((experts) {
      emit(ExpertsLoaded(experts));
      this.experts = experts;
    });
    return experts;
  }

  List<Field> getAllFields() {
    expertsRepository.getAllFields().then((fields) {
      emit(FieldsLoaded(fields));
      this.fields = fields;
    });
    return fields;
  }
}

