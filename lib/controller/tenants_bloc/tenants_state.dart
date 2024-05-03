
abstract class TenantsState  {}

class TenantsInitialState extends TenantsState {}

class TenantsLoadingState extends TenantsState {}

class TenantsFailureState extends TenantsState {}

class TenantsSuccessState extends TenantsState {
  final List tenantsData;

  TenantsSuccessState({required this.tenantsData});
}