package com.epam.testapp.presentation.action;

import com.epam.testapp.database.Dao;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.struts.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowNewsAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response)
            throws Exception {

        Dao customerBo = (Dao) getWebApplicationContext().getBean("newsDaoBean");

        return mapping.findForward("");
    }
}
