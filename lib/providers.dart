import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:splitr/providers/auth/auth_provider.dart';
import 'package:splitr/providers/groups/groups_provider.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(create: (context) => AuthProvider.instance()),
    ChangeNotifierProvider(create: (context) => GroupsProvider.instance())
  ];
}