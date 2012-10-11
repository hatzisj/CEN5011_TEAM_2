
package sam_view;

import java.awt.BorderLayout;
import java.awt.Canvas;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Point;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import sam_model.SpinGraph;
import sam_model.SpinGraphConnection;
import sam_model.SpinGraphElement;
import sam_model.SpinGraphRectangle;
import sam_model.SpinModel;

public class SpinGraphPanel extends JScrollPane {
	// singleton instance of SpinGraphPanel
	private static SpinGraphPanel instance = null;
	private final int BORDER_THICKNESS = 1;
	
	private SpinGraphCanvas canvas;
	private SpinModel model;
	
	// returns instance of SpinGraphPanel
	public static SpinGraphPanel getInstance() {
		if (instance == null) {
			instance = new SpinGraphPanel();
		}
		return instance;
	}

	// private constructor for singleton
	// sets up toolbars and menus
	private SpinGraphPanel() {
		model = SpinModel.getInstance();
		canvas = new SpinGraphCanvas(model);
		canvas.setBackground(Color.WHITE);
		canvas.setLayout(null);
		this.setAutoscrolls(true);
		canvas.setAutoscrolls(true);
		
		setViewportView(canvas);

	}
	
	class SpinGraphCanvas extends JPanel
	{
		SpinModel model;
		Dimension size;
		
		public SpinGraphCanvas (SpinModel model) {
			this.model = model;
			size = new Dimension(1200, 1200);
			setSize(getPreferredSize());
		}
		
		public Dimension getPreferredSize() {
			 return size;
		}
		
		public void paintComponent(Graphics g)
		{
			super.paintComponent(g);
			SpinGraph spinGraph = model.getSpinGraph();
			int currentX = 60;
			int currentY = 20;
			if( spinGraph != null )
			{
				g.setColor(Color.BLACK);
				for( SpinGraphConnection connection : spinGraph.getConnections() )
				{
					SpinGraphRectangle rectangle = connection.getRectangle();
					if( rectangle == null ) continue;
					SpinGraphElement element = connection.getElement();
					
					int rectX = (int)rectangle.getCenter().getX();
					int rectY = (int)rectangle.getCenter().getY();
					int cirX = (int)element.getCenter().getX();
					int cirY = (int)element.getCenter().getY();
					int stringOffset = 15;
					int lineOffset = 6;
					int polySize = 5;
					g.fillRect(rectX,rectY,SpinGraphRectangle.WIDTH,SpinGraphRectangle.HEIGHT );
					g.drawOval(cirX,cirY,SpinGraphElement.RADIUS,SpinGraphElement.RADIUS);
					g.drawString( rectangle.getName() , rectX , rectY - stringOffset );
					g.drawString( element.getName() , cirX , cirY - stringOffset );
					if( element.isSend() )
					{
						g.drawString( element.getValue() , cirX + SpinGraphElement.RADIUS + 10 , cirY + SpinGraphElement.RADIUS/2 );
						g.drawLine( cirX + SpinGraphElement.RADIUS , cirY + SpinGraphElement.RADIUS/2 + lineOffset , 
								rectX - SpinGraphRectangle.WIDTH/2 , cirY + SpinGraphElement.RADIUS/2 + lineOffset );
						int[] x = {rectX,rectX-polySize,rectX-polySize};
						int[] y = {cirY + SpinGraphElement.RADIUS/2 + lineOffset,cirY + SpinGraphElement.RADIUS/2 + lineOffset-polySize,cirY + SpinGraphElement.RADIUS/2 + lineOffset+polySize};
						g.fillPolygon(x , y , 3);
						
					}
					else
					{
						g.drawString( element.getValue() , rectX + SpinGraphRectangle.WIDTH/2 + 10 , rectY + SpinGraphRectangle.HEIGHT/2 );
						g.drawLine( rectX + SpinGraphRectangle.WIDTH/2 , rectY + SpinGraphRectangle.HEIGHT/2 + lineOffset , 
								cirX - SpinGraphElement.RADIUS/2 , rectY + SpinGraphRectangle.HEIGHT/2 + lineOffset );
						int[] x = {cirX - SpinGraphElement.RADIUS/2,cirX - SpinGraphElement.RADIUS/2-polySize,cirX - SpinGraphElement.RADIUS/2-polySize};
						int[] y = {rectY + SpinGraphRectangle.HEIGHT/2 + lineOffset,rectY + SpinGraphRectangle.HEIGHT/2 + lineOffset-polySize,rectY + SpinGraphRectangle.HEIGHT/2 + lineOffset+polySize};
						g.fillPolygon(x , y , 3);
					}
				}
				/*//draw all of the connections
				for( SpinGraphElement element : spinGraph.getElements().values() )
				{
					int factor = Math.max(element.numInits(), element.numConns());
					g.drawString(element.getName(), currentX, currentY);
					factor = 80 + 40*factor;
					g.drawOval(currentX+20, currentY, factor, factor);
					element.setCenter( new Point((currentX+20)+(factor/2) , currentY+(factor/2)) );
					element.setRadius(factor/2);
					currentY += 80 + factor;
				}
				
				//make sure the screen fits everything
				size = new Dimension( Math.max( currentX + 100 , (int)size.getWidth() ) ,
						Math.max( currentY + 100 , (int)size.getHeight() ) );
				setSize(size);
				
				//draw all of the rectangles
				currentX = 1000;
				currentY = 20;
				for( SpinGraphRectangle rectangle : spinGraph.getRectanglesByName().values() )
				{
					int factor = spinGraph.numConns(rectangle);
					if( factor == 0 ) continue;
					factor = 120 + factor*60;
					g.drawString(rectangle.getName(), currentX, currentY);
					g.fillRect(currentX , currentY + 20, 20, factor);
					spinGraph.setRectangleValues(rectangle , new Point(currentX + 10 , (currentY + 20) + (factor/2) ) , factor);
					currentY += 40 + factor;					
				}
				
				//make sure the screen fits everything
				size = new Dimension( Math.max( currentX + 100 , (int)size.getWidth() ) ,
						Math.max( currentY + 100 , (int)size.getHeight() ) );
				setSize(size);
				
				//put in the initializations
				for( SpinGraphElement element : spinGraph.getElements().values() )
				{
					int radius = element.getRadius();
					currentX = (int)element.getCenter().getX() - radius - 40;
					currentY = (int)element.getCenter().getY() - radius;
					for( Integer value : element.getInits() )
					{
						g.drawString("("+value.toString()+")", currentX, currentY);
						currentY += 20;
					}
				}
				
				//put in all of the connections
				for( SpinGraphElement element : spinGraph.getElements().values() )
				{
					int radius = element.getRadius();
					currentX = (int)element.getCenter().getX() + radius;
					currentY = (int)element.getCenter().getY() - radius + 20;
					for( SpinGraphElement.SpinGraphEvent event : element.getConns() )
					{
						SpinGraphRectangle rectangle = event.getRectangle();
						int rectX = (int)rectangle.getCenter().getX() - 10;
						int rectY = rectangle.getCurrentY();
						g.drawLine(currentX, currentY, rectX, rectY);
						if( event.isSend() )
						{
							g.drawString(event.getValue()+"",currentX,currentY-10);
							int[] x = {rectX,rectX-10,rectX-10};
							int[] y = {rectY,rectY-10,rectY+10};
							g.fillPolygon(x , y , 3);
						}						
						else
						{
							g.drawString(event.getValue()+"",rectX-20,rectY-10);
							int[] x = {currentX,currentX+10,currentX+10};
							int[] y = {currentY,currentY-10,currentY+10};
							g.fillPolygon(x , y , 3);
						}
						
						currentY += 60;
					}
				}*/
			}
		}
	}
}
