library(gWidgets2)
library('KeyboardSimulator')

delete_bols <- function(){
  
  # Create the GUI.
  w <- gwindow(title="Delete BOLs",visible=TRUE)
  grp <- ggroup(horizontal = FALSE, container=w)
  b1 <- gbutton("F4+Entrer+F5",container = grp)
  i2 <- gspinbutton(from = 0, to = 500, by = 1,container = grp)
  b4 <- gbutton("Start Loop",container = grp)
  i1 <- gspinbutton(from = 0, to = 1000, by = 1,container = grp)

  
  # Button1 clicked.
  addHandlerClicked(b1, handler = function (h, ...) {
    loop2<-as.numeric(svalue(i2))
    for (val in 1:loop2) {
    mouse.move(413, 176)
    mouse.click(button = "left")
    mouse.click(button = "left")
    Sys.sleep(5)
    keybd.press('f4')
    Sys.sleep(5)
    keybd.press('enter')
    keybd.press('f5')
    Sys.sleep(3)
    } 
  })
  
  
  # Button4 clicked.
  addHandlerClicked(b4, handler = function (h, ...) {
    loop<-as.numeric(svalue(i1))
    for (val in 1:loop) {
      
      mouse.move(413, 176)
      mouse.click(button = "left")
      mouse.click(button = "left")
      Sys.sleep(5)
      #Vuelta 1
      mouse.move(187, 130)
      mouse.click(button = "left")
      mouse.click(button = "right")
      mouse.move(369, 516)
      mouse.click(button = "left")
      keybd.press('enter')
      Sys.sleep(5)
      #Vuelta 2
      mouse.move(187, 130)
      mouse.click(button = "left")
      mouse.click(button = "right")
      mouse.move(369, 516)
      mouse.click(button = "left")
      keybd.press('enter')
      Sys.sleep(5)
      #Vuelta 3
      mouse.move(187, 130)
      mouse.click(button = "left")
      mouse.click(button = "right")
      mouse.move(369, 516)
      mouse.click(button = "left")
      keybd.press('enter')
      Sys.sleep(5)
      #Vuelta 4
      mouse.move(187, 130)
      mouse.click(button = "left")
      mouse.click(button = "right")
      mouse.move(369, 516)
      mouse.click(button = "left")
      keybd.press('enter')
      Sys.sleep(5)
      #Vuelta 5
      mouse.move(187, 130)
      mouse.click(button = "left")
      mouse.click(button = "right")
      mouse.move(369, 516)
      mouse.click(button = "left")
      keybd.press('enter')
      Sys.sleep(5)
      #Confirmación
      keybd.press('f5')
      Sys.sleep(5)
      
    }  
  })
  
  # Show the GUI.
  visible(w) <- TRUE
  
}
delete_bols()