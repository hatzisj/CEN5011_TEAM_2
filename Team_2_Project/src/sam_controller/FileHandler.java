/* Author: Alexander Pataky
 * Date: 12/05/2010
 * 
 * handles the file buttons on toolbar in samframe
 * 
 * saves/opens/close/creates files
 */
package sam_controller;

import java.awt.FileDialog;
import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.JButton;
import javax.swing.JMenuItem;
import javax.swing.JToggleButton;

import sam_model.SamModel;
import sam_model.XMLTransformer;
import sam_view.SamCanvas;
import sam_view.SamFrame;
import sam_view.SamFrame.Toggle;

/**
 * FileHandler class extends the AbstractAction API
 * and it handles the options that are chosen for the 
 * file that is selected
 */
public class FileHandler extends AbstractAction {
	private int count = 0;
	int actionType;
	JButton btn;
	JMenuItem mtm;
	
	/**
	 * Public constructor 
	 */
	public FileHandler() {
		putValue(NAME, "FileButtonHandler");
		putValue(SHORT_DESCRIPTION, "Handles button click from file toolbar or menuitem");
	}
	
	/**
	 * the actionPerformed event handler, after recieving 
	 * an ActionEvent and depending on which button is selected
	 * will execute the corresponding file action
	 * 
	 * @param ActionEvent button press
	 */
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() instanceof JButton){
			btn = (JButton) e.getSource();
			if(btn.getName().compareTo("btnCreateFile") == 0)actionType = 1;
			else if(btn.getName().compareTo("btnSaveFile") == 0)actionType = 2;
			else if(btn.getName().compareTo("btnSaveAsFile") == 0)actionType = 5;
			else if(btn.getName().compareTo("btnOpenFile") == 0)actionType = 3;
			else if(btn.getName().compareTo("btnCloseFile") == 0)actionType =4;
			
		}else if(e.getSource() instanceof JMenuItem){
			mtm = (JMenuItem) e.getSource();
			if(mtm.getName().compareTo("new") == 0)actionType = 1;
			else if(mtm.getName().compareTo("save") == 0)actionType = 2;
			else if(mtm.getName().compareTo("saveas") == 0)actionType = 5;
			else if(mtm.getName().compareTo("open") == 0)actionType = 3;
			else if(mtm.getName().compareTo("close") == 0)actionType =4;
		}else{
			//do nothing
		}	
				
		if(actionType == 1){
			count++;
			SamFrame.getInstance().addTab("tab" + count);
		}
		else if(actionType == 2){
			if(SamFrame.getInstance().getCurrentCanvas().getModel().getIsSubCompositionModel()){
				SamModel subModel= SamFrame.getInstance().getCurrentCanvas().getModel();
				SamFrame.getInstance().getCurrentCanvas().getModel().getParentComposition()
				.setSubCompositionModel(subModel);
			}else{
				FileDialog dlg = new FileDialog(SamFrame.getInstance(), "Save File", FileDialog.SAVE);
				dlg.setFile(SamFrame.getInstance().getCurrentCanvas().getName() + ".xml");
				dlg.setDirectory("C:\\");
			    dlg.setLocation(50, 50);

				dlg.setVisible(true);
				
				XMLTransformer xml = new XMLTransformer();
				xml.saveFile(SamFrame.getInstance().getCurrentCanvas().getModel(), dlg.getDirectory() + dlg.getFile());
			}

		}
		else if(actionType == 3){
			FileDialog dlg = new FileDialog(SamFrame.getInstance(), "Open File", FileDialog.LOAD);

		    dlg.setDirectory("C:\\");
		    dlg.setLocation(50, 50);


			dlg.setFile(".xml");
			dlg.setVisible(true);
			
			String path = dlg.getFile();
			String directory = dlg.getDirectory();
			XMLTransformer xml = new XMLTransformer();
			SamModel model = new SamModel();
			
			
			try {
				if(path != null && xml.openFile(model, directory + path)){
					SamFrame.getInstance().addTab(path, model);
				}
			} catch (Throwable e1) {
				e1.printStackTrace();
			}		
						
		}
		
		else if(actionType == 4){
			SamFrame.getInstance().closeTab();
			
		}
		
	}

}