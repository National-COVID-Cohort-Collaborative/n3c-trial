<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<script type="text/javascript">

	function condition_mesh_display(mode) {
		var divContainer = document.getElementById("condition_mesh_trials_header");
		divContainer.innerHTML = mode+" Trials";
		d3.html("tables/trials_by_condition_mesh.jsp?mode="+mode, function(fragment) {
			var divContainer = document.getElementById("condition_mesh_trials");
			divContainer.innerHTML = "<div id='condition_mesh_detail_table'></div>";
			divContainer.append(fragment);
		});
	}

</script>

<div class="row">
	<div class="col-sm-5">
		<div class="panel panel-primary">
			<div class="panel-heading">Conditions (MeSH)</div>
			<div class="panel-body">
<div id="condition_mesh_target_table">
<jsp:include page="../tables/conditions_mesh.jsp" flush="true">
	<jsp:param value="COVID-19" name="mode"/>
</jsp:include>
</div>

<div id="condition_mesh_table" style="overflow: scroll;">&nbsp;</div>
<div id="op_table" style="overflow: scroll;">&nbsp;</div>
			</div>
		</div>
	</div>
	<div class="col-sm-7">
		<div class="panel panel-primary">
			<div class="panel-heading" id="condition_mesh_trials_header">Trials</div>
			<div class="panel-body">
				<div id="condition_mesh_trials">
					<p>Select a condition on the left to see the related trials.</p>
				</div>
			</div>
		</div>
	</div>
</div>

