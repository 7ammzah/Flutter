import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_consulting/presentation_layer/screens/addAppointments.dart';
import 'package:new_consulting/presentation_layer/screens/appointmentsexpert.dart';
import 'package:new_consulting/presentation_layer/screens/browsing_screen.dart';
import 'package:new_consulting/presentation_layer/screens/chat.dart';
import 'package:new_consulting/presentation_layer/screens/chat_screen.dart';
import 'package:new_consulting/presentation_layer/screens/expert_book_screen.dart';
import 'package:new_consulting/presentation_layer/screens/expert_in_screen.dart';
import 'package:new_consulting/presentation_layer/screens/expert_profile_for_user.dart';
import 'package:new_consulting/presentation_layer/screens/expert_sign-in_screen.dart';
import 'package:new_consulting/presentation_layer/screens/favorite_screen.dart';
import 'package:new_consulting/presentation_layer/screens/client_chooce_appointment.dart';
import 'business_logic_layer/cubit/consulting_cubit.dart';
import 'constants/strings.dart';
import 'data_layer/repository/experts_repository.dart';
import 'data_layer/web_services/experts_web_services.dart';
import 'presentation_layer/screens/client_profile.dart';
import 'presentation_layer/screens/client_sign-in_screen.dart';
import 'presentation_layer/screens/edit_expert_profile.dart';
import 'presentation_layer/screens/edit_client_profile.dart';
import 'presentation_layer/screens/expert_profile.dart';
import 'presentation_layer/screens/experts_screen.dart';
import 'presentation_layer/screens/home_screen.dart';
import 'presentation_layer/screens/login_screen.dart';

class AppRouter {
  late ExpertsRepository expertsRepository;
  late ConsultingCubit consultingCubit;

  AppRouter() {
    expertsRepository = ExpertsRepository(ExpertServices());
    consultingCubit = ConsultingCubit(expertsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.allExperts:
        return MaterialPageRoute(
          builder: ((_) => BlocProvider(
            create: ((context) => consultingCubit),
            child: const ExpertsScreen(),
          )),
        );
      case AppStrings.homePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppStrings.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppStrings.clientProfile:
        return MaterialPageRoute(builder: (_) => const ClientProfile());
      case AppStrings.clientSignIn:
        return MaterialPageRoute(builder: (_) => const ClientSignInScreen());
      case AppStrings.expertSignIn:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => consultingCubit,
              child: const ExpertSignInScreen(),
            ));
      case AppStrings.expertProfile:
        return MaterialPageRoute(
            builder: (_) =>  ExpertProfile(
              isExpert: true,
              //expert: Expert(),
            ));
      case AppStrings.editClientProfile:
        return MaterialPageRoute(builder: (_) => const EditClientProfile());
      case AppStrings.editExpertProfile:
        return MaterialPageRoute(builder: (_) => const EditExpertProfile());
      case AppStrings.browsingScreen:
        return MaterialPageRoute(builder: (_) => BrowsingScreen());
      case AppStrings.booking_calender:
        return MaterialPageRoute(builder: (_) => BookingCalender());
      case AppStrings.expertprofiletouser:
        return MaterialPageRoute(builder: (_) => ExpertProfileForUser());
      case AppStrings.favoritescreen:
        return MaterialPageRoute(builder: (_) => FavoritesScreen());
      case AppStrings.expert_in:
        return MaterialPageRoute(builder: (_) => ExpertInScreen());
      case AppStrings.expert_book:
        return MaterialPageRoute(builder: (_) => ExpertBookTime());
      case AppStrings.appointments_expert:
        return MaterialPageRoute(builder: (_) => AppointmentsExperts());
      case AppStrings.user_chooce_expertises:
        return MaterialPageRoute(builder: (_) => UserChooceExpertises());
      case AppStrings.clientSignIn:
        return MaterialPageRoute(builder: (_) => Chat());
    //break;
    //default:
    }
    return null;
  }
}

