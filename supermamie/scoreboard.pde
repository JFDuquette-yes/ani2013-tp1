class Scoreboard{

// params
JSONObject scoreboard_data;
JSONArray scores;
JSONObject score_data;

boolean top_score;

Scoreboard()
{
  init();
}
void init()
{
   scoreboard_data = loadJSONObject("data/scoreboard.json");
   scores = scoreboard_data.getJSONArray("scores");
}
void showScoreboard()
 { 
    fill(#2AAD09);
    textAlign(CENTER, CENTER);
    textFont (typo,60);
    text("TOP 10",width/2, 100);
     for (int i = 0; i < scores.size(); i++) {
        JSONObject score = scores.getJSONObject(i);
        textFont (typo,30);
        text(score.getString("name"),width/2 -100, 200 + i*30);
        text(score.getInt("score"),width/2 +100, 200 + i*30);
     }
 }
 void setScore(int score_, String name_)
 { 
    if(scores.size() < 10)
    {
      score_data =  new JSONObject();
      score_data.setString("name", name_);
      score_data.setInt("score", score_);
      scores.setJSONObject(scores.size(), score_data);
      saveJSONObject(scoreboard_data, "data/scoreboard.json");
    }
 }
 void updateScore(JSONObject score_data_, int score_, String name_)
 { 
      score_data_.setString("name", name_);
      score_data_.setInt("score", score_);
      saveJSONObject(scoreboard_data, "data/scoreboard.json");
 }
 void checkTopScores( int score_, String name_)
 {
   top_score = false;
   if(scores.size() > 0)
   {
    for (int i = 0; i < scores.size(); i++) {
      JSONObject score = scores.getJSONObject(i);
      if(score_ > score.getInt("score") || !top_score)
      {
        top_score = true;
        updateScore(score, score_, name_);
      }
    }
   }
   else
   {
       setScore(score_, name_);
   }
 }
}
