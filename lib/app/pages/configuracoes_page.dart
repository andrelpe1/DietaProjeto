import 'package:flutter/material.dart';
import 'package:mydiet/app/theme/themecontroller.dart';
import 'package:provider/provider.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});
  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),

          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.outline, width: 3),
                  ),
                  child: ClipOval(
                    child: Image.asset('assets/mydiet.png', fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'MyDiet',
                  style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    themeController.isDark ? Icons.dark_mode : Icons.light_mode,
                    color: colorScheme.onSurface,
                  ),
                  title: Text('Tema', style: TextStyle(color: colorScheme.onSurface)),
                  trailing: Switch(
                    value: themeController.isDark,
                    onChanged: (valor) => context.read<ThemeController>().toggleTheme(valor),
                  ),
                ),

                Divider(height: 1, indent: 16, endIndent: 16, color: colorScheme.outlineVariant),

                ListTile(
                  leading: Icon(Icons.quiz_outlined, color: colorScheme.onSurface),
                  title: Text('FAQ', style: TextStyle(color: colorScheme.onSurface)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('FAQ'),
                        content: Text('Este aplicativo foi destinado a ajudar a mãe de um amigo nosso que possui uma dieta específica a ser seguida'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: Text('Fechar')),
                        ],
                      ),
                    );
                  },
                ),

                Divider(height: 1, indent: 16, endIndent: 16, color: colorScheme.outlineVariant),

                ListTile(
                  leading: Icon(Icons.help_outline, color: colorScheme.onSurface),
                  title: Text('Entre em contato conosco', style: TextStyle(color: colorScheme.onSurface)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Entre em contato conosco'),
                        content: Text('João Altevir: (42) 99953-4638'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: Text('Fechar')),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

// tem que fazer o contato e o faq n esquece ENZO