/* Author: Alexander Pataky
 * Date: 12/05/2010
 * 
 * handles the creation of property dialogs for samModelObjects
 */
package sam_controller;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

import sam_model.Arc;
import sam_model.Component;
import sam_model.Connector;
import sam_model.Port;
import sam_model.SamModelObject;
import sam_view.SamFrame;

public class PropertyMenuHandler extends AbstractAction {
	
	SamModelObject samObj;
	
	public PropertyMenuHandler(SamModelObject obj){
		samObj = obj;
	}
	@Override
	public void actionPerformed(ActionEvent arg0) {
		if(samObj instanceof Arc){
			ArcDialog dlg = new ArcDialog((Arc) samObj);
			dlg.setVisible(true);
		}
		else if(samObj instanceof Component){
			ComponentDialog dlg = new ComponentDialog((Component) samObj);
			dlg.setVisible(true);
		}
		else if(samObj instanceof Connector){
			ConnectorDialog dlg = new ConnectorDialog((Connector) samObj);
			dlg.setVisible(true);
		}
		else if(samObj instanceof Port){
			PortDialog dlg = new PortDialog((Port) samObj);
			dlg.setVisible(true);
		}
		
	}

}
