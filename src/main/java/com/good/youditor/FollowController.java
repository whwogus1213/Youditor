package com.good.youditor;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.good.dto.Search;
import com.good.service.FollowService;

@Controller
@RequestMapping(value = "/follow")
public class FollowController {

	@Inject
	FollowService followService;
	
	// 팔로워 목록 + 페이징 + 검색
	@RequestMapping(value = "/followList", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(required = false, defaultValue = "1") int page,
									@RequestParam(required = false, defaultValue = "1") int range,
									@RequestParam(required = false, defaultValue = "followAccountId") String searchType,
									@RequestParam(required = false) String keyword) throws Exception {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// 팔로워 수
		int listCnt = followService.getFollowListCnt(search);
		
		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("FollowList", followService.listAll(search));
		System.out.println("FollowController FollowList open");
		return "follow/followList";
	}
}
