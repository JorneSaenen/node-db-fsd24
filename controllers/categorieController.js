const knex = require("../db");

const getAllCategories = async (req, res) => {
  try {
    const data = await knex.select("*").from("categorieen");
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({
      error: error.mesage ?? "Something went wrong",
    });
  }
};

const getAllReceptsPerCategory = async (req, res) => {
  try {
    const { id } = req.params;
    const data = await knex
      .select(
        "recepten.id",
        "recepten.naam",
        "recepten.bereidingstijd",
        "recepten.beschrijving",
        "categorieen.naam as categorie"
      )
      .from("recepten")
      .leftJoin("categorieen", "categorieen.id", "recepten.categorie_id")
      .where("categorie_id", +id);
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({
      error: error.message ?? "Something went wrong",
    });
  }
};

const addCategory = async (req, res) => {
  try {
    const { naam } = req.body;
    await knex("categorieen").insert({ naam: naam });
    res.status(201).json({
      message: "Categorie succesvol toegevoegd",
    });
  } catch (error) {
    res.status(500).json({
      error: error.message ?? "Something went wrong",
    });
  }
};

module.exports = {
  getAllCategories,
  getAllReceptsPerCategory,
  addCategory,
};
