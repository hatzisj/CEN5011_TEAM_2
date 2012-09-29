
package sam_controller;

import java.awt.event.ActionEvent;
import java.awt.Graphics;

import java.util.Properties;

import javax.swing.AbstractAction;
import javax.swing.JCheckBox;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import sam_model.SpinModel;
import sam_view.SpinSimulatePanel;

public class SpinSimulateHandler extends AbstractAction {
	
	//whether or not the user wants to create a graph
	private boolean graph;
	
	public SpinSimulateHandler(boolean graph)
	{
		super();
		this.graph = graph;
	}
	
	public void actionPerformed(ActionEvent e) {
		try
		{
			Properties options = getOptions();
			SpinModel model = SpinModel.getInstance();
			SpinSimulatePanel panel = SpinSimulatePanel.getInstance();
			String command = model.getSimulateCommands(options);
			panel.setCommandLineText(command);
			panel.setOutputText("");
			String output = ProcessRunner.run(command,panel.getOutputText(),false);
			panel.setOutputText(output);
			model.setSimOutput(output);
			if( graph )
			{
				model.createSimGraph();
				panel.repaint();
			}
		}
		catch(Exception exc)
		{
			exc.printStackTrace();
			JOptionPane.showMessageDialog(null,exc.getMessage(),"Error Encountered",JOptionPane.ERROR_MESSAGE);
		}
	}
	
	//finds out all of the options that have been selected
	private Properties getOptions()
	{
		Properties options = new Properties();
		Object[] keys = getKeys();
		for( Object o : keys )
		{
			String key = o.toString();
			Object val = getValue(key);
			
			if( val instanceof JRadioButton )
			{
				String selected = "false";
				if( ((JRadioButton)val).isSelected() ) selected = "true";
				options.put(key, selected);
			}
			else if( val instanceof JTextField )
			{
				options.put(key, ((JTextField)val).getText() );
			}
			else if( val instanceof JCheckBox )
			{
				String selected = "false";
				if( ((JCheckBox)val).isSelected() ) selected = "true";
				options.put(key, selected);
			}
			else System.out.println("Another class " + o.getClass() + " " + key + " " + o);
		}
		return options;
	}

}