package com.epam.testapp.presentation.action;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.springframework.web.struts.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

public class ChangeLocaleAction extends DispatchAction {

    public ActionForward russian(ActionMapping mapping,ActionForm form,
                                 HttpServletRequest request,HttpServletResponse response)
            throws Exception {

        request.getSession().setAttribute(Globals.LOCALE_KEY, new Locale("ru"));

        ActionForward forward = new ActionForward("/" + request.getHeader("referer").split("/")[3]);
        forward.setRedirect(true);
        return forward;
    }

    public ActionForward english(ActionMapping mapping,ActionForm form,
                                 HttpServletRequest request,HttpServletResponse response)
            throws Exception {

        request.getSession().setAttribute(Globals.LOCALE_KEY, Locale.ENGLISH);

        ActionForward forward = new ActionForward("/" + request.getHeader("referer").split("/")[3]);
        forward.setRedirect(true);
        return forward;
    }
}
