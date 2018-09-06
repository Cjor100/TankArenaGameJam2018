switch(mpos){
case 0://Play
room_goto(room_test_map);
break;
case 1: //Tutorial
//Don't have a tutorial map yet.
break;
case 2: //Credits
//Don't have a credits map yet
break;
case 3: //Quit
game_end();
break;
default:
break;
}
