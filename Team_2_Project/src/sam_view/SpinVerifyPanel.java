
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
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import sam_controller.SpinVerifyHandler;
import sam_model.SpinCommands;

/**
 * SpinVerifyPanel extends the JScrollPane API and
 * is used for verification results
 */
public class SpinVerifyPanel extends JScrollPane {
	// singleton instance of SpinSimulatePanel
	private static SpinVerifyPanel instance = null;
	private final int BORDER_THICKNESS = 1;
	
	private JPanel panel;
	private JPanel optionsPanel;
	private ButtonGroup buttonGroupSafety;
	private ButtonGroup buttonGroupStorage;
	private ButtonGroup buttonGroupSearch;
	private ButtonGroup buttonGroupNeverClaims;
	
	//safety options
	private JRadioButton btnSafety;
	private JCheckBox cbInvalidEndStates;
	private JCheckBox cbAssertionViolations;
	private JCheckBox cbAssertions;
	
	//storage options
	private JRadioButton btnExhaustive;
	private JRadioButton btnHashCompact;
	private JRadioButton btnBitstate;
	private JCheckBox cbMinimizedAutomata;
	private JCheckBox cbCollapseCompression;
	
	//search mode options
	private JRadioButton btnDepth;
	private JRadioButton btnBreadth;
	private JCheckBox cbDepthPartialOrder;
	private JCheckBox cbBounded;
	private JTextField tfBound;
	private JCheckBox cbIterative;
	private JCheckBox cbBreadthPartialOrder;
	private JCheckBox cbReportUnreachable;
	
	//liveness options
	private JRadioButton btnNonProgress;
	private JRadioButton btnAcceptance;
	private JCheckBox cbEnforceWeak;
	
	//never claims
	private JRadioButton btnDoNotUseClaim;
	private JRadioButton btnUseClaim;
	private JTextField tfClaim;
	
	private JTextArea txtOutput;
	private JButton btnRun;
	private JTextArea txtCommandLine;
	
	
	private ButtonGroup buttonGroupChannel;
	private JRadioButton btnBlocksNewMessages;
	private JRadioButton btnLosesNewMessages;
	
	//choosing your gcc command
	private ButtonGroup buttonGroupGcc;
	private JRadioButton btnGcc;
	private JRadioButton btnGcc3;
	private JRadioButton btnGcc4;
	
	// returns instance of SpinVerifyPanel
	public static SpinVerifyPanel getInstance() {
		if (instance == null) {
			instance = new SpinVerifyPanel();
		}
		return instance;
	}

	/**
	 * Private constructor that initializes buttons
	 * and option buttons
	 */
	private SpinVerifyPanel() {
		panel = new JPanel();
		panel.setBorder(BorderFactory.createLineBorder(Color.BLACK, BORDER_THICKNESS));
		panel.setPreferredSize(new Dimension(800, 600));
		this.setViewportView(panel);
		panel.setLayout(new BorderLayout(0,0));
		this.setAutoscrolls(true);
		panel.setAutoscrolls(true);
		
		setUpOptions();
		
		txtOutput = new JTextArea();
		txtOutput.setBackground(Color.BLACK);
		txtOutput.setForeground(Color.WHITE);
		
		txtCommandLine = new JTextArea("Verification Result:");
		txtCommandLine.setBackground(Color.BLACK);
		txtCommandLine.setForeground(Color.WHITE);
		JPanel innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(1,2));
		innerPanel.add(new JScrollPane(txtOutput));
		innerPanel.add(new JScrollPane(txtCommandLine));
		panel.add(innerPanel,BorderLayout.CENTER);
	}
	
	/**
	 *  Initialize the options to their default state
	 */
	private void setUpOptions()
	{
		optionsPanel = new JPanel();
		optionsPanel.setLayout(new GridLayout(2,3,1,1));
		LineBorder border = new LineBorder(Color.BLACK,BORDER_THICKNESS);
		JLabel label = new JLabel("Safety");
		label.setForeground(Color.BLACK);
		label.setBorder(border);
		label.setHorizontalAlignment(SwingConstants.CENTER);
		
		JPanel innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(5,1));
		innerPanel.add(label);
		btnSafety = new JRadioButton("Safety",true);
		innerPanel.add(btnSafety);
		cbInvalidEndStates = new JCheckBox("+invalid endstates(deadlock");
		cbAssertionViolations = new JCheckBox("+ assertion violations");
		cbAssertions = new JCheckBox("+xr/xs assertions");
		innerPanel.add(cbInvalidEndStates);
		innerPanel.add(cbAssertionViolations);
		innerPanel.add(cbAssertions);
		optionsPanel.add(innerPanel);
		
		
		innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(5,1));
		label = new JLabel("Storage Mode");
		label.setForeground(Color.BLACK);
		label.setBorder(border);
		label.setHorizontalAlignment(SwingConstants.CENTER);
		btnExhaustive = new JRadioButton("exhaustive",true);
		btnHashCompact = new JRadioButton("hash-compact");
		btnBitstate = new JRadioButton("bitstate/superstrace");
		cbMinimizedAutomata = new JCheckBox("+ minimized automata (slow)");
		cbCollapseCompression = new JCheckBox("+ collapse compression");
		innerPanel.add(label);
		innerPanel.add(btnExhaustive);
		innerPanel.add(cbMinimizedAutomata);
		innerPanel.add(cbCollapseCompression);
		JPanel tempPanel = new JPanel();
		tempPanel.setLayout(new GridLayout(1,2));
		tempPanel.add(btnHashCompact);
		tempPanel.add(btnBitstate);
		innerPanel.add(tempPanel);
		optionsPanel.add(innerPanel);
		
		
		innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(5,1));
		label = new JLabel("Search Mode");
		label.setForeground(Color.BLACK);
		label.setBorder(border);
		label.setHorizontalAlignment(SwingConstants.CENTER);
		btnDepth = new JRadioButton("Depth-first search",true);
		cbDepthPartialOrder = new JCheckBox("+partial order reduction",true);
		cbBounded = new JCheckBox("+bounded context switching, with bound:");
		tfBound = new JTextField("0");
		innerPanel.add(label);
		innerPanel.add(btnDepth);
		innerPanel.add(cbDepthPartialOrder);
		innerPanel.add(cbBounded);
		innerPanel.add(tfBound);
		optionsPanel.add(innerPanel);
		
		innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(4,1));
		label = new JLabel("Liveness");
		label.setForeground(Color.BLACK);
		label.setBorder(border);
		label.setHorizontalAlignment(SwingConstants.CENTER);
		btnNonProgress = new JRadioButton("Non-progress cycles");
		btnNonProgress.setBorder(border);
		btnAcceptance = new JRadioButton("Acceptance cycles");
		btnAcceptance.setBorder(border);
		cbEnforceWeak = new JCheckBox("enforce weak fairness constraint");
		innerPanel.add(label);
		innerPanel.add(btnNonProgress);
		innerPanel.add(btnAcceptance);
		innerPanel.add(cbEnforceWeak);
		optionsPanel.add(innerPanel);
		
		innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(4,1));
		label = new JLabel("Never Claims");
		label.setForeground(Color.BLACK);
		label.setBorder(border);
		label.setHorizontalAlignment(SwingConstants.CENTER);
		btnDoNotUseClaim = new JRadioButton("do not use a never claim or ltl property",true);
		btnUseClaim = new JRadioButton("use claim; claim name(optional):");
		tfClaim = new JTextField();
		innerPanel.add(label);
		innerPanel.add(btnDoNotUseClaim);
		innerPanel.add(btnUseClaim);
		innerPanel.add(tfClaim);
		optionsPanel.add(innerPanel);
		
		
		innerPanel = new JPanel();
		innerPanel.setLayout(new GridLayout(4,1));
		cbIterative = new JCheckBox("+iterative search for short trail");
		btnBreadth = new JRadioButton("Breadth-first search");
		cbBreadthPartialOrder = new JCheckBox("+partial order reduction",true);
		cbReportUnreachable = new JCheckBox("report unreachable code",true);
		innerPanel.add(cbIterative);
		innerPanel.add(btnBreadth);
		innerPanel.add(cbBreadthPartialOrder);
		innerPanel.add(cbReportUnreachable);
		optionsPanel.add(innerPanel);
		
		buttonGroupSafety = new ButtonGroup();
		buttonGroupSafety.add(btnSafety);
		buttonGroupSafety.add(btnNonProgress);
		buttonGroupSafety.add(btnAcceptance);
		
		buttonGroupStorage = new ButtonGroup();
		buttonGroupStorage.add(btnExhaustive);
		buttonGroupStorage.add(btnHashCompact);
		buttonGroupStorage.add(btnBitstate);
		
		buttonGroupSearch = new ButtonGroup();
		buttonGroupSearch.add(btnDepth);
		buttonGroupSearch.add(btnBreadth);
		
		buttonGroupNeverClaims = new ButtonGroup();
		buttonGroupNeverClaims.add(btnDoNotUseClaim);
		buttonGroupNeverClaims.add(btnUseClaim);		
		

		optionsPanel.setBackground(Color.WHITE);
		innerPanel = new JPanel();
		innerPanel.setLayout(new BorderLayout(0,0));
		innerPanel.add(optionsPanel);
		
		JPanel southPanel = new JPanel(new BorderLayout(0,0));
		
		buttonGroupGcc = new ButtonGroup();;
		btnGcc = new JRadioButton("gcc",true);
		btnGcc3 = new JRadioButton("gcc-3");
		btnGcc4 = new JRadioButton("gcc-4");
		buttonGroupGcc.add(btnGcc);
		buttonGroupGcc.add(btnGcc3);
		buttonGroupGcc.add(btnGcc4);
		JPanel gccPanel = new JPanel(new GridLayout(1,3));
		gccPanel.add(btnGcc);
		gccPanel.add(btnGcc3);
		gccPanel.add(btnGcc4);
		
		btnRun = new JButton("Run");
		btnRun.addActionListener(setUpListener());
		
		southPanel.add(gccPanel,BorderLayout.CENTER);
		southPanel.add(btnRun,BorderLayout.SOUTH);
		innerPanel.add(southPanel,BorderLayout.SOUTH);
		
		panel.add(innerPanel,BorderLayout.NORTH);
	}
	
	/**
	 * Creates the listener that will handle the 
	 * different events that can occur
	 */
	private AbstractAction setUpListener()
	{
		AbstractAction handler = new SpinVerifyHandler();

		handler.putValue(SpinCommands.SAFETY,btnSafety);
		handler.putValue(SpinCommands.INVALID_ENDSTATES,cbInvalidEndStates);
		handler.putValue(SpinCommands.ASSERTION_VIOLATIONS,cbAssertionViolations);
		handler.putValue(SpinCommands.ASSERTIONS,cbAssertions);
		handler.putValue(SpinCommands.EXHAUSTIVE,btnExhaustive);
		handler.putValue(SpinCommands.HASH_COMPACT,btnHashCompact);
		handler.putValue(SpinCommands.BIT_STATE,btnBitstate);
		handler.putValue(SpinCommands.MINIMIZED_AUTOMATA,cbMinimizedAutomata);
		handler.putValue(SpinCommands.COLLAPSE_COMPRESSION,cbCollapseCompression);
		handler.putValue(SpinCommands.DEPTH_FIRST,btnDepth);
		handler.putValue(SpinCommands.BREADTH_FIRST,btnBreadth);
		handler.putValue(SpinCommands.DEPTH_PARTIAL_ORDER,cbDepthPartialOrder);
		handler.putValue(SpinCommands.BOUNDED,cbBounded);
		handler.putValue(SpinCommands.BOUNDED_VALUE,tfBound);
		handler.putValue(SpinCommands.ITERATIVE,cbIterative);
		handler.putValue(SpinCommands.BREADH_PARTIAL_ORDER,cbBreadthPartialOrder);
		handler.putValue(SpinCommands.REPORT_UNREACHABLE,cbReportUnreachable);
		handler.putValue(SpinCommands.NON_PROGRESS,btnNonProgress);
		handler.putValue(SpinCommands.ACCEPTANCE,btnAcceptance);
		handler.putValue(SpinCommands.ENFORCE_WEAK,cbEnforceWeak);
		handler.putValue(SpinCommands.DO_NOT_USE_CLAIM,btnDoNotUseClaim);
		handler.putValue(SpinCommands.USE_CLAIM,btnUseClaim);
		handler.putValue(SpinCommands.CLAIM,tfClaim);
		handler.putValue(SpinCommands.GCC,btnGcc);
		handler.putValue(SpinCommands.GCC_3,btnGcc3);
		handler.putValue(SpinCommands.GCC_4,btnGcc4);
		
		return handler;
	}
	
	/**
	 *  Sets the string of the text box of 
	 *  the output
	 *  @param string output
	 */
	public void setFileText(String text)
	{
		txtOutput.setText(text);
	}
	
	/**
	 *  Sets the string command line of the text box
	 *  @param string command line
	 */
	public void setCommandLineText(String text)
	{
		txtCommandLine.setText(text);
	}
	
	/**
	 * Appends additional command line arguments to 
	 * existing command line
	 * @param string command line
	 */
	public void appendCommandLineText(String text)
	{
		txtCommandLine.setText(txtCommandLine.getText() + "\n" + text);
	}
	
	/**
	 * sets the output text
	 * @param string text output
	 */
	public void setOutputText(String text)
	{
		txtOutput.setText(text);
	}
	
}
