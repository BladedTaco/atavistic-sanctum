/// @description stop OS sleeping

//this code causes a keypress that is not recognised by this program
//however, this keypress will stop a sleep timer activating 
//and so will prevent windows puttng the computer to sleep
var _str = keyboard_string //get current keyboard string 
io_clear(); //clear all input and output
keyboard_key_press(ord("~")) //press tilda
keyboard_key_release(ord("~")) //release tilda
io_clear(); //clear all input and output 
keyboard_string = _str //set the keyboard string back to what it was

alarm[0] = room_speed*30 //set this timer to repeat 30 seconds from now.
