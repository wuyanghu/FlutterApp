import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_demo_bloc.dart';

class BlocDemoPage extends StatelessWidget {
  static String route = 'BlocDemoPage';

  const BlocDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DemoBloc(),
      child: _BlocDemoPage(),
    );
  }
}

class _BlocDemoPage extends StatelessWidget {
  const _BlocDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc_demo"),
      ),
      body: BlocBuilder<DemoBloc, DemoInitial>(
        builder: (BuildContext context, state) {
          return Column(
            children: [
              Text("${state.count}"),
              ElevatedButton(
                  onPressed: () {
                    // BlocProvider.of<DemoBloc>(context);
                    context.read<DemoBloc>().add(DemoEvent());
                  },
                  child: Text("add"))
            ],
          );
        },
      ),
    );
    ;
  }
}
