<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="target_table"></div>

<script type="text/javascript">
	function render(mode) {
		d3.html("tables/interventions.jsp?mode="+mode, function(fragment) {
			var divContainer = document.getElementById("target_table");
			divContainer.innerHTML = "";
			divContainer.append(fragment);
		});
	}
</script>

<form action="index.jsp">
	<label for="table">Choose an Intervention Type:</label> <select name="mode" id="mode" onchange="render(mode.value)">
		<option value="Drug"	<c:if test="${empty param.mode ||  param.mode == 'Drug' }">selected</c:if>>Drug</option>
		<option value="Other" <c:if test="${param.mode == 'Other' }">selected</c:if>>Other</option>
		<option value="Biological" <c:if test="${param.mode == 'Biological' }">selected</c:if>>Biological</option>
		<option value="Diagnostic Test" <c:if test="${param.mode == 'Diagnostic Test' }">selected</c:if>>Diagnostic Test</option>
		<option value="Behavioral" <c:if test="${param.mode == 'Behavioral' }">selected</c:if>>Behavioral</option>
		<option value="Device" <c:if test="${param.mode == 'Device' }">selected</c:if>>Device</option>
		<option value="Dietary Supplement" <c:if test="${param.mode == 'Dietary Supplement' }">selected</c:if>>Dietary Supplement</option>
		<option value="Procedure" <c:if test="${param.mode == 'Procedure' }">selected</c:if>>Procedure</option>
		<option value="Combination Product" <c:if test="${param.mode == 'Combination Product' }">selected</c:if>>Combination Product</option>
		<option value="Radiation" <c:if test="${param.mode == 'Radiation' }">selected</c:if>>Radiation</option>
		<option value="Genetic" <c:if test="${param.mode == 'Genetic' }">selected</c:if>>Genetic</option>
	</select>
</form>

<jsp:include page="../tables/interventions.jsp" flush="true">
	<jsp:param value="Drug" name="mode"/>
</jsp:include>

<div id="table" style="overflow: scroll;">&nbsp;</div>
<div id="op_table" style="overflow: scroll;">&nbsp;</div>
