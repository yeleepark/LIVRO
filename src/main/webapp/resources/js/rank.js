// 탑3 아이디
var top3Id = document.getElementsByClassName('top3id');
// 탑3 팔로워 수
var top3count = document.getElementsByClassName('top3count');
// 탑3 닉네임
var top3Nickname = document.getElementsByClassName('top3nickname');

const dataFile = []; // 사용할 데이터를 배열로
for (var i =0 ; i < top3Id.length + 1; i++){
//	console.log(parseInt(i+1) + "등")
//	console.log(top3Id[i].value);
//	console.log(top3count[i].value);

	dataFile.push(top3count[i].value);
	const color = ['yellow', 'lime', 'red'] // 컬러 지정
	const svg = d3.select('svg'); // svg 태그를 선택하라

	    // d는 데이터 i는 데이터 인덱스
		svg.selectAll('bar')
		   .data(dataFile) // dataFile 배열에 있는 값 하나씩 넣기
		   .enter().append('rect') // 막대그래프로
		   .attr('fill', (d, i) => { return color[i] } ) // 속성 : 컬러 넣기
		   .attr('height', (d, i) => { return d } ) // 높이
		   .attr('width', 40) // 너비
		   .attr('x', (d, i) => { return 50*i } ) // x 축
		   .attr('y', (d, i) => { return 100-dataFile[i] } ) // y축
		   console.log(dataFile);
}



    