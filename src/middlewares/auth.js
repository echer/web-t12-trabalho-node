module.exports = (app) => {
  app.use((req, res, next) => {
    if (
      req.originalUrl == "/usuarios/login" ||
      (req.originalUrl == "/usuarios" && req.method == "POST")
    ) {
      next();
    } else {
      let token = req.headers.token;
      if (!token) res.status(401).send("Não autorizado");
      else {
        app
          .get("jwt")
          .verify(token, process.env.JWT_CHAVE_PRIVADA, (err, decoded) => {
            if (err) res.status(401).send("Não autorizado - Token inválido");
            else {
              req.decoded = decoded;
              next();
            }
          });
      }
    }
  });
};
