# **Descripción de los Casos de Uso**

## **Requisitos y Funcionalidades Importantes**

-	**R1: Registro de lectores (usuarios).**
-	**R2: Registrar libros para intercambiar.**
-	**R3: Buscar libros disponibles para intercambiar.**
-	**R4: Revisar el estado del libro disponible para intercambio.**
-	**R5: Solicitar intercambio de libros.**
-	**R6: Establecer el punto de encuentro para el intercambio.**
-	R7: Calificar los libros intercambiados.
-	R8: Revisar el historial de los libros intercambiados
-   R9: Sistema de recomendación de libros por localización

Nota: Los requisitos en negrita son priorizados para la primera entrega.

## **Casos de Uso**

![Caso de Uso del Sistema](https://github.com/eluqm/CS2024-2Grupo03/blob/main/Docs/imagenes/CASOS%20DE%20USO.png)

---

## **1. Caso de Uso: Registro de Usuarios**  
### 1. Breve Descripción del Caso de Uso
El caso de uso &quot;Registro de Usuarios&quot; describe cómo un usuario puede agregar libros que desea
intercambiar o donar, proporcionando detalles como el título, autor, condición del libro y su
disponibilidad para el intercambio.

### 2. Flujo de Eventos
#### 2.1 Flujo Básico

1. El actor (usuario) abre la aplicación y selecciona la opción &quot;Registrarse&quot;.
2. El sistema solicita al usuario su nombre, correo electrónico, contraseña y preferencias de lectura.
3. El usuario introduce los datos solicitados.
4. El sistema verifica que el correo electrónico no esté registrado previamente y valida la información.
5. El sistema crea una cuenta para el usuario y lo redirige a la pantalla principal.

#### 2.2 Flujos Alternativos

En los flujos alternativos de un caso de uso &quot;Registrar libros para intercambiar&quot; en el sistema de intercambio de libros, se puede considerar diferentes situaciones que pueden desviar el flujo
principal de eventos.

2.2.1. Flujo Alternativo: Correo ya registrado
Descripción: En el punto 4 si el correo electrónico ya está registrado, el sistema muestra un mensaje de error indicando que el correo ya está en uso y sugiere iniciar sesión o recuperar la
contraseña.
Acciones: Si el usuario selecciona recuperar la contraseña
- El sistema muestra la página de recuperar contraseña redirigiendo a otro caso de uso y el caso
de uso concluye.

### 3. Precondiciones

3.1. El usuario debe tener acceso a internet.

### 4. Postcondiciones

4.1 El usuario queda registrado y puede iniciar sesión en la aplicación.

### 5. Consideraciones Especiales

5.1. Usabilidad:
- El sistema tiene una interfaz intuitiva y de un dominio de uso en 5 intentos como máximo, con formularios claros para introducir los datos del usuario y mensajes de error fáciles de comprender.

5.2 Rendimiento:
- El proceso de registro debe ser rápido, permitiendo la creación de cuentas en menos de 5 segundos con validación en tiempo real.

5.3 Seguridad:
- El sistema debe asegurar que las contraseñas sean almacenadas cifradas y que los datos personales cumplan con normativas de privacidad como el RGPD.

---

## **2. Caso de Uso: Registrar libros para intercambiar**  

### 1. Breve Descripción del Caso de Uso
El caso de uso &quot;Registrar libros para intercambiar&quot; describe cómo un usuario puede agregar libros que desea intercambiar o donar, proporcionando detalles como el título, autor, condición del libro y su disponibilidad para el intercambio.

### 2. Flujo de Eventos
#### 2.1 Flujo Básico

1. El actor (usuario) selecciona la opción &quot;Agregar libro&quot; en su perfil.
2. El sistema solicita el título, autor, género, descripción, y
condición del libro (nuevo, usado, etc.).
3. El usuario introduce los datos solicitados y sube una imágen del
libro opcionalmente.
4. El sistema guarda la información y marca el libro como
disponible para intercambio o donación.
5. El libro aparece en la lista de libros disponibles del usuario.

#### 2.2 Flujos Alternativos

En los flujos alternativos de un caso de uso &quot;Registrar libros para intercambiar&quot; en el sistema de intercambio de libros, se puede considerar diferentes situaciones que pueden desviar el flujo
principal de eventos.

2.2.1 Flujo Alternativo: Campos faltantes
Descripción: En el punto 3 si el usuario no completa alguno de los campos obligatorios, el sistema muestra un mensaje indicando qué información es necesaria para continuar.
Acciones:
- El sistema muestra un mensaje de error especificando qué campos faltan por completar y el usuario completa dichos campos hasta que la información requerida esté completa, selecciona registrar libro y el caso de uso concluye.

### 3. Precondiciones

3.1 El usuario debe estar registrado e iniciar sesión para poder solicitar un intercambio.

### 4. Postcondiciones

4.1 El libro queda registrado y disponible para otros usuarios en el catálogo de intercambio.

### 5. Consideraciones Especiales

5.1. Usabilidad:
- El proceso de registro de libros debe ser rápido(menos de 2 min) y permitir la edición de los detalles del libro en cualquier momento.

5.2. Interoperabilidad y compatibilidad:
- El sistema es capaz de operar en las versiones posteriores a Android 10.

5.3. Rendimiento:
- El tiempo de carga de las imágenes de los libros no debe superar los 3 segundos, incluso en conexiones lentas.

5.4. Seguridad:
- Se debe validar la autenticidad de las imágenes subidas para evitar contenido no autorizado y proteger los datos de los usuarios.

---
## **3. Caso de Uso: Buscador de Libros para Intercambiar**  
### 1. Breve Descripción del Caso de Uso
El caso de uso &quot;Buscador de Libros para Intercambiar&quot; describe cómo un usuario puede buscar libros disponibles para intercambio a través de diferentes filtros como título, autor, género, o condición del libro. El usuario interactúa con la interfaz de usuario para visualizar la búsqueda.

### 2. Flujo de Eventos
#### 2.1 Flujo Básico
1. El actor (usuario) accede a la opción &quot;Buscar libros&quot;.
2. El sistema ofrece filtros de búsqueda como título, autor, género,
y condición.
3. El usuario introduce los criterios de búsqueda.
4. El sistema muestra una lista de libros que coinciden con los
criterios ingresados.
5. El usuario selecciona un libro y el sistema muestra los detalles
del libro y la opción de solicitar el intercambio.

#### 2.2 Flujos Alternativos
En los flujos alternativos de un caso de uso &quot;Buscador de Libros para Intercambiar&quot; en el sistema de intercambio de libros, se puede considerar diferentes situaciones que pueden desviar el flujo principal de eventos.

2.2.1 Flujo Alternativo: Sin coincidencias
Descripción: En el punto 4 si no se encuentran coincidencias con los filtros de búsqueda, el sistema muestra un mensaje indicando que no hay libros disponibles con esos criterios y sugiere ampliar la búsqueda.
Acciones:
- El sistema muestra un mensaje sugiriendo al usuario que amplíe los filtros o pruebe con otros criterios de búsqueda y el caso de uso concluye.

### 3. Precondiciones

3.1 El usuario debe estar registrado e iniciar sesión para poder solicitar un intercambio.

### 4. Postcondiciones

4.1 El usuario puede visualizar los libros disponibles y solicitar un intercambio.

### 5. Consideraciones Especiales

5.1 Usabilidad:
- La funcionalidad de búsqueda debe permitir el uso de varios filtros al mismo tiempo para hacer la búsqueda más precisa y brindar sugerencias útiles.

5.2 Rendimiento:
- La búsqueda debe devolver resultados en menos de 2 segundos, incluso con un catálogo de
miles de libros.

5.3 Seguridad:
- Los datos de los libros y la información de los usuarios debe estar protegida y el acceso a los
datos solo debe ser permitido a usuarios registrados.

---
## **4. Caso de Uso: Revisar el Estado del Libro**  
### 1. Breve Descripción del Caso de Uso
El caso de uso &quot;Revisar el Estado del Libro&quot; describe la funcionalidad que permite a un usuario visualizar el estado del libro elegido dentro del sistema. El usuario interactúa con la interfaz de usuario para visualizar detalladamente la información del libro.

### 2. Flujo de Eventos
#### 2.1 Flujo Básico

1. En la pantalla principal del sistema, el usuario visualiza una
miniatura del libro.
2. Si el usuario desea ver el estado del libro:

3. El usuario selecciona la opción &quot;Ver Detalle del Libro&quot;.

4. El sistema accede al detalle del libro.

5. El sistema muestra el detalle del libro en una nueva pantalla.

6. El usuario tiene la opción de salir de la pantalla del detalle del libro y regresar a la pantalla anterior del sistema.

#### 2.2 Flujos Alternativos

En los flujos alternativos de un caso de uso &quot;Revisar el Estado del Libro&quot; en el sistema se puede considerar diferentes situaciones que pueden desviar el flujo principal de eventos.

2.2.1. Flujo Alternativo: Fallo de conexión
Descripción: En el punto 2 si durante la operación de ver historial de operaciones se produce un fallo, debido a problemas de conectividad con el servidor, se debe manejar adecuadamente esta
situación.
Acciones:
- El sistema muestra un mensaje de error indicando que no se puede acceder al historial de operaciones en ese momento debido a problemas de conexión y el caso de uso concluye.

### 3. Precondiciones

3.1. El dispositivo del usuario debe estar conectado a internet para acceder al sistema.

3.2. El usuario debe estar registrado en el sistema y haber iniciado sesión correctamente.

### 4. Postcondiciones

4.1. Se muestra al usuario el detalle completo del libro en la aplicación.

4.2. El usuario puede cerrar la ventana del detalle del libro y volver a la pantalla anterior de la aplicación.

### 5. Consideraciones Especiales

5.1. Usabilidad:
- El sistema tiene una interfaz intuitiva y de un dominio de uso en 5 intentos como máximo.

5.2. Interoperabilidad y compatibilidad:

- El sistema es capaz de operar en las versiones posteriores a Android 10.

5.3. Rendimiento:
- El sistema debe ser capaz de cargar y mostrar el historial de operaciones en no más de 600 milisegundos, incluso cuando hay grandes cantidades de datos.

5.4. Seguridad:
- El sistema debe garantizar la protección de los datos de los usuarios.

---

## **5. Caso de Uso: Solicitar intercambio de libros**  
### 1. Breve Descripción del Caso de Uso
El caso de uso &quot; Solicitar intercambio de libros&quot; describe la funcionalidad que permite a un usuario solicitar un intercambio de un libro con otro que tiene disponible para intercambiar dentro del sistema. El usuario interactúa con la interfaz de usuario para solicitar el intercambio de libros.

### 2. Flujo de Eventos
#### 2.1 Flujo Básico

1. En la pantalla del detalle del libro el usuario visualiza la opción de solicitar intercambio del libro.

2. Si el usuario desea solicitar el intercambio de libros.

3. El usuario selecciona la opción &quot;Solicitar intercambio&quot;
4. El sistema solicita al usuario elegir los libros con los que quiere realizar el intercambio de los que ha registrado.

5. El usuario elige los libros que propone para el intercambio.

6. El sistema envía la solicitud de intercambio con los libros
propuestos al usuario dueño del libro.

7. El usuario tiene la opción de cancelar la solicitud y regresar a la pantalla principal del sistema.

#### 2.2 Flujos Alternativos

En los flujos alternativos de un caso de uso &quot;Solicitar intercambio de libros&quot; en el sistema puede considerar diferentes situaciones que pueden desviar el flujo principal de eventos.

2.2.1 Flujo Alternativo: Fallo de conexión
Descripción: En el punto 2 si durante la operación de ver historial de operaciones se produce un fallo, debido a problemas de conectividad con el servidor, se debe manejar adecuadamente esta
situación.
Acciones:
- El sistema muestra un mensaje de error indicando que no se puede acceder al historial de operaciones en ese momento debido a problemas de conexión y el caso de uso concluye.

### 3. Precondiciones

3.1. El dispositivo del usuario debe estar conectado a internet para acceder al sistema.

3.2. El usuario debe tener registrado en el sistema los libros y haber iniciado sesión correctamente.

3.3. Deben existir libros registrados del usuario para que pueda realizar la solicitud satisfactoriamente.

### 4. Postcondiciones

4.1. Se muestra al usuario el historial completo de sus operaciones realizadas en la aplicación.

4.2. El usuario puede revisar el historial de operaciones y realizar acciones adicionales, como filtrar, buscar y ordenar las operaciones según sus necesidades.

4.3. El usuario puede cerrar la ventana del historial de operaciones y volver a la pantalla anterior del sistema o realizar otras acciones dentro de la aplicación.

### 5. Consideraciones Especiales

5.1. Usabilidad:
- El sistema tiene una interfaz intuitiva y de un dominio de uso en 5 intentos como máximo.

5.2. Interoperabilidad y compatibilidad:
- El sistema es capaz de operar en las versiones posteriores a Android 10.

5.3. Rendimiento:
- El sistema debe ser capaz de cargar y mostrar el historial de operaciones en no más de 600 milisegundos, incluso cuando hay grandes cantidades de datos.

5.4. Seguridad:
- El sistema debe garantizar la protección de los datos de los usuarios.

---

## **6. Caso de Uso: Establecer el punto de encuentro para el intercambio**  
### 1. Breve Descripción del Caso de Uso
El caso de uso &quot;Establecer el punto de encuentro para el intercambio&quot; describe la funcionalidad que permite establecer el punto de encuentro para el intercambio dentro del sistema. El usuario interactúa con la interfaz de usuario para visualizar y elegir el lugar de intercambio.

### 2. Flujo de Eventos
#### 2.1 Flujo Básico

1. En la pantalla de selección de ubicación del sistema, el usuario
elige un punto de encuentro para el intercambio.
2. Si el usuario desea seleccionar la ubicación del intercambio:
3. El sistema muestra los lugares de intercambio disponibles para
realizar el intercambio.
4. El usuario selecciona las ubicaciones disponibles para realizar
el intercambio.
5. El sistema envía el lugar de intercambio.
6. El otro usuario acepta el lugar de intercambio:
7. El sistema muestra el lugar de intercambio al usuario
8. El usuario acepta el lugar de intercambio del libro.

#### 2.2 Flujos Alternativos

En los flujos alternativos de un caso de uso &quot;Establecer el punto de encuentro para el intercambio&quot; en el sistema se pueden considerar diferentes situaciones que pueden desviar el flujo principal de eventos.

2.2.1 Flujo Alternativo: Fallo de conexión
Descripción: En el punto 2 si durante la operación  se produce un fallo, debido a problemas de conectividad con el servidor, se debe manejar adecuadamente esta situación.

Acciones:
- El sistema muestra un mensaje de error indicando que no se puede acceder al historial de operaciones en ese momento debido a problemas de conexión y el caso de uso concluye.

### 3. Precondiciones

3.1. El dispositivo del usuario debe estar conectado a internet para acceder al sistema.
3.2. El usuario debe estar registrado en el sistema y haber iniciado sesión correctamente.
3.3. Deben existir una solicitud de intercambio de libros aceptada.

### 4. Postcondiciones

5.1 Se muestra al usuario el punto de encuentro para el intercambio.

### 5. Consideraciones Especiales

5.1. Usabilidad:
- El sistema tiene una interfaz intuitiva y de un dominio de uso en 5 intentos como máximo.

5.2. Interoperabilidad y compatibilidad:
- El sistema es capaz de operar en las versiones posteriores a Android 10.

5.3. Rendimiento:
- El sistema debe ser capaz de cargar y mostrar el historial de operaciones en no más de 600 milisegundos, incluso cuando hay grandes cantidades de datos.

5.4. Seguridad:
- El sistema debe garantizar la protección de los datos de los usuarios.


