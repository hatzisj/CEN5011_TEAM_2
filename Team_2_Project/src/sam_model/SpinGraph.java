
package sam_model;

import java.awt.Point;
import java.awt.Rectangle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * SpinGraph class stores the entities that 
 * will be displayed by the graph
 */
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
	
	/**
	 * Adds a specific SpinGraphElemenet to the SpinGraph
	 * @param SpinGraphElement
	 */
	public void addElement(SpinGraphElement element)
	{
		elementList.add(element);
	}
	
	/**
	 * Adds rectangle object
	 * @param SpinGraphRectangle
	 */
	public void addRectangle(SpinGraphRectangle rectangle)
	{
		rectanglesByNum.put(rectangle.getLineNum(),rectangle);
	}
	
	/**
	 * Adds rectangle object by name
	 * @param SpinGraphRectangle 
	 */
	public void addRectangleByName(SpinGraphRectangle rectangle)
	{
		rectanglesByName.put(rectangle.getName(),rectangle);
	}
	
	/**
	 * @return List of SpinGraphElements
	 */
	public List<SpinGraphElement> getElementList()
	{
		return elementList;
	}
	
	/**
	 * @return Map 
	 */
	public Map<Integer,SpinGraphRectangle> getRectangles()
	{
		return rectanglesByNum;
	}
	
	/**
	 * @return Map by name
	 */
	public Map<String,SpinGraphRectangle> getRectanglesByName()
	{
		return rectanglesByName;
	}
	
	/**
	 * @return SpinGraphRectangle
	 * @param integer line number
	 */
	public SpinGraphRectangle getRectangle(Integer lineNum)
	{
		return rectanglesByNum.get(lineNum);
	}
	
	/**
	 * @return SpinGraphRectangle by name
	 * @param string name
	 */
	public SpinGraphRectangle getRectangle(String name)
	{
		return rectanglesByName.get(name);
	}

	/**
	 * Adds a SpinGraphConnection to current connections
	 * @param SpinGraphConnection
	 */
	public void addConnection(SpinGraphConnection connection)
	{
		connections.add(connection);
	}
	
	/**
	 * @return a list of SpinGraphConnection
	 */
	public List<SpinGraphConnection> getConnections()
	{
		return connections;
	}
	
	/**
	 * Sets up the default appearence of panel
	 */
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
	
	/**
	 * Standard toString method for 
	 * the connection string
	 * @return connection string
	 */
	public String toString()
	{
		return connections.toString();
	}

}
