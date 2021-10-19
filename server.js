const Hapi = require('@hapi/hapi');
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
        path: '/locations',
        handler: async (request, header) => {

            const db = server.app.db;
            const locationCollection = db.collection('locations');

            // query all locations
            const documents = await locationCollection.find({}).toArray();
            return documents;
        }
    },
    {
        method: 'GET',
        path: '/locations/{locationId}/items',
        handler: async (request, header) => {

            const db = server.app.db;
            const locationCollection = db.collection('locations');
            const itemCollection = db.collection('items');
            const locationId = parseInt(request.params.locationId);

            // query in locations collections
            const locationStatus = await locationCollection.findOne({ locationId });
            
            // return the response status
            if (locationStatus === null) {
                return header.response('location not found').code(404);
            }
            
            // query in item collections
            const documents = await itemCollection.find({ locationId }).toArray();
            
            // return the query
            return documents;
        }
    },
    {
        method: 'POST',
        path: '/locations/{locationId}/order',
        handler: async (request, header) => {

            const db = server.app.db;
            const orderCollection = db.collection('orders');
            const itemCollection = db.collection('items');
            const payloadData = request.payload;
            const locationId = parseInt(request.params.locationId);
            const itemId = payloadData.items;

            // query in item collection
            const gettotalItem = itemId.map((item) => {
                return itemCollection.find({ itemId: item.itemId, locationId }).toArray();
            });

            const rawTotalItem = await Promise.all(gettotalItem);

            //get new array from sub-array
            const totalItem = rawTotalItem.reduce((previousValue, currentValue) => [...previousValue, ...currentValue], []);

            // find total price
            // Calucation of total price, so the initial value for price set to 0.0 :)
            const total = await totalItem.reduce((previousValue, currentValue, index) => {
                return previousValue + (currentValue.price * itemId[index].quantity)
            }, 0.0);
            
            // Insert in order collection
            const documents = await orderCollection.insertOne({ ...payloadData, total });

            // return the response status
            if (documents.result.ok === 1 && documents.result.ok) {
                return header.response(documents.ops[0]).code(201);
            } else {
                return header.response('Failed to Post data').code(404);
            }
        }
    }
];

const init = async () => {
    
    // connect to DB
    const url = 'mongodb://localhost:27017/local-grocery-store';
    const client = new MongoClient(url, {  useNewUrlParser: true, useUnifiedTopology: true });
    await client.connect();
    
    const db = client.db();
    server.app.db = db;
    
    console.log("Connected successfully to mongo");

    // routes configuration
    server.route(routes);

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

