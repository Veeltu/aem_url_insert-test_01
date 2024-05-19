const { argv } = require('process');

(async () => {
    const open = (await import('open')).default;

    // Define base URLs for different actions
    const baseUrls = {
        main: 'http://localhost:5000/main',
        test: 'http://localhost:5000/test',
        author: 'http://localhost:5000/author'
    };

    // Get the main action and the custom string (to be appended to the URL)
    const action = argv[2]; // e.g., 'main'
    const customString = argv[3]; // e.g., '/pl/sometext'

    if (baseUrls[action]) {
        const url = baseUrls[action] + customString; // Concatenate base URL and custom string
        console.log(`Opening URL: ${url}`);
        await open(url);
    } else {
        console.error('Invalid action. Please use "main", "test", or "author".');
    }
})();
