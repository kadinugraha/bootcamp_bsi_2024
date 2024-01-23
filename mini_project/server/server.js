const express = require('express');
const cors = require('cors') 

const app = express();
const port = process.env.PORT || 8080;
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors()); 

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

app.get('/api/user/:username', function(req, res) {
    console.log('get request: /api/penduduk');
    res.send({
        'data': listUser[req.params.username]
    });
});

app.post('/api/penduduk', function(req, res) {
    var nama = req.body.nama;
    var usia = req.body.usia;
    var keterangan = req.body.keterangan;

    console.log(`post request: /api/penduduk {${nama},${usia},${keterangan}}`);
    listPenduduk.push({'nama': nama, 'usia': usia, 'keterangan': keterangan});
  
    res.send({
      'data': true
    });
});

app.listen(port);
console.log('Server started at http://localhost:' + port);