/* Author: Alexander Pataky
 * Date: 12/05/2010
 * 
 * handles the delete action from the popuptoolbar
 */
package sam_controller;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

import sam_model.SamModelObject;
import sam_view.SamFrame;

public class DeleteFromMenuHandler extends AbstractAction{
	
	SamModelObject samObj;
	
	public DeleteFromMenuHandler(SamModelObject obj){
		samObj = obj;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		SamFrame.getInstance().getCurrentCanvas().removeSamModelObject(samObj);
		
	}

}
