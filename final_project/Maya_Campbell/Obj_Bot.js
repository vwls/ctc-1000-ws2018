console.log('Starting...');

var Twit = require('twit');
var exec = require('child_process').exec;
var fs = require('fs');
var exporttxt = "C:\\Users\\Maya\\Documents\\RISD\\Wintersession_2018\\CTC-1000\\Final_Project\\Object_Generation\\filename.txt";
var exportname;

var callback = function(){
    console.log("10 seconds Later..");
};

    
var T = new Twit({
    consumer_key:         'iQA2wbca9EKZ4BhJVlkshXJub',
    consumer_secret:      'uKKugWJZG3OuRGdm9y3RIzVQb75LUTTYdJyREgKtID3EBxdnE6',
    access_token:         '955973187455549441-Cq3s5BxxyzZ72oWvqNf63tff2PDbVFQ',
    access_token_secret:  'cfSVC3igmWduKVRHT12A9rBRo3gSF6qIbAsa7csCGUwAs',
});

ObjectGeneration();
setInterval(ObjectGeneration, 1000*60*61);

function ObjectGeneration(){
    console.log("Beginning Render...")
    var prosCMD = '"processing-java.exe" --sketch="C:\\Users\\Maya\\Documents\\RISD\\Wintersession_2018\\CTC-1000\\Final_Project\\Object_Generation" --run';
    exec(prosCMD, processTweet);
            
            }

function processTweet(){
    console.log('Image Made');
        var filetxt = fs.readFileSync(exporttxt, {encoding: "utf8"});
        exportname ="C:\\Users\\Maya\\Documents\\RISD\\Wintersession_2018\\CTC-1000\\Final_Project\\Image_Exports\\export_" + filetxt + ".png"
         var b64 = fs.readFileSync(exportname, {encoding: 'base64'});

         T.post ('media/upload', { media_data: b64 }, uploaded);
         function uploaded(err, data, response){ 
             var id = data.media_id_string;
             var tweet = {status: '', media_ids:  [id]}
            T.post('statuses/update', tweet, tweeted)
    }
}
  function tweeted(err, data, response) { 
    if (err){console.log("Something went wrong....")} 
    else {console.log("Image Posted...")
    }
}

