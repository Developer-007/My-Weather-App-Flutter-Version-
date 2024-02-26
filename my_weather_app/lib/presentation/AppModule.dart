import 'package:my_weather_app/data/repository/repository_impl.dart';
import 'package:my_weather_app/domain/repository/repository.dart';
import 'package:my_weather_app/domain/usecases/get_data_usecase.dart';
import 'package:get_it/get_it.dart';

class AppModule{
  setup(GetIt getIt){
    getIt.registerSingleton<Repository>(RepositoryImplementation());
    getIt.registerFactory(() => GetDataUseCase(getIt<Repository>()));
  }
}