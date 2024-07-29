import 'package:enquiry_form_android/models/user.dart';
import 'package:enquiry_form_android/services/renewal_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardWidget extends StatefulWidget {
  final User user;
  const DashboardWidget({super.key, required this.user});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  void initState() {
    super.initState();
    RenewalServices().getRenewals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(widget.user.decodeJwt()['name']),
                accountEmail: Text(widget.user.decodeJwt()['email'])),
            ListTile(
              onTap: () {
                context.go('/');
              },
              title: const Text("Log Out"),
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Test Dashboard"),
          )
        ],
      ),
    );
  }
}
