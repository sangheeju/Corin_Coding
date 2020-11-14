package kr.co.korogom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
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

	@GetMapping("/upload/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		logger.info("fileName: "+fileName);
		File file = new File("C:\\upload\\Korogom\\"+fileName);
		logger.info("file : "+file);
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;		
	}
	
	@GetMapping(value="/upload/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName){
		logger.info("download file: "+fileName);
		
		Resource resource = new FileSystemResource("c:\\upload\\Korogom\\"+fileName); 
		logger.info("resource : "+resource);
		
		if(resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} 
		String resourceName = resource.getFilename();
		
		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			if(userAgent.contains("Trident")) {
				logger.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", "");				
			} else if(userAgent.contains("Edge")) {
				logger.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				logger.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");				
			}
			logger.info("downloadName: "+downloadName);
			
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping("/upload/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		logger.info("deleteFile: "+fileName);
		File file;
		
		try {
			file = new File("c:\\upload\\Korogom\\"+ URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				logger.info("largeFileName: "+largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
}
