package com.good.youditor;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.good.dto.AccountsVO;
import com.good.dto.FollowListVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;
import com.good.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	HomeService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<NoticeCategoryVO> nCatList = (List<NoticeCategoryVO>) session.getAttribute("nCatList");
		List<VideoCategoryVO> vCatList = (List<VideoCategoryVO>) session.getAttribute("vCatList");
		List<TipCategoryVO> tCatList = (List<TipCategoryVO>) session.getAttribute("tCatList");
		List<RecruitCategoryVO> rCatList = (List<RecruitCategoryVO>) session.getAttribute("rCatList");
		
		if(nCatList.equals(null) | vCatList.equals(null) | tCatList.equals(null) | rCatList.equals(null)) {
			nCatList = service.bringNoticeCategory();
			vCatList = service.bringVideoCategory();
			tCatList = service.bringTipCategory();
			rCatList = service.bringRecruitCategory();

			session.setAttribute("nCatList", nCatList);
			session.setAttribute("vCatList", vCatList);
			session.setAttribute("tCatList", tCatList);
			session.setAttribute("rCatList", rCatList);

		}
		
		AccountsVO login = (AccountsVO) session.getAttribute("login");
		int mCount = 0;
		int fCount = 0;
		if(login != null) {
			int accountId = login.getAccountId();
			FollowListVO vo = new FollowListVO();
			vo.setFollowAccountId(accountId);
			vo.setReg_date(login.getLastFollowerCheck());
			
			mCount = service.newMessageCnt(accountId);
			fCount = service.newFollowerCnt(vo);
			
			session.setAttribute("mCount", mCount);
			session.setAttribute("fCount", fCount);
		}
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

}
