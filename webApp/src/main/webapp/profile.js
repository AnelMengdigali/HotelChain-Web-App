const tab = document.querySelectorAll('.tab');

$('.nav ul li').click(function() {
    $(this).addClass("active").siblings().removeClass("active");
})
function tabs(panelIndex) {
    tab.forEach(function(node) {
        node.style.display = 'none';
    });
    tab[panelIndex].style.display = 'block';
}
tabs(0);


$(".clear").click(function() {
    document.getElementById("form").reset();
});


const form = document.getElementById('form');

function removeB(id){
	$.ajax({
        	url: 'deleteBooking?res=' + id,
    	}).done(function(){
	location.reload()
})
}

function editProfile(form){
    // validation code here
      	
		$.ajax({
        	url: 'edit',
			data: '?nickname=' + form.nickname.value + '&first_name='+ form.first_name.value 
			+ '&last_name='+ form.last_name.value + '&idtype='+ form.idtype.value + 
			'&idnumber=' + form.idnumber.value + '&country='+ form.country.value + 
			'&city='+ form.city.value + '&street='+ form.street.value + '&mobile=' 
			+ form.mobile.value + '&home='+ form.home.value
    	}).done(function(){
	let path = "/register?usr=" +form.nickname.value + "&login=1";
	console.log(path);})
	//window.location.href = path;
}









