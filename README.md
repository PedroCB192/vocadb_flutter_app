# VocaDB Flutter App

Aplicación móvil desarrollada en **[Flutter](https://flutter.dev/)** que consume la **API pública de [VocaDB](https://vocadb.net/)** para explorar información musical como canciones, artistas y álbumes.

Este proyecto nace como una **versión moderna y simplificada** de la **[app oficial de VocaDB](https://github.com/VocaDB/vocadb)**, con un enfoque en mejorar la estructura, mantenibilidad y experiencia de desarrollo, más que en replicar todas las funcionalidades existentes.

---

## 🎯 Propósito del Proyecto

El objetivo principal de este proyecto es **aprender y practicar**:

- **[Flutter](https://flutter.dev/)** y **[Dart](https://dart.dev/)**
- Consumo de **APIs REST**
- Arquitectura de proyectos escalables
- Separación de responsabilidades
- Buenas prácticas de UI y organización de código
- Uso de **[Git](https://git-scm.com/)** y control de versiones

La aplicación es **solo de consumo**: no permite crear, editar ni sincronizar contenido con VocaDB.

---

## 🚀 Funcionalidades (alto nivel)

Actualmente, la app está pensada para ofrecer:

- Exploración de contenido musical desde **[VocaDB](https://vocadb.net/)**
- Listados de canciones, artistas y álbumes
- Rankings y listas ordenadas por distintos criterios
- Búsqueda global
- Pantallas de detalle
- Sistema de favoritos almacenado localmente

Las funcionalidades se implementan de forma incremental conforme avanza el aprendizaje.

---

## 🧱 Arquitectura

El proyecto utiliza una arquitectura basada en **separación por features** (inspirada en *Screaming Architecture*), donde cada funcionalidad agrupa:

- Capa de dominio (entidades y casos de uso)
- Capa de datos (modelos, datasources, repositorios)
- Capa de presentación (UI y manejo de estado)

Esto permite:
- Escalabilidad
- Reutilización de código
- Fácil mantenimiento
- Pruebas más sencillas en el futuro

---

## 📡 API

La app consume la **API pública de [VocaDB](https://vocadb.net/)**:

- Documentación: https://vocadb.net/swagger  
- Repositorio oficial: https://github.com/VocaDB/vocadb

No requiere autenticación.

---

## 📌 Estado del Proyecto

🚧 **En desarrollo activo**

Este proyecto está en constante evolución y su estructura y funcionalidades pueden cambiar conforme se aprende y se experimenta con nuevas ideas.

---

## 📄 Licencia

Proyecto con fines educativos y de aprendizaje.  
No afiliado oficialmente con **[VocaDB](https://vocadb.net/)**.
