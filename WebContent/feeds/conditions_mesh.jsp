<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="conditions" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(foo))
	from (select condition_mesh_term as condition_mesh,count(*) from n3c_trials.condition_mesh group by 1 order by 2 desc) as foo;
</sql:query>
{
    "headers": [
        {"value":"condition_mesh", "label":"Condition (MeSH)"},
        {"value":"count", "label":"Count"}
    ],
    "rows" : 
<c:forEach items="${conditions.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			