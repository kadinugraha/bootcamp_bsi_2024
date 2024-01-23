const express = require('express');
const cors = require('cors') 

const app = express();
const port = process.env.PORT || 8080;
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors()); 

function makeid(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
}

var listUser = {
    'adinugraha': {
        'rooms': ['8SFkk','ondNC']
    },
    'tutisusanti':{
        'rooms': ['8SFkk']
    },
    'bambangp':{
        'rooms': ['ondNC']
    }
};

var listChatroom = {
    '8SFkk':{
        'users': ['adinugraha','tutisusanti'],
        'messages': [
            {'username':'adinugraha', 'text': 'halo selamat pagi','timestamp':'1705989565'},
            {'username':'adinugraha', 'text': 'apakah saya boleh bertanya?','timestamp':'1705989585'},
            {'username':'tutisusanti', 'text': 'tidak','timestamp':'1705989605'},
        ]
    },
    'ondNC':{
        'users': ['adinugraha','bambangp'],
        'messages': [
            {'username':'adinugraha', 'text': 'selamat sore','timestamp':'1705989637'},
            {'username':'bambangp', 'text': 'ya, selamat sore juga','timestamp':'1705989682'}
        ]
    },
};

/*
    get user data 
    :username -> username
*/
app.get('/api/user/:username', function(req, res) {
    var username = req.params.username;
    console.log('get request: /api/user/'+username);
    
    if (!listUser.hasOwnProperty(username)) {
        listUser[username] = {'rooms': []};
    }
    
    res.send({
        'data': listUser[username]
    });
});


/*
    get chat data 
    :id -> id room
*/
app.get('/api/chat/:id', function(req, res) {
    var id = req.params.id;
    console.log('get request: /api/chat/'+id);
    
    res.send({
        'data': listChatroom[id]
    });
});

/*
    get room data by username 
    :username -> username
*/
app.get('/api/room/:username', function(req, res) {
    var username = req.params.username;
    console.log('get request: /api/room/'+username);

    var list = [];
    for(var i = 0; i < listUser[username].rooms.length; i++){
        list.push(listChatroom[listUser[username].rooms[i]]);
    }
    
    res.send({
        'data': list
    });
});

/*
    add new room data
    params: 
    {
        'from': 'adinugraha', //username pengirim
        'to': 'tutisusanti', //username pengirim
    }
        
*/
app.post('/api/room', function(req, res) {
    console.log('post request: /api/room');
    var from = req.body.from;
    var to = req.body.to;

    var id = makeid(5);
    while(listChatroom.hasOwnProperty(id)){
        id = makeid(5);
    };

    listUser[from].rooms.push(id);
    listUser[to].rooms.push(id);
    listChatroom[id] = {
        'users': [from,to],
        'messages': []
    };

    res.send({
        'data': {'id': id}
    });
});

/*
    add chat data
    params: 
    {
        'id': '8SFkk', //berisi id room
        'username': 'adinugraha', //username pengirim
        'text': 'selamat pagi', //isi pesan
    }
        
*/
app.post('/api/chat', function(req, res) {
    console.log('post request: /api/chat');
    var id = req.body.id;
    var username = req.body.from;
    var text = req.body.text;

    listChatroom[id].messages.push({
        'username': username,
        'text': text,
        'timestamp': Date.now()
    });

    res.send({
        'data': true
    });
});

app.listen(port);
console.log('Server started at http://localhost:' + port);