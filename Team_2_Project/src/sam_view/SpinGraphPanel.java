
package sam_view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

public class SpinGraphPanel extends JScrollPane {
	// singleton instance of SpinGraphPanel
	private static SpinGraphPanel instance = null;
	private final int BORDER_THICKNESS = 1;
	
	private JPanel panel;
	
	// returns instance of SpinGraphPanel
	public static SpinGraphPanel getInstance() {
		if (instance == null) {
			instance = new SpinGraphPanel();
		}
		return instance;
	}

	// private constructor for singleton
	// sets up toolbars and menus
	private SpinGraphPanel() {
		panel = new JPanel();
		panel.setBackground(Color.WHITE);
		panel.setBorder(BorderFactory.createLineBorder(Color.BLACK, BORDER_THICKNESS));
		panel.setPreferredSize(new Dimension(800, 600));
		this.setViewportView(panel);
		panel.setLayout(null);
		this.setAutoscrolls(true);
		panel.setAutoscrolls(true);
		

	}
}
