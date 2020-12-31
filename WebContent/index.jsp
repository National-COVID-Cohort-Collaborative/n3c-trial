<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
</style>

<style type="text/css">
table.dataTable thead .sorting_asc {
	background-image: none !important;
}
</style>

<body>

	<jsp:include page="navbar.jsp" flush="true" />

	<div class="container-fluid center-box">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C COVID-19 Clinical Trial Exploration
		</h2>
		<div style="text-align: center;">
			This is an initial configuration of an exploration tool for clinical trials involving COVID-19. All data are drawn from
			<a href="https://clinicaltrials.gov">ClinicalTrials.gov</a>.<br> You are encouraged to submit suggestions for
			enhancements/additions.
		</div>
		<p>&nbsp;</p>
		<ul class="nav nav-tabs" style="font-size: 16px;">
			<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			<li><a data-toggle="tab" href="#conditions">Conditions</a></li>
			<li><a data-toggle="tab" href="#conditions_mesh">Conditions (MeSH)</a></li>
			<li><a data-toggle="tab" href="#interventions">Interventions</a></li>
			<li><a data-toggle="tab" href="#interventions_mesh">Interventions (MeSH)</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<jsp:include page="graphs/home.jsp" flush="true" />
			</div>
			
			<div class="tab-pane fade" id="conditions">
				<jsp:include page="graphs/conditions.jsp" flush="true" />
			</div>

			<div class="tab-pane fade" id="conditions_mesh">
				<jsp:include page="graphs/conditions_mesh.jsp" flush="true" />
			</div>

			<div class="tab-pane fade" id="interventions">
				<jsp:include page="graphs/interventions.jsp" flush="true" />
			</div>

			<div class="tab-pane fade" id="interventions_mesh">
				<jsp:include page="graphs/interventions_mesh.jsp" flush="true" />
			</div>
		</div>

		<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html>
