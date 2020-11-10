package kr.co.korogom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.korogom.domain.AttachFileDTO;
import net.coobird.thumbnailator.Thumbnailator;


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
		
		String uploadFolder = "C:\\upload\\Korogom";	
		
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
	
	// 오늘 날짜의 경로를 문자열로 생성한다.
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-",	File.separator);	
	}
	
	//이미지 파일 확인
	private boolean checkImageType(File file)  {
		
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	@PostMapping(value="/upload/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	   public ResponseEntity<List<AttachFileDTO>>  
	   uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		
	      logger.info("AJAX 파일 업로드!");      
	      String uploadFolder = "C:\\upload\\Korogom";   
	      
	      String uploadFolderPath = getFolder();
	      
	      //Make folder ----
	      File uploadPath = new File(uploadFolder, getFolder());
	      logger.info("upload path: "+uploadPath);
	      
	      if(uploadPath.exists() == false) {
	    	  uploadPath.mkdirs();
	      }
	      // make yyyy/MM/dd folder
	      
	      for (MultipartFile multipartFile : uploadFile) {
	         
	    	  AttachFileDTO attachDTO = new AttachFileDTO();
	    	  
		      logger.info("==== : 나누기 : ====");
		      logger.info("Upload File Name :"+multipartFile.getOriginalFilename());
		      logger.info("Upload File Size :"+multipartFile.getSize());      
		      
		      String uploadFileName = multipartFile.getOriginalFilename();
		      		      
		      //IE has file path
		      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		      logger.info("only file name : "+uploadFileName);
		      
		      attachDTO.setFileName(uploadFileName);
		      
		      UUID uuid = UUID.randomUUID();
		      
		      uploadFileName = uuid.toString() + "_" + uploadFileName;
		      try {   
			      // File saveFile = new File(uploadFolder, uploadFileName);
			      File saveFile = new File(uploadPath, uploadFileName);
			      multipartFile.transferTo(saveFile);
			      
			      attachDTO.setUuid(uuid.toString());
			      attachDTO.setUploadPath(uploadFolderPath);
			      
			      // check image type file		      
			      if (checkImageType(saveFile)) {
			    	  
			    	  attachDTO.setImage(true);
			    	  
			    	  FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
			    	  Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
			    	  thumbnail.close();
			      } //if end
			      //add to List
			      list.add(attachDTO);
		      } catch (Exception e) {
		    	  e.printStackTrace();
		      }
	      } //end of for
	       return new ResponseEntity<>(list, HttpStatus.OK);
	   }

	
}
