
package sam_model;
	
public class SpinGraphConnection
{
	SpinGraphElement element;
	SpinGraphRectangle rectangle;
	String value;
	boolean send;
	boolean init;
	
	public SpinGraphConnection(SpinGraphElement element, SpinGraphRectangle rectangle)
	{
		this.element = element;
		this.rectangle = rectangle;
		this.value = element.getValue();
		this.send = element.isSend();
		this.init = element.isInit();
	}
	
	public SpinGraphElement getElement()
	{
		return element;
	}
	
	public SpinGraphRectangle getRectangle()
	{
		return rectangle;
	}
	
	public void setRectangle(SpinGraphRectangle rectangle)
	{
		this.rectangle = rectangle;
	}
	
	public String getValue()
	{
		return value;
	}
	
	public boolean isSend()
	{
		return send;
	}
	
	public boolean isInit()
	{
		return init;
	}
	
	public String toString()
	{
		String ret = element.toString();
		if( init ) ret += " initializes to " + value;
		else
		{
			if( send ) ret += " sends " + value + " to " + rectangle;
			else ret += " receives " + value + " from " + rectangle;
		}
		return ret;
	}
}
