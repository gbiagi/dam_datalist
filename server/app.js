const express = require('express')
const fs = require('fs')
const app = express()
const port = 3000

// Continguts estàtics (carpeta public)
app.use(express.static('public'))
app.use(express.json()); 

app.get('/', async (req, res) => {
    res.send(`Hello World *_/`)
})

// Demanar categories (POST)
app.post('/categories', async (req, res) => {
    // Obtener las categorias del json
    let categories
    try {
        let data = fs.readFileSync('assets/items.json')
        data = JSON.parse(data)
        categories = []
        data.forEach(element => {
            if (!categories.includes(element.category)) {
                categories.push(element.category)
            }
        });
        res.send(categories)

    } catch (error) {
        console.log(error);
    }
})

// Demanar items d'una categoria (POST)
app.post('/cat_items', async (req, res) => {
    let items = [];
    try {
        console.log(req.body); // This should now print the correct body
        console.log(req.body.category); // This should now print the category
        let data = fs.readFileSync('assets/items.json');
        data = JSON.parse(data);
        data.forEach(element => {
            if (element.category == req.body.category) {
                items.push(element);
            }
        });
        res.send(items);
    } catch (error) {
        console.log(error);
        res.send(error);
    }
});

// Demanar informació d'un ítem (POST)
app.post('/item_info', async (req, res) => {
    let items = []
    try {
        let data = fs.readFileSync('assets/items.json')
        data = JSON.parse(data)

        if(req.body.itemName != undefined){
            data.forEach(element => {
                if(element.name == req.body.itemName){
                    items.push(element)
                }
            });
        } else if(req.body.itemID != undefined){
            data.forEach(element => {
                if(element.id == req.body.itemID){
                    items.push(element)
                }
            });
        }
        res.send(items)

    } catch (error) {
        console.log(error);
        res.send(error)
    }
})

// Demanar items d'una cerca (POST)
app.post('/search_item', async (req, res) => {
    res.send(`Hello Search /`)
})

// Retornar la imatge d'un ítem amb una crida GET
app.get('/get_image', async (req, res) => {
    let image
    try {
        let data = fs.readFileSync('assets/items.json')
        data = JSON.parse(data)

        if(req.body.itemName != undefined){
            data.forEach(element => {
                if(element.name == req.body.itemName){
                    image = element.imgpath
                }
            });
        } else if(req.body.itemID != undefined){
            data.forEach(element => {
                if(element.id == req.body.itemID){
                    image = element.imgpath
                }
            });
        }
        res.send(image)

    } catch (error) {
        console.log(error);
        res.send(error)
    }
})

// Activar el servidor
const httpServer = app.listen(port, appListen)
function appListen () {
    console.log(`Example app listening on: http://0.0.0.0:${port}`)
}

// Aturar el servidor correctament 
process.on('SIGTERM', shutDown);
process.on('SIGINT', shutDown);
function shutDown() {
    console.log('Received kill signal, shutting down gracefully');
    httpServer.close()
    process.exit(0);
}