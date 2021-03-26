const getRandomColor = () => (Math.floor(Math.random()*16777215).toString(16))

setInterval(function(){ body.style.backgroundColor = getRandomColor(); }, 300);