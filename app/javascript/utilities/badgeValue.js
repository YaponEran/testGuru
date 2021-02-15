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

  function ruleValueSelectorChange() {
    (this.value == "first_try") ? firstTry() : 
    (this.value == "all_by_category") ? allByCategory(): 
    (this.value == "all_by_level") ? allByLevel() : 
    defaultSetup()
  }

  
  function valueShow(c0, c1, c2, e=false) {

    const v_0 = document.querySelector(c0)
    e ?  v_0.classList.add("hide") :  v_0.classList.remove("hide") 

    const v_1 = document.querySelector(c1)
    v_1.classList.add("hide")

    const v_2 = document.querySelector(c2)
    v_2.classList.add("hide")
  }
  
  function setName(c0, c1, c2, e=false) {

    const s_0 = document.querySelector(c0)
    e ?  s_0.setAttribute("name", "badge[nothing]") : 
         s_0.setAttribute("name", "badge[rule_value]")

    const s_1 = document.querySelector(c1)
    s_1.setAttribute("name", "badge[nothing]")

    const s_3 = document.querySelector(c2)
    s_3.setAttribute("name", "badge[nothing]")
  
  }
  
  function labelShow(c1, c2, c3, c4, e=false) {
    const l_0 = document.querySelector(c1)

    e ? l_0.classList.add("hide") :  l_0.classList.remove("hide") 

    const l_1 = document.querySelector(c2)
    l_1.classList.add("hide")

    const l_2 = document.querySelector(c3)
    l_2.classList.add("hide")

    const l_3 = document.querySelector(c4)
    l_3.classList.add("hide")
  }