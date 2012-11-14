
package sam_view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

/**
 * SpinFilePanel extends JScrollPane and displayse the
 * file content of the file that the user opens
 */
public class SpinFilePanel extends JScrollPane {
	// singleton instance of SpinFilePanel
	private static SpinFilePanel instance = null;
	private final int BORDER_THICKNESS = 1;
	
	private JPanel panel;
	private JTextArea textArea;
	
	/**
	 * This method returns an singleton instance of
	 * a SpinFilePanel object
	 * 
	 * @return SpinFilePanel instance
	 */
	public static SpinFilePanel getInstance() {
		if (instance == null) {
			instance = new SpinFilePanel();
		}
		return instance;
	}

	/**
	 * Private singleton constructor that
	 * sets up toolbars amd menus 
	 */
	private SpinFilePanel() {
		panel = new JPanel();
		panel.setBackground(Color.WHITE);
		panel.setBorder(BorderFactory.createLineBorder(Color.BLACK, BORDER_THICKNESS));
		panel.setPreferredSize(new Dimension(800, 600));
		this.setViewportView(panel);
		panel.setLayout(null);
		this.setAutoscrolls(true);
		panel.setAutoscrolls(true);
		
		textArea = new JTextArea();
		textArea.setBackground(Color.BLACK);
		textArea.setForeground(Color.WHITE);
		panel.setLayout(new BorderLayout(0,0));
		panel.add(new JScrollPane(textArea));
	}
	
/**
 * Setter for the text area
 * @param string of random size
 */
	public void setText(String text)
	{
		textArea.setText(text);
	}
	
	
}
