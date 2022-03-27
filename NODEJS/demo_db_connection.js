// node C:\Users\SMARTBOX\Desktop\mySql\demo_db_connection.js
var faker = require('faker');
var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database:"join_us"
});


// Selectin data

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
//   var q = "select count(*) as total from users";
//   con.query(q, function (err, result) {
//     if (err) throw err;
// console.log(result[0].total);
//
// con.end();
//
//   });
// });
//

// INSERTING DATA


con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");

//
// for(var i=0; i < 500; i++){
//  var person = {email: faker.internet.email(), created_at: faker.date.past()};
//   con.query("insert into users set ?",person, function (err, result) {
//     if (err) throw err;
//    console.log(result);
//
//   });
//
// } // FOR END
//
// con.end();
// });



var data = [];
for(var i=0; i < 500; i++){
  data.push([faker.internet.email(),faker.date.past()]);
}


//console.log(data);

var q ='insert into users(email, created_at) values ?';

con.query(q,[data],function(err,results){
    if(err) throw err;
    console.log(results);

} //function END

);

con.end();
 });
