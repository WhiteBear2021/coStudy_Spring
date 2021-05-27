package org.coStudy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.coStudy.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/files/")
public class UploadController {
	
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(HttpSession session,@RequestHeader("User-Agent") String userAgent,String fileName){
		log.info("download file:"+fileName);
	      String root_path = session.getServletContext().getRealPath("/");  
	      String uploadPath = "resources/";
	      String imgUploadPath = root_path+uploadPath + File.separator + "imgUpload";
		Resource resource=new FileSystemResource(imgUploadPath+File.separator+fileName);
		
		log.info(resource);
		String resourceName=resource.getFilename();
		
		//다운로드시 uuid뺀 파일이름으로 다운로드 되도록
		String resourceOriginalName=resourceName.substring(resourceName.indexOf("_")+1);
		
		HttpHeaders headers=new HttpHeaders();
		try {
			String downloadName=null;
			if(userAgent.contains("Trident")){
				log.info("IE BROWSER");
				downloadName=URLEncoder.encode(resourceOriginalName,"UTF-8").replace("\\", " ");
			}else if(userAgent.contains("Edge")){
				log.info("Edge Browser");
				downloadName=URLEncoder.encode(resourceOriginalName,"UTF-8");
			}else{
				log.info("Chrome Browser");
				downloadName=new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			
			log.info("downloadName:"+downloadName);
			
			headers.add("Content-Disposition", "attachment; filename="+downloadName);
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}
	
	
	
}
