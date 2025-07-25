// This is a configuration file that exports an object named `config`.
// The `config` object contains the configuration settings for the database connection.
// It specifies the host, user, password, and database name for the MySQL database that the web app will connect to.
// The `listPerPage` property specifies the number of items to display per page in case of pagination.
// This file is used to store the configuration settings in a separate file, making it easier to manage and modify them.

const config = {
  db: {
    host: "localhost",
    user: "root",
    password: "",
    database: "iot_garden",
  },
};
// require('dotenv').config();
// const config = {
//     db: {
//         host: process.env.MYSQL_HOST,
//         user: process.env.MYSQL_USER,
//         password: process.env.MYSQL_PASSWORD,
//         database: process.env.MYSQL_DATABASE,
//         port: process.env.MYSQL_PORT,
//     }
// };
module.exports = config;
