/**
    Created by maqbool on 25/June/2015.
    Hot day in Karachi! waiting of rain
    - Ramadan 2015!

    aToast.js (Android Toast)
    A pure JS written Android like Toast
    no need of any dependency!

    just add aToast-min.js in ur html
    n u r ready to go...

    and i provide this for learning purppse :)
 */
function aToast(options) {
    var timer = 0;
    var box = document.createElement("div");
    var pageWidth = window.innerWidth;
    // aToast css
    box.style.position = "fixed";
    if(!options.top)
        box.style.top = "10px";
    else
        box.style.top = options.top + "px";
    if(options.maxWidth == undefined)
        box.style.maxWidth = pageWidth-40 +"px";
    else
        box.style.maxWidth = options.maxWidth +"px";
    box.style.minWidth = "100px";
    box.style.borderRadius = "1px";
    box.style.background = "transparent"
   /* box.style.boxShadow = "3px 3px 8px rgba(0, 0, 0, 0.3)";*/
    /*box.style.textShadow = "0 -1px 0px black";*/
    box.style.color = "#F44336";
    box.style.textAlign = "center";
    box.style.padding = "5px 15px";
    box.style.display = "inline-block";
    if(options.font == undefined)
        box.style.fontFamily = "TREBUCHET MS";
    else
        box.style.fontFamily = options.font;

    if(options.bold != undefined && options.bold == false)
        box.style.fontWeight = "normal";
    else
        box.style.fontWeight = "bold";
    if(options.fontSize == undefined)
        box.style.fontSize = "13px";
    else
        box.style.fontSize = options.fontSize + "px";
    box.style.zIndex = "1001";
    box.style.display = "none"

    this.show = function (message, holdtime) {
        document.body.appendChild(box);
        box.style.display = "block"
        if(box.textContent == 'undefined' || box.textContent == null)
            box.innerText = message;
        else
            box.textContent = message;
        if(options.dir == undefined || options.dir == "center") {
            //center is here because we want to get a width dynamically added element and we did not get it until its visible
            box.style.left =  (pageWidth - box.offsetWidth)/2 + "px";
        } else if(options.dir == "left") {
            if(!options.left)
                box.style.left = "10px";
            else
                box.style.left = options.left+"px";
            var l = box.offsetLeft ;
            var  r = (pageWidth - box.offsetWidth - box.offsetLeft);
            if(l > r) {
                box.style.right = l + "px";
            }
        } else if(options.dir == "right") {
            if(!options.right)
                box.style.right = "10px";
            else
                box.style.right = options.right+"px";
            var l = box.offsetLeft ;
            var  r = (pageWidth - box.offsetWidth - box.offsetLeft);
            if(l < r) {
                box.style.left = r + "px";
            }
        }
        if (timer < 1) {
            box.style.opacity = timer;
            timer += 0.1;
            setTimeout(function () {
                this.show(message, holdtime)
            }, 100);
        } else {
                setTimeout(function () {
                    hide()
                }, holdtime * 1000);
        }
        return this;
    }
    var hide = function () { // private function
        if (timer > 0) {
        box.style.opacity = timer;
        timer -= 0.1;
        setTimeout(function () {hide() }, 100);
             } else {
            timer = 0;
            box.parentElement.removeChild(box);
        }
        return this;
    }
    return this;
}