//Variables
open = ds_list_create() //if the current node hasnt been checked
closed = ds_list_create() //if the current node has been checked
path = ds_list_create() //the path the ai will take
current=0
end_node=0

//Calculate the distance
with object_nav_node
    {
       h=round(point_distance(x,0,(end_node).x,0)+round(point_distance(0,y,0,(end_node).y)))
    }
