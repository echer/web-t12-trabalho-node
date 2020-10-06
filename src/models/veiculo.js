module.exports = app => {
    let VeiculosSchema = app.db.mongoose.Schema({
        nome: String,
    })

    app.db.mongoose.model("Veiculos", VeiculosSchema);
}