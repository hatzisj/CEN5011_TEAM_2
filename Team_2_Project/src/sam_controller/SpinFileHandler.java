
package sam_controller;

import java.awt.FileDialog;
import java.awt.event.ActionEvent;

import java.io.File;

import javax.swing.AbstractAction;
import javax.swing.JTextField;

import sam_model.SpinModel;
import sam_view.SpinFilePanel;
import sam_view.SpinFrame;

public class SpinFileHandler extends AbstractAction {
		
	public void actionPerformed(ActionEvent e) {
				
		
		FileDialog dlg = new FileDialog(SpinFrame.getInstance(), "Open File", FileDialog.LOAD);

	    dlg.setDirectory("C:\\");
	    dlg.setLocation(50, 50);

		dlg.setVisible(true);

		SpinModel model = SpinModel.getInstance();
		SpinFilePanel filePanel = SpinFilePanel.getInstance();
		model.setFile( new File(dlg.getDirectory() + dlg.getFile()) );
		filePanel.setText(model.getFileText());
	}

}