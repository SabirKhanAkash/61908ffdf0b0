import 'package:dvm_app/core/di/injection_container.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/analytics/analytics_state.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_cubit.dart';
import 'package:dvm_app/features/vitals/presentation/blocs/vitals/vitals_state.dart';
import 'package:dvm_app/core/widgets/error_display.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/history/analytics_error_view.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/history/analytics_overview_card.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/history/empty_history_view.dart';
import 'package:dvm_app/features/vitals/presentation/widgets/history/history_header.dart';
import 'package:dvm_app/core/widgets/loader.dart';
import 'package:dvm_app/core/widgets/vital_log_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// History screen - displays logged vitals and analytics
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<VitalsCubit>()..getHistory()),
        BlocProvider(create: (_) => sl<AnalyticsCubit>()..getAnalytics()),
      ],
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History & Analytics',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: -0.5),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.wait([
          context.read<VitalsCubit>().refresh(),
          context.read<AnalyticsCubit>().refresh(),
        ]),
        child: CustomScrollView(
          slivers: [
            // Analytics Section
            SliverToBoxAdapter(
              child: BlocBuilder<AnalyticsCubit, AnalyticsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Loader(message: 'Loading analytics...'),
                    ),
                    success: (analytics) =>
                        AnalyticsOverviewCard(analytics: analytics),
                    failure: (error) =>
                        AnalyticsErrorView(message: error.message.toString()),
                  );
                },
              ),
            ),

            // History Header
            const SliverToBoxAdapter(child: HistoryHeader()),

            // History List
            BlocBuilder<VitalsCubit, VitalsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SliverFillRemaining(
                    child: Center(child: Text('No data')),
                  ),
                  posting: () => const SliverFillRemaining(child: Loader()),
                  posted: () => const SliverFillRemaining(child: Loader()),
                  loadingHistory: () => const SliverFillRemaining(
                    child: Loader(message: 'Loading history...'),
                  ),
                  historyLoaded: (logs) {
                    if (logs.isEmpty) {
                      return const SliverFillRemaining(
                        child: EmptyHistoryView(),
                      );
                    }

                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final log = logs[index];
                        return VitalLogTile(log: log);
                      }, childCount: logs.length),
                    );
                  },
                  error: (failure) => SliverFillRemaining(
                    child: ErrorDisplay(
                      message: failure.message.toString(),
                      onRetry: () {
                        context.read<VitalsCubit>().refresh();
                      },
                    ),
                  ),
                );
              },
            ),

            // Bottom padding
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
