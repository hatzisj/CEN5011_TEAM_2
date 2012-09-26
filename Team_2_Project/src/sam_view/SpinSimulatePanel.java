
package sam_view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;

import javax.swing.AbstractAction;
import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.border.LineBorder;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import sam_model.SpinCommands;
import sam_controller.SpinSimulateHandler;

public class SpinSimulatePanel extends JScrollPane {
	// singleton instance of SpinSimulatePanel
	private static SpinSimulatePanel instance = null;
	private final int BORDER_THICKNESS = 1;
	
	private JPanel panel;
	private JPanel optionsPanel;
	private ButtonGroup buttonGroupMode;
	private JRadioButton btnRandomWithSeed;
	private JTextField txtSeed;
	private JRadioButton btnInteractive;
	private JRadioButton btnGuidedWithTrail;
	private JRadioButton btnSimpleWithTrail;
	private JTextField txtTrail;
	private JTextArea txtOutput;
	private JButton btnRun;
	private JButton btnRunWithGraph;
	private JTextArea txtCommandLine;
	
	
	private ButtonGroup buttonGroupChannel;
	private JRadioButton btnBlocksNewMessages;
	private JRadioButton btnLosesNewMessages;
	
	// returns instance of SpinFilePanel
	public static SpinSimulatePanel getInstance() {
		if (instance == null) {
			instance = new SpinSimulatePanel();
		}
		return instance;
	}

	// private constructor for singleton
	// sets up toolbars and menus
	private SpinSimulatePanel() {
		panel = new JPanel();
		panel.setBorder(BorderFactory.createLineBorder(Color.BLACK, BORDER_THICKNESS));
		panel.setPreferredSize(new Dimension(800, 600));
		this.setViewportView(panel);
		panel.setLayout(new BorderLayout(0,0));
		this.setAutoscrolls(true);
		panel.setAutoscrolls(true);
		
		setUpOptions();
		
		txtOutput = new JTextArea("Simulation Output:");
		txtOutput.setBackground(Color.BLACK);
		txtOutput.setForeground(Color.WHITE);
		
		txtCommandLine = new JTextArea("Command line:");
		txtCommandLine.setBackground(Color.BLACK);
		txtCommandLine.setForeground(Color.WHITE);
		JPanel innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(1,2));
		innerPanel.add(new JScrollPane(txtOutput));
		innerPanel.add(new JScrollPane(txtCommandLine));
		panel.add(innerPanel,BorderLayout.CENTER);
	}
	
	//sets up the area to choose options
	private void setUpOptions()
	{
		optionsPanel = new JPanel();
		optionsPanel.setLayout(new GridLayout(4,2,1,1));
		JLabel label = new JLabel("Mode");
		label.setForeground(Color.BLACK);
		label.setBorder(new LineBorder(Color.BLACK,BORDER_THICKNESS));
		label.setHorizontalAlignment(SwingConstants.CENTER);
		optionsPanel.add(label);
		label = new JLabel("A full channel");
		label.setForeground(Color.BLACK);
		label.setBorder(new LineBorder(Color.BLACK,BORDER_THICKNESS));
		label.setHorizontalAlignment(SwingConstants.CENTER);
		optionsPanel.add(label);
		
		optionsPanel.setBackground(Color.WHITE);
		
		buttonGroupMode = new ButtonGroup();
		LineBorder border = new LineBorder(Color.BLACK,BORDER_THICKNESS);
		btnRandomWithSeed = new JRadioButton("Random with seed: ");
		btnRandomWithSeed.setBorder(border);
		txtSeed = new JTextField("123");
		txtSeed.setBorder(border);
		btnInteractive = new JRadioButton("Interactive");
		btnInteractive.setBorder(border);
		btnGuidedWithTrail = new JRadioButton("Guided,with trail");
		btnGuidedWithTrail.setBorder(border);
		btnSimpleWithTrail = new JRadioButton("Simple queue output,with trail, used for creating graphical rep.",true);
		btnSimpleWithTrail.setBorder(border);
		txtTrail = new JTextField();
		txtTrail.setBorder(border);
		buttonGroupChannel = new ButtonGroup();
		btnBlocksNewMessages = new JRadioButton("Blocks new messages",true);
		btnBlocksNewMessages.setBorder(border);
		btnLosesNewMessages = new JRadioButton("Loses new messages");
		btnBlocksNewMessages.setBorder(border);
		
		buttonGroupMode.add(btnRandomWithSeed);
		buttonGroupMode.add(btnInteractive);
		buttonGroupMode.add(btnGuidedWithTrail);
		buttonGroupMode.add(btnSimpleWithTrail);
		
		buttonGroupChannel.add(btnBlocksNewMessages);
		buttonGroupChannel.add(btnLosesNewMessages);
		
		JPanel innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(1,2));
		innerPanel.add(btnRandomWithSeed);innerPanel.add(txtSeed);
		optionsPanel.add(innerPanel);
		
		
		optionsPanel.add(btnBlocksNewMessages);
		
		//optionsPanel.add(btnInteractive);
		optionsPanel.add(btnSimpleWithTrail);
		
		optionsPanel.add(btnLosesNewMessages);
		
		innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(1,2));
		innerPanel.add(btnGuidedWithTrail);innerPanel.add(txtTrail);
		optionsPanel.add(innerPanel);
		
		btnRun = new JButton("Run the simulation");
		btnRun.addActionListener(setUpListener(false));
		
		btnRunWithGraph = new JButton("Run the simulation and produce a graphical representation");
		btnRunWithGraph.addActionListener(setUpListener(true));;
		
		innerPanel = new JPanel();
		innerPanel.setLayout(new BorderLayout(0,0));
		innerPanel.add(optionsPanel);
		JPanel btnPanel = new JPanel();
		btnPanel.setLayout(new GridLayout(1,2));
		btnPanel.add(btnRun);btnPanel.add(btnRunWithGraph);
		innerPanel.add(btnPanel,BorderLayout.SOUTH);
		
		panel.add(innerPanel,BorderLayout.NORTH);
	}
	
	public void setTrailFile(String file)
	{
		txtTrail.setText(file);
	}
	
	private AbstractAction setUpListener(boolean graph)
	{
		AbstractAction handler = new SpinSimulateHandler(graph);
		handler.putValue(SpinCommands.RANDOM_WITH_SEED,btnRandomWithSeed);
		handler.putValue(SpinCommands.SEED_VALUE,txtSeed);
		handler.putValue(SpinCommands.INTERACTIVE,btnInteractive);
		handler.putValue(SpinCommands.GUIDED_WITH_TRAIL,btnGuidedWithTrail);
		handler.putValue(SpinCommands.SIMPLE_WITH_TRAIL,btnSimpleWithTrail);
		handler.putValue(SpinCommands.TRAIL_FILE,txtTrail);
		handler.putValue(SpinCommands.BLOCKS_NEW_MESSAGE,btnBlocksNewMessages);
		handler.putValue(SpinCommands.LOSES_NEW_MESSAGE,btnLosesNewMessages);
		
		return handler;
	}
	
	public void setCommandLineText(String text)
	{
		txtCommandLine.setText(text);
	}
	
	public void appendCommandLineText(String text)
	{
		txtCommandLine.setText(txtCommandLine.getText()+"\n"+text);
	}
	
	public void setOutputText(String text)
	{
		txtOutput.setText(text);
	}
	
	public JTextArea getOutputText()
	{
		return txtOutput;
	}
}
