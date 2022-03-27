var faker = require('faker');
var mysql = require('mysql');
// console.log(faker.date.past());

var connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'join_us'

});

var connection.connect(function(err){

     if(err) throw err;
     console.log('Connected');
});



var q = 'SELECT curdate()';
connection.query(q, function(error, results, fields){
   if(error) throw error;
   console.log('The solution is :', results[0].solution);

});



function generateAdress(){
  console.log(faker.address.streetAddress());
  console.log(faker.address.city());
  console.log(faker.address.state());
}


generateAdress();
generateAdress();
generateAdress();
