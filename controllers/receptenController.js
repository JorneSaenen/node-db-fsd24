const knex = require("../db")

const getDetailsPerRecept = async (req, res) => {
    try {
        const { id } = req.params
        const recept = await knex.select("*")
            .from("recepten")
            .where("id", +id)
            .first()

        const stappen = await knex.select("*")
            .from("bereidingsstappen")
            .where("recept_id", +id)

        const materialen = await knex.select("ingredienten.naam", "recept_ingredienten.hoeveelheid")
            .from("recept_ingredienten")
            .where("recept_id", +id)
            .leftJoin("ingredienten", "ingredienten.id", "ingredient_id")

        const data = {
            recept: recept,
            ingredienten: materialen,
            stappen: stappen,
        }

        res.status(200).json(data)
    }
    catch (error) {
        res.status(500).json({
            error: error.message ?? "Something went wrong"
        })
    }
}

exports.getDetailsPerRecept = getDetailsPerRecept