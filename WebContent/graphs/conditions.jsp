<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<script type="text/javascript">

	function condition_display(mode) {
		var divContainer = document.getElementById("condition_trials_header");
		divContainer.innerHTML = mode+" Trials";
		d3.html("tables/trials_by_condition.jsp?mode="+mode, function(fragment) {
			var divContainer = document.getElementById("condition_trials");
			divContainer.innerHTML = "<div id='condition_detail_table'></div>";
			divContainer.append(fragment);
		});
	}

</script>

<div class="row">
	<div class="col-sm-5">
		<div class="panel panel-primary">
			<div class="panel-heading">Conditions</div>
			<div class="panel-body">
				<div id="condition_target_table">
					<jsp:include page="../tables/conditions.jsp" flush="true">
						<jsp:param value="COVID-19" name="mode" />
					</jsp:include>
				</div>

				<div id="condition_table" style="overflow: scroll;">&nbsp;</div>
				<div id="op_table" style="overflow: scroll;">&nbsp;</div>
			</div>
			<div class="panel-footer"><a href="feeds/conditions.jsp">Export this list as JSON</a></div>
		</div>
	</div>
	<div class="col-sm-7">
		<div class="panel panel-primary">
			<div class="panel-heading" id="condition_trials_header">Trials</div>
			<div class="panel-body">
				<div id="condition_trials">
					<p>Select a condition on the left to see the related trials.</p>
				</div>
			</div>
		</div>
	</div>
</div>

