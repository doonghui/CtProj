package com.campus.CtProj.controller;

import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.service.EnterService;
import com.campus.CtProj.service.RoomInService;
import com.campus.CtProj.service.RoomListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/list")
public class RoomListController {
    @Autowired
    RoomListService roomListService;
    @Autowired
    RoomInService roomInService;

    // 회원에 따른 방들을 전부 보여주는 메서드
    @GetMapping("/mem")
    public ResponseEntity<List<RoomDto>> listmem(HttpSession session)  {
        List<RoomDto> list_Mem = null;
        String user_id = (String)session.getAttribute("id");
        try {
            list_Mem =  roomListService.readMem(user_id);
            return new ResponseEntity<>(list_Mem, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list_Mem, HttpStatus.BAD_REQUEST);      //400
        }
    }

    @GetMapping("/host")
    public ResponseEntity<List<RoomDto>> listhost(HttpSession session)  {
        List<RoomDto> list_Host = null;
        String user_id = (String)session.getAttribute("id");
        try {
            list_Host =  roomListService.readHost(user_id);
            return new ResponseEntity<>(list_Host, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list_Host, HttpStatus.BAD_REQUEST);      //400
        }

    }




    @DeleteMapping("/mem/{bno}")
    public ResponseEntity<String> removeMem(@PathVariable Integer bno, HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("id");

        try {
            int rowCnt = roomInService.removeMem(bno, user_id);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>(HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }



    @DeleteMapping("/host/{bno}")
    public ResponseEntity<String> removeHost(@PathVariable Integer bno, HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("id");

        try {
            int rowCnt = roomInService.removeHost(bno);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("삭제가 완료되었습니다.",HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }



    // 회원이 입장+ 생성한 방 총 수를 보여준다.
    @GetMapping("/num")            // comments?bno=1080 GET
        public ResponseEntity<Integer> listNum( HttpSession session)  {
        Integer listNum = null;
        String user_id = (String) session.getAttribute("id");
        try {
            listNum =  roomListService.getCount(user_id);
            return new ResponseEntity<Integer>(listNum, HttpStatus.OK);   // 200
        } catch (Exception e) {
                    e.printStackTrace();
            return new ResponseEntity<Integer>(listNum, HttpStatus.BAD_REQUEST);      //400
        }

    }

    // 후기를 위해서 방안의 유저정보가져옴
    @PostMapping("/mem/review")
    @ResponseBody public ResponseEntity<List<BoolDto>> getReviewList(@RequestBody Integer roomBno,HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("id");

        System.out.println("여기도 안드가져?");
        System.out.println(roomBno);
        List<BoolDto> list = null;
        try {
            list = roomListService.readReviewList(roomBno);
            System.out.println(list);
            return new ResponseEntity<>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);      //400
        }

    }




}

