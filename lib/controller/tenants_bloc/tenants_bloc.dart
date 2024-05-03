import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/tenants_data/tenants_repository.dart';
import '../../model/tenants_model.dart';
import '../../utils/string_constants.dart';
import 'tenants_event.dart';
import 'tenants_state.dart';

class TenantsBloc extends Bloc<TenantsEvent, TenantsState>{
  TenantsRepository repository;

  TenantsBloc({required this.repository}) : super(TenantsInitialState()) {
    on((event, emit) async {
      if(event is TenantsLoadingEvent){
        emit(TenantsLoadingState());
      } else if(event is TenantsLoadedEvent){
        try {
          List<TenantsData> tenantsData = (await repository.fetchTenantsItems(ConstantStrings.dynamicId));
          emit(TenantsSuccessState(tenantsData: tenantsData));
          debugPrint("Success");
        } catch(e){
          debugPrint("Error $e");
          emit(TenantsFailureState());
        }
      }
    });
  }
}