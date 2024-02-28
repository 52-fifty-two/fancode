const News = require('../controllers/news');

module.exports = function(app) {
   
    app.route('/news').get(async (req, res, next) => {
        try {
            return res.json(await News.getAllNews());
        } catch (err) {
            return next(err);
        }
    });

    app.route('/getNewsByMatchId').get(async (req, res, next) => {
        try {
            let params = req.query;
            let result = await News.getNewsByMatchId(params);
            return res.json(result);
        } catch (err) {
            return next(err);
        }
    });

    app.route('/getNewsByTourId').get(async (req, res, next) => {
        try {
            let params = req.query;
            let result = await News.getNewsByTourId(params);
            return res.json(result);
        } catch (err) {
            return next(err);
        }
    });

    app.route('/getNewsBySportId').get(async (req, res, next) => {
        try {
            let params = req.query;
            let result = await News.getNewsBySportId(params);
            return res.json(result);
        } catch (err) {
            return next(err);
        }
    });
}