<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="row">
	<div class="col-sm-4">
		<div class="panel panel-primary">
			<div class="panel-heading">Summary</div>
			<div class="panel-body">
				<div id="home_summary">
				<sql:query var="elements" dataSource="jdbc/N3CCohort">
					select * from 
						(select to_char(count(*), '999,999,999') as study_count from n3c_trials.study) as study_count
				</sql:query>
				
				<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
					<p><b># of COVID-19-relevant trials</b>: ${row.study_count}</p>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-primary">
			<div class="panel-heading">Most Common Conditions (MeSH)</div>
			<div class="panel-body">
				<div id="home_top_conditions"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-primary">
			<div class="panel-heading">Intervention Type</div>
			<div class="panel-body">
				<div id="home_intervention_type"></div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page" value="feeds/top_conditions.jsp" />
	<jsp:param name="dom_element" value="#home_top_conditions" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page" value="feeds/intervention_type.jsp" />
	<jsp:param name="dom_element" value="#home_intervention_type" />
</jsp:include>
