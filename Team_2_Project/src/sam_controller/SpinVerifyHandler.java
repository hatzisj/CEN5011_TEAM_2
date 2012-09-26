
package sam_controller;

import java.awt.event.ActionEvent;

import java.util.Properties;

import javax.swing.AbstractAction;
import javax.swing.JCheckBox;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import sam_model.SpinModel;
import sam_view.SpinVerifyPanel;

public class SpinVerifyHandler extends AbstractAction {
		
	public void actionPerformed(ActionEvent e) {
			
		try
		{
			Properties options = getOptions();
			SpinModel model = SpinModel.getInstance();
			SpinVerifyPanel panel = SpinVerifyPanel.getInstance();
			String[] commands = model.getVerifyCommands(options);
			String output = "";
			panel.setCommandLineText("");
			for( String command : commands )
			{
				panel.appendCommandLineText(command);
				String curOutput = ProcessRunner.run(command,null,false);
				panel.appendCommandLineText(curOutput);
				output += curOutput;
			}
			model.extractVerificationInfo(output);
			panel.setOutputText(model.getVerOutput());
		}
		catch(Exception exc)
		{
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