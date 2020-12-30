<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script>
$.getJSON("feeds/interventions.jsp?mode=${param.mode}", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover';
	table.style.width = '100%';
	table.id="table1";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:16px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("table");
	divContainer.innerHTML = "<h3>Patient Characteristics by COVID Status</h3>";
	divContainer.appendChild(table);

	var data = json['rows'];

	$('#table1').DataTable( {
    	data: data,
       	paging: true,
    	pageLength: 10,
    	lengthMenu: [ 10, 25, 50, 75, 100 ],
    	order: [[2, 'desc']],
     	columns: [
        	{ data: 'intervention_type', visible: true, orderable: true },
        	{ data: 'intervention_name', visible: true, orderable: true },
        	{ data: 'count', visible: true, orderable: true },
    	]
	} );

	
});
</script>
