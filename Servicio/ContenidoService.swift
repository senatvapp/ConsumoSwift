import Foundation

/// Clase que maneja las operaciones CRUD para el modelo Contenido.
class ContenidoManager {
    private var contenidos: [Contenido] = []

    // MARK: - Operaciones CRUD

    /// Agrega un nuevo contenido a la lista de contenidos.
    ///
    /// - Parameter contenido: El objeto Contenido que se va a agregar.
    func agregarContenido(_ contenido: Contenido) {
        contenidos.append(contenido)
    }

    /// Obtiene todos los contenidos almacenados.
    ///
    /// - Returns: Una lista con todos los contenidos.
    func obtenerTodosLosContenidos() -> [Contenido] {
        return contenidos
    }

    /// Obtiene un contenido por su identificador único.
    ///
    /// - Parameter id: El identificador único del contenido.
    /// - Returns: El contenido que corresponde al identificador, o nil si no se encuentra.
    func obtenerContenidoPorId(_ id: UUID) -> Contenido? {
        return contenidos.first(where: { $0.id == id })
    }

    /// Actualiza los datos de un contenido existente.
    ///
    /// - Parameter id: El identificador del contenido que se quiere actualizar.
    /// - Parameter contenidoActualizado: El nuevo objeto Contenido que reemplazará al contenido existente.
    /// - Returns: `true` si la actualización fue exitosa, `false` si no se encontró el contenido.
    func actualizarContenido(_ id: UUID, con contenidoActualizado: Contenido) -> Bool {
        if let index = contenidos.firstIndex(where: { $0.id == id }) {
            contenidos[index] = contenidoActualizado
            return true
        }
        return false
    }

    /// Elimina un contenido de la lista.
    ///
    /// - Parameter id: El identificador único del contenido a eliminar.
    /// - Returns: `true` si la eliminación fue exitosa, `false` si no se encontró el contenido.
    func eliminarContenido(_ id: UUID) -> Bool {
        if let index = contenidos.firstIndex(where: { $0.id == id }) {
            contenidos.remove(at: index)
            return true
        }
        return false
    }
}
