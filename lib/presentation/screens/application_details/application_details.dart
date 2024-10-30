import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_trackr/data/models/application_status.dart';
import 'package:job_trackr/data/models/job_application_details.dart';
import 'package:job_trackr/data/models/work_flexibility.dart';
import 'package:job_trackr/presentation/application_status_color.dart';
import 'package:job_trackr/presentation/application_status_localization.dart';
import 'package:job_trackr/presentation/work_flexibility_localization.dart';

import 'application_details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ApplicationDetailsScreen extends ConsumerStatefulWidget {
  final int applicationId;

  const ApplicationDetailsScreen({super.key, required this.applicationId});

  @override
  // ignore: library_private_types_in_public_api
  _ApplicationDetailsScreenState createState() =>
      _ApplicationDetailsScreenState();
}

class _ApplicationDetailsScreenState
    extends ConsumerState<ApplicationDetailsScreen> {
  ApplicationDetails? applicationDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchApplicationDetails();
  }

  Future<void> fetchApplicationDetails() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  Future<void> updateStatus(String newStatus) async {}

  Future<void> openEditStatusDialog() async {}

  @override
  Widget build(BuildContext context) {
    final applicationDetails =
        ref.watch(applicationDetailsProvider(widget.applicationId));

    return Scaffold(
      body: applicationDetails.when(
        data: (applicationDetails) {
          return CustomScrollView(slivers: [
            SliverAppBar(
              expandedHeight: 160.0,
              pinned: true,
              // Keeps the app bar pinned/sticky at the top when collapsed
              backgroundColor: Colors.purple,
              // Background color for the collapsed state
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    //TODO: Handle edit
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    //TODO: Handle delete
                  },
                ),
                //  _status(applicationDetails.status)
              ],
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Check the collapse ratio by comparing height
                  var top = constraints.biggest.height;
                  var isCollapsed = top < 120; // Threshold for title display

                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: isCollapsed ? 1.0 : 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          'Développeur Mobile Android H/F',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'images/details_header_image.jpg',
                          // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 8.0,
                            right: 4.0,
                            child: _status(applicationDetails.status))
                      ],
                    ),
                  );
                },
              ),
            ),
            // Rest of the body content goes here
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Développeur Mobile Android H/F',
                            // This only shows when expanded
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'United Solutions',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '• Lyon - 69',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '• CDI',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.blue[100]?.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '38 000 - 47 000 € / an',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    DropdownButton<ApplicationStatus>(
                      value: applicationDetails.status,
                      underline: SizedBox(),
                      isExpanded: true,
                      items: ApplicationStatus.values.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: _status(status),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          // Handle change and update the application status
                          //if (value != null) {
                          //   applicationDetails = applicationDetails.copyWith(status: value);
                          //}
                        });
                      },
                      hint: Text(AppLocalizations.of(context)!.applicationStatus),

                    ),

                    // Progress indicator
                    Divider(height: 40),
                    _actionTabBar(),
                    // Question Section
                    Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.purple[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Avez-vous eu un retour du recruteur ?",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          RadioListTile(
                            value: 1,
                            groupValue: 0,
                            onChanged: (value) {},
                            title: Text("Oui, je suis recruté"),
                          ),
                          RadioListTile(
                            value: 2,
                            groupValue: 0,
                            onChanged: (value) {},
                            title: Text(
                                "Ma candidature n'a pas été retenue / Je n'ai pas donné suite"),
                          ),
                          RadioListTile(
                            value: 3,
                            groupValue: 0,
                            onChanged: (value) {},
                            title: Text("Non, pas encore"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]);
          /*return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    applicationDetails.role,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    applicationDetails.company,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _locationAndFlexibility(applicationDetails.location,
                    applicationDetails.flexibility),
                _salaryRange(),
                _applicationStatus(applicationDetails.status),
                _actionTabBar()
              ],
            ),
          );*/
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _locationAndFlexibility(
      String? location, WorkFlexibility? flexibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '${location ?? ''}'
        '${location != null && flexibility != null ? ' - ' : ''}'
        '${flexibility != null ? flexibility.localizedString(context) : ''}',
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Widget _applicationStatus(ApplicationStatus status) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Status: ${status.localized(context)}',
                style: TextStyle(fontSize: 18)),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Open edit dialog to change status
              },
            ),
          ],
        ));
  }

  Widget _salaryRange() {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Text('35000 - 40000'));
  }

  Widget _actionTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {
            // Handle information action
          },
        ),
        IconButton(
          icon: Icon(Icons.history),
          onPressed: () {
            // Handle lightbulb action
          },
        ),
        IconButton(
          icon: Icon(Icons.note),
          onPressed: () {
            // Handle attachment action
          },
        ),
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            // Handle calendar action
          },
        ),
        IconButton(
          icon: Icon(Icons.contacts),
          onPressed: () {
            // Handle email action
          },
        ),
        IconButton(
          icon: Icon(Icons.check_circle),
          onPressed: () {
            // Handle completion action
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Handle edit action
          },
        ),
      ],
    );
  }

  Widget _status(ApplicationStatus status) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20.0,
              height: 12.0,
              decoration: status.decoration,
            ),
            const SizedBox(width: 4),
            // Space between the circle and text
            Text(
              status.localized(context),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
