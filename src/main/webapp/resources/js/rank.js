var top3id = document.getElementsByClassName('top3id');
var top3nick = document.getElementsByClassName('top3nick');
var top3count = document.getElementsByClassName('top3count');
var top3rank = document.getElementsByClassName('top3rank');

var dataSet = [];
for(var i = 0; i < top3id.length; i ++){
	dataSet.push({
		member_id : top3id[i].value,
		member_nickname : top3nick[i].value,
		count : top3count[i].value,
		rank : top3rank[i].value
	});
}

d3.select('.print').selectAll('span')
  .data(dataSet)
  .enter()
  .append('span')
  .style('height', function(d,i){
	  return (d.count*100)+ "px";
  	})
  .style('width', function(){
	  return "50px";
	})
  .style('background-color', (d,i)=>{
	  if(d.rank == 1){
		  return "gold";
	  }else if(d.rank==2){
		  return "silver";
	  }else{
		  return "copper";
	  }
  })
  .attr("class", "bar-chart")
  .on('click',(d,i)=>{
	  location.href='artist.do?member_id='+i.member_id;
});
