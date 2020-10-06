module.exports = app => {
    let AvisosSchema = app.db.mongoose.Schema({
        nome: String,
    })

    app.db.mongoose.model("Avisos", AvisosSchema);
}