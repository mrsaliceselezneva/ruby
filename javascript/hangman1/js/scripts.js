function draw_hangman(i, now_word, name, use_letters){
	
	 if (now_word.indexOf(name) > -1){
		 if (use_letters.indexOf(name) < 0){
			 var counter = 0;
			 for (i = 0; i < now_word.length; ++i){
				 if (name === now_word[i]){			 
					 document.getElementById("letter" + i).remove();
					 var cases = document.getElementById("td" + i);
					 var div = document.createElement("div");
					 div.id = "letter" + i;
					 div.appendChild(document.createTextNode(name));
					 cases.appendChild(div);
					 ++counter;
				 }
			 }
			 return counter;
		 }
		 return 0;
	 }
	 const pi = Math.PI;
	 board = [
		 [[150, 300], [270, 300]],
		 [[270, 300], [270, 150]],
		 [[270, 150], [180, 150]],
		 [[180, 150], [180, 190]],
		 [180, 200, 10, 0, 2 * pi, true],
		 [[180, 210], [180, 250]],
		 [[180, 220], [160, 240]],
		 [[180, 220], [200, 240]],
		 [[180, 250], [160, 270]],
		 [[180, 250], [200, 270]]
	 ];
	 var canvas = document.getElementById('canvas');
	 var ctx = canvas.getContext('2d');
	 ctx.beginPath();
	 if (i === 4){
		 ctx.arc(board[i][0], board[i][1], board[i][2], board[i][3], board[i][4], board[i][5]);
	 }
	 ctx.moveTo(board[i][0][0], board[i][0][1]);
	 ctx.lineTo(board[i][1][0], board[i][1][1]);
	 ctx.stroke();
	 return -1;
 }
 
 
 
 function start(){
	 var step_for_finish = 0;
	 var guessed_letters = 0;
	 var letters = document.getElementById("letters");
	 var val = document.getElementById("canvas");
	 var use_letters = "";
	 if (val !== null){
		val.remove();
		document.getElementById("table").remove();
		for (i = 65; i < 91; ++i){
			document.getElementById("click").remove();
		}
	 }
	 
	 
	 const mas = ['HELLO', 'PROGRAMMER', 'TASK', 'KING', 'INTERNET', 'PYTHON', 'NOTEPAD', 'MATHEMATICS', 'SCREEN', 'LIGHTING']
	 var now_word = mas[Math.floor(Math.random() * mas.length)];
	// alert(now_word);
	 
	 var table = document.createElement("table");
	 table.border = "1";
	 table.width = now_word.length * 50 + "px";
	 table.height = "50px";
	 table.cellpadding = "5";
	 table.id = "table";
	 var tableRow = document.createElement("tr");
	 
	 for (i = 0; i < now_word.length; ++i){	 
		 var cases = document.createElement("td");
		 cases.id = "td" + i;
		 var div = document.createElement("div");
		 div.id = "letter" + i;
		 div.appendChild(document.createTextNode("_"));
		 cases.appendChild(div);
		 tableRow.appendChild(cases);
	 }
	 
	 table.appendChild(tableRow);
	 document.getElementById("word").appendChild(table);
	 
	 var canvas = document.createElement("canvas");
	 canvas.id = "canvas";
	 canvas.width = "400";
	 canvas.height = "400";
	 document.getElementById("hangman").appendChild(canvas);
	 
	 for (var i = 65; i < 91; ++i){
		 var button = document.createElement("button");
		 button.id = "click";
		 button.onclick = function check(){
			 change = draw_hangman(step_for_finish, now_word, this.name, use_letters);
			 if(change < 0){	 
				 this.style.backgroundColor = "rgb(255, 43, 43)";
				 step_for_finish -= change;
			 }
			 else if (change > 0){
				 this.style.backgroundColor = "rgb(0, 204, 0)";
				 guessed_letters += change;
				 use_letters += this.name;
			 }
			 setTimeout(total, 100, step_for_finish, guessed_letters, now_word);
		};
		 button.name = String.fromCharCode(i);
		 button.appendChild(document.createTextNode(String.fromCharCode(i)));
		 letters.appendChild(button);

	 }
 }

 
function total(step_for_finish, guessed_letters, now_word){
	 if (step_for_finish > 9){
		 start();
		 alert("LOSE");
		 return;
	 }
	 if(guessed_letters === now_word.length){
		 start();
		 alert("WIN");
		 return;
	}
}
 