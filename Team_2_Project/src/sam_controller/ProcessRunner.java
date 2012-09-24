
package sam_controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.swing.JTextArea;

public class ProcessRunner {
		
	public static String run(String process,JTextArea area,boolean append)
	{
		StringBuffer output = new StringBuffer();
		try 
		{
			String line;
			Process p = Runtime.getRuntime().exec(process);
			BufferedReader bri = new BufferedReader
					(new InputStreamReader(p.getInputStream()));
			BufferedReader bre = new BufferedReader
					(new InputStreamReader(p.getErrorStream()));
	      
			while ((line = bri.readLine()) != null) {
				output.append(line + "\n");
				if(append)
					area.setText(area.getText()+"\n"+line);
			}
			bri.close();
			p.waitFor();
			
	    }
	    catch (Exception err) {
	      err.printStackTrace();
	    }
		finally
		{
			return output.toString();
		}
	}

}