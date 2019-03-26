function [n,i,j]=findneighbour(stack,Maze,Maze_opp,t_x,t_y)

pos=find(Maze(:,:,6)==stack);
if mod(pos,7)==0
   a=7;
else
   a=mod(pos,7);
end
b=(pos-a)/7+1;
n=0;
color=Maze(a,b,1);
x=a;
y=b;
i=a;
j=b;
%check neighbour
while x<=7&&x>=1&&y<=7&&y>=1
    x=x+Maze(a,b,3);
    y=y+Maze(a,b,4);
    if (x<=7)&&(x>=1)&&(y<=7)&&(y>=1)
      if x==t_x && y==t_y &&(Maze(x,y,1)~=color)
        n=-1;
        i=x;
        j=y;
        break
      elseif Maze(x,y,2)==67
          if (Maze(x,y,1)~=color)&&(Maze_opp(x,y,5)==0)     
            n=n+1;
            %nearest neighbour
            if n==1
                i=x;
                j=y;
            end
          end
      elseif Maze(x,y,2)==78
          if (Maze(x,y,1)~=color)&&(Maze(x,y,5)==0)
            n=n+1;
            %nearest neighbour
            if n==1
                i=x;
                j=y;
            end
          end
      end
    end
end

