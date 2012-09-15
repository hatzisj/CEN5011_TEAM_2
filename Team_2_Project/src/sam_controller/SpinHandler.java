
package sam_controller;

import java.awt.event.ActionEvent;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;

import javax.swing.AbstractAction;
import javax.swing.JCheckBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import sam_view.SpinFrame;

public class SpinHandler extends AbstractAction {
		
	public void actionPerformed(ActionEvent e) {
		
		String strFile = ( (JTextField)getValue("file") ).getText();
		
		FileReader fileReader = null;
		try
		{
			fileReader = new FileReader( strFile );
		}
		catch( FileNotFoundException exc )
		{
			JOptionPane.showMessageDialog(SpinFrame.getInstance(), "Please make sure that a valid input file is entered" , "No input file" , JOptionPane.ERROR_MESSAGE );
			return;
		}
		String command = e.getActionCommand();
		
		if( command.equals("SPIN") )
		{

			JCheckBox minusA = (JCheckBox)getValue("-a");
			JCheckBox minusB = (JCheckBox)getValue("-b");
			JCheckBox minusC = (JCheckBox)getValue("-c");
			JTextField minusCOption = (JTextField)getValue("-cN");
			JCheckBox minusE = (JCheckBox)getValue("-e");
			JCheckBox minusF = (JCheckBox)getValue("-f");
			JCheckBox minusCapI = (JCheckBox)getValue("-I");
			JCheckBox minusN = (JCheckBox)getValue("-n");
			JCheckBox minusCapN = (JCheckBox)getValue("-N");
			JTextField minusCapNOption = (JTextField)getValue("-Nn");
			JCheckBox minusCapT = (JCheckBox)getValue("-T");
			JCheckBox minusX = (JCheckBox)getValue("-x");
			JTextField otherOptions = (JTextField)getValue("otherOptions");
			
			String optionString = otherOptions.getText() + " ";
			if( minusA.isSelected()) optionString += "-a ";
			if( minusB.isSelected() ) optionString += "-b ";
			if( minusC.isSelected() )
			{
				optionString += "-c" + minusCOption.getText() + " ";
			}
			if(minusE.isSelected()) optionString += "-e ";
			if(minusF.isSelected()) optionString += "-f ";
			if(minusCapI.isSelected()) optionString += "-I ";
			if(minusN.isSelected()) optionString += "-n ";
			if(minusCapN.isSelected())
			{
				optionString += "-N" + minusCapNOption.getText() + " ";
			}
			if(minusCapT.isSelected()) optionString += "-T ";
			if(minusX.isSelected()) optionString += "-x ";
			
			String out = run("spin " + optionString + "\"" + strFile + "\"" );
			System.out.println(out);
		}
		
		else if( command.equals("GCC"))
		{
			JTextField otherOptions = (JTextField)getValue("otherOptions");
			
			String optionString = otherOptions.getText() + " ";
			JTextField gccCommand = (JTextField)getValue("gccCommand");
			String strGccCommand = gccCommand.getText();
			if( strGccCommand == null || strGccCommand.equals("")) strGccCommand = "gcc";
			
			String out = run(strGccCommand+ " " + optionString + "\"" + strFile + "\"" );
		}
		
		else if( command.equals("APP"))
		{

			JTextField otherOptions = (JTextField)getValue("otherOptions");
			
			String optionString = otherOptions.getText() + " ";
			String out = run( "\"" + strFile + "\"" + " " + optionString );
		}
		
	}
	
	private String run(String command)
	{
		String out = "";
		try{
			Process p = Runtime.getRuntime().exec(command);
			BufferedReader bri = new BufferedReader
	        (new InputStreamReader(p.getInputStream()));
	        String line = "";
	        while( (line = bri.readLine())!=null )
	        {
	        	out += line + "\n";
	       	}
	        bri.close();
	        p.waitFor();
      		System.out.println("Done.");
		} catch( Exception e )
		{
			JOptionPane.showMessageDialog(SpinFrame.getInstance(), "There was an exception thrown when running the application" , "Exception" , JOptionPane.ERROR_MESSAGE );
			e.printStackTrace();
		}
		finally
		{
			return out;
		}
	}

}