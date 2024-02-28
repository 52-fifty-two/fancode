const mysql = require('../lib/mysql');

const getAllTours = async () => {
    const statement = 'select * from tours;';
    const parameters = [];
    return await mysql.query(statement, parameters);
}

const getMatchesByTourName = async params => {

    const size = parseInt(params.size) || 2;
    const page = parseInt(params.page) || 1;

    const offset = (page - 1) * size;

    const statement = `
        SELECT tours.name, matches.name as matchName, tourId, tours.startTime, tours.endTime 
        FROM matches 
        LEFT JOIN tours ON matches.tourId = tours.id 
        WHERE tours.name = ? 
        LIMIT ? OFFSET ?;
    `;

    const parameters = [params.name, size, offset];

    return await mysql.query(statement, parameters);

}

module.exports = {
    getAllTours: getAllTours,
    getMatchesByTourName: getMatchesByTourName
}