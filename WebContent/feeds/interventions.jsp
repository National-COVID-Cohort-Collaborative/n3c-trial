<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="interventions" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(foo))
	from (select intervention_type,intervention_name,count(*) from n3c_trials.intervention where intervention_type = ? group by 1,2 order by 3 desc) as foo;
	<sql:param>${param.mode}</sql:param>
</sql:query>
{
    "headers": [
        {"value":"intervention_name", "label":"Intervention Name"},
        {"value":"count", "label":"Count"}
    ],
    "rows" : 
<c:forEach items="${interventions.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			