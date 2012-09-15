
package sam_view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class SpinFilePanel extends JScrollPane {
	// singleton instance of SpinFilePanel
	private static SpinFilePanel instance = null;
	private final int BORDER_THICKNESS = 1;
	
	private JPanel panel;
	private JTextArea textArea;
	
	// returns instance of SpinFilePanel
	public static SpinFilePanel getInstance() {
		if (instance == null) {
			instance = new SpinFilePanel();
		}
		return instance;
	}

	// private constructor for singleton
	// sets up toolbars and menus
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
	
	public void setText(String text)
	{
		textArea.setText(text);
	}
	
	
}
