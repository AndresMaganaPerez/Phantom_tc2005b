const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

window.addEventListener('load',function(){

	document.getElementById('fechaNac').type= 'text';
	
	document.getElementById('fechaNac').addEventListener('blur',function(){
	
	document.getElementById('fechaNac').type= 'text';
	
	});
	
	document.getElementById('fechaNac').addEventListener('focus',function(){
	
	document.getElementById('fechaNac').type= 'date';
	
	});
	
});