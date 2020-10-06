module.exports = (app) => {
    app.get("/avisos", app.controllers.avisosController.listar)
    app.get("/avisos/:id", app.controllers.avisosController.consultarPorId)
    app.post("/avisos", app.controllers.avisosController.adicionar)
    app.put('/avisos/:id', app.controllers.avisosController.atualizar)
    app.delete('/avisos/:id', app.controllers.avisosController.excluir)
}