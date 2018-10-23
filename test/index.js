'use strict';

const Lab = require('lab');
const Code = require('code');
const api = require('../api');

// Test shortcuts

const lab = exports.lab = Lab.script();
const describe = lab.describe;
const expect = Code.expect;
const it = lab.it;

describe('demographics API', () => {

    it('GET /', async () => {

        const response = await api.inject({
            method: 'GET',
            url: '/'
        });

        expect(response.statusCode).to.equal(200);
        expect(response.result).to.equal('Hello World!');
    });
});