module.exports = (app) => {
  let AvisosSchema = app.db.mongoose.Schema({
    titulo: {
      type: String,
      required: [true, "é obrigatório"],
    },
    message: {
      type: String,
      required: [true, "é obrigatório"],
    },
  });

  app.db.mongoose.model("Avisos", AvisosSchema);
};
