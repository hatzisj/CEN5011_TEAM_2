
package sam_model;

import java.awt.Point;
import java.awt.Rectangle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class SpinGraph {

	List<SpinGraphElement> elementList;
	Map<Integer,SpinGraphRectangle> rectanglesByNum;
	Map<String,SpinGraphRectangle> rectanglesByName;
	List<SpinGraphConnection> connections;
	public static final int xDistance = 250;
	
	public SpinGraph() {
		elementList = new ArrayList<SpinGraphElement>();
		rectanglesByNum = new TreeMap<Integer,SpinGraphRectangle>();
		rectanglesByName = new TreeMap<String,SpinGraphRectangle>();
		connections = new ArrayList<SpinGraphConnection>();
	}
	
	public void addElement(SpinGraphElement element)
	{
		elementList.add(element);
	}
	
	public void addRectangle(SpinGraphRectangle rectangle)
	{
		rectanglesByNum.put(rectangle.getLineNum(),rectangle);
	}
	
	public void addRectangleByName(SpinGraphRectangle rectangle)
	{
		rectanglesByName.put(rectangle.getName(),rectangle);
	}
	
	public List<SpinGraphElement> getElementList()
	{
		return elementList;
	}
	
	public Map<Integer,SpinGraphRectangle> getRectangles()
	{
		return rectanglesByNum;
	}
	
	public Map<String,SpinGraphRectangle> getRectanglesByName()
	{
		return rectanglesByName;
	}
	
	public SpinGraphRectangle getRectangle(Integer lineNum)
	{
		return rectanglesByNum.get(lineNum);
	}
	
	public SpinGraphRectangle getRectangle(String name)
	{
		return rectanglesByName.get(name);
	}

	public void addConnection(SpinGraphConnection connection)
	{
		connections.add(connection);
	}
	
	public List<SpinGraphConnection> getConnections()
	{
		return connections;
	}
	
	public void setUpForPaint()
	{
		int yOffset = 80;
		int currentY = 40;
		int initX = 60;
		for( SpinGraphConnection connection : connections )
		{
			SpinGraphElement element = connection.getElement();
			if( element.isInit() )
			{
				connection.setRectangle( new SpinGraphRectangle("init",0));
			}
			SpinGraphRectangle rectangle = connection.getRectangle();
			if( element.isSend() )
			{
				element.setCenter( new Point( initX , currentY ) );
				rectangle.setCenter( new Point( initX + xDistance /*- SpinGraphRectangle.WIDTH/2*/ , currentY /*- SpinGraphRectangle.HEIGHT/2*/ ) );
			}
			else
			{
				element.setCenter( new Point( initX + xDistance , currentY ) );
				rectangle.setCenter( new Point( initX /*- SpinGraphRectangle.WIDTH/2*/ , currentY /*- SpinGraphRectangle.HEIGHT/2*/ ) );
			}
			currentY += yOffset;
		}
	}
	
	public String toString()
	{
		return connections.toString();
	}

}
