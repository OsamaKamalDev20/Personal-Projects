import 'package:flutter/material.dart';

class ResponsiveDesign extends StatefulWidget {
  const ResponsiveDesign({super.key});

  @override
  State<ResponsiveDesign> createState() => _ResponsiveDesignState();
}

class _ResponsiveDesignState extends State<ResponsiveDesign> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width > 660;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67FF5),
        title: Text(
          "Responsive Design",
          style: TextStyle(
            fontSize: 22,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(20),
          child: isSmall ? _singleColumnLayout() : _multiColumnLayout(),
        ),
      ),
    );
  }

  Widget _container(String title, Color color) {
    return Container(
      padding: const .all(15),
      height: 120,
      decoration: BoxDecoration(color: color, borderRadius: .circular(6)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _singleColumnLayout() {
    return Column(
      spacing: 20,
      children: [
        _container("Box 1", Colors.pinkAccent),
        _container("Box 2", Colors.purpleAccent),
        _container("Box 3", Colors.indigoAccent),
      ],
    );
  }

  Widget _multiColumnLayout() {
    return Row(
      spacing: 20,
      children: [
        Expanded(child: _container("Box 1", Colors.pinkAccent)),
        Expanded(child: _container("Box 2", Colors.purpleAccent)),
        Expanded(child: _container("Box 3", Colors.indigoAccent)),
      ],
    );
  }
}
