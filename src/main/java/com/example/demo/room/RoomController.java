package com.example.demo.room;

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

import com.example.demo.hotel.Hotel;
import com.example.demo.hotel.HotelService;

@Controller
public class RoomController {

	@Autowired
	private RoomService service;
	@Autowired
	private HotelService hotelservice;
	
	public static String basePath = "C:\\roomimg\\";
	
	
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
	
	@RequestMapping(value = "/room/form")
	public ModelAndView form(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("room/form");
		
		ArrayList<Hotel> hotellist = (ArrayList<Hotel>) hotelservice.getHotelAll();
		mav.addObject("hotellist",hotellist);
		
		return mav;
	}
	
//	@RequestMapping("/hotel/hotelList")
//	public ModelAndView hotelList(HttpServletRequest req) {
//		
//		ModelAndView mav = new ModelAndView("hotel/hotelList");
//		
//		ArrayList<Room> list = (ArrayList<Room>) service.getHotelAll();
//		mav.addObject("list", list);
//		
//		return mav;
//	}
	
	@RequestMapping(value="/room/add")
	public String add(Room r) {
		int num = service.getNum();
		r.setRoom_id(num);
		
		String filename = saveImg(num, r.getRoom_imgfile());
		r.setRoom_img(filename);
		service.addRoom(r);
		System.out.println(r);
		return "redirect:/hotel/hotelList";
	}
	
//	@RequestMapping(value="/hotel/detail")
//	public ModelAndView detail(int num) {
//				
//		ModelAndView mav = new ModelAndView("hotel/detail");
//		
//		Room h = service.getHotelByNum(num);
//		mav.addObject("h", h);
//		
//		return mav;
//	}
	
	
	@RequestMapping("/room/img")
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