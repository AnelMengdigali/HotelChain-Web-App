let hotels = document.getElementById("hotels");
let from = document.getElementById("from");


let to = document.getElementById("to");
let residents = document.getElementById("Residents");
let guestID = document.getElementById("clerk");

let occupants = 0;
let fromval = 0;
let toval = 0;
var roomType = "";
function updateList(items) {
    $("#my-list").html("");
	let list = document.getElementById("my-list");
   
    items.forEach(function (e) {
	
		let value = e.hotelID+"|" + occupants + "|" + fromval + "|" + toval + "|";
		value  += roomType;
		value+="|" + e.roomNumber;
		value += "|";
		value += Math.round(e.price);
		var x = document.createElement("INPUT");
  		x.setAttribute("type", "radio");
  		x.setAttribute("value", value);
		x.setAttribute("name", "choice");
  		x.setAttribute("required", "true");
  		list.appendChild(x);
list.appendChild(document. createTextNode(`${e.roomNumber} | ${e.floor} | ${e.roomType} | ${Math.round(e.price)}`));
    
});

   
}
function getRooms(e) {
	e.preventDefault();
	let radios = $("input[name='room-type']:checked");
	occupants = residents.value.trim();
	fromval = from.value.trim();
	toval = to.value.trim();
	roomType = radios.val();
	
	$.ajax({
        url : "./findRooms?hotelID=" + hotels.value.trim() + "&type=" + radios.val() +
 "&inD=" + from.value.trim() + "&outD=" + to.value.trim() + "&residents=" + residents.value.trim(),
        dataType : 'json',
        success : function(r) {
	
            updateList(r);
		
        }
    });
	return false;
}