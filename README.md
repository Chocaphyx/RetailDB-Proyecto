# RetailDB-Proyecto
# Proyecto Base de Datos - TechStore Perú

Este repositorio contiene el desarrollo del proyecto académico 1 de **Gestión de Base de Datos** aplicado al caso empresarial **TechStore Perú**, abarcando desde el análisis inicial hasta la implementación en PostgreSQL y Oracle, y finalmente el análisis comparativo.

Entregables del Proyecto

### Entregable 1: Análisis de Requerimientos
- Documento de análisis del sistema (PDF, máx. 15 páginas).  
- Análisis del contexto empresarial TechStore Perú.  
- Identificación de procesos de negocio críticos y flujos de información.  
- Stakeholders y usuarios finales.  
- Requerimientos funcionales (RF) y no funcionales (RNF).  
- Volumetría de datos esperada.  
- Investigación inicial sobre PostgreSQL.  
- **Entregables específicos:**  
  - Documento PDF  
  - Diagrama de procesos de negocio  
  - Matriz de requerimientos  

### Entregable 2: Diseño e Implementación en PostgreSQL
- Diseño de la base de datos:  
  - Modelo Entidad-Relación (ER).  
  - Modelo Relacional normalizado (3FN mínimo).  
  - Diccionario de datos.  
- Implementación en PostgreSQL:  
  - Scripts **DDL** para creación de tablas y relaciones.  
  - Scripts **DML** con carga de datos de prueba (+1000 registros).  
  - Constraints, triggers, funciones y procedimientos almacenados.  
  - Configuración de usuarios y permisos.  
- **Entregables específicos:**  
  - Scripts SQL  
  - Diagrama ER  
  - Manual de instalación y configuración  
  - Base de datos funcional  

### Entregable 3: Diseño e Implementación en Oracle
- Migración del diseño de PostgreSQL a Oracle.  
- Adaptación del modelo a características específicas de Oracle.  
- Scripts **DDL** y **DML** adaptados.  
- Implementación de **PL/SQL procedures** y funciones.  
- Configuración de tablespaces, usuarios, roles y privilegios.  
- Procedimiento de migración documentado.  
- **Entregables específicos:**  
  - Scripts SQL para Oracle  
  - Documento comparativo de diferencias  
  - Base de datos funcional en Oracle
  - 
### Entregable 4: Análisis Comparativo y Documentación Final
- Análisis comparativo técnico entre PostgreSQL y Oracle:  
  - Rendimiento en consultas, inserciones y actualizaciones.  
  - Consumo de recursos.  
  - Facilidad de administración y seguridad.  
- Análisis económico:  
  - Costos de licenciamiento y mantenimiento.  
  - **TCO (Total Cost of Ownership)** a 3 años.  
- Recomendación final:  
  - SGBD recomendado para TechStore Perú.  
  - Justificación técnica y económica.  
  - Plan de implementación y mitigación de riesgos.  
- Casos de prueba:  
  - Ejecución de mínimo 10 consultas complejas en ambos SGBD.  
  - Comparación de tiempos y planes de ejecución.  
- **Entregables específicos:**  
  - Informe final en PDF  
  - Resultados de pruebas

### Contenido del Repositorio:
/RetailDB-Proyecto/
├── /docs/ # Documentación
├── /postgresql/ # Scripts PostgreSQL
├── /oracle/ # Scripts Oracle
├── /data/ # Datos de prueba
├── /tests/ # Scripts de pruebas
└── README.md # Guía del proyecto
