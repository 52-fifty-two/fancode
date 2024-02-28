const mysql = require('../lib/mysql');

const getAllSportsToursAndMatches = async () => {
    const statement = 'select s.name as sportName, t.name as tourName, m.tourId as matchTourId, m.startTime as startTime, m.format as matchFormat, m.name as matchName ' +
        'from matches m inner join tours t on m.tourId = t.id ' +
        'inner join sports s on t.sportId = s.id';
    const parameters = [];
    return await mysql.query(statement, parameters);
}

module.exports = {
    getAllSportsToursAndMatches: getAllSportsToursAndMatches
}