package com.example.demo.hotel;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HotelController {

	@Autowired
	private HotelService service;
	
	public static String basePath = "C:\\hotelimg\\";
	
	
	public String saveImg(int num, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(basePath + num);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File f = new File(basePath + num + "\\" + fileName);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fileName;
	}
	
	@RequestMapping(value = "/hotel/form")
	public void form() {
	}
	
	@RequestMapping(value="/hotel/add")
	public String add(Hotel h) {
		int num = service.getNum();
		h.setHotel_id(num);
		
		String filename = saveImg(num, h.getHotel_imgfile());
		System.out.println(filename);
		h.setHotel_img(filename);
		service.addHotel(h);
		System.out.println(h);
		return "hotel/hotelList";
	}
	
	
	
	
	@RequestMapping("/hotel/hotelList")
	public ModelAndView hotelList(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("hotel/hotelList");
		
		ArrayList<Hotel> list = (ArrayList<Hotel>) service.getHotelAll();
		mav.addObject("list", list);
		
		return mav;
	}
	
	
	@RequestMapping("/hotel/img")
	public ResponseEntity<byte[]> getImg(String filename, int num) {
		
		String path = basePath + num + "\\" + filename;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
}