package com.example.demo.seller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.AdminService;
import com.example.demo.order.OrderService;

@Controller
public class SellerController {

	@Autowired
	private SellerService service;

	public static String basePath = "C:\\shopimg\\";

	@RequestMapping(value = "/seller/myList")
	public ModelAndView myList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("member/prodPage");
		HttpSession session = req.getSession(false);
		String seller_id = (String) session.getAttribute("id");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductBySellerId(seller_id);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/form")
	public void form() {
	}

	public void saveImg(int num, MultipartFile file) {
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
	}

	@RequestMapping(value = "/seller/add")
	public String add(Product p) {
		int num = service.getNum();
		p.setNum(num);
		service.addProduct(p);
		saveImg(num, p.getFile1());
		saveImg(num, p.getFile2());
		saveImg(num, p.getFile3());
		return "member/main";
	}

	@RequestMapping(value = "/seller/itemView")
	public ModelAndView itemView(@RequestParam(value = "num") int num, @RequestParam(value = "type") int type) {
		ModelAndView mav = new ModelAndView();
		if (type == 1) {
			mav.setViewName("seller/itemView");
		} else if (type == 2) {
			mav.setViewName("order/itemView");
		}
		Product p = service.getProductByNum(num);
		String path = basePath + p.getNum() + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
			}
		}

		mav.addObject("p", p);
		return mav;
	}

	@RequestMapping(value = "/seller/edit")
	public String edit(Product p) {
		service.editProduct(p);
		return "member/main";
	}

	@RequestMapping(value = "/seller/del")
	public String del(@RequestParam(value = "num") int num) {
		service.delProduct(num);
		String path = basePath + num + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		return "member/main";
	}

	@RequestMapping(value = "/seller/allList")
	public ModelAndView allList() {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductAll();
		mav.addObject("list", list);
		return mav;
	}

	
//	파라미터값 필수여부, 기본값 설정하기
//
//	required -> false 로 설정하면 파라미터값 필수아님!
//	-> 에러는 없지만 null로 넘어온다.
//
//	defualtValue : 파라미터 값이 없을 경우 기본으로 들어갈 값
//	-> 설정 시 파라미터값 비어있으면 defaultValue값으로 설정!
	
	
	
	
	@RequestMapping(value = "/seller/cateList")
	public ModelAndView cateList(@RequestParam(value = "c1", required = true) int c1,
			@RequestParam(value = "c2", required = false, defaultValue = "0") int c2,
			@RequestParam(value = "c3", required = false, defaultValue = "0") int c3) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = null;
		if (c2 == 0) {
			list = (ArrayList<Product>) service.getProductByC1(c1);
		} else if (c3 == 0) {
			list = (ArrayList<Product>) service.getProductByC2(c2);
		} else {
			list = (ArrayList<Product>) service.getProductByC3(c3);
		}
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/nameList")
	public ModelAndView nameList(@RequestParam(value = "name") String name) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductByName(name);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/priceList")
	public ModelAndView priceList(@RequestParam(value = "min") int min, @RequestParam(value = "max") int max) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductByPrice(min, max);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/sellerList")
	public ModelAndView sellerList(@RequestParam(value = "seller_id") String seller_id) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductBySellerId(seller_id);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/img")
	public ResponseEntity<byte[]> getImg(String fname, int num) {
		String path = basePath + num + "\\" + fname;
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
