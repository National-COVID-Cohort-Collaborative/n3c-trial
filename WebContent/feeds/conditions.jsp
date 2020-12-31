<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="conditions" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(foo))
	from (select condition,count(*) from n3c_trials.condition group by 1 order by 2 desc) as foo;
</sql:query>
{
    "headers": [
        {"value":"condition", "label":"Condition"},
        {"value":"count", "label":"Count"}
    ],
    "rows" : 
<c:forEach items="${conditions.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			