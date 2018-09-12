  //Variables
  Integer[] adjacent = new Integer[4];
  ArrayList<Integer> open = new ArrayList<Integer>();
  ArrayList<Integer> closed = new ArrayList<Integer>();
  ArrayList<Integer> path = new ArrayList<Integer>();
  int current=0;
  //start is the starting location in the navgrid
  //end is the end goal in the navgrid
  //botid is the bots number in the bots arraylist
  //the adjacent array is used to store the location of the adjacent navgrids
  //the open arraylist is used to store the current considered grids
  //the closed arraylist is used to store the current expended grids
  //the path arraylist is used to store the final path
  //current is used to store the current location for the loop

  //Navigation grid creation
  class navgrid
  {
    int x, y, h, g, f;
    int parent = -1;
    //h is distance from end
    //g is path length
    //f is g+h
  }
  ArrayList<navgrid> navgrids = new ArrayList<navgrid>();
  //Grid Setup
  for (int a=0; a<24; a++)//hight
  {
    for (int s=0; s<32; s++)//width
    {
      navgrids.add(new navgrid(s, a));
    }
  }

  //Calculate h
  for (int a=0; a<navgrids.size(); a++)
  {
    navgrids.get(a).h=int((dist(navgrids.get(a).x, 0, navgrids.get(end).x, 0) + dist(0, navgrids.get(a).y, 0, navgrids.get(end).y)));
  }

  //Pathfinding start
  open.add(start);
  while (open.size()!=0)
  {
    //Find the lowest F of tiles   
    int temp;
    for (int i=open.size()-1; i>0; i--)
    {
      int first=0;
      for (int j=1; j<=i; j++)
      {
        if (navgrids.get(open.get(j)).f > navgrids.get(open.get(first)).f)
          first=j;
      }
      temp = open.get(first);
      open.set(first, open.get(i));
      open.set(i, temp);
    }
    current=open.get(0);
    open.remove(0);
    closed.add(current);

    //Assign adjacent navgrids
    if ((current+1)<navgrids.size() && (navgrids.get(current).x+1==navgrids.get(current+1).x))
      adjacent[0]=current+1; //right
    else
      adjacent[0]=-1;
    if ((current-1)>=0 && (navgrids.get(current).x-1==navgrids.get(current-1).x))
      adjacent[1]=current-1; //left
    else
      adjacent[1]=-1;
    if ((current+32)<navgrids.size() && (navgrids.get(current).y+1==navgrids.get(current+32).y))
      adjacent[2]=current+32; //up
    else
      adjacent[2]=-1;
    if ((current-32)>=0 && (navgrids.get(current).y-1==navgrids.get(current-32).y))
      adjacent[3]=current-32; //down
    else
      adjacent[3]=-1;

    //Check if the current block is the destination
    if (current==end)
    {
      for (int a=0; a<=3; a++)
      {
        if (adjacent[a]!=-1)
        {
          if (navgrids.get(adjacent[a]).parent==current)
          {
            navgrids.get(current).parent=adjacent[a];
          }
        }
      }
      break;
    }

    //Check adjacents
    for (int a=0; a<=3; a++)
    {
      if (adjacent[a]!=-1)
      {
        if (grids.get(adjacent[a]).state==1 || (closed.contains(adjacent[a]) || (botdifficulty==3 && grids.get(adjacent[a]).state==2)))
        {
          continue;
        }
        if (navgrids.get(adjacent[a]).g!=0 && navgrids.get(current).g+1<navgrids.get(adjacent[a]).g || !open.contains(adjacent[a]))
        {
          navgrids.get(adjacent[a]).g=(navgrids.get(current).g+1);
          navgrids.get(adjacent[a]).f=(navgrids.get(adjacent[a]).g+navgrids.get(adjacent[a]).h);
          navgrids.get(adjacent[a]).parent=current;
          if (!open.contains(adjacent[a]))
          {
            open.add(adjacent[a]);
          }
        }
      }
    }
  }

  //Find the path
  current=end;
  path.add(end);
  while (navgrids.get(current).parent!=-1)
  {
    //Assign adjacent navgrids
    if ((current+1)<navgrids.size() && (navgrids.get(current).x+1==navgrids.get(current+1).x))
      adjacent[0]=current+1; //right
    else
      adjacent[0]=-1;
    if ((current-1)>=0 && (navgrids.get(current).x-1==navgrids.get(current-1).x))
      adjacent[1]=current-1; //left
    else
      adjacent[1]=-1;
    if ((current+32)<navgrids.size() && (navgrids.get(current).y+1==navgrids.get(current+32).y))
      adjacent[2]=current+32; //up
    else
      adjacent[2]=-1;
    if ((current-32)>=0 && (navgrids.get(current).y-1==navgrids.get(current-32).y))
      adjacent[3]=current-32; //down
    else
      adjacent[3]=-1;

    //Check adjacents
    for (int a=0; a<=3; a++)
    {
      if (adjacent[a]!=-1)
      {
        if (navgrids.get(current).parent==adjacent[a])
        {
          path.add(adjacent[a]);
          current=adjacent[a];
        }
        if (adjacent[a]==start)
        {
          break;
        }
      }
    }
  }
  return(path);

