{# This is the template for an index of recorded data files.
  It is used by index_recorded_data.py #}
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Dataset Index</title>
<style>
body {
  font-family: sans-serif;
  background-color: #ddd;
  margin: 0;
}
#container {
  max-width: 1000px;
  margin: 0 auto; /* Centred */
  padding: 10px;
  background-color: #fff;
}
.run {
  margin-bottom: 0.5em;
}
.bag-line {
  padding-left: 10px;
}
.meter-bar-outer {
  display: inline-block;
  border: 1px solid black;
  width: 100px;
  height: 0.8em;
}
.meter-bar-inner {
  background-color: #494;
  height: 100%
}
</style>
</head>
<body>
<div id="container">
{% for day, batch in days %}
  <div class="day">
    <h2>{{day.strftime('%a %d %B %Y')}}</h2>
    {% for run in batch %}
    <div class="run">
      <div class="run-line">{{run.rosbag.start.strftime('%H:%M:%S')}} [{{run.rosbag.test_name.strip('_')}}] :
      {% for file in run %}
        <a href="{{file.filename}}">{{file.file_type}}</a> ·
      {% endfor %}
      </div>
      <div class="bag-line">
        <div class="meter-bar-outer"><div class="meter-bar-inner" style="width:{{run.prop_size}}px;"></div></div>
        {{run.rosbag.duration | seconds_to_mins}} minutes, {{run.rosbag.n_messages}} messages
      </div>
    </div>
    {% endfor %}
  </div>
{% endfor %}
</div>
</body>
</html>
