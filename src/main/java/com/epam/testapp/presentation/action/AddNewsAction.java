package com.epam.testapp.presentation.action;


import com.epam.testapp.database.Dao;
import com.epam.testapp.model.entity.News;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.struts.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddNewsAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Dao<News> newsDao = (Dao) getWebApplicationContext().getBean("newsDaoBean");

        newsDao.insert(form.);

        return mapping.findForward("news");
    }
}
