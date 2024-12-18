const root = async (req, res) => {
    try {
        const info = {
            toonAlleCategorieen: process.env.NODE_ENV = "development" ? "http://localhost:3000/api/categorieen" : "/api/categorieen",
            toonAlleReceptenVanEenCategorie: "/api/categorieen/1",
            toonAlleDetailsVanEenRecept: "/api/recepten/1"
        }
        res.status(200).json(info)
    }
    catch (error) {
        res.status(500).json({
            error: error.mesage ?? "Something went wrong"
        })

    }
}
const notFound = (req, res) => {
    res.status(404).json({
        message: `Dit eindpunt (${req.url}) bestaat niet!!`
    })
}

const html = (req, res) => {
    res.send("<ul><li>hello</li></ul>")
}

exports.root = root
exports.notFound = notFound
exports.html = html