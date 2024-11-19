import Foundation

/// Estructura que representa un contenido digital (película, serie, etc.)
/// Conformada al protocolo Codable para facilitar la serialización y deserialización de datos.
struct Contenido: Codable, Equatable {
    /// Identificador único del contenido.
    let id: UUID
    /// Nombre del contenido.
    let nombre: String
    /// Descripción breve del contenido.
    let sinopsis: String
    /// Año de lanzamiento del contenido.
    let anioLanzamiento: Int
    /// URL de la imagen asociada al contenido.
    let imagenURL: String
    /// Director del contenido.
    let director: String
    /// Usuario que creó el contenido.
    let usuarioCreacion: String
    /// Código del tipo de contenido (ej. película, serie).
    let tipoContenidoCodigo: String
    /// Código del género del contenido (ej. acción, comedia).
    let generoContenidoCodigo: String

    /// Inicializador de la estructura Contenido.
    init(nombre: String, sinopsis: String, anioLanzamiento: Int, imagenURL: String, director: String, usuarioCreacion: String, tipoContenidoCodigo: String, generoContenidoCodigo: String) {
        self.id = UUID()  // Genera un identificador único al crear el contenido.
        self.nombre = nombre
        self.sinopsis = sinopsis
        self.anioLanzamiento = anioLanzamiento
        self.imagenURL = imagenURL
        self.director = director
        self.usuarioCreacion = usuarioCreacion
        self.tipoContenidoCodigo = tipoContenidoCodigo
        self.generoContenidoCodigo = generoContenidoCodigo
    }
}
