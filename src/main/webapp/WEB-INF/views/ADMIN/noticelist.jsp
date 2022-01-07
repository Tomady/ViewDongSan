<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	button {
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  
	  background: var(--button-bg-color);
	  color: var(--button-color);
	  
	  margin: 0;
	  padding: 0.5rem 1rem;
	  
	  font-family: 'Noto Sans KR', sans-serif;
	  font-size: 1rem;
	  font-weight: 400;
	  text-align: center;
	  text-decoration: none;
	  
	  border: none;
	  border-radius: 4px !important;
	  
	  display: inline-block;
	  width: auto;
	  
	  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
	  
	  cursor: pointer;
	  
	  transition: 0.5s;
	  color : white;
	}
	
	button:active,
	button:hover,
	button:focus {
	  background: var(--button-hover-bg-color);
	  outline: 0;
	}
	.check_th::before, .check_th::after{
			display: none !important;
			font-size:0;
			width:0;
			height: 0;
		}
	</style>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="resources/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet" href="resources/vendors/select2/select2.min.css">
<link rel="stylesheet"
	href="resources/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="resources/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="resources/images/favicon.png" />
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">공지사항관리</h4>
							<p class="card-description">공지사항 등록</p>
							
							<form class="forms-sample" action="oKnoticeinsert.do" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="exampleInputName1">제목</label> <input type="text"
										class="form-control" id="Ntitle" name="Ntitle"
										placeholder="제목을 입력하세요">
								</div>
								<div class="form-group">
									<label>File upload</label> <input type="file" id="Nimg"
										name="Nimg" class="file-upload-default">
									<div class="input-group col-xs-12">
										<input type="text"  class="form-control file-upload-info"
											disabled placeholder="Upload Image"> <span
											class="input-group-append">
											<button class="file-upload-browse btn btn-primary"
												type="button">Upload</button>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label for="exampleTextarea1">Textarea</label>
									<textarea class="form-control" id="Nsubject" name="Nsubject"
										rows="4"></textarea>
								</div>
								<button type="submit" class="btn btn-primary mr-2">Submit</button>
								<button type="button" class="btn btn-light" onclick="location.href='alllist.do'">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content-wrapper ends -->
		<!-- partial:../../partials/_footer.html -->
		<!-- partial -->
	</div>
	<script src="resources/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="resources/vendors/typeahead.js/typeahead.bundle.min.js"></script>
	<script src="resources/vendors/select2/select2.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/template.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="resources/js/file-upload.js"></script>
	<script src="resources/js/typeahead.js"></script>
	<script src="resources/js/select2.js"></script>
</body>
</html>