var workers = [
    {
        username: "deskclerk1",
        password: "secret1"    
    },
    {
        username: "deskclerk2",
        password: "secret2"    
    }
]
let form = document.getElementById("form1");
function checkReg(e) {
	e.preventDefault();
	if (getInfo()) {
		
		form.submit();
		return true;
	}
	return false;
}
function getInfo() {

    var username = document.getElementById("username").value
    var password = document.getElementById("password").value

    for(i = 0; i < workers.length; i ++){
        if(username == workers[i].username && password == workers[i].password){
            return true;
        }
    }
	return false;
}