package sys.security

/**
 * File Description/檔案描述:
 * @author JamesChang* @since 2020/4/5上午 07:48
 * @version 1.0* */
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
