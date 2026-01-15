import 'package:flutter/material.dart';
import '../models/action_button_model.dart';
import '../widgets/custom_action_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late List<ActionButtonModel> _actions;
  
  // Controlador para una animación suave de entrada
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Inicializamos la animación
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Definimos las acciones usando nuestro modelo profesional
    _actions = [
      ActionButtonModel(
        label: "Llamar Familia",
        description: "Toca para hablar con tus seres queridos",
        icon: Icons.family_restroom_rounded,
        color: const Color(0xFF2E7D32), // Verde bosque accesible
        onTap: () => _showActionDialog(context, "Llamando a Familia"),
      ),
      ActionButtonModel(
        label: "Emergencia",
        description: "Pide ayuda inmediata en caso de riesgo",
        icon: Icons.emergency_share_rounded,
        color: const Color(0xFFD32F2F), // Rojo alerta
        onTap: () => _showActionDialog(context, "Activando Emergencia..."),
      ),
      ActionButtonModel(
        label: "Guía de Voz",
        description: "Escucha las instrucciones de la aplicación",
        icon: Icons.record_voice_over_rounded,
        color: const Color(0xFF1976D2), // Azul institucional
        onTap: () => _showActionDialog(context, "Iniciando Guía de Voz"),
      ),
    ];

    // Iniciamos la animación al cargar la pantalla
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Método para simular una acción con un diálogo visual
  void _showActionDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Icon(Icons.info_outline, size: 50, color: Colors.blue),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CERRAR", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Usamos el Theme global para los textos
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Asistente"),
        // El estilo del AppBar ya viene del AppTheme
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "¡Hola!",
                style: textStyle.headlineMedium,
              ),
              Text(
                "¿En qué puedo ayudarte hoy?",
                style: textStyle.bodyLarge,
              ),
              const SizedBox(height: 30),
              
              // Lista de botones profesionales
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _actions.length,
                  itemBuilder: (context, index) {
                    return CustomActionCard(action: _actions[index]);
                  },
                ),
              ),
              
              // Pie de página de seguridad
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Versión de Asistencia 2026",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}