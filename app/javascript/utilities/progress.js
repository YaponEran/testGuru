document.addEventListener('turbolinks:load', function () {
    var button = document.querySelector('.next');
    if (button) button.addEventListener('click', addProgress(button.dataset.progress))
});

function addProgress(progress) {
   var progressBar = document.querySelector('.progress-bar')
   progressBar.style["width"] = progress + "%"
}