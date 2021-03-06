document.addEventListener('turbolinks:load', function () {

    const timer = document.querySelector('.timer')
    if (timer) {
        let timeLeft = timer.dataset.timer

        setInterval(function () {
            timeLeft ? timeLeft-- : document.querySelector('form').submit()
            changeTimer(timeLeft, timer)
        }, 1000)
    }
});

function changeTimer(timer_count, timer_obj) {
    line = 'Time is moving '
    timer_obj.innerHTML = (line + timer_count)
}