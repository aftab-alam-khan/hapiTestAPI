const Hapi = require('hapi');

const server = Hapi.server({
    port: 3000,
    debug: {
        request: ['*']
    }
});


server.route([
    {
        method: 'GET',
        path: '/',
        handler: (request) => {

            const { method, path, headers, query, params } = request;

            request.log(['info'], { method, path, headers, query, params });

            return 'Hello World!';
        }
    }
]);

const init = async () => {

    await server.start();

    console.log(`Server running at: ${server.info.uri}`);
};

process.on('unhandledRejection', (err) => {

    console.log(err);
    process.exit(1);
});

if (require.main === module) {
    init();
} else {
    module.exports = server;
}
