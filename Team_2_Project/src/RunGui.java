import pipe.gui.CreateGui;
import sam_model.Component;
import sam_view.SamFrame;


/**
 * <b>RunGui</b> - Start-up class with main function
 * @version 1.0
 * @author Alex Duncan
 */
public class RunGui{

   
  public static void main(String args[]){
  	try{
  		System.setProperty("file.separator","/");
  		SamFrame sm = SamFrame.getInstance();
  		sm.setVisible(true);
  	} catch(Exception e){
  		e.printStackTrace();
  	}
  }
  
}
