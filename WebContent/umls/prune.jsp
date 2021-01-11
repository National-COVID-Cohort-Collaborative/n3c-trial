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
		<h2 class="header-text"><img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C COVID-19 Clinical Trial Exploration</h2>
		<div>
			<form method='POST' action='prune.jsp'>
				<select name="stn" id="stn" onchange="this.form.submit()">
					<option value="none" <c:if test="${'none' == param.stn}">selected</c:if>>- choose a UMLS type -</option>
					<option value="A1.2.3.5"	<c:if test="${'A1.2.3.5' == param.stn}">selected</c:if>>A1.2.3.5 - Gene or Genome</option>
					<option value="A1.4.1.1.1"	<c:if test="${'A1.4.1.1.1' == param.stn}">selected</c:if>>A1.4.1.1.1 - Pharmacologic Substance</option>
					<option value="A2.2" <c:if test="${'A2.2' == param.stn}">selected</c:if>>A2.2  - Finding</option>
					<option value="B2.2.1.2.1" <c:if test="${'B2.2.1.2.1' == param.stn}">selected</c:if>>B2.2.1.2.1	- Disease or Syndrome</option>
				</select>
			</form>
			<c:if test="${not empty param.stn and param.stn ne 'none'}">
				<sql:query var="cuis" dataSource="jdbc/N3CCohort">
					select cui_tf_idf.cui, str, stn, count(*)
					from n3c_trials.cui_tf_idf, umls.mrconso, umls.mrsty
					where cui_tf_idf.cui=mrconso.cui
					  and cui_tf_idf.cui=mrsty.cui
					  and tty='PN'
					  and stn~?
					  and not exists (select cui from n3c_trials.cui_suppress where cui_suppress.cui = cui_tf_idf.cui)
					group by 1,2,3 order by 4 desc,1 limit 5;
					<sql:param>^${param.stn}</sql:param>
				</sql:query>
				<form method='POST' action='submit_suppress.jsp'>
					<table class="table table-striped">
						<c:forEach items="${cuis.rows}" var="row" varStatus="rowCounter">
							<tr>
								<td><input type="radio" id="true" name="${row.cui}"	value="true"><label for="true"> Suppress</label>
									<input type="radio" id="false" name="${row.cui}" value="false" checked><label for="true"> Keep</label>
									</td>
								<td>${row.cui}</td>
								<td>${row.str}</td>
								<td>${row.stn}</td>
								<td>${row.count}</td>
								<td><sql:query var="cache" dataSource="jdbc/N3CCohort">
										select id,phrase, count
										from n3c_trials.cui_cache
										where cui = ?
										limit 5;
										<sql:param>${row.cui }</sql:param>
									</sql:query>
									<ul>
										<c:forEach items="${cache.rows}" var="row2"	varStatus="rowCounter">
											<li><a  href="detail.jsp?id=${row2.id}">${row2.phrase}</a>
										</c:forEach>
									</ul>
									</td>
							</tr>
						</c:forEach>
					</table>
	                <input type="hidden" name="stn" value="${param.stn}">
					<button type="submit" name="action" value="submit">Submit</button>
				</form>
			</c:if>
		</div>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
