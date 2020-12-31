<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="interventions" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(foo))
	from (select intervention_mesh_term as intervention_mesh_name,count(*) from n3c_trials.intervention_mesh group by 1 order by 2 desc) as foo;
</sql:query>
{
    "headers": [
        {"value":"intervention_mesh_name", "label":"Intervention MeSH Term"},
        {"value":"count", "label":"Count"}
    ],
    "rows" : 
<c:forEach items="${interventions.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			