package com.epam.testapp.presentation.action;

import com.epam.testapp.database.Dao;
import com.epam.testapp.model.entity.News;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.struts.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowNewsAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response)
            throws Exception {

        if (request.getParameter("id") != null) {
            Integer id = Integer.valueOf(request.getParameter("id"));
            Dao<News> newsDao = (Dao) getWebApplicationContext().getBean("newsDaoBean");
            News news = newsDao.findById(id);
            request.setAttribute("news", news);
            request.setAttribute("target", "list");
            return mapping.findForward("success");
        } else {
            request.setAttribute("target", "add");
            return mapping.findForward("success");
        }
    }
}
