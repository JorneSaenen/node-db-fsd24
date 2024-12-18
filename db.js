const { DB_HOST, DB_PORT, DB_USER, DB_PASS, DB_DATABASE } = process.env

const knex = require('knex')({
    client: 'mysql2',
    connection: {
        host: DB_HOST,
        port: DB_PORT,
        user: DB_USER,
        password: DB_PASS,
        database: DB_DATABASE,
    },
});

module.exports = knex