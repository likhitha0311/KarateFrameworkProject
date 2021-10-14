package FeaturePackage;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import java.util.zip.GZIPOutputStream;

import org.apache.commons.codec.binary.Base64OutputStream;

import io.tus.java.client.ProtocolException;
import io.tus.java.client.TusClient;
import io.tus.java.client.TusExecutor;
import io.tus.java.client.TusUpload;
import io.tus.java.client.TusUploader;
import net.minidev.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Base64;  
import java.sql.Timestamp;


public class ImageUpload
{
 static String Ref_id;
 static String file_name;
	public static String Ref_id_Generation(String file_path)
	{    
		
		System.out.println("File path is " +file_path);
		
		String File_path[] = file_path.split("//");
		int sizeofarray = File_path.length;
		String file_name = File_path[sizeofarray-1];
		//System.out.println(file_name);
		String File_type[] = file_name.split("\\.");
		int length_of_image_name = File_type.length;
		String file_type = File_type[length_of_image_name-1];
		UUID uuid =UUID.randomUUID();
		 Ref_id = (uuid.toString())+"."+file_type;
		System.out.println(Ref_id);
		return Ref_id;
		
    }
	
	
	public static long File_Size(String file_path)
	{   
		long bytes=0;
		try {
            
			System.out.println("File path inside size method is " +file_path);
			Path path = Paths.get(file_path);
            bytes = Files.size(path);
            System.out.println(String.format("%,d bytes", bytes));
            //System.out.println(String.format("%,d kilobytes", bytes / 1024));

        } catch (IOException e) {
            e.printStackTrace();
        }
		return bytes;
		
	}
	
	public static String File_name(String file_path)
	{   
		  
		String File_path[] = file_path.split("//");
		int sizeofarray = File_path.length;
		file_name = File_path[sizeofarray-1];
		return file_name;
		
	}
	
	public static void call_Tus(String token, String bearer_token, String file_path) throws ProtocolException, IOException
	{    
		try
		{
		System.out.println(token);
		System.out.println(bearer_token);
		Date date= new Date();
        //getTime() returns current time in milliseconds
	    long time = date.getTime();
        //Passed the milliseconds to constructor of Timestamp class 
	     Timestamp ts = new Timestamp(time);
		 Map<String, String> metadata = new LinkedHashMap<String, String>();
		  
//		 Base64.Encoder encoder = Base64.getEncoder();
//		 
//		 Ref_id=encoder.encodeToString(Ref_id.getBytes());
//		 
//		 file_name=encoder.encodeToString( file_name.getBytes());
//		 
//	     token=encoder.encodeToString(token.getBytes());
//	     
//	     bearer_token=encoder.encodeToString(bearer_token.getBytes());
	     
	     String type="image/jpeg";
	    // type = encoder.encodeToString(type.getBytes());
	     
	     String name=ts.toString()+file_name;
	     //name = encoder.encodeToString(name.getBytes());
	     
	     String status = "1";
	    // status = encoder.encodeToString(status.getBytes());
	     
				 
		  metadata.put("id", Ref_id);
		  metadata.put("refId", Ref_id);
		  metadata.put("filename", file_name);
		  metadata.put("token", token);
		  metadata.put("authorization", bearer_token);
		  metadata.put("upload_request_id", token);
		  metadata.put("status", status);
		  metadata.put("type", type);
		  metadata.put("name", name);
		
		  //System.out.println(Arrays.asList(metadata));
		  
		  for (Map.Entry<String, String> entry : metadata.entrySet()) 
		     {
			    System.out.println(entry.getKey()+" : "+entry.getValue());
			    System.out.println("\n");
			}
		  
		 TusClient client = new TusClient();
		 client.setUploadCreationURL(new URL("https://image-upload.api.spec.lovethat.design/uploads/"));
		
		// File file = new File("C:/Users/karti/eclipse/Karate/src/test/java/TestData/Love-That-Design-Florya-Ihlamur-Apartments-1.jpg");
		 File file = new File(file_path);
		 TusUpload upload = new TusUpload(file);
		 upload.setMetadata(metadata);
//		 
//		 TusExecutor executor = new TusExecutor() {
//			    @Override
//			    protected void makeAttempt() throws ProtocolException, IOException {
//			        // First try to resume an upload. If that's not possible we will create a new
//			        // upload and get a TusUploader in return. This class is responsible for opening
//			        // a connection to the remote server and doing the uploading.
			    	
			    	
			        TusUploader uploader = client.resumeOrCreateUpload(upload);
			        
			        // Alternatively, if your tus server does not support the Creation extension
			        // and you obtained an upload URL from another service, you can instruct
			        // tus-java-client to upload to a specific URL. Please note that this is usually
			        // _not_ necessary and only if the tus server does not support the Creation
			        // extension. The Vimeo API would be an example where this method is needed.
			        // TusUploader uploader = client.beginOrResumeUploadFromURL(upload, new URL("https://tus.server.net/files/my_file"));

			        // Upload the file in chunks of 1KB sizes.
			        uploader.setChunkSize(1024);

			        // Upload the file as long as data is available. Once the
			        // file has been fully uploaded the method will return -1
			        do {
			            // Calculate the progress using the total size of the uploading file and
			            // the current offset.
			            long totalBytes = upload.getSize();
			            long bytesUploaded = uploader.getOffset();
			            double progress = (double) bytesUploaded / totalBytes * 100;

			            System.out.printf("Upload at %06.2f%%.\n", progress);
			        } while(uploader.uploadChunk() > -1);

			        // Allow the HTTP connection to be closed and cleaned up
			        uploader.finish();

			        System.out.println("Upload finished.");
			        System.out.format("Upload available at: %s", uploader.getUploadURL().toString());
//			    }
//			};
//			executor.makeAttempts();
		}
		 catch (Exception e) {
	            e.printStackTrace();
	        }
		 //upload.setMetadata(metadata);
		 //upload.setSize(1024);
		 //upload.setInputStream(new ByteArrayInputStream(new byte[10]));
		 //System.out.println("Upload -Before");
		// TusUploader uploader = client.resumeOrCreateUpload(upload);
		// System.out.println("Upload completion check");
		// uploader.setChunkSize(1024);
		// uploader.finish();
		 //System.out.println("Upload finished.");
	}
	
	

	   
	}

	

