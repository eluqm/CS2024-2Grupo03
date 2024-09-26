# **Diagramas del Diseño del Sistema**

## Diagrama Relacional de la Base de Datos | Versión 1.0

![Diagrama Relacional](#)

## Diagrama de la Vista de Desarrolo del Sistema

En el presente diagrama de componentes el sistema se va a dividir en capas:
- Capa de Presentación: en esta capa se desarrollará el manejo de la interfaz de usuario (Frontend) a travéz de un entorno de móbil o aplicación para smartphone.
- Capa de Servicios Web: en esta capa se ofrecen los servicios web del sistema (Parte del **Backend**) que el usuario consumirá en la capa de presentación (**Frontend**: Aplicación de Android).
- Capa de Servicios: en esta capa se desarrollará los procesos de negocios del sistema (Parte del **Backend**).
- Capa Repositorio: en esta capa se encargará de la conexión, configuración y almacenamiento de la información en la Base de Datos.

![Vista de Desarrollo](#)

## Diagrama de la Vista Física del Sistema
En esta vista se muestra el los nodos del sistema. En el nodo del Servidor_Library se encontrarán el servidor de Aplicaciones y el servidor de la Base de Datos. En el nodo Movil_Usuario se instalará la aplicación que hará uso de los servicios del Backend.

![Vista Física](#)
