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
<title>Face Recognition</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background="resources/crowd.jpg">

	<div class="container-fluid">
		<br>
		<br>
		<br>
		<br> <br>
		<br>
		<br>
		<br>
		<div class="row">
			<div class="col-sm-1 col-md-1"></div>
			<div class="col-sm-4 col-md-4">
				<img src="resources/fr.png"> <img src="resources/watson.png">
			</div>
			<div class="col-sm-2 col-md-2"></div>
			<div class="col-sm-3 col-md-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Enter Image URL</h4>
					</div>
					<div class="panel-body" style="background: #ced9ea;">
						<s:form class="form-inline" method="post" action="imageprocess">
							<div class="form-group">
								<s:textfield name="img.url" class="form-control" />
							</div>
							<s:submit name="submit" class="btn btn-default"></s:submit>
						</s:form>
					</div>
				</div>
			</div>
			<div class="col-sm-2 col-md-2"></div>
		</div>
	</div>

</body>
</html>