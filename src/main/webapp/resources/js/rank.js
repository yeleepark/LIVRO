var top5id = document.getElementsByClassName('top5id');
var top5nick = document.getElementsByClassName('top5nick');
var top5count = document.getElementsByClassName('top5count');
var top5rank = document.getElementsByClassName('top5rank');

var dataSet = [];
for(var i = 0; i < top5id.length; i ++){
	dataSet.push({
		member_id : top5id[i].value,
		member_nickname : top5nick[i].value,
		count : top5count[i].value,
		rank : top5rank[i].value
	});
}

d3.select('.top5print').selectAll('span')
  .data(dataSet)
  .enter()
  .append('span')
  .style('height', (d,i)=>{
	  return (d.count)*50+ "px";
  	})
  .style('width', (d,i)=>{
	  return 10 + "%";
	})
  .attr('x', (d,i)=>{
	  return 50 * i
  })
  .attr('y', (d,i)=>{
	  return 100 - (d.count);
  })
  .html((d,i)=>{
	  return '<span class="chartText">'+d.member_nickname+'</span>';
  })
  .style('background-color', (d,i)=>{
	  if(d.rank == 1){
		  return "gold";
	  }else if(d.rank==2){
		  return "silver";
	  }else if(d.rank==3){
		  return "brown";
	  }else{
		  return "black";
	  }
  })
  
  .attr("class", "bar-chart")
  .on('click',(d,i)=>{
	  location.href='artist.do?member_id='+i.member_id;
});


// 서포트 게시물 수
var artistId = document.getElementsByClassName('artistId');
var artistNick = document.getElementsByClassName('artistNick');
var supportCount = document.getElementsByClassName('supportCount');
var supportRank = document.getElementsByClassName('supportRank');
var supportSet = [];
for(var i = 0; i < artistId.length; i ++){
	supportSet.push({
		member_id : artistId[i].value,
		member_nickname : artistNick[i].value,
		count : supportCount[i].value,
		rank : supportRank[i].value
	});
}

d3.select('.supportPrint').selectAll('span')
  .data(supportSet)
  .enter()
  .append('span')
  .style('height', function(d,i){
	  return (d.count)+ "px";
  	})
  .style('width', function(){
	  return "50px";
	})
  .html((d,i)=>{
	  return '<span class="chartText">'+d.member_nickname+'</span>';
  })
  .attr('x', (d,i)=>{
	  return 50 * i
  })
  .attr('y', (d,i)=>{
	  return  (d.count);
  })
  .style('background-color', (d,i)=>{
	  if(d.rank == 1){
		  return "gold";
	  }else if(d.rank==2){
		  return "silver";
	  }else if(d.rank==3){
		  return "brown";
	  }else{
		  return "black";
	  }
  })
  .attr("class", "support-chart")
  .on('click',(d,i)=>{
	  location.href='artist.do?member_id='+i.member_id;
});

	
