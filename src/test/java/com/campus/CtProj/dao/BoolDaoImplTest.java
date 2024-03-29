package com.campus.CtProj.dao;

import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import static org.junit.Assert.assertTrue;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoolDaoImplTest {

    @Autowired
    RoomDao roomDao;

    @Autowired
    EnterDao enterDao;
    @Autowired
    UserDao userDao;
    @Autowired
    BoolDao boolDao;

    @Test
    public void count() throws Exception {
        System.out.println(roomDao.count());

    }

    @Test
    public void countId() throws Exception {
        System.out.println(roomDao.countId("7100725"));
    }

    @Test
    public void updateUser() throws Exception {
        UserDto userdto = userDao.selectUser("17100123");
        userdto.setCoin(50);
        userDao.updateUser(userdto);
    }

    @Test
    public void meetDate() throws Exception {
        RoomDto roomDto = roomDao.select(370);
        System.out.println(roomDto.getMeet_Date());
        System.out.println(roomDto.getMeet_Date().getTime());
        Date date = new Date();
        Timestamp st = new Timestamp(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm", Locale.KOREA);
        SimpleDateFormat datef = new SimpleDateFormat("yy-MM-dd HH:mm", Locale.KOREA);
        String str = sdf.format(new Date(st.getTime()));
        SimpleDateFormat aaa = new SimpleDateFormat("yy-MM-dd HH:mm", Locale.KOREA);

        String datefr = datef.format(date);

        long te = roomDto.getMeet_Date().getTime()-date.getTime();

        System.out.println("시간 차이: "+te/(1000*60*60));
        System.out.println("분 차이: "+te/(1000*60));
        System.out.println("분 차이: "+te/(1000*60)%60);



        System.out.println(date);
        System.out.println(date.getTime());

        System.out.println(st);
        System.out.println(str);
        System.out.println(datefr);
        System.out.println(aaa.format(roomDto.getMeet_Date()));


    }


//    @Test
//    public void selectRoom() throws Exception {
//
//    RoomDto dto = roomDao.select(127);
//
//        System.out.println(dto.getMeet_Date());
//
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
////SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.sss");  //<--millisecond는 "sss"가 아니라 "SSS"로 해야 정확하게 보존된다.
//
//        long timeInMillis =System.currentTimeMillis();
//        System.out.println(timeInMillis);166898880000
//
//
//        Date timeInDate = new Date(166898880000);
//        String timeInFormat = sdf.format(timeInDate);
//        System.out.println(timeInFormat);
//
//
//    }


        @Test
    public void ttest() throws Exception {
            List<BoolDto> li = boolDao.selectRoomId(401);
            List<String> lii = enterDao.selectRoomId(401);
            System.out.println(lii);
            System.out.println(lii.get(0));

            System.out.println(li);
            System.out.println(li.get(0));

    }
//
//    @Test
//    public void insert() throws  Exception{
//        RoomDto roomDto = new RoomDto("같이 놀사람!", "/pic", "공릉동", "꼭참석해야해요", "취미","17100721", 6);
//        assertTrue(roomDao.insert(roomDto)==1);
//
////        boardDto = new BoardDto("no title", "no content", "asdf");
////        assertTrue(boardDao.insert(boardDto)==1);
////        assertTrue(boardDao.count()==2);
////
////        boardDao.deleteAll();
////        boardDto = new BoardDto("no title", "no content", "asdf");
////        assertTrue(boardDao.insert(boardDto)==1);
////        assertTrue(boardDao.count()==1);
//    }
//
//    @Test
//    public void select()throws Exception {
//        RoomDto roomDto = new RoomDto("같이 놀사람!", "/pic", "노원구", "꼭참석해야해요", "취미","17100999", 6);
//        roomDao.insert(roomDto);
//        RoomDto roomDto2 = roomDao.select(59,"17100725");
//        System.out.println(roomDto2.getMeet_place());
//        System.out.println(roomDto.getMeet_place());
//        assertTrue(roomDto.getMeet_place().equals(roomDto2.getMeet_place()));
//
//    }
//
    @Test
    public void update() throws Exception {
        RoomDto roomDto = roomDao.select(216);
        System.out.println(roomDto.getNotice());
        roomDto.setMeet_place("서초");
        roomDto.setNotice("진짜 다 바꼈네ㅋㅋㅋ ");
        roomDto.setUser_limit(5);
        assertTrue(roomDao.update(roomDto) == 1);
    }
}