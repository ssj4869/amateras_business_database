
<?php
$result = '';
$q='';
?>
    <html>
	    <head>
		    <script type="text/javascript">
			    function update() {
				    var table = document.getElementById('table').value;
					if(table == 'product_information') 
						data = '<br><h3>Search criteria for '+table+' is name of the Laptop. Ex: Lenovo (or) Asus</h3>';
					else
						data = '<br><h3>Search criteria for '+table+' is employee name</h3>';
					document.getElementById("data").innerHTML=data;
				}
			</script>
		    <title>Amateras Business Database</title>
			<style>
				#mytable {
				  font-family: Arial, Helvetica, sans-serif;
				  border-collapse: collapse;
				  width: 100%;
				}

				#mytable td, #mytable th {
				  border: 1px solid #ddd;
				  padding: 8px;
				}

				#mytable tr:nth-child(even){background-color: #f2f2f2;}

				#mytable tr:hover {background-color: #ddd;}

				#mytable th {
				  padding-top: 12px;
				  padding-bottom: 12px;
				  text-align: left;
				  background-color: #04AA6D;
				  color: white;
				}

		</style>
		</head>
		
		<body>
		    
			<h1><center>Amateras Business Database</center></h1>
			<hr>
			<br>
			<form action = "dbms.php" method="POST">
			Select a table to perform search operation:
			<select id="table"  onclick="update()"name='table_'>
			    <option value=''>Select</option>
			    <option value='product_information'>Product Information</option>
			    <option value='employee_data'>Employee Data</option>
			</select>
			<div id="data"><br></div>
			<br><br>
			Enter Search string&nbsp;<input type="text" size="40" name="query" value="<?=$q;?>">&nbsp;<input type="submit" value="Search" name="search">
			<br><br><?=$result;?>
			</form>
		</body>
	</html>
	<?php
	if(isset($_POST['search'])) {
		$search = $_POST['query'];
		$q = $search;
		$table = $_POST['table_'];
		$conn = mysqli_connect("localhost", "root", "", "amateras_business");
		$field = ($table == "product_information") ? "model_name" : "emp_name";
		$SQL = "SELECT * FROM $table WHERE $field LIKE '%$search%'";
		$res = mysqli_query($conn, $SQL);
		$fields = array(
		    'product_information' => array('model_id', 'model_name', 'model_company', 'model_cost', 'model_processor','model_ram_size', 'model_hdd_size', 'model_operating_system', 'model_screen_size'),
			
			'employee_data' => array('emp_id', 'emp_name', 'emp_role', 'emp_joining_date', 'emp_phno')
			);
				?>
				<Table id="mytable">
				    <tr>
					<?php
					foreach($fields[$table] as $key=>$name) {
						?>
						<th><?=$name;?></th>
						<?php
					}?>
					</tr>
				<?php

		while($row = mysqli_fetch_array($res)) {
			//foreach($row as $key =>$value) 
			?><tr>
			    <?php
				foreach($fields[$table] as $key=>$name) {
				    ?><td><?=$row[$name]?></td><?php
				}
				?>
				</tr>
				<?php

		}
	
    }
?>