package MSWeb2

/**
 * @author JamesChang
 * @since Grails4.0.1
 */
class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'login', action:'auth')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
