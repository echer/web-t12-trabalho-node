const fs = require("fs");

module.exports = function (app) {
  let model = app.db.mongoose.model("Avisos");

  return {
    listar: function (req, res) {
      let search = req.body.search;
      model
        .find({
          titulo: new RegExp(search),
        })
        .then((obj) => {
          res.json(obj);
        })
        .catch((err) => res.status(500).send(err));
    },
    adicionar: (req, res) => {
      try {
        let obj = new model(req.body);
        obj.save((err) => {
          if (err) res.status(500).send(`Erro ao inserir: ${err}`);
          else res.send(`Adicionado com sucesso - Id: ${obj.id}`);
        });
      } catch (error) {
        res.send("Eror ao adicionar: " + error);
      }
    },
    consultarPorId: async (req, res) => {
      try {
        let id = req.params.id;
        let obj = await model.findById(id);
        if (obj) res.json(obj);
        else res.status(404).end();
      } catch (error) {
        res.status(404).send();
      }
    },
    atualizar: async (req, res) => {
      let id = req.params.id;
      let obj = req.body;

      model.findByIdAndUpdate(id, { $set: obj }, (err) => {
        if (err) res.status(500).send(`Erro ao atualizar: ${err}`);
        else res.send("Atualizado com sucesso");
      });
    },
    excluir: (req, res) => {
      let id = req.params.id;
      model.findByIdAndRemove(id, (err) => {
        if (err) res.status(500).send(`Erro ao excluir: ${err}`);
        else res.send("Excluído com sucesso");
      });
    },
  };
};
