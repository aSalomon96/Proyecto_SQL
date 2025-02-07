# Proyecto: Análisis SQL de Películas y Alquileres 
### **🎬📊Descripción del Proyecto 📝**
Este proyecto tiene como objetivo explorar y manipular datos en una base de datos relacional utilizando SQL. Se abordan consultas básicas, intermedias y avanzadas para analizar información relevante sobre películas, actores, clientes y alquileres. A través del uso de SQL, se busca extraer insights valiosos sobre tendencias y patrones en la industria del cine y la gestión de alquileres.

### **El análisis incluye:**
-   Consultas de selección y filtrado de datos.
-   Análisis de duración y clasificación de películas.
-   Evaluación de ingresos totales y rentabilidad.
-   Identificación de clientes destacados y comportamiento de alquiler.
-   Creación de vistas y uso de tablas temporales.

### **Estructura del Proyecto 🗂️**
        ├── 01_consultas_basicas.sql         # Consultas iniciales
        ├── 02_consultas_intermedias.sql     # Consultas más complejas
        ├── 03_consultas_avanzadas.sql       # Consultas avanzadas y optimización
        ├── 04_tablas_temporales.sql         # Uso de tablas temporales
        ├── README.md                        # Descripción del proyecto      


### **Consultas SQL 🔍**
1. **Consultas Básicas**
-   Selección de nombres de películas con clasificación ‘R’.
-   Actores con actor_id entre 30 y 40.
-   Películas cuyo idioma coincide con el original.
-   Ordenación de películas por duración.
-   Actores con apellido ‘Allen’.
-   Conteo de películas por clasificación.
-   Filtro combinado de películas PG13 o duración mayor a 3 horas.
-   Análisis de costos de reemplazo de películas.
-   Películas con la mayor y menor duración.
-   Costos de alquiler ordenados por fecha.

2. **Consultas IntermediasPelículas únicas en la base de datos.**
-   Comedias con duración superior a 180 minutos.
- Categorías con promedio de duración mayor a 110 min.
- Promedio de duración de alquileres.
- Concatenación de nombres de actores.
- Número de alquileres por día.
- Películas con duración superior al promedio.
- Número de alquileres por mes.
- Estadísticas de pagos (promedio, varianza, desviación estándar).
- Películas con alquiler por encima del precio medio.

3. **Consultas Avanzadas**
-   Identificación del actor con el ID más bajo y más alto.
- Conteo total de actores en la base de datos.
- Ordenación de actores por apellido.
- Primeras 5 películas de la base de datos.
- Agrupación de actores por nombre y conteo.
- Relación entre clientes y alquileres.
- CROSS JOIN entre film y category.
- Actores en películas de la categoría ‘Action’.
- Creación de vistas para análisis de películas y actores.
4. **Consultas con Tablas Temporales**
-   Número total de alquileres por cliente.
-   Duración total de películas en la categoría ‘Action’.
-   Clientes que alquilaron al menos 7 películas distintas.
-   Total de películas alquiladas por categoría.
-   Creación de tablas temporales para análisis de clientes y películas.´

### **Conclusiones y Resultados** 📌
El análisis de datos en la base de datos de películas y alquileres ha permitido identificar patrones en las preferencias de los clientes, rentabilidad de películas y eficiencia operativa en los alquileres. 

**Entre los hallazgos más relevantes:**

-   Clasificaciones y duración: Se identificaron tendencias en la duración de las películas y su relación con la clasificación por edades.
-   Ingresos y rentabilidad: Se analizaron los ingresos generados por alquileres y la rentabilidad de películas específicas.
-   Clientes y comportamiento de alquiler: Se encontraron clientes frecuentes y su impacto en los ingresos.
-   Optimización de consultas: Uso de vistas y tablas temporales para mejorar la eficiencia en consultas recurrentes.

### **Instalación y Requisitos 🛠️** 
Este proyecto requiere un entorno con SQL (por ejemplo, PostgreSQL o MySQL). Por motivos de tamaño el el esquema de la base de datos no se cargo en GitHub. En caso de requerirse, solicitarlo.

### **Contribuciones 🤝** 
Las contribuciones son bienvenidas para mejorar este análisis. Puedes proponer mejoras abriendo un pull request o creando una issue para discutir nuevas ideas.

### **Autor ✒️** 
**Agustin Salomon**

Repositorios Github
https://github.com/aSalomon96

mi LinkedIn https://www.linkedin.com/in/agustin-salomon/

Este proyecto es un ejercicio práctico para mejorar habilidades en SQL y análisis de bases de datos. 🚀
