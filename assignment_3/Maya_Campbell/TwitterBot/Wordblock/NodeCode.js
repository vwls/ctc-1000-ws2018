console.log('the bot has started');

var Twit = require('twit');
var exec = require('child_process').exec;
var fs = require('fs');
var cmd = require('node-cmd');
    
var T = new Twit({
    consumer_key:         '...',    // Your keys go Here
    consumer_secret:      '...',
    access_token:         '...',
    access_token_secret:  '...',
  });

wordBlock();
setInterval(wordBlock, 1000*60*30);


function wordBlock(){
    
    var prosCMD = '';
    // If you're on windows format your command like: "C:\\Program Files\\processing-3.3.6\\processing-java.exe" --sketch="C:\\Users\\Maya\\Documents\\RISD\\Wintersession_2018\\CTC-1000\\TwitterBot\\Wordblock" --run
    exec(prosCMD, Processing);

    function Processing(){
         console.log('Image Made');

         var filename = 'export.png';
         var b64 = fs.readFileSync(filename, {encoding: 'base64'});

         T.post ('media/upload', { media_data: b64 }, uploaded);
         function uploaded(err, data, response){ 
             var id = data.media_id_string;
             var tweet = {status: '', media_ids:  [id]}
            T.post('statuses/update', tweet, tweeted)
}
}
}
    function tweeted(err, data, response) { 
        if (err){console.log("Something went wrong?!")} 
        else {console.log("It worked!")
    }}
