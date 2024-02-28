const News = require('../models/news');

const getAllNews = async () => {
    return await News.getAllNews();
}

const getNewsByMatchId = async params => {
    const { matchId } = params;

    if (!matchId) {
        throw new Error('Match ID is required');
    }

    return await News.getNewsByMatchId(params);
}

const getNewsByTourId = async params => {
    const { tourId } = params;

    if (!tourId) {
        throw new Error('Tour ID is required');
    }

    return await News.getNewsByTourId(params);
}

const getNewsBySportId = async params => {
    const { sportId } = params;

    if (!sportId) {
        throw new Error('Sport ID is required');
    }

    return await News.getNewsBySportId(params);
}

module.exports = {
    getAllNews: getAllNews,
    getNewsByMatchId: getNewsByMatchId,
    getNewsByTourId: getNewsByTourId,
    getNewsBySportId: getNewsBySportId
}