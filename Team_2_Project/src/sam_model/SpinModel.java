
package sam_model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class SpinModel {

	private static SpinModel spinModel;
	private SpinGraph spinGraph;
	private String commandString;
	private String verErrors;
	private String verTotalMemory;
	private String verStates;
	private String verTime;
	private String fileText = null;
	private String simOutput;
	
	private File promelaFile = null;
	
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
	
	public String getFileText() throws Exception
	{
		if( fileText == null )
		{
			if( promelaFile == null ) return null;
			fileText = "";
			try
			{

				BufferedReader input = new BufferedReader(new FileReader(promelaFile));
				String line ="";
				int counter = 1;
				while( ( line = input.readLine() ) != null )
				{
					fileText += counter + ":  " + line + "\n";
					counter++;
				}	
			}
			catch(IOException e)
			{
				throw( new Exception("There was a problem reading the file") );
			}
		}
		return fileText;
		
	}
	
	public void setCommandString(String s)
	{
		commandString = s;
	}
	
	public String getCommandString()
	{
		return commandString;
	}
	
	public void setVerErrors(String str)
	{
		verErrors = str;
	}
	
	public String getVerErrors()
	{
		return verErrors;
	}
	
	public void setVerTotalMemory(String str)
	{
		verTotalMemory = str;
	}
	
	public String getVerTotalMemory()
	{
		return verTotalMemory;
	}
	
	public void setSimOutput(String str)
	{
		simOutput = str;
	}
	
	public String getSimOutput()
	{
		return simOutput;
	}
	
	public String getVerOutput()
	{
		return "Errors: " + verErrors + "\r\n\r\n" +
				"Total Memory: " + verTotalMemory + "\r\n\r\n" +
						"States Stored: " + verStates + "\r\n\r\n" +
								"Time Elapsed: " + verTime + "\r\n\r\n";
	}
	
	public SpinGraph getSpinGraph()
	{
		return spinGraph;
	}
	
	public String[] getVerifyCommands(Properties options) throws Exception
	{
		String[] commands = new String[3];
		try
		{
			commands[0] = "spin -a \"" + promelaFile.getPath() + "\"";
		}
		catch(NullPointerException n)
		{
			throw(new Exception("Please choose a file"));
		}

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
	
	public String getSimulateCommands(Properties options) throws Exception
	{
		String command = "spin -p -s -r -X -v -l -g -u10000";
		
		if( options.getProperty(SpinCommands.RANDOM_WITH_SEED).equals("true"))
		{
			command += " -n" + options.getProperty(SpinCommands.SEED_VALUE); 
		}
		else if( options.getProperty(SpinCommands.GUIDED_WITH_TRAIL).equals("true") )
		{
			command += " -k " + options.getProperty(SpinCommands.TRAIL_FILE);
			String seedValue = options.getProperty(SpinCommands.SEED_VALUE);
			if( seedValue != null && seedValue.length() > 0 )
				command += " -n" + options.getProperty(SpinCommands.SEED_VALUE); 
		}
		else if( options.getProperty(SpinCommands.SIMPLE_WITH_TRAIL).equals("true") )
		{
			command = "spin -r -s -k " + options.getProperty(SpinCommands.TRAIL_FILE);
			String seedValue = options.getProperty(SpinCommands.SEED_VALUE);
			if( seedValue != null && seedValue.length() > 0 )
				command += " -n" + options.getProperty(SpinCommands.SEED_VALUE);
		}
		
		if( options.getProperty(SpinCommands.LOSES_NEW_MESSAGE).equals("true"))
		{
			command += " -m"; 
		}
		
		
		try
		{
			command += " \"" + promelaFile.getPath() + "\"";
		}
		catch(NullPointerException n)
		{
			throw(new Exception("Please choose a file"));
		}
		return command;
	}
	
	public void extractVerificationInfo(String input)
	{
		//find how many errors there are
		Pattern p = Pattern.compile("errors:\\s+([0-9]+)");
		Matcher m = p.matcher(input);
		if(m.find()) verErrors = m.group(1);
		else verErrors = "0";
		
		//find the total memory usage
		p = Pattern.compile("([0-9]+\\.*[0-9]*)\\s+total\\sactual\\smemory\\susage");
		m = p.matcher(input);
		if(m.find()) verTotalMemory = m.group(1);
		else verTotalMemory = "";
		
		//find the total number of states
		p = Pattern.compile("([0-9]+)\\s*states,\\s*stored");
		m = p.matcher(input);
		if(m.find()) verStates = m.group(1);
		else verStates = "";
		
		//find the total time elapsed
		p = Pattern.compile("elapsed\\s*time\\s*([0-9]+\\.{0,1}[0-9]*)");
		m = p.matcher(input);
		if(m.find()) verTime = m.group(1);
		else verTime = "";

	}
	
	public void createSimGraph() throws Exception
	{
		
		spinGraph = new SpinGraph();
		
		String[] simSplit = simOutput.split("\n");
		Pattern p = Pattern.compile("\\d+:\\s+proc");
		Pattern patExtractor = Pattern.compile("\\s*[0-9]+:\\s*proc\\s*[0-9]+\\s*\\(([^)]*)\\)"
				 + "[^:]*:[^:]*:([0-9]+)\\s*(\\S*)\\s+(\\S*)[^(]*\\([^_]*_([^)]*)\\)");
		Pattern patExtractor2 = Pattern.compile("\\s*[0-9]+:\\s*proc\\s*[0-9]+\\s*\\(([^)]*)\\)"
				 + "[^:]*:([0-9]+)\\s*(\\S*)\\s+(\\S*)[^(]*\\([^_]*_([^)]*)\\)");

		//capture all of the relevant lines from the sim output and extract the appropriate info
		boolean cycle = false;
		for( String str : simSplit )
		{
			/*if( str.indexOf("START OF CYCLE")!=-1 ) cycle = true;;
			if( !cycle )continue;*/
			Matcher m = p.matcher(str);
			if(!m.find()) continue;
			m = patExtractor.matcher(str);
			if(!m.find())
			{
				m = patExtractor2.matcher(str);
				if(!m.find())continue;
			}

			//is this an initialize function or not?
			boolean init = true;
			if( !m.group(1).equals(":init:")) init = false;
			
			//what line number does it refer to in the .pml file?
			String lineNum = m.group(2);
			
			//is this a send or receive action?
			boolean send = true;
			if( m.group(3).equals("Send") ) send = false;
			else if( m.group(3).equals("[Recv]") ) continue;
			
			//what are the values being sent/received?
			String values = m.group(4);
			
			//what is the name of the place?
			String place = m.group(5);
			
			SpinGraphElement element = new SpinGraphElement(init , Integer.parseInt(lineNum) , send , values , place );
			spinGraph.addElement(element);
		}
		
		/* using all of the places found in the sim output and their line numbers, we need to determine
		 * what the name of the sender/receiver object is, first we will go through the .abp file in order
		 * to find the rectangle names and all of their line numbers, then we will add the rectangles to
		 * each element.
		 */
		
		String fileText = getFileText();
		String[] text = fileText.split("\n");
		int lineNum = 1;
		p = Pattern.compile("inline\\s+([^(]*)");
		for( String str : text )
		{
			Matcher m = p.matcher(str);
			if( m.find() )
			{
				String name = m.group(1);
				String[] strArray = name.split("_");
				name = strArray[strArray.length-1];
				SpinGraphRectangle rectangle = new SpinGraphRectangle(name,lineNum);
				spinGraph.addRectangle(rectangle);
				spinGraph.addRectangleByName(rectangle);
			}
			lineNum++;
		}
		
		//for efficiency create a lineNum range map before looping through the elements
		Map<Integer,Integer> lineNumMap = new TreeMap<Integer,Integer>();
		Iterator<Integer> itr = spinGraph.getRectangles().keySet().iterator();
		Integer next = itr.next();
		Integer following = null;
		if( itr.hasNext() ) following = itr.next();
		for( int i = 1 ; i < text.length ; i++ )
		{
			if( i < next.intValue() ) continue;
			if( following == null ) lineNumMap.put(new Integer(i), next);
			else if( i < following.intValue() )
			{
				lineNumMap.put(new Integer(i), next);
			}
			else
			{
				lineNumMap.put(new Integer(i), following);
				next = following;
				if( itr.hasNext() ) following = itr.next();
				else following = null;
			}
			
		}
		
		//now we can easily link each element with the rectangle it points to
		for( SpinGraphElement element : spinGraph.getElementList() )
		{
			SpinGraphRectangle rectangle = spinGraph.getRectangle( lineNumMap.get(element.getLineNum() ) );
			spinGraph.addConnection( new SpinGraphConnection( element , new SpinGraphRectangle(rectangle) ) );
		}
		
		//make sure that the spinGraph is set up for painting
		spinGraph.setUpForPaint();
	}

}
