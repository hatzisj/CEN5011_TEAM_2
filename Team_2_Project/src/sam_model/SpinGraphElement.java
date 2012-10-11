
package sam_model;

import java.awt.Point;

import java.util.List;
import java.util.ArrayList;

public class SpinGraphElement implements Comparable<SpinGraphElement>{

	
	private String name;
	private Point center;
	private String value;
	private int lineNum;
	private boolean init;
	private boolean send;
	public static final int RADIUS = 40; 
	
	public SpinGraphElement(boolean init,int lineNum,boolean send,String strValues,String name) {
		String[] split = strValues.split(",");
		this.name = name;
		this.lineNum = lineNum;
		this.send = send;
		this.init = init;
		value = strValues;
	}

	public void setCenter(Point p)
	{
		center = p;
	}
	
	public Point getCenter()
	{
		return center;
	}
	
	public String getName()
	{
		return name;
	}
	
	public String getValue()
	{
		return value;
	}
	
	public int getLineNum()
	{
		return lineNum;
	}
	
	public String toString()
	{
		return name + " " + center + " " + value + " " + send + " " + init;
	}
	
	public int compareTo(SpinGraphElement element)
	{
		return this.name.compareTo(element.getName());
	}
	
	public boolean equals(Object o)
	{
		if( !(o instanceof SpinGraphElement) ) return false;
		return this.name.equals( ((SpinGraphElement)o ).getName() )
				&& this.value.equals( ((SpinGraphElement)o ).getValue() );
	}
	
	public int hashCode()
	{
		return name.hashCode() ^ value.hashCode();
	}
	
	public boolean isSend()
	{
		return send;
	}
	
	public boolean isInit()
	{
		return init;
	}

}
