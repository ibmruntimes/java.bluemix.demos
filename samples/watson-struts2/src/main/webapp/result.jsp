<!--  (C) Copyright IBM Corporation 2017, 2017

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License. -->
 
<%@ taglib prefix="s" uri="/struts-tags" %>"
<!DOCTYPE html>
<html lang="en">
<head>
  <%@ page isELIgnored="false" %>
  <title>Face Result</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background="resources/crowd.jpg">
 
<div class="container">
<br><br><br><br>  
<!-- <br><br><br><br> -->
<div class="row">
<div class="col-md-4">
<img src="resources/fr.png" >
<img src="resources/watson.png" >
<br>
<br><br>

<a href="./" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-home"></span> Home</a>
&nbsp;&nbsp;
<a href="image" class="btn btn-primary btn-lg" role="button" style="float:right"> <span class="glyphicon glyphicon-picture"> </span> Try Another Image</a>

</div>
<div class="col-md-1"></div>
<div class="col-md-7">
 <div class="panel panel-primary">
    <div class="panel-heading"><h2>Name: <s:property value="img.name"/> </h2></div>
    <div class="panel-body" style="background:#ced9ea;">
     <div class="row">
  
  <div class="col-sm-5">
  <div class="row">
  <h3>  &nbsp Gender : <s:property value="img.gender"/></h3>
  </div>
  <div class="row">
  <h3>  &nbsp Max Age : <s:property value="img.max_age"/></h3>
  </div>
  <div class="row">
  <h3>  &nbsp Min Age : <s:property value="img.min_age"/></h3>
  </div>
<!--   bf<br>asf<br>fedf -->
  </div>
  <div class="col-sm-4"><img src="<s:property value="img.url"/>" style="width:304px;height:304px"/></div>
  </div>
</div>

</div>
    

	</div>
  </div>
</div>

</body>
</html>
