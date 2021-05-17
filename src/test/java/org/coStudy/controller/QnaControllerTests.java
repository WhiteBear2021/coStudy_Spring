package org.coStudy.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
@WebAppConfiguration
public class QnaControllerTests {
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testRegister() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/qna/insert")
				.param("notice_title", "테스트 새글 제목").param("notice_content", "테스트 새글 내용")).andReturn().getModelAndView()
				.getViewName();

		log.info(resultPage);

	}
	@Test
	public void testList() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/qna/user_list")
				.param("user_no","1")).andReturn().getModelAndView()
				.getViewName();
	}
	
	
	/*
	 * @Test public void testList() throws Exception {
	 * 
	 * log.info(mockMvc.perform(MockMvcRequestBuilders.get("/notice/list")).
	 * andReturn().getModelAndView() .getModelMap()); }
	 */

	/*
	 * @Test public void testDetail() throws Exception {
	 * 
	 * log.info(mockMvc.perform(MockMvcRequestBuilders.get("/notice/detail").
	 * param("notice_no", "15")).andReturn() .getModelAndView().getModelMap());
	 * }
	 */

	/*
	 * @Test public void testUpdate() throws Exception {
	 * 
	 * String resultPage = mockMvc
	 * .perform(MockMvcRequestBuilders.post("/notice/update")
	 * .param("notice_no", "72") .param("notice_title", "수정된 테스트 새글 제목")
	 * .param("notice_content", "수정된 테스트 새글 내용"))
	 * .andReturn().getModelAndView().getViewName();
	 * 
	 * log.info(resultPage);
	 * 
	 * }
	 */

	/*
	 * @Test public void testDelete() throws Exception { String resultPage =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/notice/delete")
	 * .param("notice_no", "72")).andReturn() .getModelAndView().getViewName();
	 * 
	 * log.info(resultPage); }
	 */
	@Test
	public void testListPaging() throws Exception {

		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/notice/list").param("pageNum", "2").param("amount", "10"))
				.andReturn().getModelAndView().getModelMap());
	}

}
