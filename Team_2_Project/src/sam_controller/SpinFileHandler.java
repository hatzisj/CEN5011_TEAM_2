
package sam_controller;

import java.awt.FileDialog;
import java.awt.event.ActionEvent;

import java.io.File;

import javax.swing.AbstractAction;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import sam_model.SpinModel;
import sam_view.SpinFilePanel;
import sam_view.SpinFrame;
import sam_view.SpinSimulatePanel;
import sam_view.SpinVerifyPanel;

/**
 * The SpinFileHandler extends the AbstractionAction API
 * and allows the end user to open a file to use the SPIN
 */
public class SpinFileHandler extends AbstractAction {
	
	/**
	 * actionPerformed is a handler for creating instances
	 * of many of the singleton classes that will be used
	 * to run tests
	 * 
	 * @param ActionEvent 
	 */
	public void actionPerformed(ActionEvent e) {				
		
		FileDialog dlg = new FileDialog(SpinFrame.getInstance(), "Open File", FileDialog.LOAD);

	    dlg.setDirectory("C:\\");
	    dlg.setLocation(50, 50);
	    
		dlg.setVisible(true);

		SpinModel model 				= SpinModel.getInstance();
		SpinFilePanel filePanel 		= SpinFilePanel.getInstance();
		SpinVerifyPanel verifyPanel 	= SpinVerifyPanel.getInstance();
		SpinSimulatePanel simulatePanel = SpinSimulatePanel.getInstance();
		model.setFile( new File(dlg.getDirectory() + dlg.getFile()) );
		try
		{
			filePanel.setText(model.getFileText());
		}
		catch(Exception exc)
		{
			JOptionPane.showMessageDialog(null,exc.getMessage(),"Error Encountered",JOptionPane.ERROR_MESSAGE);
		}
		simulatePanel.setTrailFile(dlg.getFile()+".trail");
	}

}