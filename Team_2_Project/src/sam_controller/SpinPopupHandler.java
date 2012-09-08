package sam_controller;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.swing.AbstractAction;
import javax.swing.JButton;

import sam_view.SpinFrame;

public class SpinPopupHandler extends AbstractAction {
	
	JButton btn;
	private static final String MODULE_NAME = "Using SPIN to analyze and simulate PROMELA results";
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() instanceof JButton){
			btn = (JButton) e.getSource();
			if(btn.getName().compareTo("btnSpin") == 0){
				modelToSpinWindow();
			}
		}
		
	}
	
	private void modelToSpinWindow() {
		SpinFrame spinFrame = SpinFrame.getInstance();
		spinFrame.setVisible(true);
	}
	
	  public String getName() {
	      return MODULE_NAME;
	   }
	
}
