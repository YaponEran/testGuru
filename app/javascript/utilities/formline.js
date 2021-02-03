document.addEventListener('turbolinks:load', function(){
    var controls = document.querySelector('.form-line-link')

    if(controls.length){
        for(var i = 0; i < controls.length; i++){
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }

    var errors = document.querySelector('.resource-errors')

    if(errors){
        var resourceId = errors.dataset.resourceId
        formLineHandler(resourceId)
    }
})

function formInlineLinkHandler(event){
    event.preventDefault()

    var testId = this.dataset.tes

    formLineHandler(testId)
}

function formLineHandler(testId){
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    var formInLine = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

    if(formInLine){
        if(formInLine.classList.contains('hide')){
            testTitle.classList.add('hide')
            formInLine.classList.remove('hide')
            link.textContent = 'Cancel'
        } else {
            testTitle.classList.remove('hide')
            formInLine.classList.add('hide')
            link.textContent = 'Edit'
        }
    }
}