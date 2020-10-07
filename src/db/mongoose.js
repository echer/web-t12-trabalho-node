const mongoose = require('mongoose')

module.exports = app => {
    mongoose.connect(`mongodb+srv://${process.env.MONGODB_USERNAME}:${process.env.MONGODB_PASSWORD}@${process.env.MONGODB_URL}/${process.env.MONGODB_DATABASE}?retryWrites=true&w=majority`, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        useFindAndModify: false
    })
    .then(() => console.log("Conexão foi realizada com o MongoDB"))
    .catch((err) => console.log(`Erro ao conectar ao no MongoDB: ${err}`))

    return mongoose;
}