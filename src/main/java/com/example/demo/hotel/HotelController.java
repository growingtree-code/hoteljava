package com.example.demo.hotel;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.room.Room;
import com.example.demo.room.RoomService;
import com.example.demo.users.UsersService;

@Controller
public class HotelController {

	@Autowired
	private HotelService service;
	
	@Autowired
	private RoomService roomservice;
	
	@Autowired
	private UsersService userservice;
	/* 윈도우 */
	public static String basePath = "C:\\hotelimg\\";

	/* 이재혁 맥 */
//	public static String basePath = "/Users/lee/hotelimg";

	public String saveImg(int num, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(basePath + num);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			/* 윈도우 */
			File f = new File(basePath + num + "\\" + fileName);

			/* 이재혁 맥 */
//			File f = new File(basePath + num + "/" + fileName);

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
	
	@RequestMapping("/hotel/hotelList")
	public ModelAndView hotelList(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("hotel/hotelList");
		
		ArrayList<Hotel> list = (ArrayList<Hotel>) service.getHotelAll();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/hotel/listpage")
	public String listpage(Model model, PageVO vo) {
		
		System.out.println(vo);
		
		PageCreate pc = new PageCreate();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		
		System.out.println(pc);
		
		List list = service.getHotelPaging(vo);
		
		System.out.println(list);
		
		model.addAttribute("catelist", list);
		model.addAttribute("pc", pc);
		
		return "hotel/category";
	}

	@RequestMapping(value="/hotel/add")
	public String add(HttpServletRequest req, Hotel h) {
		int num = service.getNum();
		h.setHotel_id(num);
		
		String filename = saveImg(num, h.getHotel_imgfile());
		h.setHotel_img(filename);
		
		HttpSession session = req.getSession(false);
		String email = (String) session.getAttribute("email");
		int userid = userservice.searchUserIdByEmail(email);
		h.setUser_id(userid);
		
		service.addHotel(h);
		System.out.println(h);
		return "index";
	}
	
	@RequestMapping(value="/hotel/edit")
	public ModelAndView editform(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("hotel/edit");
		ArrayList<Hotel> list = null;
		
		HttpSession session = req.getSession(false);
		int type = (int) session.getAttribute("type");
		String email = (String) session.getAttribute("email");
		int userid = userservice.searchUserIdByEmail(email);
				
		if(type==0) {
			list = (ArrayList<Hotel>) service.getHotelAll();
		} else if(type==2) {
			list = (ArrayList<Hotel>) service.getHotelBySeller(userid);
		}
		
		System.out.println(list);
		
		mav.addObject("list",list);
		
		return mav;
	}
	
	@PostMapping(value="/hotel/update")
	public String edit(Hotel h) {
		
		if(!h.getHotel_imgfile().isEmpty()) {
			String filename = saveImg(h.getHotel_id(), h.getHotel_imgfile());
			h.setHotel_img(filename);
		} else {
			Hotel h2 = service.getHotelByNum(h.getHotel_id());
			h.setHotel_img(h2.getHotel_img());
		}
		
		service.editHotel(h);
		return "index";
	}
	
	@RequestMapping(value="/hotel/del")
	public String del(int id) {
		
		service.delHotel(id);
		return "index";
	}
	
	@RequestMapping(value = "/hotel/getsub")
	public ModelAndView getsub(@RequestParam(value = "id") int id) {
		ModelAndView mav = new ModelAndView("hotel/getsub");
		
		ArrayList<Room> rlist = (ArrayList<Room>)roomservice.getRoomByHotelNum(id);
		mav.addObject("rlist",rlist);
		
		return mav;
	}
	
	@RequestMapping(value="/hotel/detail")
	public ModelAndView detail(int num) {
				
		ModelAndView mav = new ModelAndView("hotel/detail");
		
		Hotel h = service.getHotelByNum(num);
		
		ArrayList<Room> roomlist = (ArrayList<Room>) roomservice.getRoomByHotelNum(num);
		
		mav.addObject("h", h);
		mav.addObject("roomlist",roomlist);
		
		return mav;
	}
	
	
	@RequestMapping("/hotel/img")
	public ResponseEntity<byte[]> getImg(String filename, int num) {
		/* 이재혁 맥 */
//		String path = basePath + num + "/" + filename;
		/* 윈도우 */
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
