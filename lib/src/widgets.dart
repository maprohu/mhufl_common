import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';

typedef ValueBuilder<T> = Widget Function(BuildContext context, T value);

class NullWidget extends StatelessWidget {
  const NullWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Loading..."),
    );
  }
}

class NextButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('>'),
    );
  }
}

class ScaffoldPage extends StatelessWidget {
  final String title;
  final Widget body;

  const ScaffoldPage({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }

  static Future<T> show<T>(
    BuildContext context,
    String title,
    Widget body,
  ) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScaffoldPage(title: title, body: body),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget child;

  const Section({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          dense: true,
        ),
        child,
      ],
    );
  }
}

class ActionsBar extends StatelessWidget {
  final List<Widget> children;

  const ActionsBar({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

class BusyWidget extends StatelessWidget {
  const BusyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      onPressed: null,
      icon: CircularProgressIndicator(
          // color: Colors.white,
          ),
    );
  }
}

class StateWidget<T> extends StatelessWidget {
  final StateType state;

  const StateWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case StateType.ok:
        return const Icon(
          Icons.check,
          color: Colors.green,
          size: 24.0,
        );
      case StateType.error:
        return const Icon(
          Icons.error,
          color: Colors.red,
          size: 24.0,
        );
      case StateType.busy:
        return const BusyWidget();
    }
  }
}
