package com.yrtrip.app.joiner.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.joiner.JoinerService;
import com.yrtrip.app.joiner.JoinerVO;

@Controller
public class JoinerController {

   @Autowired
   JoinerService joinerService;

   // 동행 신청자 리스트 전체조회
   @RequestMapping("/getJoinerList") // http://localhost:8081/app/getPartnerList
   @ResponseBody
   public List<JoinerVO> getjoinerList(JoinerVO vo) {
      return joinerService.getJoinerList(vo);
   }
	// 단건 조회
	@RequestMapping("getJoiner")
	@ResponseBody
	public JoinerVO getJoiner(JoinerVO vo) {
		return joinerService.getJoiner(vo);
	}
   
   // 동행 신청(신청자)
   @RequestMapping("insertJoiner")
   @ResponseBody   
   public JoinerVO insertJoiner(JoinerVO vo) {
      joinerService.insertJoiner(vo); // 등록 처리
      return joinerService.getJoiner(vo); // 목록요청
   }
   // 동행 신청 취소(신청자)
   @RequestMapping("deleteJoiner")
   @ResponseBody
   public JoinerVO deleteJoiner(JoinerVO vo) {
      joinerService.deleteJoiner(vo); // 삭제처리
      return vo;
   }

   // 수락하기(작성자)
   @RequestMapping("acceptJoiner")
   @ResponseBody
   public JoinerVO acceptJoiner(JoinerVO vo) {
	   joinerService.acceptJoiner(vo);
	   return vo;
   }
   // 수락취소(작성자)
   @RequestMapping("cancleJoiner")
   @ResponseBody
   public JoinerVO cancleJoiner(JoinerVO vo) {
	   joinerService.cancleJoiner(vo);
	   return vo;
   }
   /*@RequestMapping(value = { "/ajax/getJoinerList" }, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
   public String getajaxjoinerList(Model model, JoinerVO vo, HttpServletRequest request) {

      System.out.println("listin");

      List<JoinerVO> li = joinerService.getJoinerList(vo);

      for (JoinerVO v : li) {
         System.out.println(v.getJoinerCondition());
      }

      vo.setPartnerId(Integer.parseInt(request.getParameter("partnerid")));

      model.addAttribute("joinerList", joinerService.getJoinerList(vo));

      return "ajax/partner/testpage";
   }*/
   
	//동행 수락 여부 판단
	@RequestMapping("getJoinerUser")
	@ResponseBody
	public int getJoinerUser(JoinerVO vo) {
		return joinerService.getJoinerUser(vo);
	}

}