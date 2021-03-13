import 'package:alugup/features/alugup/app/alugup_application.dart';
import 'package:alugup/features/alugup/app/alugup_widget.dart';
import 'package:alugup/features/alugup/framework/environment.dart';

void main() => Production();

class Production extends Environment {
  final String appName = "AlugUp Production";
  final String baseUrl = "https://matheussanches.wixsite.com/mysite-10/_functions/";
  final String apiKey = "Ol5UtCXeHR0JLhl1LN64KmViEhDeMhtat3TlH1lb";

  EnvironmentType environmentType = EnvironmentType.PRODUCTION;

  @override
  createApplication() {
    return AlugupApplication();
  }

  @override
  createMainWidget(application) {
    return AlugupWidget(application);
  }
}