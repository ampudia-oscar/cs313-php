function clickMe() {
    alert("Clicked!");
};

function changeColor(){
	var d1 = document.getElementById("d1");
	var newColor = document.getElementById("getColor").value;
	
	d1.style.color = newColor;
};

function changeBg() {
	var div1 = document.getElementById("div1");
	var newColor = document.getElementById("getColorBg").value;
	
	$("#div1").css("background-color", newColor);
}
