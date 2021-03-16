document.addEventListener('turbolinks:load', function() {
    var ruleTypeSelector = document.querySelector('#badge_rule')
  
    if (ruleTypeSelector) {
      ruleTypeSelector.addEventListener('change', ruleValueSelectorChange)
    }
  })

function firstTry(){
    labelShow(".tests", ".categories", ".levels", ".all")
    valueShow(".rule_tests", ".rule_categories", ".rule_levels")
    setName(".rule_tests", ".rule_categories", ".rule_levels")
}

function allByCategory(){
    labelShow(".categories", ".levels", ".tests", ".all")
    valueShow(".rule_categories", ".rule_tests", ".rule_levels")
    setName(".rule_categories", ".rule_tests", ".rule_levels")
}

function allByLevel(){
    labelShow(".levels", ".tests", ".categories", ".all")
    valueShow(".rule_levels", ".rule_categories", ".rule_tests")
    setName(".rule_levels", ".rule_categories", ".rule_tests")
}

function defaultSetup(){
    labelShow(".tests", ".categories", ".levels", ".all", e=true)
    valueShow(".rule_levels", ".rule_categories", ".rule_tests", e=true)
    setName(".rule_levels", ".rule_categories", ".rule_tests", e=true)
}

  function ruleValueSelectorChange() {
      switch(this.value){
          case "first_try":
              firstTry()
              break;
          case "all_by_category":
              allByCategory()
              break;
          case "all_by_level":
              allByLevel()
              break;
          default:
              defaultSetup()
      }
  }
  
  function valueShow(c0, c1, c2, e=false) {

    const value_0 = document.querySelector(c0)
    e ?  value_0.classList.add("hide") :  value_0.classList.remove("hide") 

    const value_1 = document.querySelector(c1)
    value_1.classList.add("hide")

    const value_2 = document.querySelector(c2)
    value_2.classList.add("hide")
  }
  
  function setName(c0, c1, c2, e=false) {

    const setName_0 = document.querySelector(c0)
    e ?  setName_0.setAttribute("name", "badge[nothing]") : 
         setName_0.setAttribute("name", "badge[rule_value]")

    const setName_1 = document.querySelector(c1)
    setName_1.setAttribute("name", "badge[nothing]")

    const setName_3 = document.querySelector(c2)
    setName_3.setAttribute("name", "badge[nothing]")
  
  }
  
  function labelShow(c1, c2, c3, c4, e=false) {
    const labelShow_0 = document.querySelector(c1)

    e ? labelShow_0.classList.add("hide") :  labelShow_0.classList.remove("hide") 

    const labelShow_1 = document.querySelector(c2)
    labelShow_1.classList.add("hide")

    const labelShow_2 = document.querySelector(c3)
    labelShow_2.classList.add("hide")

    const labelShow_3 = document.querySelector(c4)
    labelShow_3.classList.add("hide")
  }