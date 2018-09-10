switch(mpos){
case 0://Play
room_goto(room_map1);
break;
case 1: //Tutorial
//Don't have a tutorial map yet.
break;
case 2: //Credits
room_goto(room_credits);
break;
case 3: //Quit
game_end();
break;
default:
break;
}
