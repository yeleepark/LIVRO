/*var list2 = document.getElementById("list");
console.log(JSON.parse(list2.innerHTML));
var list = JSON.parse(list2.innerHTML);
		
var graphData = [{"name":[], "value":[]}];
			
for(var i in list){
console.log(list[i].MEMBER_NICKNAME);
graphData[0].name.push(list[i].MEMBER_NICKNAME); 
graphData[0].value.push(list[i].COUNT);	



}*/


var list2 = document.getElementById("list");
console.log(JSON.parse(list2.innerHTML));
var list = JSON.parse(list2.innerHTML);

      	var dataset = [];
		var dataset2 = [];
		var dataset3 = [];
		for(var i in list){
		//console.log(list[i].MEMBER_NICKNAME);
		console.log(list[i].MEMBER_ID);
		dataset.push(list[i].MEMBER_NICKNAME); 
		dataset2.push(list[i].COUNT);
		dataset3.push(list[i].MEMBER_ID);
		}
		console.log(dataset2);
		console.log(dataset3);
      var svg = d3.select("svg");
      
      svg.selectAll("bar")
          .data(dataset2)
          .enter().append("rect")
          .attr('class','bar')
          .attr("height", (d, i)=>{return d*100})
          .attr("width", 40)
			//x축 그래프 위치
          .attr("x", (d, i) => {return (50 * i)})
			//y축 그래프 위치 현재 반전 형태
          .attr("y", (d, i) => {return (300- dataset2[i]*100)})
			//d가 뭔 역할인진 모르겠는데... 아무튼 온클릭 이벤트 줘서 아티스트 페이지로 넘어갈 수 있다.
      	  .on("click",function(d, i){
	return location.href = "artist.do?member_id=" + dataset3[i]});
		  
				//그래프에 rank_count 값 text로 출력
         		svg.selectAll("text")
                .data(dataset2)
                .enter().append("text")
                .text(function (d) { return d })
				//x축 text 위치 이동
                .attr("x", function (d, i) { return 50 * i + 15})
				//y축 text 위치 이동
                .attr("y", function (d, i) { return (300 - dataset2[i]*100 + 15)});
	
	//그래프에 rank_member_nickname 값 text 로 출력			
	/*	svg.selectAll("text")
			.data(dataset)
			.enter().append("text")
			.text(function (d) { return d })
			//x축 text 위치 이동
            .attr("x", function (d, i) { return 50 * i + 15})
			//y축 text 위치 이동
            .attr("y", function (d, i) { return (300 - dataset2[i]*100 )});*/

		
				
				
	