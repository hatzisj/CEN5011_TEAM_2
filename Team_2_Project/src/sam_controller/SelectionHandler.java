/* Author: Alexander Pataky
 * Date: 12/05/2010
 * 
 * handles selection for samModelObjects
 * 
 * also repaints so that they change color
 */
package sam_controller;

import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.MouseEvent;

import javax.swing.JComponent;
import javax.swing.event.MouseInputListener;

import sam_model.SamModelObject;
import sam_view.SamFrame;

/**
 * The SelectionHandler class implements the FocusListener and MouseInputListner
 * classes and handles the mouse function events
 */
public class SelectionHandler implements FocusListener, MouseInputListener {

	@Override
	public void focusGained(FocusEvent e) {
		SamModelObject obj = (SamModelObject) e.getSource();
		obj.setSelected(true);

		SamFrame.getInstance().getCurrentCanvas().getCanvas().repaint();
		SamFrame.getInstance().getCurrentCanvas().getCanvas().validate();

	}

	@Override
	public void focusLost(FocusEvent e) {
		SamModelObject obj = (SamModelObject) e.getSource();
		obj.setSelected(false);
		
		SamFrame.getInstance().getCurrentCanvas().getCanvas().repaint();
		SamFrame.getInstance().getCurrentCanvas().getCanvas().validate();

	}

	@Override
	public void mouseClicked(MouseEvent e) {
		
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		
	}

	@Override
	public void mousePressed(MouseEvent e) {
		JComponent obj = (JComponent) e.getSource();
		obj.requestFocusInWindow();
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		
	}

	@Override
	public void mouseDragged(MouseEvent e) {
		
	}

	@Override
	public void mouseMoved(MouseEvent e) {
		
	}

}
