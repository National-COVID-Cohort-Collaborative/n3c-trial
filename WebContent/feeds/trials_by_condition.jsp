<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="trials" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(foo))
	from (select  id,nct_id,official_title from n3c_trials.study natural join n3c_trials.condition where condition =  ?) as foo;
	<sql:param>${param.mode}</sql:param>
</sql:query>
{
    "headers": [
        {"value":"id", "label":"ID"},
        {"value":"official_title", "label":"Official Title"},
        {"value":"nct_id", "label":"NCT ID"}
    ],
    "rows" : 
<c:forEach items="${trials.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			