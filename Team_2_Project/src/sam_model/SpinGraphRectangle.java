
package sam_model;

import java.awt.Point;

public class SpinGraphRectangle implements Comparable<SpinGraphRectangle> {

	private String name;
	private int lineNum;
	private Point center;
	public static final int HEIGHT = 40;
	public static final int WIDTH = 5;
	
	public SpinGraphRectangle(String name,int lineNum) {
		this.name = name;
		this.lineNum = lineNum;
	}
	
	public SpinGraphRectangle(SpinGraphRectangle rectangle)
	{
		this.name = rectangle.getName();
		this.lineNum = rectangle.getLineNum();
	}
	
	public String getName()
	{
		return name;
	}
	
	public int getLineNum()
	{
		return lineNum;
	}
	
	public void setCenter(Point p)
	{
		center = p;
	}
	
	public Point getCenter()
	{
		return center;
	}
	
	public int compareTo(SpinGraphRectangle rect)
	{
		return this.lineNum - rect.getLineNum();
	}
	
	public boolean equals(Object o)
	{
		if( !(o instanceof SpinGraphRectangle) ) return false;
		return name.equals( ((SpinGraphRectangle)o).getName() );
	}
	
	public int hashCode()
	{
		return name.hashCode();
	}
	
	public String toString()
	{
		return name + " " + lineNum + " " + center;
	}

}
