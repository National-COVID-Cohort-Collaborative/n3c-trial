<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<script type="text/javascript">
	function intervention_render(mode) {
		var footer = document.getElementById("intervention-panel-footer");
		footer.innerHTML = "<a href=\"feeds/interventions.jsp?mode="+mode+"\">Export this list as JSON</a>";
		d3.html("tables/interventions.jsp?mode="+mode, function(fragment) {
			var divContainer = document.getElementById("intervention_target_table");
			divContainer.innerHTML = "";
			divContainer.append(fragment);
		});
	}

	function intervention_display(mode) {
		var divContainer = document.getElementById("intervention_trials_header");
		divContainer.innerHTML = mode+" Trials";
		d3.html("tables/trials_by_intervention.jsp?mode="+mode, function(fragment) {
			var divContainer = document.getElementById("intervention_trials");
			divContainer.innerHTML = "<div id='intervention_detail_table'></div>";
			divContainer.append(fragment);
		});
	}

</script>

<form action="index.jsp">
	<label for="table">Choose an Intervention Type:</label> <select name="mode" id="mode" onchange="intervention_render(mode.value)">
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

<div class="row">
	<div class="col-sm-5">
		<div class="panel panel-primary">
			<div class="panel-heading">Interventions</div>
			<div class="panel-body">
				<div id="intervention_target_table">
					<jsp:include page="../tables/interventions.jsp" flush="true">
						<jsp:param value="Drug" name="mode" />
					</jsp:include>
				</div>

				<div id="intervention_table" style="overflow: scroll;">&nbsp;</div>
				<div id="op_table" style="overflow: scroll;">&nbsp;</div>
			</div>
			<div class="panel-footer" id="intervention-panel-footer"><a href="feeds/interventions.jsp?mode=Drug">Export this list as JSON</a></div>
		</div>
	</div>
	<div class="col-sm-7">
		<div class="panel panel-primary">
			<div class="panel-heading" id="intervention_trials_header">Trials</div>
			<div class="panel-body">
				<div id="intervention_trials">
					<p>Select an intervention on the left to see the related trials.</p>
				</div>
			</div>
		</div>
	</div>
</div>

