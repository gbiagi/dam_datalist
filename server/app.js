const express = require('express');
const fs = require('fs');
const app = express();
const port = 3000;

// Static content (public folder)
app.use('/public', express.static('public'));
app.use(express.json());

// Cache items.json data
let itemsCache = [];
try {
    const data = fs.readFileSync('assets/items.json', 'utf-8');
    itemsCache = JSON.parse(data);
} catch (err) {
    console.error("Failed to load items.json at startup:", err);
    process.exit(1); // Exit if the data can't be loaded at startup
}

// Routes
app.get('/', async (req, res) => {
    res.status(200).send(`Hello World *_/`);
});

// Fetch categories (GET)
app.get('/categories', async (req, res) => {
    console.log('Fetching categories');
    try {
        const categories = [...new Set(itemsCache.map(item => item.category))];
        res.status(200).send(categories);
    } catch (error) {
        console.error('Error fetching categories:', error);
        res.status(500).send({ error: 'Internal Server Error' });
    }
});

// Fetch items by category (POST)
app.post('/cat_items', async (req, res) => {
    console.log('Request body:', req.body);
    if (!req.body.category) {
        return res.status(400).send({ error: 'Category is required' });
    }

    console.log('Fetching items from category:', req.body.category);
    try {
        const items = itemsCache.filter(item => item.category === req.body.category)
            .map(item => {
                const commonFields = {
                    id: item.id,
                    category: item.category,
                    name: item.name,
                    minAgilty: item.minAgilty,
                    minStrength: item.minStrength,
                    weight: item.weight,
                    price: item.price,
                    description: item.description,
                    imagePath: item.imgpath,
                };
                if (item.category === "Bow") {
                    return { ...commonFields, power: item.power };
                } else {
                    return {
                        ...commonFields,
                        stabDmg: item.stabDmg,
                        slashDmg: item.slashDmg,
                        bluntDmg: item.bluntDmg,
                        defense: item.defense,
                        charisma: item.charisma,
                        durability: item.durability,
                    };
                }
            });
        res.status(200).send({ items });
    } catch (error) {
        console.error('Error fetching items by category:', error);
        res.status(500).send({ error: 'Internal Server Error' });
    }
});

// Fetch item information (POST)
app.post('/item_info', async (req, res) => {
    if (!req.body.itemName || !req.body.itemID) {
        return res.status(400).send({ error: 'Item name or ID is required' });
    }

    try {
        const items = itemsCache.filter(item =>
            item.name === req.body.itemName || item.id === req.body.itemID
        );
        res.status(200).send(items);
    } catch (error) {
        console.error('Error fetching item information:', error);
        res.status(500).send({ error: 'Internal Server Error' });
    }
});

// Item search (POST)
app.post('/search_item', async (req, res) => {
    const query = req.body.query?.toLowerCase() || '';
    const items = itemsCache.filter(item =>
        item.name.toLowerCase().includes(query)
    );
    res.status(200).send({ items });
});

// Start the server
const httpServer = app.listen(port, () => {
    console.log(`Example app listening on: http://0.0.0.0:${port}`);
});

// Handle unhandled promise rejections
process.on('unhandledRejection', (reason, promise) => {
    console.error('Unhandled Rejection at:', promise, 'reason:', reason);
    // Application specific logging, throwing an error, or other logic here
});

// Handle uncaught exceptions
process.on('uncaughtException', (err) => {
    console.error('Uncaught Exception thrown:', err);
    // Application specific logging, throwing an error, or other logic here
    process.exit(1); // Exit the process to avoid unknown state
});

// Gracefully shut down the server
process.on('SIGTERM', shutDown);
process.on('SIGINT', shutDown);

function shutDown() {
    console.log('Received kill signal, shutting down gracefully');
    httpServer.close(() => {
        process.exit(0);
    });
}
