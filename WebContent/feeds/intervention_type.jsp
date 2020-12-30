<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select intervention_type,count(*) from n3c_trials.intervention group by 1 order by 2 desc;
</sql:query>
[
	<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	    {"element":"${row.intervention_type}","count":${row.count}}<c:if test="${ rowCounter.count < elements.rowCount }">,</c:if>
	</c:forEach>
  ]

			