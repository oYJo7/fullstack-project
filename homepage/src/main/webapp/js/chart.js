window.onload = function () {
    loofChart();
}

function loofChart(){
	for (let i=1; i<4; i++){
		let ele = document.getElementById('PchartCanvas-'+i);
		let eleCount = ele.childElementCount-1;
		
		let question = [];
		let count = [];
		
		for (let j=0; j<eleCount; j++){
			if (j%2 == 0){
				let temp = document.getElementById('ChartCanvas-'+i+'-'+j).value;
				question.push(temp);
			}else{
				let temp = document.getElementById('ChartCanvas-'+i+'-'+j).value;
				count.push(temp);
			}
		}
		
		count = count.map(Number); //문자를 숫자로 변경
		
		let pieChartData = {
			axis: 'y',
		    labels: question,
		    datasets: [{
		        data: count,
		        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
		    }] 
		};
		

	    let ctx = document.getElementById('ChartCanvas-'+i).getContext('2d');
	    
	    window.pieChart = new Chart(ctx, {
	        type: 'bar',
	        data: pieChartData,
	        options: {
				indexAxis: 'y',
	            responsive: false
	        }
	    });
	}
}

