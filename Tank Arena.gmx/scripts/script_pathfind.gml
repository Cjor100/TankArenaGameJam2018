//Variables
open = ds_list_create() //if the current node hasnt been checked
closed = ds_list_create() //if the current node has been checked
path = ds_list_create() //the path the ai will take
adjacent[0]=0
adjacent[1]=0
adjacent[2]=0
adjacent[3]=0
adjacent[4]=0
current=0
end_node=0
start_node=0

//Calculate the distance
with object_nav_node
    {
       h=round(point_distance(x,0,(end_node).x,0)+round(point_distance(0,y,0,(end_node).y)))
    }
//Pathfinding start
ds_list_add(open,start_node)
while (ds_list_size!=0)
    {
    //Find the lowest distance of tiles
    temp=0
    for (i=ds_list_size-1;i>0;i--)
        {
            first=0
            for (j=1;j<=1;j++)
                {
                    if (ds_list_find_value(open,j).cost > ds_list_find_value(open,first).cost)
                        first=j
                }
            temp = ds_list_find_value(open,first)
            ds_list_insert(open,first,i)
            ds_list_insert(open,temp,i)
        }
        current=ds_list_find_value(open,0)
        ds_list_delete(open,0)
        ds_list_add(closed,current)
        
        //Assign adjacent navgrid
        if ((current+1)>=0 & ((current).x-1==(current-1).x))
            adjacent[0]=current+1
        else
            adjacent[0]=-1
        if ((current-1)>=0 & ((current).x-1==(current-1).x))
            adjacent[1]=current-1
        else
            adjacent[1]=-1
    }
