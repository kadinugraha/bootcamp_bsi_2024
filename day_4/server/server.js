const express = require('express');
const cors = require('cors') 

const app = express();
const port = process.env.PORT || 8080;
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors()); 

var listPenduduk = [
    {nama: 'Adi Nugraha', usia: 17, keterangan: 'tampan dan berani'},
    {nama: 'Kristofan Feriadi', usia: 30, keterangan: 'jujur dan berwibawa'}
];

app.get('/api/penduduk', function(req, res) {
    console.log('get request: /api/penduduk');
    res.send({
        'data': listPenduduk
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