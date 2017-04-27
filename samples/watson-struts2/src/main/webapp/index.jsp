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
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	background-image: url('resources/watsonbg.png');
	background-repeat: no-repeat;
	background-position: center top;
	background-color: black;
}

.btn1 {
  position: absolute;
  top: 70%;
  left: 40%;
  transform: translate(-30%, -60%);
}

.btn-xl {
    padding: 10px 20px;
    font-size: 20px;
    border-radius: 10px;
}
</style>
</head>
<body>

	<div class="btn1">
				<a href="text" class="btn btn-info btn-xl btn-block" role="button"><h2><b>Text To Speech</b></h2></a>
				<br><br><br>
				<a href="image" class="btn btn-info btn-xl btn-block" role="button"><h2><b>Facial Recognition</b></h2></a>
	</div>
	
		<div class="btn2">
				

	</div>

</body>
</html>