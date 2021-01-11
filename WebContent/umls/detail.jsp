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
			<sql:query var="study" dataSource="jdbc/N3CCohort">
					select * from n3c_trials.study where id = ?::int;
					<sql:param>${param.id}</sql:param>
			</sql:query>
				<c:forEach items="${study.rows}" var="row" varStatus="rowCounter">
					<h2>${row.official_title}</h2>
					<h4>Brief Title: ${row.brief_title}</h4>
					
					<h4>Condition</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select condition from clinical_trials.condition where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.condition}
					</c:forEach>
					</ul>
					
					<h4>Condition Ancestor</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select condition_ancestor_term from clinical_trials.condition_ancestor where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.condition_ancestor_term}
					</c:forEach>
					</ul>
					
					<h4>Condition Browse Leaf</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.condition_browse_leaf where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.condition_browse_leaf_name}  :  ${row2.condition_browse_leaf_as_found}
					</c:forEach>
					</ul>
					
					<h4>Condition MeSH</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.condition_mesh where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.condition_mesh_id} : ${row2.condition_mesh_term}
					</c:forEach>
					</ul>
					
					<h4>Intervention</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.intervention where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.intervention_name} : ${row2.intervention_description}
					</c:forEach>
					</ul>
					
					<h4>Intervention Ancestor</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select intervention_ancestor_term from clinical_trials.intervention_ancestor where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.intervention_ancestor_term}
					</c:forEach>
					</ul>
					
					<h4>Intervention Browse Branch</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.intervention_browse_branch where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.intervention_browse_branch_abbrev}  :  ${row2.intervention_browse_branch_name}
					</c:forEach>
					</ul>
					
					<h4>Intervention Browse Leaf</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.intervention_browse_leaf where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.intervention_browse_leaf_name}  :  ${row2.intervention_browse_leaf_as_found}
					</c:forEach>
					</ul>
					
					<h4>Intervention MeSH</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.intervention_mesh where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.intervention_mesh_id} : ${row2.intervention_mesh_term}
					</c:forEach>
					</ul>
					
					<h4>Intervention Other Name</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.intervention_other_name where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.intervention_other_name}
					</c:forEach>
					</ul>
					
					<h4>Keyword</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.keyword where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.keyword}
					</c:forEach>
					</ul>
					
					<h4>Primary Outcome</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.primary_outcome where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.primary_outcome_measure} : ${row2.primary_outcome_description} : ${row2.primary_outcome_time_frame}
					</c:forEach>
					</ul>
					
					<h4>Secondary Outcome</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.secondary_outcome where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.secondary_outcome_measure} : ${row2.secondary_outcome_description} : ${row2.secondary_outcome_time_frame}
					</c:forEach>
					</ul>
					
					<h4>Other Outcome</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.other_outcome where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.other_outcome_measure} : ${row2.other_outcome_description} : ${row2.other_outcome_time_frame}
					</c:forEach>
					</ul>
					
					<h4>Reference</h4>
					<sql:query var="elements" dataSource="jdbc/N3CCohort">
						select * from clinical_trials.reference where id = ?::int;
						<sql:param>${param.id}</sql:param>
					</sql:query>
					<ul>
					<c:forEach items="${elements.rows}" var="row2" varStatus="rowCounter">
						<li>${row2.reference_citation}
					</c:forEach>
					</ul>
				</c:forEach>
		</div>
		<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
