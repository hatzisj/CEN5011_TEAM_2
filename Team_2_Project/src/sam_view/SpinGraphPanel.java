
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
		canvas = new SpinGraphCanvas(model,this);
		canvas.setBackground(Color.WHITE);
		canvas.setLayout(null);
		this.setAutoscrolls(true);
		canvas.setAutoscrolls(true);

		setViewportView(canvas);
		revalidate();
	}
	
	class SpinGraphCanvas extends JPanel
	{
		SpinModel model;
		Dimension size;
		SpinGraphPanel parent;
		
		public SpinGraphCanvas (SpinModel model,SpinGraphPanel parent) {
			this.model = model;
			this.parent = parent;
			size = new Dimension(1200, 4000);
			setSize(getPreferredSize());
		}
		
		public Dimension getPreferredSize() {
			 return size;
		}
		
		public void paintComponent(Graphics g)
		{
			super.paintComponent(g);
			SpinGraph spinGraph = model.getSpinGraph();
			int currentX = 0;
			int currentY = 0;
			if( spinGraph != null )
			{
				g.setColor(Color.BLACK);
				for( SpinGraphConnection connection : spinGraph.getConnections() )
				{
					SpinGraphRectangle rectangle = connection.getRectangle();
					if( rectangle == null ) continue;
					SpinGraphElement element = connection.getElement();

					if(element.inCycle())g.setColor(Color.RED);
					
					int rectX = (int)rectangle.getCenter().getX();
					int rectY = (int)rectangle.getCenter().getY();
					int cirX = (int)element.getCenter().getX();
					int cirY = (int)element.getCenter().getY();
					currentX = Math.max(rectX, cirX);
					currentY = Math.max(rectY, cirY);
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
			}
			/*size = new Dimension(currentX + 100,1200);
			setSize(getPreferredSize());
			parent.revalidate();*/
		}
	}
}
