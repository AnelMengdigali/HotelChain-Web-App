const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});

const form1 = document.getElementById('form');
const form2 = document.getElementById('form2');

const username1 = document.getElementById('usr');
const username2 = document.getElementById('usr2');

const password = document.getElementById('psw');
const password2 = document.getElementById('psw-repeat');

const passwordLog = document.getElementById('psw2');


function checkReg(e) {
	e.preventDefault();
    checkRegInputs()
	
}

function checkLog(e) {
	e.preventDefault();
	checkLogInputs()
	const usernameValue = username2.value.trim()
    const passwordValue = passwordLog.value.trim()

	var result = false
	
    if (username2.parentElement.className == 'form-control success' && passwordLog.parentElement.className == 'form-control success') {
		correctSignIn(usernameValue, passwordValue).then((answer) => {
			result = answer
			if(result == false){
				setErrorFor(username2, 'Invalid username or password!')
				setErrorFor(passwordLog,'Invalid username or password!')
			}else if(result == true)
				form2.submit()
		})		
	}
	return false
}

function checkRegInputs() {
    // trim to remove the whitespaces
   	const usernameValue = username1.value.trim()
    const passwordValue = password.value.trim()
    const password2Value = password2.value.trim()

	
    if (passwordValue === '') {
        setErrorFor(password, 'Password cannot be blank');
    } else if (!checkpassword(passwordValue)) {
        setErrorFor(password, 'Password must contain 4 to 10 characters which contain only characters, numeric digits, underscore and first character must be a letter');
    } else {
        setSuccessFor(password);
    }

    if (password2Value === '') {
        setErrorFor(password2, 'Password2 cannot be blank');
    } else if (passwordValue !== password2Value) {
        setErrorFor(password2, 'Passwords does not match');
    } else {
        setSuccessFor(password2);
    }
	registered(usernameValue).then((result) => {
    	if (usernameValue === '') {
        	setErrorFor(username1, 'Username cannot be blank');
    	} else if (result == true) {
			setErrorFor(username1, 'Username is taken, please try another one');
		}else if(password.parentElement.className == 'form-control success' && password2.parentElement.className == 'form-control success'){
        	setSuccessFor(username1);
			form1.submit()
    	}
	})
}




function checkLogInputs() {
    // trim to remove the whitespaces
    const usernameValue = username2.value.trim();
    const passwordValue = passwordLog.value.trim();



    if (usernameValue === '' ) {
        setErrorFor(username2, 'Username cannot be blank');
    } else {
        setSuccessFor(username2);
    }

    if (passwordValue === '') {
        setErrorFor(password, 'Password cannot be blank');
    } else if (!checkpassword(passwordValue)) {
        setErrorFor(passwordLog, 'Password must contain 4 to 10 characters which contain only characters, numeric digits, underscore and first character must be a letter');
    } else {
        setSuccessFor(passwordLog);
    }
}

function setErrorFor(input, message) {
    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.className = 'form-control error';
    small.innerText = message;
}


function setSuccessFor(input) {
    const formControl = input.parentElement;
    formControl.className = 'form-control success';
}

function checkpassword(p) {
    var passw = /^[A-Za-z]\w{3,9}$/;
    if (p.match(passw)) {

        return true;
    } else {
        return false;
    }
}
//check if this nickname is already in the database
//CHECKED
function registered(name) {	
	return new Promise((resolve, reject) => {
		$.ajax({
        	url: 'checkUsername?usr=' + name,
        	dataType: 'json',
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

function correctSignIn(user, pass){
	return new Promise((resolve, reject) => {
		$.ajax({
			url: 'checkUsername?usr=' + user + '&pass=' + pass,
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