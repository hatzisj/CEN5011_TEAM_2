
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

/**
 *  The SpinSimulatHandler class extends the AbstractAction API
 *  and creates the batch scripts for the simulation
 */
public class SpinSimulateHandler extends AbstractAction {
	
	//whether or not the user wants to create a graph
	private boolean graph;
	
	/**
	 * Public constructor that takes in a boolean value
	 * and uses the super class constructor
	 * @param boolean value of graph
	 */
	public SpinSimulateHandler(boolean graph)
	{
		super();
		this.graph = graph;
	}
	
	/**
	 * the actionPerformed event handler, after recieving 
	 * an ActionEvent will create necessary panels and models
	 * for SPIN
	 * @param ActionEvent
	 */
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
	
	/**
	 * getOptions will return all of the options that
	 * the user has selected when it comes to running the
	 * tests in SPIN
	 * @return Properties object that contains options selections
	 */
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