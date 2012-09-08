
package sam_view;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.util.ArrayList;

import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JToggleButton;
import javax.swing.JToolBar;
import javax.swing.KeyStroke;
import javax.swing.UIManager;

import sam_controller.AddButtonHandler;
import sam_controller.AnalysisModuleHandler;
import sam_controller.FileHandler;
import sam_model.Component;
import sam_model.SamModel;
import sam_model.XMLTransformer;

public class SpinFrame extends JFrame {
	// singleton instance of SpinFrame
	private static SpinFrame instance = null;
	
	//buttons for model analysis
	private JButton btn;
	
	// returns instance of SpinFrame
	public static SpinFrame getInstance() {
		if (instance == null) {
			instance = new SpinFrame();
		}
		return instance;
	}

	// private constructor for singleton
	// sets up toolbars and menus
	private SpinFrame() {
		setTitle("SPIN Analysis Tool");
		this.setName("frameSPIN");
		this.setMinimumSize(new Dimension(600, 400));
		this.setSize(800, 600);

	}
}
