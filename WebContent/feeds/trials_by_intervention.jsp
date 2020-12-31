<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="trials" dataSource="jdbc/N3CCohort">
	select  id,official_title from n3c_trials.study natural join n3c_trials.intervention where intervention_name =  ?;
	<sql:param>${param.mode}</sql:param>
</sql:query>
{
    "headers": [
        {"value":"id", "label":"ID"},
        {"value":"official_title", "label":"Official Title"}
    ],
    "rows" : 
<c:forEach items="${trials.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			