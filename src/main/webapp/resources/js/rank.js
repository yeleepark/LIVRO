function setTime(){
	window.setTimeout('window.location.reload()', 60000);
	let today = new Date();
	let updateTime = document.getElementsByClassName('updateTime');
	var res = moment(today).format('HH시mm분')

	updateTime[0].innerHTML = res;
	updateTime[1].innerHTML = res;
}

setTime();

let regdate = document.getElementById('newRegdate').value;
var regRes = new Date (regdate.replace("KST", "UTC+0900"));
let regdateRes = moment(regRes, "YYYYMMDDHHMMSS").fromNow()
let regdatePrint = document.getElementById('regdatePrint');
regdatePrint.innerHTML = regdateRes;

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

var top5length = top5id.length;
var top5total = 0;
dataSet.forEach(key => {
	top5total += parseInt(key.count);
	});
	
d3.select('.top5print').selectAll('span')
  .data(dataSet)
  .enter()
  .append('span')
  .style('height', (d,i)=>{
	  return d.count/top5total*100 + "%";
  	})
  .style('width', (d,i)=>{
	  return 80/top5length + "%";
	})
  .style('left', (d,i)=>{
	  return ((100/top5length)*i)+(10/top5length) + "%";
  })
  .html((d,i)=>{
	  return '<span class="chartText">'+d.member_nickname+'</span>';
  })
  .style('background-color', (d,i)=>{
	  if(d.rank == 1){
		  return "#b08f26";
	  }else if(d.rank==2){
		  return "#a7a7a7";
	  }else if(d.rank==3){
		  return "#a4672d";
	  }else if(d.rank==4){
		  return "#70d4a4";
	  }else{
	  	return "#7292b5";
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

var supportLength = artistId.length;
var supportTotal = 0;
supportSet.forEach(key => {
	supportTotal += parseInt(key.count);
	});

d3.select('.supportPrint').selectAll('span')
  .data(supportSet)
  .enter()
  .append('span')
  .style('height', (d,i) => {
	  return  parseInt(d.count)/parseInt(supportTotal)*100+"%";
  	})
  .style('width', (d, i) => {
	  return 80/supportLength + "%";
	})
  .style('left', (d,i)=>{
	  return ((100/supportLength)*i)+(10/supportLength) + "%";
  })
  .html((d,i)=>{
	  return '<span class="chartText">'+d.member_nickname+'</span>';
  })
  .style('background-color', (d,i)=>{
	  if(d.rank == 1){
		  return "#b08f26";
	  }else if(d.rank==2){
		  return "#a7a7a7";
	  }else if(d.rank==3){
		  return "#a4672d";
	  }else if(d.rank==4){
		  return "#70d4a4";
	  }else{
		  return "#7292b5";
	  }
  })
  .attr("class", "support-chart")
  .on('click',(d,i)=>{
	  location.href='artist.do?member_id='+i.member_id;
});

	
