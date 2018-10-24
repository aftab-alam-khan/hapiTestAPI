const Hapi = require('hapi');
const MongoClient = require('mongodb').MongoClient;

const server = Hapi.server({
    port: 3000,
    debug: {
        request: ['*']
    }
});

const routes = [
    {
        method: 'GET',
        path: '/',
        handler: (request) => {

            const { method, path, headers, query, params } = request;
            request.log(['info'], { method, path, headers, query, params });

            return 'Hello World!';
        }
    },
    {
        method: 'GET',
        path: '/locations',
        handler: async (request) => {

            const db = request.server.db;
            const locations = db.collection('location');

            // query all locations
            const documents = await locations.find({}).toArray();

            // prepare response
            // const response = documents.map((d) => {
            //     delete d._id;
            //     return d;
            // });
            
            return documents;
        }
    },
    {
        method: 'GET',
        path: '/locations/{locationId}/items',
        handler: async (request) => {

            return `implement the search for location:${request.params.locationId}`;
        }
    }
];

const init = async () => {

    await server.register({
        plugin: {
            register: async (server, options) => {

                // connection URL
                const url = 'mongodb://localhost:27017';
                const dbName = 'local-grocery-store';
                
                // connect
                const client = new MongoClient(url, {  useNewUrlParser: true });
                await client.connect();

                console.log("Connected successfully to mongo");
            
                const db = client.db(dbName);
                server.decorate('server', 'db', db);
                server.app.db = db;
            },
            name: 'db'
        }
    });

    await server.register({
        plugin: {
            register: (server, options) => {
                server.route(routes);
            },
            name: 'locations'
        }
    });

    try {
        if (!module.parent) {
            await server.start();
        } 
        else {
            await server.initialize();
        }
        return server;
    } 
    catch (error) {
        console.error(error);
        process.exit(1);
    }
};

process.on('unhandledRejection', (err) => {

    console.log(err);
    process.exit(1);
});

void async function () {
    if (!module.parent) {
        await init();
    }
}();

module.exports = {
    init
}

