// node C:\Users\SMARTBOX\Desktop\joinUs\app.js

var express = require('express');
var mysql = require('mysql');
var app = express(); // execute the express modules and we assign it to app
var bodyParser = require("body-parser");


app.set("view engine","ejs");
app.use(bodyParser.urlencoded({extend: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
        host: 'localhost',
        user:'root',
        password:'',
        database: 'join_us'

});


app.get("/", function(req, res){
        // Find the count of database
        var q = "Select count(*) as count from users";
        connection.query(q, function(err,results){
           if(err) throw err;
           var count = results[0].count;
               // Respond with that count
           //res.send("We have "+count+" users in our database");
           res.render("home", {data: count});
        });


});

app.post("/register", function(req,res){
      var person={
        email: req.body.email
      };

      connection.query("insert into users set ?",person, function(err,result){
         if(err) throw err;
         res.redirect("/");
      });
});


app.get("/joke",function(req,res){
var joke = "this is a joke";
res.send("joke");
});

// app.get("/random_num", funtion(req,res){
// res.send("7");

// var num = Math.floor(Math.random()*10) + 1;
// });

app.listen(3000, function(){
          console.log('Server running on 3000!');
});
