import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:job_trackr/data/models/application_status.dart';
import 'package:job_trackr/data/models/job_application_details.dart';
import 'package:job_trackr/data/models/work_flexibility.dart';
import 'package:job_trackr/database/table.dart';
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
    extends ConsumerState<ApplicationDetailsScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  ApplicationDetails? applicationDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    fetchApplicationDetails();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                      duration: const Duration(milliseconds: 200),
                      opacity: isCollapsed ? 1.0 : 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          applicationDetails.role,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'images/details_header_image.jpg',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.2),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          applicationDetails.role,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              applicationDetails.company,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            _locationAndFlexibility(applicationDetails.location,
                                applicationDetails.flexibility),
                            const SizedBox(width: 10),
                            Text(
                              '• CDI',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _applicationDate(applicationDetails.applicationDate),
                        const SizedBox(height: 8),
                        _salaryRange(applicationDetails.salaryRange),
                        const SizedBox(height: 20),
                        _applicationStatus(applicationDetails.status),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),
                    _actionTabBar(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  Center(
                    child: Text("Infos here"),
                  ),
                  Center(
                    child: Text("History here"),
                  ),
                  Center(
                    child: Text("Notes here"),
                  ),
                  Center(
                    child: Text("Contacts here"),
                  ),
                  Center(
                    child: Text("Interviews here"),
                  ),
                  Center(
                    child: Text("Follow-up here"),
                  ),
                ],
              ),
            )
          ]);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _locationAndFlexibility(
      String? location, WorkFlexibility? flexibility) {
    return Text(
      '${location ?? ''}'
      '${location != null && flexibility != null ? ' • ' : ''}'
      '${flexibility != null ? ' • ${flexibility.localizedString(context)}' : ''}',
      style: TextStyle(color: Colors.grey[600]),
    );
  }

  Widget _applicationStatus(ApplicationStatus status) {
    return Container(
      color: status.decoration.color,
      child: DropdownButton<ApplicationStatus>(
        value: status,
        underline: const SizedBox(),
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
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
        hint: Text(
          AppLocalizations.of(context)!.applicationStatus,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _salaryRange(SalaryRange? salaryRange) {
    return salaryRange != null
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
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
          )
        : InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Add salary range',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ));
  }

  Widget _applicationDate(DateTime? applicationDate) {
    final DateFormat localizedDateFormat =
        DateFormat.yMMMMd(Localizations.localeOf(context).toString());
    return Text(
      applicationDate != null
          ? AppLocalizations.of(context)!
              .appliedOn(localizedDateFormat.format(applicationDate))
          : "",
      style: TextStyle(
        color: Colors.grey[600],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _actionTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: const <Widget>[
        Tab(
          icon: Icon(Icons.info_outline),
        ),
        Tab(
          icon: Icon(Icons.history_outlined),
        ),
        Tab(
          icon: Icon(Icons.note_alt_outlined),
        ),
        Tab(
          icon: Icon(Icons.contacts_outlined),
        ),
        Tab(
          icon: Icon(Icons.meeting_room_outlined),
        ),
        Tab(
          icon: Icon(Icons.calendar_today_outlined),
        ),
      ],
    );
  }

  Widget _status(ApplicationStatus status) {
    return Container(
      width: double.infinity, // Take up the full width of the dropdown item

      decoration: BoxDecoration(
        color: status.decoration.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          status.localized(context),
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
