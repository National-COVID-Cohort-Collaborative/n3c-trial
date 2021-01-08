<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" flush="true" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="resources/d3.v3.min.js"></script>

<style type="text/css" media="all">
@import "../resources/n3c_login_style.css";
</style>

<style type="text/css">
table.dataTable thead .sorting_asc {
	background-image: none !important;
}
</style>

<body>

	<jsp:include page="../navbar.jsp" flush="true" />

	<div class="container center-box">
		<h2 class="header-text">
			<img src="../images/n3c_logo.png" class="n3c_logo_header"
				alt="N3C Logo">N3C COVID-19 Clinical Trial Exploration
		</h2>
		<div>
			<p>Yes for suppress.</p>
			<sql:query var="cuis" dataSource="jdbc/N3CCohort">
				select cui_tf_idf.cui, str, stn, count(*)
				from n3c_trials.cui_tf_idf, umls.mrconso, umls.mrsty
				where cui_tf_idf.cui=mrconso.cui
				  and cui_tf_idf.cui=mrsty.cui
				  and tty='PN'
				  and stn~'^A1.4.1.1.1'
				  and not exists (select cui from n3c_trials.cui_suppress where cui_suppress.cui = cui_tf_idf.cui)
				group by 1,2,3 order by 4 desc,1 limit 1;
			</sql:query>
			<ul>
			<c:forEach items="${cuis.rows}" var="row" varStatus="rowCounter">
				<li><a href="submit_suppress.jsp?cui=${row.cui}&suppress=true">Y</a> <a href="submit_suppress.jsp?cui=${row.cui}&suppress=false">N</a> ${row.cui} ${row.str} ${row.stn} ${row.count}
				<sql:query var="cache" dataSource="jdbc/N3CCohort">
					select phrase, count
					from n3c_trials.cui_cache
					where cui = ?
					limit 5;
					<sql:param>${row.cui }</sql:param>
				</sql:query>
				<ul>
				<c:forEach items="${cache.rows}" var="row2" varStatus="rowCounter">
					<li>${row2.phrase}
				</c:forEach>
				</ul>
			</c:forEach>
			</ul>
		</div>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
