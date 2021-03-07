function pullDown() {


  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")
  const pullDownChild = document.querySelectorAll(".pull-down-list")
  
  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:#808080;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:##808080;")
  })

  pullDownButton.addEventListener('click', function() {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
}

setInterval(pullDown, 1000);
// window.addEventListener('load', pullDown)