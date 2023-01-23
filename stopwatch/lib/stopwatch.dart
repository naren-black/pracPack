import 'package:flutter/material.dart';
import 'dart:async';

import 'package:stopwatch/platform_alert.dart';

class Stopwatch extends StatefulWidget {
  static const route = '/stopwatch';
  final String? name, email;
  const Stopwatch({this.name, this.email}) : super();

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  late int millSec = 0;
  late Timer timer = Timer(const Duration(milliseconds: 1), () {});
  bool isTicking = false;
  final laps = <int>[];
  final itemHeight = 60.0;
  final ScrollController scrolly = ScrollController();

  void _onTick(Timer timy) {
    setState(() {
      millSec += 100;
    });
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      // laps.clear();
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _resetIt() {
    timer.cancel();
    setState(() {
      laps.add(millSec);
      millSec = 0;
    });

    scrolly.animateTo(
      itemHeight * laps.length,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeIn,
    );
  }

  // Widget _showTotal(BuildContext context) {
  //   Scaffold.of(context).showBottomSheet((context) {
  //     final totRuntime = laps.fold(millSec, (total, lap) => total + lap);
  //     final textTheme = Theme.of(context).textTheme;
  //     return Container(
  //       color: Theme.of(context).cardColor,
  //       width: double.infinity,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 30.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               'Lap finished!',
  //               style: textTheme.headline6,
  //             ),
  //             Text('Total Lap time is: ${_secondsText(totRuntime)}'),
  //           ],
  //         ),
  //       ),
  //     );
  //   });

  // final ctrl = showBottomSheet(
  //   context: context,
  //   builder: _buildRunCompleteSheet,
  // );
  // Future.delayed(Duration(seconds: 5)).then((_) => ctrl.close);
  // final totRuntime = laps.fold(millSec, (total, lap) => total + lap);
  // final alert = PlatformAlert(
  //   title: 'Run completed!',
  //   message: 'Total runtime: ${totRuntime / 1000} seconds',
  // );
  // alert.show(context);
  // }

  // Widget _buildRunCompleteSheet(BuildContext context) {
  //   final totRuntime = laps.fold(millSec, (total, lap) => total + lap);
  //   final textTheme = Theme.of(context).textTheme;

  //   return SafeArea(
  //     child: Container(
  //       color: Theme.of(context).cardColor,
  //       width: double.infinity,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 30.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               'Lap finished!',
  //               style: textTheme.headline6,
  //             ),
  //             Text('Total Lap time is: ${_secondsText(totRuntime)}'),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  String _secondsText(int millsecs) => '${millsecs / 1000} seconds';

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map argies =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // String theName = argies.containsKey('theName') ? argies['theName'] : "NoName";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
          child: Text(
              'Stopwatch of: ${argies['theName']} with ${argies['theEmail']}'),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lap No: ${laps.length + 1}',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _secondsText(millSec),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const SizedBox(height: 20.0),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: isTicking ? null : _startTimer,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text('Start Madi'),
        ),
        const SizedBox(width: 20.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: isTicking ? _stopTimer : null,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            child: const Text('Stopeth!'),
          ),
        ),
        IconButton(
          onPressed: _resetIt,
          icon: const Icon(Icons.reset_tv_rounded),
        ),
        const SizedBox(width: 10.0),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              builder: (context) {
                final totRuntime =
                    laps.fold(millSec, (total, lap) => total + lap);
                final textTheme = Theme.of(context).textTheme;

                return SafeArea(
                  child: Container(
                    color: Theme.of(context).cardColor,
                    height: 200.0,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Lap finished!',
                              style: textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Total Lap time is: ${_secondsText(totRuntime)}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Closeth')),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text('Calculate Total'),
        ),

        // Builder(
        //   builder: (context) => TextButton(onPressed: onPressed, child: child),
        // ),
      ],
    );
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
          controller: scrolly,
          itemExtent: itemHeight,
          itemCount: laps.length,
          itemBuilder: (context, index) {
            final milsy = laps[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 50),
              title: Text('Lap no: ${index + 1}'),
              trailing: Text(_secondsText(milsy)),
            );
          }),
    );
  }
}
