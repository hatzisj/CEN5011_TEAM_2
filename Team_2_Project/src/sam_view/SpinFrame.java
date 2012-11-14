
package sam_view;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.JToolBar;

import sam_controller.SpinFileHandler;
import sam_controller.SpinHandler;

/**
 * SpinFrame is the parent view class and extends the JFrame API
 */
public class SpinFrame extends JFrame {
	// singleton instance of SpinFrame
	private static SpinFrame instance = null;
	
	//these are used for choosing the command line options  -a -b -cN -e -f -I -n -Nn -T -x
	private JCheckBox minusA;
	private JCheckBox minusB;
	private JCheckBox minusC;
	private JCheckBox minusE;
	private JCheckBox minusF;
	private JCheckBox minusCapI;
	private JCheckBox minusN;
	private JCheckBox minusCapN;
	private JCheckBox minusCapT;
	private JCheckBox minusX;
	
	private JTextField minusCOption;
	private JTextField minusCapNOption;
	private JTextField otherOptions;
	private JTextField gccCommand;
	
	//buttons for model analysis
	private JButton btnRunSpin;
	private JButton btnRunGcc;
	private JButton btnFileChooser;
	private JButton btnRunApp;
	private JTextField chosenFile;
	
	private JTabbedPane pane;
	

	/**
	 * This is a singleton accessor of the SpinFrame class
	 * @return instance of SpinFrame
	 */
	public static SpinFrame getInstance() {
		if (instance == null) {
			instance = new SpinFrame();
		}
		return instance;
	}

	
	/**
	 * private constructor for singleton 
	 * that sets up toolbars and menus
	 */
	private SpinFrame() {
		setTitle("SPIN Analysis Tool");
		this.setName("frameSPIN");
		this.setMinimumSize(new Dimension(600, 400));
		this.setSize(1200, 600);
		
		pane = new JTabbedPane();
		pane.setTabLayoutPolicy(JTabbedPane.SCROLL_TAB_LAYOUT);
		pane.addTab("Open File", SpinFilePanel.getInstance());
		pane.addTab("Simulate", SpinSimulatePanel.getInstance());
		pane.addTab("Verify", SpinVerifyPanel.getInstance());
		pane.addTab("Graphical Representation", SpinGraphPanel.getInstance());
		
		getContentPane().setLayout(new BorderLayout(0, 0));
		
		getContentPane().add(pane);
		
		setupToolbars();
		
		//addCheckBoxes();
		
		//addButtons();

	}
	
	/**
	 * Sets up the toolbars for JPanel
	 */
	public void setupToolbars() {
		JPanel panelToolBars = new JPanel();
		getContentPane().add(panelToolBars, BorderLayout.NORTH);
		panelToolBars.setLayout(new BoxLayout(panelToolBars, BoxLayout.X_AXIS));

		setupToolbarsFile(panelToolBars);
	}

	/**
	 * Sets up the tool bars for File panel
	 * 
	 * @param JPanel 
	 */
	public void setupToolbarsFile(JPanel panelToolBars) {
		JToolBar toolBarFile = new JToolBar();
		toolBarFile.setFloatable(false);
		panelToolBars.add(toolBarFile);
		JLabel lblFile = new JLabel("");
		toolBarFile.add(lblFile);
		
		btnFileChooser = new JButton("");
		btnFileChooser.setIcon(new ImageIcon(SamFrame.class
				.getResource("/sam_view/resources/createDoc16.png")));
		btnFileChooser.setBackground(SystemColor.menu);
		toolBarFile.add(btnFileChooser);
		btnFileChooser.setToolTipText("Open File");
		btnFileChooser.setName("btnFileChooser");
		btnFileChooser.addActionListener(new SpinFileHandler());
	}
	
	/**
	 * This method adds all the check boxes for the
	 * options that the user can make
	 */
	private void addCheckBoxes()
	{
		JPanel panel = new JPanel( new GridLayout(14,1) );
		
		minusA = new JCheckBox("Choose -a option");
		minusB = new JCheckBox("Choose -b option");
		minusC = new JCheckBox("Choose -c option, Input n");
		minusE = new JCheckBox("Choose -e option");
		minusF = new JCheckBox("Choose -f option");
		minusCapI = new JCheckBox("Choose -I option");
		minusN = new JCheckBox("Choose -n option");
		minusCapN = new JCheckBox("Choose -N option, Input n");
		minusCapT = new JCheckBox("Choose -T option");
		minusX = new JCheckBox("Choose -x option");
		
		minusCOption = new JTextField();
		minusCapNOption = new JTextField();
		
		panel.add(minusA);
		panel.add(minusB);
		
		JPanel innerCPanel = new JPanel( new GridLayout(1,2) );
		innerCPanel.add(minusC);
		innerCPanel.add(minusCOption);
		panel.add(innerCPanel);
		
		panel.add(minusE);
		panel.add(minusF);
		panel.add(minusCapI);
		panel.add(minusN);
		
		JPanel innerNPanel = new JPanel( new GridLayout(1,2) );
		innerNPanel.add(minusCapN);
		innerNPanel.add(minusCapNOption);
		panel.add(innerNPanel);
		
		panel.add(minusCapT);
		panel.add(minusX);
		
		panel.add(new JLabel("Enter any other arguments you want"));
		otherOptions = new JTextField();
		panel.add(otherOptions);
		
		panel.add(new JLabel("Enter the gcc command for your cpu (gcc, gcc-3/4, etc"));
		gccCommand = new JTextField();
		panel.add(gccCommand);
		add(panel, BorderLayout.WEST);
	}
	
	/**
	 * This method will add all the buttons to the 
	 * interface
	 */
	private void addButtons()
	{
		btnRunSpin = new JButton("Run the SPIN application");
		btnRunSpin.setActionCommand("SPIN");
		btnRunGcc = new JButton("Run the GCC");
		btnRunGcc.setActionCommand("GCC");
		btnRunApp = new JButton("Run the Application");
		btnRunApp.setActionCommand("APP");
		btnFileChooser = new JButton("Choose the file to run against");
		chosenFile = new JTextField();
		chosenFile.setEditable(false);
		
		SpinHandler spinHandler = new SpinHandler();
		spinHandler.putValue("file",chosenFile);
		spinHandler.putValue("-a",minusA);
		spinHandler.putValue("-b",minusB);
		spinHandler.putValue("-c",minusC);
		spinHandler.putValue("-cN",minusCOption);
		spinHandler.putValue("-e",minusE);
		spinHandler.putValue("-f",minusF);
		spinHandler.putValue("-I",minusCapI);
		spinHandler.putValue("-n",minusN);
		spinHandler.putValue("-N",minusCapN);
		spinHandler.putValue("-Nn",minusCapNOption);
		spinHandler.putValue("-T",minusCapT);
		spinHandler.putValue("-x",minusX);
		spinHandler.putValue("otherOptions",otherOptions);
		spinHandler.putValue("gccCommand",gccCommand);
		
		btnRunSpin.addActionListener(spinHandler);
		btnRunGcc.addActionListener(spinHandler);
		btnRunApp.addActionListener(spinHandler);
		
		SpinFileHandler spinFileHandler = new SpinFileHandler();
		spinFileHandler.putValue("file",chosenFile);
		btnFileChooser.addActionListener(spinFileHandler);
		
		JPanel panel = new JPanel( new GridLayout(3,2) );
		panel.add(btnFileChooser);
		panel.add(chosenFile);
		panel.add(btnRunSpin);
		panel.add(btnRunGcc);
		panel.add(btnRunApp);
		
		add(panel,BorderLayout.SOUTH);
	}
}
