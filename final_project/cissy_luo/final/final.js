console.log('heyyy there');

var Twit = require('twit');
var config = require('./config');
var T = new Twit(config);

var stream = T.stream('user');
stream.on('follow', followed);

function followed(eventMsg){
	var name = eventMsg.source.name;
	var screenName = eventMsg.source.screen_name;
	tweetIt('@' + screenName + 'thanks so much for following me!')

}
 function twetIt(txt){
 	 var tweet = {
 	 	status: txt
 	 }

 	 T.post('statuses/update', tweet, tweeted);
 }
 
var exec = require('child_process').exec;
var fs = require('fs');

tweetIt();
setInterval(tweetIt, 1000*30);

function tweetIt(){

	var cmd = '"E:\\processing-3.3.6\\processing-java.exe" --sketch="E:\\processing-3.3.6\\final\\realdots" --run';
	exec(cmd, processing);

	function processing(){
		var filename ='realdots/output.png';
		var params = {
			encoding: 'base64'
		}
		var b64 = fs.readFileSync(filename, params);

		T.post('media/upload', {media_data: b64}, uploaded);

		function uploaded(err, data, response){
			var id = data.media_id_string;
			var tweet = {
				status: '#findthedifference #processing if you like the pattern you may have it:)',
				media_ids: [id]
			}
			T.post('statuses/update', tweet, tweeted);

		}
	}
}
function tweeted(err, data, response){
	if (err) {
		console.log("sth went wrong!");
	} else {
			console.log("It's working!");
		}
}