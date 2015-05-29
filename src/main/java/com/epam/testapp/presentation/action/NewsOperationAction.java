package com.epam.testapp.presentation.action;


import com.epam.testapp.database.Dao;
import com.epam.testapp.database.NewsDao;
import com.epam.testapp.model.entity.News;
import com.epam.testapp.model.form.Newsform;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.springframework.util.Assert;
import org.springframework.web.struts.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsOperationAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Dao<News> newsDao = (Dao) getWebApplicationContext().getBean("newsDaoBean");
        Newsform dAForm = (Newsform) form;

        String[] delArray = request.getParameterValues("delArray");


        String type = dAForm.getOperationType();
        switch (type) {
            case "Save":
                newsDao.insert(getNewsFromForm(dAForm));
                break;
            case "Update":
                newsDao.update(getNewsFromForm(dAForm));
                break;
            case "Delete":
                newsDao.delete(Integer.valueOf(dAForm.getId()));
                break;
            case "Delete checked":
                deleteRange((NewsDao) newsDao, delArray);
                break;
        }

        return mapping.findForward("success");
    }

    private void deleteRange(NewsDao newsDao, String[] array) {
        for (String index : array) {
            newsDao.delete(Integer.valueOf(index));
        }
    }

    private News getNewsFromForm(Newsform form) {
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        News news = new News();
        try {
            if (form.getId() != null && !form.getId().equals(""))
            news.setId(Integer.valueOf(form.getId()));
            news.setTitle(form.getTitle());
            news.setDate(format.parse(form.getNewsDate()));
            news.setBrief(form.getBrief());
            news.setContent(form.getContent());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return news;
    }
}
