
package sam_model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class SpinModel {

	private static SpinModel spinModel;
	
	private File promelaFile;
	
	public static SpinModel getInstance()
	{
		if( spinModel == null ) spinModel = new SpinModel();
		return spinModel;
	}
	
	public SpinModel() {

	}
	
	public void setFile(File file)
	{
		promelaFile = file;
	}
	
	public String getFileText()
	{
		String out = "";
		try
		{

			BufferedReader input = new BufferedReader(new FileReader(promelaFile));
			String line ="";
			while( ( line = input.readLine() ) != null )
			{
				out += line + "\n";
			}	
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		return out;
	}

}
