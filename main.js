require('dotenv').config()
const express = require("express")
const app = express()

// Controller imports
const { getAllCategories, getAllReceptsPerCategory, addCategory } = require("./controllers/categorieController")
const { getDetailsPerRecept } = require("./controllers/receptenController")
const { root, notFound, html } = require('./controllers/mainController')

// Config
const PORT = process.env.PORT || 3000
const endpoint = "/api"

// Middleware
app.use(express.json())

// Routes
app.get(`${endpoint}/categorieen`, getAllCategories)
app.get(`${endpoint}/categorieen/:id`, getAllReceptsPerCategory)
app.get(`${endpoint}/recepten/:id`, getDetailsPerRecept)
app.get("/", root)
app.post(`${endpoint}/categorieen`, addCategory)
app.get("/html", html)
// Catch all route
app.get("*", notFound)

// Start server
app.listen(PORT, () => {
    console.log(`Server is listening to port ${PORT}`)
})