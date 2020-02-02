package ex

class Ex200Controller {

    def index() { }

    def creatPage = {
        def ex100I = new Ex100()
        render view: 'creatEx200', model: [readonly:false,ex100I:ex100I,pageId:params.id]
    }
}
