import UIKit

class ContenidoView: UIViewController {
    let contenidoManager = ContenidoManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Ejemplo: Crear contenido al cargar la vista
        let contenido = Contenido(nombre: "Película A", sinopsis: "Una película épica", anioLanzamiento: 2023, imagenURL: "http://example.com/image.jpg", director: "Director A", usuarioCreacion: "Usuario1", tipoContenidoCodigo: "P001", generoContenidoCodigo: "G001")
        contenidoManager.agregarContenido(contenido)

        // Ejemplo: Obtener todos los contenidos
        let todosLosContenidos = contenidoManager.obtenerTodosLosContenidos()
        print(todosLosContenidos)
    }
}
