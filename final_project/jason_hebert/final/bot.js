console.log("bot is running");

var Twit = require('twit');
var fs = require('fs');

var T = new Twit({
    consumer_key: 'FSmjywZOFGMVEYAEzHNZRWLZY',
    consumer_secret: 'd3oWd38Zc5dN25HKp4JJjCPqEvzA9Vo9kOa26z9NBrlReUo303',
    access_token: '953860964667088896-t1jIQ6UoTctAzqejL5P2u3tVjZclzTO',
    access_token_secret: 'qsB3lmVVsfJXIuj8X1kestUuNemmSzL0x84nzZreQ5J3d'
})

function tweetIt() {

    var cmd = 'processing-java --sketch=`pwd`/final_processing --run';
    var exec = require('child_process').exec;
    exec(cmd, processing);

    function processing() {
        var filename = 'final_processing/output.png';
        var params = {
            encoding: 'base64'
        }
        var b64content = fs.readFileSync(filename, params);

        T.post('media/upload', { media_data: b64content }, uploaded);

        function uploaded(err, data, response) {
            var id = data.media_id_string;
            var tweet = {
                status: "#final",
                media_ids: [id]
            }
            T.post('statuses/update', tweet, tweeted);
        }

        function tweeted(err, data, response) {
            if (err) {
                console.log("something went wrong");
            } else {
                console.log("it works");
            }
        }
    }
}

tweetIt();
