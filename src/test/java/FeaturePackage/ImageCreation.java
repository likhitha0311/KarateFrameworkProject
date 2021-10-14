package FeaturePackage;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;

import javax.imageio.ImageIO;

public class ImageCreation {

	
	public static void create_Image(String imagetext) throws IOException {
		 
        int width = 250;
        int height = 250;
 
        // Constructs a BufferedImage of one of the predefined image types.
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
 
        // Create a graphics which can be used to draw into the buffered image
        //Graphics2D g2d = bufferedImage.createGraphics();
 
        // fill all the image with white
        //g2d.setColor(Color.blue);
        //g2d.fillRect(0, 0, width, height);
        
        Graphics graphics = bufferedImage.getGraphics();
        graphics.setColor(Color.blue);
        graphics.fillRect(0, 0, width, height);
       
        //graphics.setColor(Color.BLUE);
        Font font = new Font("Arial Black", Font.BOLD, 20);
        
        
        //graphics.setFont(font);
        graphics.setColor(Color.white);
        FontMetrics metrics =   graphics.getFontMetrics(font);
        System.out.println("Text width is "+metrics.stringWidth(imagetext));
        int positionX = ( bufferedImage.getWidth() - metrics.stringWidth(imagetext)) / 2;
        int positionY = (bufferedImage.getHeight() - metrics.getHeight()) / 2 + metrics.getAscent();
 
        // create a circle with black
        //g2d.setColor(Color.black);
        //g2d.fillOval(0, 0, width, height);
 
        // create a string with yellow
        //g2d.setColor(Color.yellow);
        //g2d.setFont((new Font("Arial Black", Font.BOLD, 20)));
      
        graphics.setFont(font);
        graphics.drawString(imagetext, positionX,  positionY);
 
        // Disposes of this graphics context and releases any system resources that it is using. 
        graphics.dispose();
 
        // Save as PNG
       //File file = new File("myimage.png");
        //ImageIO.write(bufferedImage, "png", file);
 
        // Save as JPEG
       //File  file = new File("myimage.jpg");
        //ImageIO.write(bufferedImage, "jpg", file);
       
        String full_name= imagetext+".jpg";
        
        File  file = new File("C://Users//karti//eclipse//Karate//src//test//java//TestData//Images//"+full_name+"");
        ImageIO.write(bufferedImage, "jpg", file);
 
    }
}
