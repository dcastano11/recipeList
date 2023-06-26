# Proyecto Recipe List

Este proyecto es una implementación de un recetario utilizando con la arquitectura Clean. La arquitectura Clean es un enfoque que promueve la separación de preocupaciones y la independencia de las capas en una aplicación.

## Estructura del proyecto

El proyecto sigue la siguiente estructura de carpetas:

- **Presentation**: Contiene la capa de presentación de la aplicación. Aquí se encuentran los controladores de la interfaz de usuario, vistas y presentadores que manejan la lógica de presentación.
- **Domain**: Contiene la capa de dominio, que define los modelos de datos y los casos de uso de la aplicación. Los casos de uso encapsulan la lógica de negocio de la aplicación y son independientes de cualquier implementación concreta.
- **Data**: Contiene la capa de datos, que se encarga de interactuar con fuentes de datos externas, como una API remota o una base de datos local. Aquí se encuentran los repositorios que implementan las interfaces definidas en la capa de dominio.
- **Core**: Contiene el punto de entrada de la app y una clase para la inyección de dependencias
## Dependencias

El proyecto no tiene dependencias externas y utiliza las siguientes frameworks internas:

- **MapKit**: Framework de Apple para mostrar mapas, ubicaciones y rutas en la aplicación.
- **Combine**: Framework de Apple para la programación reactiva y el manejo de flujos de datos asíncronos.
- **SwiftUI**: Framework de Apple para la creación de interfaces de usuario declarativas y reactivas.
- **Foundation**: Framework de Apple que proporciona estructuras y funcionalidades fundamentales para el desarrollo de aplicaciones.

## Instalación

1. Clona el repositorio en tu máquina local.
2. Abre el proyecto en Xcode.

## Uso

El proyecto es un ejemplo básico de una aplicación de listar recetas. Utiliza la arquitectura clean para separar la lógica de presentación, la lógica de negocio y la lógica de acceso a datos en capas independientes.

Puedes explorar el código fuente en las diferentes capas para comprender cómo se implementa la arquitectura Clean. Los casos de uso se encuentran en la capa de dominio, los controladores y presentadores en la capa de presentación, y los repositorios en la capa de datos.

## Notas
- El proyecto usa unas test unitarios básicos para el servicio de donde pide las recetas
- Incluye un servicio mock ("RecipeServiceMock") también, que toma un archivo JSON incluido como archivo para realizar la prueba en caso de que el servicio no esté disponible en el momento de su uso 
