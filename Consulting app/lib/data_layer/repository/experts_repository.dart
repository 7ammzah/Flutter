import '../models/expert.dart';
import '../models/field.dart';
import '../web_services/experts_web_services.dart';

class ExpertsRepository {
  final ExpertServices expertWebServices;

  ExpertsRepository(this.expertWebServices);

  Future<List<Expert>> getAllExperts() async {
    final experts = await expertWebServices.getAllExperts();
    return experts.map((exp) => Expert.fromJson(exp)).toList();
  }

  Future<List<Field>> getAllFields() async {
    final fields = await expertWebServices.getAllFields();
    return fields.map((field) => Field.fromJson(field)).toList();
  }
}
