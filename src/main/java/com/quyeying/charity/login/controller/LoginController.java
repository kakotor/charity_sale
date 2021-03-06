package com.quyeying.charity.login.controller;

import com.quyeying.charity.login.dto.LoginDto;
import com.quyeying.security.CharitySecurityUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;

/**
 * charity_sale
 * com.quyeying.charity.login.controller
 * Created with IntelliJ IDEA.
 * User: Watson
 * Date: 2014/6/12
 * Time: 10:56
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    /**
     * 登录方法
     *
     * @param dto dto
     * @return 返回首页
     */
    @RequestMapping(method = RequestMethod.POST)
    public String login(LoginDto dto, RedirectAttributes attr, HttpServletResponse resp) {

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(dto.getUserName(), dto.getPassword());
        try {
            subject.login(token);

            return "redirect:/";
        } catch (AuthenticationException e) {
            CharitySecurityUtils.removeCurrentUser();
            attr.addFlashAttribute("dto", dto);
            return "redirect:/login";
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView toLogin() {
        return new ModelAndView("login/login");
    }


}
