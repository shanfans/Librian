window.onload = ->
    x = y = now_x = now_y = 0;
    body = document.querySelector('body')
    body.onmousemove = (e) => 
        now_x = e.pageX
        now_y = e.pageY
    循环 = ->
        x = (x*9 + now_x)/10
        y = (y*9 + now_y)/10
        body.style.setProperty('--x', "#{-x/100}px")
        body.style.setProperty('--y', "#{-y/100}px")
        body.style.setProperty('--s', "#{x/20}deg")
        setTimeout(循环, 15)
    循环()