'use strict';

const Lab = require('lab');
const Code = require('code');
const Server = require('../server');
let server;

// test shortcuts
const lab = exports.lab = Lab.script();
const before = lab.before;
const after = lab.after;
const describe = lab.describe;
const expect = Code.expect;
const it = lab.it;

// test data
const mockLocations = [
    {   
        locationId: 1,
        name: 'Diego\'s Grocerys'
    }, 
    {   
        locationId: 2,
        name: 'Carlos\'s Super Market'
    },
    {   
        locationId: 3,
        name: 'Miguel\'s Späti'
    },
    {   
        locationId: 4,
        name: 'Food Heaven'
    },
    {   
        locationId: 5,
        name: 'Pared Mercado'
    }
];

describe('Local Grocery API', () => {

    before(async () => {

        server = await Server.init();

        // clean DB
        await server.db.collection('location').drop();

        // insert test data
        const locationsCol = await server.db.collection('location');
        await locationsCol.insertMany(mockLocations);
    });

    after(async () => {

        if (!server) {
          return;
        }
    
        await server.stop();
    });

    it('GET /', async () => {

        const response = await server.inject({
            method: 'GET',
            url: '/'
        });

        expect(response.statusCode).to.equal(200);
        expect(response.result).to.equal('Hello World!');
    });

    it('GET /locations/', async () => {

        const response = await server.inject({
            method: 'GET',
            url: '/locations'
        });

        expect(response.statusCode).to.equal(200);
        expect(response.result).to.equal(mockLocations);
    });

    it('GET /locations/:locationId:/items', async () => {

        const response = await server.inject({
            method: 'GET',
            url: '/locations/1/items'
        });

        expect(response.statusCode).to.equal(200);
        expect(response.result).to.equal('Hello World!');
    });
});