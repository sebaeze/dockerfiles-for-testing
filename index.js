/*
*   Presentacion Docker + Containers
*/
const http        = require('http');
const MongoClient = require('mongodb').MongoClient;
//
let databaseMongo = false ;
try {
  MongoClient.connect("mongodb://demo:123456@localhost:27017/?authMechanism=DEFAULT&authSource=demo", function(err, db) {
    if(err) {
      console.log("...ERROR: MongoDB: ",err,";") ;
    } else {
      console.log("MongoDB::Conectado!");
      databaseMongo = db ;
    }
  });
} catch(errConn){
  console.log("***ERROR: ",errConn,";") ;
} ;
//
const port = process.env.PORT || 3000;
//
var MSG_DEMO = "" ;
try {
    MSG_DEMO = process.env.MSG_DEMO || "" ;	
} catch(err){
	console.log("***error: ",err,";");
} ;
//
const server = http.createServer((req, res) => {
  //
  res.statusCode = 200;
  let msg = MSG_DEMO ;
  //
  if ( databaseMongo!==false ){
    try {
      let demoDB      = databaseMongo.db("demo") ;
      let usuarioColl = demoDB.collection("mensajes") ;
      //
      usuarioColl.find({_id: "HOLA_MUNDO" }).toArray(function(err, arrayMensajes) {
        //
        if ( err==undefined ){
        if ( arrayMensajes.length>0 ){
          msg = arrayMensajes[0].texto ;
          } ;
          //
          console.log("...msg: ",msg) ;
          //
        } ;
        //
        res.end(msg); 
        //
      }) ;
      //
    } catch(errDB){
      console.log("***ERROR: ",errDB) ;
    } ;
  } ;
  //
}) ;
//
server.listen(port, () => {
  console.log(`Ejecutandose en http://localhost:${port}/`);
});
//