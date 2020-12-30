<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select condition_mesh_id,condition_mesh_term,count(*) from n3c_trials.condition_mesh group by 1,2 order by 3 desc limit 10;
</sql:query>
[
	<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	    {"element":"${row.condition_mesh_term}","count":${row.count}}<c:if test="${ rowCounter.count < elements.rowCount }">,</c:if>
	</c:forEach>
  ]

			