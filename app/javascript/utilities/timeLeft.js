document.addEventListener('turbolinks:load', function () {
    const content = document.querySelector('#timeLeft');
    const n = document.querySelector('.remaining').textContent

    if(content) timeLeft(n)
});

function timeLeft(duration) {
    
	let content = document.querySelector('#timeLeft');
    let timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        content.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}
