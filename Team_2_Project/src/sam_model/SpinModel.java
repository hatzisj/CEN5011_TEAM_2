
package sam_model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import java.util.Properties;

public class SpinModel {

	private static SpinModel spinModel;
	private String commandString;
	
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
	
	public void setCommandString(String s)
	{
		commandString = s;
	}
	
	public String getCommandString()
	{
		return commandString;
	}
	
	public String[] getVerifyCommands(Properties options)
	{
		String[] commands = new String[3];
		commands[0] = "spin -a \"" + promelaFile.getPath() + "\"";
		String gcc = "gcc";
		if( options.getProperty(SpinCommands.GCC_3).equals("true")) gcc = SpinCommands.GCC_3;
		else if( options.getProperty(SpinCommands.GCC_4).equals("true")) gcc = SpinCommands.GCC_4;
		commands[1] = gcc + " -DMEMLIM=1024 -O2 -DXUSAFE";
		commands[2] = "./pan -m10000";
		
		String type = "";
		boolean enforceWeak = false;
		if( options.getProperty(SpinCommands.ENFORCE_WEAK).equals("true") ) enforceWeak = true;
		//user wants the choices in the safety section
		if( options.getProperty(SpinCommands.SAFETY).equals("true") )
		{
			type = SpinCommands.SAFETY;
			commands[1] += SpinCommands.gccOptions.getProperty(type);
			boolean[] flags = new boolean[3];
			if( options.getProperty(SpinCommands.INVALID_ENDSTATES).equals("true") ) flags[0] = true;
			if( options.getProperty(SpinCommands.ASSERTION_VIOLATIONS).equals("true") ) flags[1] = true;
			if( options.getProperty(SpinCommands.ASSERTIONS).equals("true") ) flags[2] = true;
			if( flags[0] && !flags[1] ) commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.INVALID_ENDSTATES);
			else if( flags[1] && !flags[0] ) commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.ASSERTION_VIOLATIONS);
			else if( !flags[0] && !flags[1] ) commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.ASSERTIONS);
			
			
		}
		//user wants the non progress choice
		else if( options.getProperty(SpinCommands.NON_PROGRESS).equals("true") )
		{
			type = SpinCommands.NON_PROGRESS;
			commands[1] += SpinCommands.gccOptions.getProperty(type);
			commands[2] += SpinCommands.panOptions.getProperty(type);
			if( enforceWeak ) commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.ENFORCE_WEAK);
		}
		//use wants the acceptance choice
		else
		{
			type = SpinCommands.ACCEPTANCE;
			commands[2] += SpinCommands.panOptions.getProperty(type);
			if( enforceWeak ) commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.ENFORCE_WEAK);
		}
		
		//check the search mode
		if( options.getProperty(SpinCommands.EXHAUSTIVE).equals("true") )
		{
			if( options.getProperty(SpinCommands.COLLAPSE_COMPRESSION).equals("true") )
			{
				commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.COLLAPSE_COMPRESSION);
			}
		}
		else if( options.getProperty(SpinCommands.HASH_COMPACT).equals("true") )
		{
			commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.HASH_COMPACT);
		}
		else if( options.getProperty(SpinCommands.BIT_STATE).equals("true") )
		{
			commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.BIT_STATE);
		}
		
		//check for claims
		if( options.getProperty(SpinCommands.DO_NOT_USE_CLAIM).equals("true") )
		{
			commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.DO_NOT_USE_CLAIM);
		}
		else if( options.getProperty(SpinCommands.USE_CLAIM).equals("true") )
		{
			commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.USE_CLAIM) +
					" " + options.getProperty(SpinCommands.CLAIM);
		}
		
		//check search mode
		if( options.getProperty(SpinCommands.DEPTH_FIRST).equals("true") )
		{
			if( options.getProperty(SpinCommands.DEPTH_PARTIAL_ORDER).equals("false") )
			{
				commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.DEPTH_PARTIAL_ORDER);
			}
		}
		else if( options.getProperty(SpinCommands.BREADTH_FIRST).equals("true") )
		{
			if( options.getProperty(SpinCommands.BREADH_PARTIAL_ORDER).equals("false") )
			{
				commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.BREADH_PARTIAL_ORDER);
			}
			
		}
		
		if( options.getProperty(SpinCommands.BOUNDED).equals("true") )
		{
			commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.BOUNDED);
			commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.BOUNDED) +
					options.getProperty(SpinCommands.BOUNDED_VALUE);
		}
		if( options.getProperty(SpinCommands.ITERATIVE).equals("true") )
		{
			commands[1] += SpinCommands.gccOptions.getProperty(SpinCommands.ITERATIVE);
			commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.ITERATIVE);
		}
		if( options.getProperty(SpinCommands.REPORT_UNREACHABLE).equals("false") )
		{
			commands[2] += SpinCommands.panOptions.getProperty(SpinCommands.REPORT_UNREACHABLE);
		}
		
		commands[1] += " -w -o pan pan.c";
		return commands;
	}
	
	public String getSimulateCommands(Properties options)
	{
		String command = "spin -p -s -r -X -v -l -g -u10000";
		
		if( options.getProperty(SpinCommands.RANDOM_WITH_SEED).equals("true"))
		{
			command += " -n" + options.getProperty(SpinCommands.SEED_VALUE); 
		}
		else if( options.getProperty(SpinCommands.GUIDED_WITH_TRAIL).equals("true") )
		{
			command += " -k " + options.getProperty(SpinCommands.TRAIL_FILE);
		}
		
		if( options.getProperty(SpinCommands.LOSES_NEW_MESSAGE).equals("true"))
		{
			command += " -m"; 
		}
		
		command += " \"" + promelaFile.getPath() + "\"";
		return command;
	}

}
