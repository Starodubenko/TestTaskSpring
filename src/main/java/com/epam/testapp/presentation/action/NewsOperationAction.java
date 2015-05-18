package com.epam.testapp.presentation.action;


import com.epam.testapp.database.Dao;
import com.epam.testapp.database.NewsDao;
import com.epam.testapp.model.entity.News;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.springframework.web.struts.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsOperationAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Dao<News> newsDao = (Dao) getWebApplicationContext().getBean("newsDaoBean");
        DynaActionForm dAForm = (DynaActionForm) form;

        String[] delArray = request.getParameterValues("delArray");

        String type = (String) dAForm.get("operationType");
        switch (type) {
            case "Save":
                newsDao.insert(getNewsFromForm(dAForm));
                break;
            case "Update":
                newsDao.update(getNewsFromForm(dAForm));
                break;
            case "Delete":
                newsDao.delete(getNewsFromForm(dAForm).getId());
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

    private News getNewsFromForm(DynaActionForm form) {
        News news = new News();
        news.setId((Integer) form.get("id"));
        news.setTitle((String) form.get("title"));
        news.setDate(getDate((String) form.get("date")));
        news.setBrief((String) form.get("brief"));
        news.setContent((String) form.get("content"));
        return news;
    }

    private Date getDate(String date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        try {
            return dateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return new Date(0);
    }
}
