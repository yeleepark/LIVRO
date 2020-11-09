						/*방송 없을 떄*/

	let ele = document.getElementsByClassName(('broadcast-table'))[0];
	let h1 = document.createElement('h1');

	if (ele.childElementCount < 1) {

		// 방송이 하나도 없을 때 출력되는 메시지
		h1.innerHTML = '진행중인 방송이 없습니다 헤헤';

		ele.appendChild(h1);

	}
