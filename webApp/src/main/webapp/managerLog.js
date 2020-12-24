const username = document.getElementById('username');
const password = document.getElementById('password');
const form = document.getElementById('form');

function checkManagerLog(e) {
	e.preventDefault();
	const usernameValue = username.value.trim()
    const passwordValue = password.value.trim()
	
	var result = false
	
    
	correctSignIn(usernameValue, passwordValue).then((answer) => {
		result = answer
		if(result == false){
			
		}else if(result == true)
			form.submit()
	})		

	return false
}

function correctSignIn(user, pass){
	return new Promise((resolve) => {
		$.ajax({
			url: 'checkManager?usr=' + user + '&pass=' + pass,
			datatype: 'json',
			success: function(r) {
				if(r.answ == "true"){
					resolve(true)
				}else {
					resolve(false)
				}
			}
		})
	})
}