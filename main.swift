import Foundation

// Modelo
struct Contenido: Codable, Equatable {
    let id: UUID
    let nombre: String
    let sinopsis: String
    let anioLanzamiento: Int
    let imagenURL: String
    let director: String
    let usuarioCreacion: String
    let tipoContenidoCodigo: String
    let generoContenidoCodigo: String

    init(nombre: String, sinopsis: String, anioLanzamiento: Int, imagenURL: String, director: String, usuarioCreacion: String, tipoContenidoCodigo: String, generoContenidoCodigo: String) {
        self.id = UUID()
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

// CRUD Manager
class ContenidoManager {
    private var contenidos: [Contenido] = []

    // Create
    func agregarContenido(_ contenido: Contenido) {
        contenidos.append(contenido)
    }

    // Read
    func obtenerTodosLosContenidos() -> [Contenido] {
        return contenidos
    }

    func obtenerContenidoPorId(_ id: UUID) -> Contenido? {
        return contenidos.first(where: { $0.id == id })
    }

    // Update
    func actualizarContenido(_ id: UUID, con contenidoActualizado: Contenido) -> Bool {
        if let index = contenidos.firstIndex(where: { $0.id == id }) {
            contenidos[index] = contenidoActualizado
            return true
        }
        return false
    }

    // Delete
    func eliminarContenido(_ id: UUID) -> Bool {
        if let index = contenidos.firstIndex(where: { $0.id == id }) {
            contenidos.remove(at: index)
            return true
        }
        return false
    }
}

// Uso del CRUD
let contenidoManager = ContenidoManager()

// Crear
let contenido1 = Contenido(nombre: "Película A", sinopsis: "Una gran película", anioLanzamiento: 2021, imagenURL: "http://imagen.com/a.jpg", director: "Director A", usuarioCreacion: "usuario1", tipoContenidoCodigo: "T001", generoContenidoCodigo: "G001")
contenidoManager.agregarContenido(contenido1)

let contenido2 = Contenido(nombre: "Película B", sinopsis: "Otra gran película", anioLanzamiento: 2023, imagenURL: "http://imagen.com/b.jpg", director: "Director B", usuarioCreacion: "usuario2", tipoContenidoCodigo: "T002", generoContenidoCodigo: "G002")
contenidoManager.agregarContenido(contenido2)

// Leer
print("Todos los contenidos:")
print(contenidoManager.obtenerTodosLosContenidos())

if let contenido = contenidoManager.obtenerContenidoPorId(contenido1.id) {
    print("Contenido encontrado: \(contenido.nombre)")
}

// Actualizar
let contenidoActualizado = Contenido(nombre: "Película A (Actualizada)", sinopsis: "Una gran película (actualizada)", anioLanzamiento: 2021, imagenURL: "http://imagen.com/a_new.jpg", director: "Director A", usuarioCreacion: "usuario1", tipoContenidoCodigo: "T001", generoContenidoCodigo: "G001")
if contenidoManager.actualizarContenido(contenido1.id, con: contenidoActualizado) {
    print("Contenido actualizado")
}

// Eliminar
if contenidoManager.eliminarContenido(contenido2.id) {
    print("Contenido eliminado")
}

print("Contenidos después de eliminar:")
print(contenidoManager.obtenerTodosLosContenidos())
