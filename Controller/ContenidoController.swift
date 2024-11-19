import Foundation

class ContenidoController {
    private let contenidoService = ContenidoService()

    func crearContenido() {
        print("=== Crear Contenido ===")

        let nombre = leerEntrada(prompt: "Nombre")
        let sinopsis = leerEntrada(prompt: "Sinopsis")
        let anioLanzamiento = Int(leerEntrada(prompt: "Año de lanzamiento")) ?? 0
        let imagenURL = leerEntrada(prompt: "Imagen URL")
        let director = leerEntrada(prompt: "Director")
        let usuarioCreacion = leerEntrada(prompt: "Usuario creación")
        let tipoContenidoCodigo = leerEntrada(prompt: "Tipo contenido código")
        let generoContenidoCodigo = leerEntrada(prompt: "Género contenido código")

        let contenido = Contenido(
            nombre: nombre,
            sinopsis: sinopsis,
            anioLanzamiento: anioLanzamiento,
            imagenURL: imagenURL,
            director: director,
            usuarioCreacion: usuarioCreacion,
            tipoContenidoCodigo: tipoContenidoCodigo,
            generoContenidoCodigo: generoContenidoCodigo
        )

        contenidoService.crearContenido(contenido: contenido)
    }

    func listarContenidos() {
        print("=== Listar Contenidos ===")
        let contenidos = contenidoService.obtenerTodosLosContenidos()
        if contenidos.isEmpty {
            print("No hay contenidos disponibles.")
        } else {
            for (index, contenido) in contenidos.enumerated() {
                print("""
                \(index + 1). \(contenido.nombre)
                Sinopsis: \(contenido.sinopsis)
                Año de lanzamiento: \(contenido.anioLanzamiento)
                URL Imagen: \(contenido.imagenURL)
                Director: \(contenido.director)
                Usuario creación: \(contenido.usuarioCreacion)
                Tipo contenido: \(contenido.tipoContenidoCodigo)
                Género contenido: \(contenido.generoContenidoCodigo)
                """)
            }
        }
    }
}

// Función de lectura genérica
func leerEntrada(prompt: String) -> String {
    print(prompt, terminator: ": ")
    return readLine() ?? ""
}
