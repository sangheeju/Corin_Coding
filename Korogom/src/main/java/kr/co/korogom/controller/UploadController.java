package kr.co.korogom.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class UploadController {
	
	public static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@RequestMapping(value="/upload/uploadForm", method=RequestMethod.GET)
	public void uploadForm() {
		logger.info("업로드 페이지로 이동");
	}

	@RequestMapping(value="/upload/uploadFormAction", method=RequestMethod.POST)
	public void uploadForm(MultipartFile[] uploadFile, Model model) throws Exception {
		logger.info("파일 업로드!");
		
		String uploadFolder = "D:\\upload\\Korogom";	
		
		for (MultipartFile multipartFile : uploadFile) {					
			logger.info("==== : 나눔 : ====");
			logger.info("Upload File Name :"+multipartFile.getOriginalFilename());
			logger.info("Upload File Size :"+multipartFile.getSize());			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());			
			multipartFile.transferTo(saveFile);
		} //end of for
	}
	
	@RequestMapping(value="/upload/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax() {
		logger.info("AJAX 파일 업로드 페이지 이동");
		
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-",	File.separator);	
	}
	
	
	@RequestMapping(value="/upload/uploadAjaxAction", method=RequestMethod.POST)
	   public void uploadAjaxPost(MultipartFile[] uploadFile) throws Exception {
	      logger.info("AJAX 파일 업로드!");      
	      String uploadFolder = "D:\\upload\\Korogom";   
	      
	      //Make folder ----
	      File uploadPath = new File(uploadFolder, getFolder());
	      logger.info("upload path: "+uploadPath);
	      
	      if(uploadPath.exists() == false) {
	    	  uploadPath.mkdirs();
	      }
	      // make yyyy/MM/dd folder
	      
	      for (MultipartFile multipartFile : uploadFile) {
	         
		      logger.info("==== : 나누기 : ====");
		      logger.info("Upload File Name :"+multipartFile.getOriginalFilename());
		      logger.info("Upload File Size :"+multipartFile.getSize());      
		      
		      String uploadFileName = multipartFile.getOriginalFilename();
		      		      
		      //IE has file path
		      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		      logger.info("only file name : "+uploadFileName);
		      
		      // File saveFile = new File(uploadFolder, uploadFileName);
		      File saveFile = new File(uploadPath, uploadFileName);
		      multipartFile.transferTo(saveFile);
	      } //end of for
	   }

	
}
