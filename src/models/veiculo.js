module.exports = (app) => {
  let VeiculosSchema = app.db.mongoose.Schema({
    marca: {
      type: String,
      required: [true, "é obrigatório"],
    },
    modelo: {
      type: String,
      required: [true, "é obrigatório"],
    },
    placa: {
      type: String,
      required: [true, "é obrigatório"],
    },
    ano: {
      type: Number,
      required: [true, "é obrigatório"],
    },
  });

  app.db.mongoose.model("Veiculos", VeiculosSchema);
};
