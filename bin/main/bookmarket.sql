DROP TABLE IF EXISTS BookPublisher;

CREATE TABLE BookPublisher (
	pub_id	number	NOT NULL,
	pub_name	varchar2(200)	NOT NULL,
	pub_pw	varchar(100)	NOT NULL,
	pub_addr	varchar2(300)	NOT NULL,
	pub_email	varchar2(30)	NOT NULL,
	pub_ceo	varchar2(20)	NOT NULL,
	pub_join	date	NOT NULL,
	pub_del	char(1)	NOT NULL	DEFAULT 'n',
	pub_mgr	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
	order_id	number	NOT NULL,
	user_id	varchar2(50)	NOT NULL,
	order_date	date	NOT NULL,
	order_del	char(1)	NOT NULL	DEFAULT 'n',
	order_confirm	char(1)	NOT NULL	DEFAULT 'n',
	order_reject	char(1)	NOT NULL	DEFAULT 'n'
);

DROP TABLE IF EXISTS BookSellRequest;

CREATE TABLE BookSellRequest (
	bsr_id	number	NOT NULL,
	book_id	number	NOT NULL,
	pub_id	number	NOT NULL,
	bsr_cnt	number	NOT NULL,
	bsr_yn	char(1)	NOT NULL DEFAULT 'n',
	bsr_date	date	NOT NULL,
	bsr_confirm	date	NULL,
	bsr_reason	varchar2(1000)	NULL
);

DROP TABLE IF EXISTS BookRecommendation;

CREATE TABLE BookRecommendation (
	rcd_id	number	NOT NULL,
	user_id	varchar2(50)	NOT NULL,
	book_id	number	NOT NULL,
	rcd_date	date	NOT NULL
);

DROP TABLE IF EXISTS OrderDetail;

CREATE TABLE OrderDetail (
	od_id	number	NOT NULL,
	book_id	number	NOT NULL,
	order_id	number	NOT NULL,
	odr_cnt	number	NOT NULL
);

DROP TABLE IF EXISTS Book;

CREATE TABLE Book (
	book_id	number	NOT NULL,
	bsc_id	number	NOT NULL,
	book_price	number	NOT NULL,
	book_name	varchar2(100)	NOT NULL,
	book_writer	varchar2(20)	NOT NULL,
	book_desc	varchar2(4000)	NOT NULL,
	book_index	varchar2(4000)	NOT NULL,
	book_pub_cmt	varchar2(4000)	NULL,
	book_stock	number	NOT NULL,
	book_date	date	NOT NULL,
	book_img	varchar2(200)	NULL,
	book_page	number	NOT NULL,
	book_size	varchar2(100)	NOT NULL,
	book_isbn	varchar2(13)	NOT NULL,
	book_out	char(1)	NOT NULL	DEFAULT 'n',
	book_rcd_cnt	number	NOT NULL	DEFAULT 0
);

DROP TABLE IF EXISTS Cart;

CREATE TABLE Cart (
	cart_id	number	NOT NULL,
	user_id	varchar2(50)	NOT NULL,
	book_id	number	NOT NULL,
	book_cnt	number	NOT NULL,
	cart_del	char(1)	NOT NULL	DEFAULT 'n',
	cart_date	date	NOT NULL
);

DROP TABLE IF EXISTS BookLargeCategory;

CREATE TABLE BookLargeCategory (
	blc_id	number	NOT NULL,
	blc_name	varchar2(30)	NOT NULL
);

DROP TABLE IF EXISTS BookSmallCategory;

CREATE TABLE BookSmallCategory (
	bsc_id	number	NOT NULL,
	blc_id	number	NOT NULL,
	bsc_name	varchar2(30)	NOT NULL
);

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
	user_id	varchar2(50)	NOT NULL,
	user_name	varchar2(20)	NOT NULL,
	user_birth	date	NOT NULL,
	user_email	varchar2(30)	NOT NULL,
	user_pw	varchar2(100)	NOT NULL,
	user_addr	varchar2(300)	NOT NULL,
	user_del	char(1)	NOT NULL	DEFAULT 'n',
	user_join	date	NOT NULL,
	user_img	varchar2(200)	NULL,
	user_tel	varchar2(20)	NOT NULL
);

ALTER TABLE Orders ADD CONSTRAINT FK_Users_TO_Orders_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

ALTER TABLE BookSellRequest ADD CONSTRAINT FK_Book_TO_BookSellRequest_1 FOREIGN KEY (
	book_id
)
REFERENCES Book (
	book_id
);

ALTER TABLE BookSellRequest ADD CONSTRAINT FK_BookPublisher_TO_BookSellRequest_1 FOREIGN KEY (
	pub_id
)
REFERENCES BookPublisher (
	pub_id
);

ALTER TABLE BookRecommendation ADD CONSTRAINT FK_Users_TO_BookRecommendation_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

ALTER TABLE BookRecommendation ADD CONSTRAINT FK_Book_TO_BookRecommendation_1 FOREIGN KEY (
	book_id
)
REFERENCES Book (
	book_id
);

ALTER TABLE OrderDetail ADD CONSTRAINT FK_Book_TO_OrderDetail_1 FOREIGN KEY (
	book_id
)
REFERENCES Book (
	book_id
);

ALTER TABLE OrderDetail ADD CONSTRAINT FK_Orders_TO_OrderDetail_1 FOREIGN KEY (
	order_id
)
REFERENCES Orders (
	order_id
);

ALTER TABLE Book ADD CONSTRAINT FK_BookSmallCategory_TO_Book_1 FOREIGN KEY (
	bsc_id
)
REFERENCES BookSmallCategory (
	bsc_id
);

ALTER TABLE Cart ADD CONSTRAINT FK_Users_TO_Cart_1 FOREIGN KEY (
	user_id
)
REFERENCES Users (
	user_id
);

ALTER TABLE Cart ADD CONSTRAINT FK_Book_TO_Cart_1 FOREIGN KEY (
	book_id
)
REFERENCES Book (
	book_id
);

ALTER TABLE BookSmallCategory ADD CONSTRAINT FK_BookLargeCategory_TO_BookSmallCategory_1 FOREIGN KEY (
	blc_id
)
REFERENCES BookLargeCategory (
	blc_id
);

--시퀀스
DROP SEQUENCE BOOK_SEQ;
DROP SEQUENCE BOOKSELLREQUEST_SEQ;

CREATE SEQUENCE BOOK_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE BOOKSELLREQUEST_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

--admin
insert into users values('admin', 'admin', sysdate, 'admin', 9999, 'addr', 'n', sysdate, '123', '111111');

--user
insert into users values('userId1', 'userName1', '000101', 'bookmarket123@naver.com', 1, 'userAddr1', 'n', sysdate, null, '010-1111-1111');
insert into users values('userId2', 'userName2', '001012', 'bookmarket12@naver.com', 2, 'userAddr1', 'n', sysdate, null, '010-1111-1111');
insert into users values('userId3', 'userName3', '000816', 'bookmarket12@naver.com', 3, 'userAddr1', 'n', sysdate, null, '010-1111-1111');
insert into users values('userId4', 'userName4', '020724', 'bookmarket12@naver.com', 4, 'userAddr1', 'n', sysdate, null, '010-1111-1111');
insert into users values('userId5', 'userName5', '011112', 'bookmarket12@naver.com', 5, 'userAddr1', 'n', sysdate, null, '010-1111-1111');

--publisher
insert into bookpublisher values (123456, '과학동아', 1, '부천', 'bookmarket123@naver.com', '과대표',to_date('24-06-17'), 'n', '학담당');
insert into bookpublisher values (111111, '코믹스', 1, '과천', 'bookmarket124@naver.com', '만대표',to_date('24-06-17'), 'n', '화담당');
insert into bookpublisher values (222222, '노블', 1, '서창', 'bookmarket125@naver.com', '노대표',to_date('24-06-17'), 'n', '소담당');
insert into bookpublisher values (333333, '기타', 1, '아산', 'bookmarket126@naver.com', '기대표',to_date('24-06-17'), 'n', '타담당');

--book Category
insert into BookSmallCategory values (1, 1, '만화');--만화
insert into BookSmallCategory values (2, 1, '소설');--소설
insert into BookSmallCategory values (3, 1, '경제');--경제
insert into BookSmallCategory values (4, 1, '정치');--정치
insert into BookSmallCategory values (5, 1, '어린이');--어린이
----------------------------------------------------------------------
insert into BookSmallCategory values (6, 2, '영어');--영어
insert into BookSmallCategory values (7, 2, '일본');--일본
insert into BookSmallCategory values (8, 2, '중국');--중국
insert into BookSmallCategory values (9, 2, '기타');--기타
------------------------------------------------------------------------
insert into BookSmallCategory values (10, 3, '과학');--과학
insert into BookSmallCategory values (11, 3, '로맨스');--로맨스
insert into BookSmallCategory values (12, 3, '헬스');--헬스
insert into BookSmallCategory values (13, 3, '역사');--역사
insert into BookSmallCategory values (14, 3, '요리');--요리

insert into BookLargeCategory values(1, '국내');--국내
insert into BookLargeCategory values(2, '국외');--국외
insert into BookLargeCategory values(3, 'ebook');--e북

-------------------------------------------------------------서적 데이터: book과 booksellrequset는 1개씩 세트
---- 만화 1
insert into book values(BOOK_SEQ.nextval,1,6000,
'원피스 110: 시대의 일렁임','EIICHIRO ODA',
'거병 해적단의 도움으로<br>
미래섬 탈출에 빛줄기를 본 루피 일행이었으나<br>,
오로성이 벽이 되어 막아선다!<br>
한편, 베가펑크의 방송이 시작되고 그 내용에 세계가 요동치는데...<br>
"원피스"를 둘러싼 해양 모험 로망!!',
'-',
null,100, to_date('2025-01-23'), 'onepice-110.jpg', 200,'기타 규격' ,9791142305337,'n',0); 

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,111111,100, 'y', to_date('2025-04-23'), to_date('2025-04-23'),null);

insert into book values(BOOK_SEQ.nextval,1,6000,
'명탐정 코난 106','아오야마 고쇼',
'헤이지 일행이 모티브가 된 연극을 보러 온 코난 일행.<br>
헤이지는 그곳에서 카즈하에게 고백하기로 결심한다.<br>
장소는 노을이 보이는 ‘나니와 하루카스’!!<br>
그런데 살인사건이 발생하면서,<br>
고백은 시간 제한에 걸리고 마는데….<br>',
'FILE.1 기묘한 주사위<br>
FILE.2 두 거점 작전<br>
FILE.3 수상한 손님<br>
FILE.4 제한 시간은 0시<br>
FILE.5 반격의 기폭제<br>
FILE.6 주은색 개연<br>
FILE.7 치자색 첫날<br>
FILE.8 납빛의 중간 날<br>
FILE.9 연학 먹빛의 최종일 전날<br>
FILE.10 노을빛의 최종일<br><br>
106권 FILE.6~10 설정 자료 + α',
null, 100, to_date('2025-02-25'), '코난 106.jpg', 192,'B6(188mm X 127mm, 사륙판)' ,9791136799159,'n',0); 

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,111111, 100, 'y', to_date('2025-02-26'), to_date('2025-02-26'),null);

insert into book values(BOOK_SEQ.nextval,1,6000,'스파이 패밀리13','엔도 타츠야',
'초일류 스파이 "황혼"에게 어느 날 떨어진 미션은 "가족"을 만들어 명문학교에 잠입하라! <br>
하지만 독신인데다 아내와 딸을 동시에 만들어야하는 난감한 상황. <br>어떻게든 가족을 만들어 명문교에 잠입하지 않으면 세상은 파멸(?)의 길로 빠질 가능성도 있다. <br>
이 상황에서《황혼》이 선택한 "가족"은?!<br><br>
엔도 타츠야의 『스파이 패밀리』 제 13권.',
'MISSION : 85<br>
MISSION : 86<br>
MISSION : 87<br>
MISSION : 88<br>
MISSION : 89<br>
MISSION : 90<br>
MISSION : 91<br>
MISSION : 92<br><br>
SHORT MISSION : 11',
null, 100, to_date('2024-06-25'), '스파패13.jpg', 194,'B6(188mm X 127mm, 사륙판)' ,9791141151676,'n',0);
insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,111111, 100, 'y', to_date('2024-06-27'), to_date('2025-02-27'),null);

--소설 2
insert into book values(BOOK_SEQ.nextval,2,13000,'모순','양귀자 ',
'인생은 탐구하면서 살아가는 것이 아니라, 살아가면서 탐구하는 것이다.<br>
실수는 되풀이된다. 그것이 인생이다…….<br>

『모순』은 작가 양귀자가 1998년 펴낸 세 번째 장편소설로, 책이 나온 지 한 달 만에 무서운 속도로 베스트셀러 1위에 진입, 
출판계를 놀라게 하고 그해 최고의 베스트셀러로 자리 잡으면서 ‘양귀자 소설의 힘’을 다시 한 번 유감없이 보여준 소설이다.<br>

초판이 나온 지 벌써 15년이 흘렀지만 이 소설 『모순』은 아주 특별한 길을 걷고 있다. 그때 20대였던 독자들은 지금 결혼을 하고 30대가 되어서도 가끔씩 『모순』을 꺼내 다시 읽는다고 했다.
다시 읽을 때마다 전에는 몰랐던 소설 속 행간의 의미를 깨우치거나 세월의 힘이 알려준 다른 해석에 놀라면서 “내 인생의 가장 소중한 책 한 권”으로 꼽는 것을 주저하지 않는다. 
『모순』이 특별한 것은 대다수의 독자들이 한 번만 읽고 마는 것이 아니라 적어도 두 번, 혹은 세 번 이상 되풀이 읽고 있다는 사실에 있다.',
'1 생의 외침<br>
2 거짓말들<br>
3 사람이 있는 풍경<br>
4 슬픈 일몰의 아버지<br>
5 희미한 사랑의 그림자<br>
6 오래전 그 십 분의 의미<br>
7 불행의 과장법<br>
8 착한 주리<br>
9 선운사 도솔암 가는 길에<br>
10 사랑에 관한 세 가지 메모<br>
11 사랑에 관한 네 번째 메모<br>
12 참을 수 없는 너무나 참을 수 없는<br>
13 헤어진 다음날<br>
14 크리스마스 선물<br>
15 씁쓸하고도 달콤한<br>
16 편지<br>
17 모순<br><br>
작가노트
',
'모순을 이해하라<br>
『모순』의 주인공은 25세의 미혼여성 안진진. 시장에서 내복을 팔고 있는 억척스런 어머니와 행방불명의 상태로 떠돌다 가끔씩 귀가하는 아버지, 
그리고 조폭의 보스가 인생의 꿈인 남동생이 가족이다. 여기에 소설의 중요 인물로 등장하는 이모는 주인공 안진진의 어머니와는 일란성 쌍둥이로 태어났지만 인생행로는 사뭇 다르다. 
부유한 이모는 지루한 삶에 진력을 내고 있고 가난한 어머니는 처리해야 할 불행들이 많아 지루할 틈이 없다.<br>
주인공 안진진은 극단으로 나뉜 어머니와 이모의 삶을 바라보며 모순투성이인 이 삶을 어떻게 이해해야 하는지 심각하게 고민하기 시작한다.',
100,TO_DATE('2013-04-01'), '모순.jpg', 307,'A5(210mm X 148mm, 국판)' ,9788998441012,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,222222,100, 'y', to_date('2024-07-18'), to_date('2024-07-18'),null);

insert into book values(BOOK_SEQ.nextval,2,14000,'급류','정대건',
'“너 소용돌이에 빠지면 어떻게 해야 하는 줄 알아?<br>
수면에서 나오려 하지 말고 숨 참고 밑바닥까지 잠수해서 빠져나와야 돼.”<br><br>

상처에 흠뻑 젖은 이들이 각자의 몸을 말리기까지,<br>
서로의 흉터를 감싸며 다시 무지개를 보기까지<br>
거센 물살 같은 시간 속에서 헤엄치는 법을 알아내는<br>
연약한 이들의 용감한 성장담, 단 하나의 사랑론<br>',
'1부 7<br>
2부 73<br>
3부 187<br>
4부 275<br><br>

작가의 말 297',
'■헤어짐 이후의 나날<br>

열여덟.<br> 그들은 그날 그 밤의 사건을 덮어 둔 채, 가족의 손에 이끌려 작별하게 된다. 사랑하는 사람들을 한 번에 잃게 된 악몽 같은 순간을 매일 복기하며 서로 다른 성격으로, 
다른 마음가짐으로 그날 이후의 시간을 보내게 된다. 사랑하는 가족이 남긴 거대한 물음표를 지닌 채 사랑을 믿지 못하게 되거나, 
혹은 더 이상 사랑하는 사람을 잃을 수 없다는 생각에 죄책감을 품고 죄인처럼 살아가는 것이다. 스물하나. 시간이 흘러 두 사람이 우연히 재회했을 때, 
도담과 해솔의 상처는 아직 아물지 못한 채다. 기적적으로 다시 만나 연인이 되지만 이들의 관계는 절뚝거리고 위태로워 보인다. 
그들은 이 사랑이 죄책감 때문인지 진짜 사랑인지 혼란스러워하며, 지난 불행을 잊기 위해 이번에는 반드시 행복해져야 한다는 강박에 시달리고, 
서로의 얼굴을 보면 진평에서의 그날이 떠올라 서로를 똑바로 보지 못한다.<br><br>
소설은 같은 트라우마를 지닌 채 헤어졌다가 다시 만난 도담과 해솔이 같은 상처를 어떻게 다르게 지나가는지, 어떻게 다시 한 번 서로를 사랑으로 선택하는지를 그려낸다. 
충격적이지만 보편적인 사랑이야기이자, 애틋한 사랑이야기인 동시에 낭만적이기만 하지는 않은 복잡하고 깊은 물 같은 이야기다.',
100,TO_DATE('2022-12-22'), '급류.jpg', 300,'B6(188mm X 127mm, 사륙판)' ,9788937473401,'n',40);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,222222,100, 'y', to_date('2024-07-17'), to_date('2024-07-17'),null);

--경제 3
insert into book values(BOOK_SEQ.nextval,3,16800,'착취 경제','이순환',
'혈통과 사회적 기능이 아닌,<br>
존재 그 자체로 고귀한 인간 ?<br>
그 인식의 전환이 인간다움을 발전시켰다<br>

자본주의는 우리를 자본의 노예로 만들었다.<br>
지주는 우리의 노동을 착취한다.<br>
금융은 자본가의 이익만을 확대한다.<br>
교육은 우리가 자본가로 가는 기회를 차단한다.<br>
플랫폼은 착취를 가속한다.',
'PART 1<br>
지주의 착취<br>
노동의 착취<br>
금융의 착취<br>
교육의 착취<br>
플랫폼의 착취<br>
사업가와 자영업자<br>
PART 2<br>
종교의 착취<br>
철학의 착취<br>
정치와 언론의 착취<br>
기술의 착취<br>
지구를 착취<br>
멸망과 멸종',
null,
100,TO_DATE('2025-04-21'), '착취경제.jpg', 198,'기타 규격' ,9791172245986,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2025-04-22'), to_date('2025-04-23'),null);

insert into book values(BOOK_SEQ.nextval,3,19900,'슬기로운 노후 독립','오종남 ',
'-',
'-',
null,
100,TO_DATE('2025-04-23'), '노후독립.jpg', 268,'A5(210mm X 148mm, 국판)' ,9791173572449,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2025-04-24'), to_date('2025-04-24'),null);

--정치 4
insert into book values(BOOK_SEQ.nextval,4,24000,'소법전','법률연구회',
'六法은 국민의 일상생활과 밀접한 관계가 있는 法律로서 모든 法令의 근원이 되고 있다.<br>
이 책에 수록된 기본육법과 특별법은 변호사시험?법무사시험?공인회계사시험?세무사시험 등 각종 시험에 출제되는 법률로서 어느 시험을 준비하든 필수적인 법령으로 공부해야 하는 법률 과목을 포함하고 있다.',
'▣ 대한민국헌법 1<br>
▣ 헌법재판소법 17<br>
▣ 민법 31<br>
▣ 민사소송법 143<br>
▣ 민사집행법 199<br>
▣ 형법 239<br>
▣ 형사소송법 281<br>
▣ 형사소송규칙 359<br>
▣ 상법 395<br>
▣ 행정소송법 547<br>
▣ 행정심판법 553<br>
▣ 변호사시험법 569<br>
▣ 주택임대차보호법 573<br>
▣ 공직선거법 583<br>
▣ 고위공직자범죄수사처 설치 및 운영에 관한 법률 727<br>
▣ 검찰청법 735<br>
▣ 성폭력범죄의 처벌 등에 관한 특례법 745<br>
▣ 스토킹범죄의 처벌 등에 관한 법률 763<br>',
null,
100,TO_DATE('2025-01-15'), '소법전.jpg', 781,'규격 외(225mm X 152mm, 신국판)' ,9791193350782,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2025-01-17'), to_date('2025-01-17'),null);

insert into book values(BOOK_SEQ.nextval,4,19000,'최소한의 정치공부','추동훈 ',
'“정치, 이 정도만 알아도 충분합니다!”<br>
알아야 덜 흔들리니까, 누구의 편도 아닌 나를 위한 공부<br>
계엄, 탄핵부터 헌법, 정당, 국회, 참정권까지<br>
꼭 알아야 할 필수 정치상식 가이드!<br>',
'서문<br>
01 계엄과 탄핵을 통해 본 대한민국 정치사<br>
02 헌법을 알면 민주주의가 보인다<br>
03 법과 정치가 만나는 전쟁터, 국회의 모든 것<br>
04 나라를 움직이는 힘겨루기, 정당<br>
05 행정부와 사법부 그리고 균형<br>
06 나라를 바꾸는 힘, 참정권<br>
맺음말',
null,
100,TO_DATE('2025-04-30'), '정치공부.jpg', 300,'규격 외(225mm X 152mm, 신국판)' ,9791164847693,'n',0);
insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'n', to_date('2025-04-25'),null,null);

--어린이 5
insert into book values(BOOK_SEQ.nextval,5,15000,'딸기가 말을 걸었어(물고기 그림책)','강승임',
'“봄이가 문을 나서자, 세상이 말을 걸어요.”<br>
눈이 닿는 곳에서 시작되는 아이들의 첫 번째 언어!<br>
문을 열고 밖으로 나서는 아이들은 저마다 세상에 관심을 가지고 관찰하기 시작해요.<br>
봄이가 유치원에 가요.<br>
문을 나서자 누군가 봄이를 불러요. “봄아! 봄아!” 발그레 잘 익은 딸기예요.<br>
“나도 유치원에 가고 싶어!” 봄이는 신이 나서 함께 가자고 말해요.<br>',
'-',
'#낯선 환경에 긍정적으로 적응하기<br>
#유치원에 처음 가는 아이와 부모에게 추천 #인지 발달 놀이<br>
#나만의 소통으로 사회성 키우는 법 #문해력 말놀이 그림책<br>
#관심과 호기심은 아이들을 자라게 한다<br>
와글와글 사물들이 말을 건다고요?<br>
낯선 세상과 친해지고 싶은 아이의 마음이에요!<br>
말풍선이 가득한 유치원 속으로!<br>
세상과 즐겁게 대화할 준비가 되었어요!<br>',
100,TO_DATE('2025-05-05'), '딸기가말을걸었어.jpg', 32,'기타 규격' ,9791163271789,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'n', sysdate, null,null);

insert into book values(BOOK_SEQ.nextval,5,14000,'여름의 짝꿍 옷을 만들러 가요(그림책도서관)','이시이 무쓰미 ',
'무덥지만 열정 가득한 여름을 즐겁게 보내고 있는 단짝 사키와 수리. 할머니가 선물해 준 천으로 짝꿍 옷을 만들면서 
여름의 색, 소리, 냄새, 풍경 등 여름과 관련된 다양한 감각과 이미지를 떠올려 보는 계절 그림책.',
'사키와 수리는 나팔꽃이 가득 핀 꽃밭으로 갔어요.<br>
“우리 나팔꽃 꽃물 만들까?”<br>
“만들자, 만들자.”<br>
사키가 묻자 수리가 좋아하며 대답했어요.<br>
둘은 작은 통 가득 예쁜 꽃물을 만들었어요. _본문 6쪽<br>
꾸러미 안에는 줄무늬 천과 편지가 들어 있었어요.<br>
편지에는 이렇게 쓰여 있었어요.<br>
이 천은 사키 마음대로 사용해 주렴. -할머니가<br>
사키는 좋은 생각이 떠올랐어요.<br>
“있잖아, 수리야. 미코 아줌마한테 가서<br>
이 천으로 짝꿍 옷을 만들어 달라고 하자.” _본문 11쪽',
null,
100,TO_DATE('2025-05-20'), '여름의 짝꿍.jpg', 40,'기타 규격' ,9791173320477,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', sysdate, sysdate, null);

--영어 6
insert into book values(BOOK_SEQ.nextval,6,18000,'MICKEY 7 - MTI','EDWARD ASHTON',
'Now experience where the hit movie from Academy Award-winning director Bong Joon-ho, <br>
starring Robert Pattinson, started in Mickey7 (the inspiration for the film Mickey 17).
Dying isn’t any fun…but at least it’s a living.<br>
Mickey Barnes is an Expendable: a disposable employee on a human expedition sent to colonize the ice world Niflheim. 
Whenever there’s a mission that’s too dangerous―even suicidal―the crew turns to Mickey. After one iteration dies, 
a new body is regenerated with most of his memories intact. After six deaths,
Mickey7 understands the terms of his deal…and why it was the only colonial position unfilled when he took it.',
'-',
'*NPR Best Books of 2022*<br><br>
"Mickey7 is a unique blend of thought-provoking sci-fi concepts, farcical relationship drama and 
exotic body horror. Edward Ashton keeps it all grounded via a protagonist who experiences the wonders of interstellar travel and
alien contact while literally having the worst job in the universe. The result is alternately amusing, intriguing and horrifying, 
with each chapter seeming to engage a different part of your brain." ―Jason Pargin, New York Times Bestselling author <br><br>
“Mickey7 is a mind-bending and powerful exploration of identity. This is why we read science fiction! Highly recommended.” 
―Jonathan Maberry, NY Times bestselling author of Rage and Ink<br><br>
"I loved Mickey 7―a smart, breezy SF novel that doubles as a pitch-black comedy of errors." 
―Dexter Palmer, critically acclaimed author of Version Control',
100,TO_DATE('2025-02-11'), 'mickey7.jpg', 320,'기타 규격' ,9781250385406,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2025-02-12'), to_date('2025-02-12'),null);

insert into book values(BOOK_SEQ.nextval,6,16700,'Educated: A Memoir','Tara Westover',
'A fascinating look at LeWitt''s deceptively simple geometric sculptures, 
which epitomize the artist''s aim "to recreate art" by starting "from square one"',
'-',
null,
100,TO_DATE('2022-02-08'), 'Educated.jpg', 368,'기타 규격' ,9780399590528,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2024-06-23'), to_date('2024-06-23'),null);

--일본 7
insert into book values(BOOK_SEQ.nextval,7,19900,'今夜,世界からこの戀が消えても','一條 岬 著 ',
'원서번역서 내용 엿보기<br><br>

무미건조한 인생을 살고 있는 고등학교 2학년생 가미야 도루. 괴롭힘당하는 친구를 돕기 위해 나섰다가 의도치 않은 일에 휘말린다. 
“1반의 히노 마오리에게 고백하면 더 이상 괴롭히지 않을게.” 어쩔 수 없이 하게 된 거짓 고백. 당연히 거절당할 줄 알았지만, 
히노는 세 가지 조건을 내걸고 고백을 받아들인다. 
<br>“첫째, 학교 끝날 때까지 서로 말 걸지 말 것. <br>둘째, 연락은 되도록 짧게 할 것. <br>
셋째, 날 정말로 좋아하지 말 것.” <br><br>
그렇게 시작한 가짜 연애. 함께 보내는 시간이 쌓여갈수록 히노를 향한 마음은 점점 커져가고, 도루는 세 번째 조건을 깨고 고백을 하고 만다. 
그리고 충격적인 사실을 알게 되는데…. <br>“나는 병이 있어. 선행성 기억상실증이라고 하는데, 밤에 자고 일어나면 잊어버려. 그날 있었던 일을 전부.”<br> 
날마다 기억을 잃는 히노와 매일 새로운 사랑을 쌓아가는 날들. <br>
도루는 히노의 내일을 언제까지고 지켜줄 수 있을까? 이들의 관계를 뒤흔들 어두운 그늘의 정체는 무엇일까?',
'모르는 남자애의, 모르는 여자애<br>
걸음을 뗀 두 사람<br>
이 여름은 언제나 한 번<br>
하얀 공백<br>
모르는 여자애의, 모르는 남자애<br>
마음은 너를 그리니까<br>',
'한 편의 영화를 보는 듯 선명히 그려지는 풍경,<br>
생생하게 살아 움직이는 현실적인 캐릭터,<br>
너무나 사랑스러워 더없이 안타까운 아름다운 청춘의 초상.<br><br>

조건부 연애를 시작한 도루와 히노는 매일 방과 후에 만나 이야기를 나누고, 주말이면 도시락을 싸 들고 벚꽃 구경을 가며 서로를 향한 마음을 쌓아간다.
아직 사랑이라 부르기엔 조심스러운, 두 사람의 설익은 감정이 흩날리는 봄의 벚꽃, 초여름의 자전거, 
한여름의 불꽃놀이와 같은 서정적이고 아름다운 풍경을 통과해가며 점점 무르익어가는 과정이 생생하게 그려진다. 첫사랑의 아련한 감성,
막 시작하는 사랑이 품고 있는 두근거리고, 긴장되고, 아슬아슬한 그 감정을 계절에 따른 변화와 싱그러운 이미지로 고스란히 전달한다.',
100,TO_DATE('2020-02-01'), '오늘밤세계에서.jpg', 311,'A5(210mm X 148mm, 국판)' ,9784049130195 ,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2024-06-23'), to_date('2024-06-23'),null);

insert into book values(BOOK_SEQ.nextval,7,31000,'街とその不確かな壁','村上春樹',
'원서번역서 내용 엿보기<br><br>
첫 발표 이후 43년, 마음에 품어왔던 소설을 마침내 완성하다.<br>
하루키적 상상력의 모든 것이 담긴 결정적 세계!<br><br>
“이 작품에는 무언가 나에게 매우 중요한 요소가 포함되어 있다고,<br>
처음부터 그렇게 느껴왔다.” _무라카미 하루키<br><br>
무라카미 하루키의 신작 장편소설 『도시와 그 불확실한 벽』은 집필과 출간에 얽힌 이야기가 특별하다. 1979년 데뷔 이래, 하루키는 각종 문예지에 소설을 비롯한 다양한 글을 발표했고, 대부분 그 글들을 책으로 엮어 공식 출간했다. 그중 유일하게 단행본으로 출간되지 않아 팬들 사이에서도 오랜 미스터리로 남은 작품이 문예지 〈문학계〉에 발표했던 중편소설 「도시와, 그 불확실한 벽」(1980)이었다.<br><br>
코로나19로 사람들 사이에 벽이 세워지기 시작한 2020년, 그는 사십 년간 묻어두었던 작품을 새로 다듬어 완성할 수 있겠다고 생각했다. 그리고 삼 년간의 집필 끝에 총 3부 구성의 장편소설 『도시와 그 불확실한 벽』을 세상에 내놓았다. 매 작품을 발표할 때마다 ‘하루키 신드롬’을 일으키며 전 세계 독자들의 사랑을 받고 있는 70대의 작가가 청년 시절에 그렸던 세계를 43년 만에 마침내 완성한 것이다.',
'1부 009<br>
2부 221<br>
3부 697<br>
작가 후기 762',
'무라카미 하루키, 6년 만의 신작 장편소설<br>
한국어판 예약판매 직후 종합 베스트셀러 1위<br><br>

무라카미 하루키의 신작 장편소설 『도시와 그 불확실한 벽』이 9월 6일 출간된다. 6년 만에 발표하는 장편소설로 화제가 된 이번 작품은 현지 출간과 동시에 책을 구입하려는 독자들의 행렬과 언론의 취재 열기로 주요 서점이 마비되었고, 2개월 만에 상반기 베스트셀러 1위에 오르며 거장 하루키에 대한 독자들의 관심과 사랑이 여전함을 과시했다.
<br>8월 28일 예약판매를 시작한 한국어판의 반응 역시 뜨거웠다. 예약판매 즉시 교보문고, 알라딘, 예스24 3대 온라인서점의 실시간 베스트셀러에 올랐으며, 이례적으로 예약판매 기간 내내 종합 베스트셀러 1위를 유지하고 있다. 전작인 장편소설 『기사단장 죽이기』와 비교해볼 때 하루 만에 전작의 3일간 판매량을 넘어선 기록이다. 독자들의 뜨거운 반응에 힘입어 문학동네는 예약판매중 급히 중쇄를 결정했으며 9월 4일 기준 3쇄를 제작중이다.
<br>
마음속에 비밀을 품지 않은 사람은 없다.<br>
“진짜 내가 사는 곳은 높은 벽에 둘러싸인 그 도시 안이야.”<br>',
100,TO_DATE('2023-04-12'), '도시와불확실한벽.jpg', 768,'137 * 195 * 48 mm / 948 g' ,9784103534372 ,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2024-06-23'), to_date('2024-06-23'),null);

--중국 8
insert into book values(BOOK_SEQ.nextval,8,19500,'許三觀賣血記 허삼관매혈기','余華',
'《?三??血?》是余?1995年?作的一部?篇小?。 《?三??血?》?述了一?令人感到悲?的故事，?中一次次地?思想和??上描?主人公?三??血的??，
?了他的妻子、他的孩子、他的情?，一次又一次，而在最后一次，?他想到要?自己去?血的?候，血站已?不要他的血了，??的只是老???。 
故事?生于解放初的五六十年代，那?主人公?三??是一??年，他被周?生活不?地?迫，?了生活，不得不?命地工作，但是依然无法保?生活，
他只能用?血??持，每?无奈?，就?想到用?血?解?。?着?月的流逝，?三?身?一日不如一日。他?了??子治病，?持15天?一次血，以??欠?，最后?致大病不起。 
小???着?血的??，展??三?生活中的??事事，??出一?男人所??承?的某些?任，或??也正是一?人生的无奈。小??含辛酸的??，但也不乏幽默之?，比如每次?血前喝足八碗水，
??身上的血就?多起?了，?如此?的奇怪想法非常多。',
'中文版（再版）自序<br>
?文版自序<br>
德文版自序<br>
意大利文版自序<br>
?三??血?<br>
外文版??摘要<br>',
null,
100,TO_DATE('2025-04-07'), '허삼관매혈기.jpg', 192,'180x255mm' ,9787506365680 ,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'n', to_date('2012-09-12'), to_date('2024-04-07'),null);

insert into book values(BOOK_SEQ.nextval,8,41000,'畵猫·夢唐 화묘몽당 (精裝, 第1版) ','과지라',
'瓜幾拉又一本關于猫的全新?本。以猫擬人,講述了發生在唐朝的各?傳奇故事。
全?主要內容分爲“唐朝的娛樂休?”“唐朝的黑夜怪談”“唐朝的動物奇?”“唐朝的國色天香”“唐朝的?氣民俗”,從多個角度出發,描?那些曾經發生在盛世唐朝的曲折離奇的傳奇故事。
關于猫,生活中有太多趣事,關于唐朝,歷史上有太多奇聞。于是,瓜幾拉在一些日常生活中的小故事的基?上,結合唐朝的歷史,構造出這?一本由衆猫出演的?本集。<br>
<br>
당나라를 배경으로 한 고양이 화보집으로 고양이 캐랙터로 당조의 각종 전기와 고사를 묘사했다. 
당조의 놀이와 유희, 당조의 신기한 동물, 당조의 절세미인, 당조의 절기민속 등 당나라의 다양한 생활상과 이야기를 귀여운 고양이 화보집으로 담았다.',
'-',
null,
100,TO_DATE('2025-04-07'), '화묘묭당.jpg', 125,'200*290m' ,9787535673831 ,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'n', to_date('2015-10-01'), to_date('2024-04-07'),null);
--기타 9
insert into book values(BOOK_SEQ.nextval,9,18000,'AROUND(2025.4.월.100호)(어라운드)','편집부',
'먼저, 《AROUND》의 100번째 이야기를 독자분들 곁에 꺼내둘 수 있어 기쁜 마음을 첫 문장에 담아둡니다. 
그간 나와 우리의 주변을 살피고, 오랫동안 보듬고 싶은 이야기들을 건져 올린 《AROUND》는 이번 호를 ‘일과 일상 사이’로 이름 지었어요. 
우리는 모두 저마다 일을 하며 살아갑니다. 사람 수만큼 일의 형태도 다양하기에 혼자 또는 함께하거나 규칙적으로 또는 이따금 임하겠지요. 
일을 대하는 마음가짐이나 그로부터 얻는 의미, 일 안팎으로 삶의 균형을 잡는 법도 저마다 다르리라 생각합니다. 갖가지 다름 속에서 똑같은 것을 골라내 보자면, 
내가 가진 시간과 노력, 마음을 쏟는 그 ‘일’이 바로 나의 존재를 증명하는 행위라는 것 아닐까요?
이번 호에서는 일과 일상을 잘 버무려 살아가고 있는 사람들을 떠올려봤습니다.
고뇌하기도 지루하기도 때론 기쁘기도 한 나날 속에서 중심을 지키고자 노력하는 우리는 저마다 다른 일을 하더라도 같은 마음을 겪어내고 있지요. 
살아가는 우리 모두의 이야기이자, 앞으로도 잘 해내고 싶은 우리 모두의 고민을 이번 호를 통해 나누고 싶어요.
끝으로, 《AROUND》의 숱한 시간을 지켜봐 주신 독자분들께 감사를 전하고 싶습니다. 
어라운드의 문장과 장면에 깊은 공감과 응원을 보내주셔서 진심으로 감사드리며, 
앞으로도 우리는 일과 일상 사이를 가벼이 오가며 오랫동안 반짝일 삶의 조각들을 안겨드릴게요. 
새로운 계절을 맞이하는 4월, 어라운드와 함께 자분자분 걸어보아요.',
'[목 차]
Contents<br><br>
006 Pictorial 우리의 시선을 나눕니다<br>
Looking Around Us<br><br>
Creation<br>
024 Interview 영원한 소년의 얼굴로<br>
장기하 뮤지션<br>
038 둥글게 이어 붙인 세계<br>
조희진 공예가<br>
046 재미 따라 걷는 사람<br>
이수지 그림책 작가<br>
056 어라운드의 100번째 시선: 창작<br>
Collection<br>
068 Interview 아부, 유쾌하고 말랑한!<br>
조아란 마케터<br><br>
078 Culture 보기 드문 인생들<br>
092 Interview 어라운드의 100번째 시선: 수집<br><br>
Daily Life<br>
104 Interview 일상과 비일상 사이의 다정<br>
남궁인 응급의학과 의사·작가',
null,
100,TO_DATE('2025-04-07'), 'AROUND.jpg', 192,'180x255mm' ,9791167540416 ,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2024-04-07'), to_date('2024-04-07'),null);

insert into book values(BOOK_SEQ.nextval,9,10000,'보드게임 2025.5.6','코리아보드게임즈 편집부',
'보드게임과 놀이 산업의 이해로 무장한 전문 집필진이 보드게임 잡지를 편찬합니다. 
보드게임에 얽힌 다양한 이야기를 흥미진진하게 소개합니다. 이번에 나온 신작이 어떤 것이 있는지 둘러 보고, 
오랜 세월을 거치며 입증된 명작 보드게임도 만나 보세요.',
'기억과 보드게임<br>
람세스 들여다보기<br>
밀리메모리 개발기<br>
편집인의 선택<br>
교실 돋보기<br>
정을식 선생님이 선택한 게임<br>
전문가에게 묻다<br>
신작 소식<br>
게임 시스템 이야기<br>
보드게임 100<br>
보드게임 일상을 그려요<br>
에세이 한 편<br>
작은 로봇, 강렬한 재미! 헥스봇<br>
김군의 그래비트랙스 트랙 가이드<br>
그래비트랙스 줌인<br>
행사 소식<br>
보드게임 뉴스',
'교육과 관련한 다채로운 콘텐츠<br>
격월간《보드게임》은 교육과 관련한 콘텐츠들을 선보입니다. 보드게임과 교육이 만나 펼쳐지는 다채로운 경험을 체험해 보세요.<br>
<br>- 교실에서 수업시간에 보드게임을 하는 선생님들은 어떤 마음으로 하시는 걸까요? 《교실 돋보기》를 읽으면서 열정 넘치는 선생님들의 가지각색 이야기를 만나보세요.
<br>- 어린이와 보드게임을 하며 어려움을 겪고 계신가요? 다른 사람도 같은 고민을 하고 있을지도 몰라요. 전문가의 답변을 들으며 내가 하는 고민의 실마리를 찾아 보세요.
',
100,TO_DATE('2025-04-25'), '보드게임.jpg', 124,'180*245mm' ,9772508407001 ,'n',1);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2025-04-25'), to_date('2025-04-25'),null);
--과학 10
insert into book values(BOOK_SEQ.nextval,10,22000,'수학의 중력','야우싱퉁',
'★★하버드대학교 수학과 명예교수·필즈상 수상자 야우 싱퉁이 따라간
우주와 시공간의 비밀을 밝히는 기하학의 발자취!★★<br>
일반상대성이론 이후 수학적 발전을 총망라하는 물리학과 수학의 최전선 시공간을 설명하는 방정식과 우주론들은 어떻게 탄생했는가?<br>
수학과 물리학이 함께 써내려간 놀라운 발견의 대서사시',
'들어가며 물리학과 수학이 함께 추는 춤<br>
전주곡 원뿔을 자르는 방법은 하나만이 아니다<br><br>
1장 낙하하는 물체, 패러다임의 전환<br>
: 특수상대성이론과 중력 이론의 실마리<br><br>
2장 일반적인 길로 향하는 여정<br>
: 리만 기하학과 일반상대성이론의 발전<br><br>
3장 비선형적 상호작용<br>
: 중력장 방정식의 완성<br><br>
4장 가장 특이한 해답<br>
: 방정식의 첫 번째 해, 블랙홀과 특이점',
'김상현 (고등과학원 수학부 교수·《수학은 상상》 저자)<br>
“진리보다는 아름다움을 우선한다”는 수학자 헤르만 바일의 말에 잘 드러나듯, 수학자는 심미주의자이다. <br>
아무리 아름다워도 현실에 어긋나는 이론은 용납할 수 없는 물리학자와는 다르다. <br>
그런데 신비하게도 물리학자의 우주는 엄밀한 수학적 이론을 따른다. 반대로, 수학자의 모든 방정식 중 가장 아름다운 것은 우주의 방정식이다. 
이렇게 신비하고도 필연적인 협력으로 지난 세기 인류는 급진적 발전을 이루었다. 그 현장에 있던 야우싱퉁은 핵심을 꿰뚫는 수학적 서사로 중력과 상대성이론을 설명하고 있다. 
<br>독특한 주제, 쉽고 독창적인 설명, 저자의 경외감이 어우러져 손에서 놓을 수 없는 매력적인 책이다.',100,TO_DATE('2025-01-23'), '수학의 중력.jpg', 344,'기타 규격' ,9788990247919,'n',0); -- 과학 10

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,123456,100, 'y', to_date('2025-02-07'), to_date('2025-02-08'),null);

insert into book values(BOOK_SEQ.nextval,10,19900,'코스모스','칼 세이건',
'현대 천문학의 거장 칼 세이건이 펼쳐 보이는 대우주의 신비<br>
전 세계 60개국에 방송되어 6억 시청자를 감동시킨 텔레비전 교양 프로그램을 책으로 옮긴 칼 세이건(Carl Sagan)의 <코스모스(Cosmos)>가 (주)사이언스북스에서 출간되었다. 
1980년에 1판이 출간된 이래 영어판만 600만 부가 팔리고 ≪뉴욕 타임스≫ 베스트셀러 목록에 70주 연속 실린 이 책은 역사상 가장 많이 읽힌 과학책이자
시대와 국경을 뛰어넘어 우주 탐험의 희망을 심어 준 교양서의 걸작으로 평가받아 왔다.<br>
현대 천문학을 대표하는 저명한 과학자인 칼 세이건은 이 책에서 사람들의 상상력을 사로잡고, 난해한 개념을 명쾌하게 해설하는 놀라운 능력을 마음껏 발휘한다. 
그는 에라토스테네스, 데모크리토스, 히파티아, 케플러, 갈릴레오, 뉴턴, 다윈 같은 과학의 탐험가들이 개척해 놓은 길을 따라가며 과거, 현재, 미래의 과학이 이뤘고, 이루고 있으며, 
앞으로 이룰 성과들을 알기 쉽게 풀이해 들려준다. <br>
그리고 과학의 발전을 심오한 철학적 사색과 엮어 장대한 문명사적 맥락 속에서 코스모스를 탐구한 인간 정신의 발달 과정으로 재조명해 낸다.',
'Chapter 1 코스모스의 바닷가에서 <br>
Chapter 2 우주 생명의 푸가 <br>
Chapter 3 지상과 천상의 하모니 <br>
Chapter 4 천국과 지옥 <br>
Chapter 5 붉은 행성을 위한 블루스 <br>
Chapter 6 여행자가 들려준 이야기 <br>
Chapter 7 밤하늘의 등뼈 <br>
Chapter 8 시간과 공간을 가르는 여행',
'시간과 공간을 초월한 빅 히스토리〈코스모스〉<br><br>
1980년 7억 5천만이 시청한 칼 세이건의〈코스모스〉가 2014년, 내셔널지오그래픽채널에서 더 화려하게 부활한다!<br>
〈코스모스〉는 진행자인 닐 타이슨 박사와 함께 시간과 공간을 여행하는 방식으로 전개된다. 
닐 타이슨 박사는 원작에서도 등장했던 ‘상상의 우주선(SOTI, Ship of the imagination)’을 타고
자연의 법칙과 생명의 기원을 찾아 광대한 우주 공간과 137억년의 시간을 자유롭게 항해하는 모습을 선보인다. 
기존 다큐멘터리를 뛰어넘는 지구와 자연의 아름다움을 담아낸 영상미뿐만 아니라 우주의 신비로움을 표현한 그래픽, 역사 속 에피소드를 재현한 애니메이션 등 다양한 표현방식을 살펴보는 것도 큰 볼거리다. 
13부작, 매주 토요일 밤 11시 내셔널지오그래픽채널 방송 (2014년 3월 15일 첫방송)',100,TO_DATE('2012-12-31'), 'cosmos.jpg', 719,'기타 규격' ,9788983711892,'n',0); -- 과학 10

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,123456,100, 'y', to_date('24-08-18'), to_date('24-08-19'),null);

insert into book values(BOOK_SEQ.nextval,10,24000,'다가올 초대륙 - 지구과학의 패러다임을 바꾼 판구조론 히스토리','로스 미첼',
'“우리가 발 딛고 서 있는 지구를 이해한다는 것은<br>
곧 우리 자신을 이해하는 가장 탁월한 방식이다.”<br><br>
지난 세기 초반까지만 해도 인류는 지구 내부에 대해 거의 알지 못했다. 그러다가 지진으로 발생한 진동을 통해 지구 내부를 연구하는 학문인 지진학이 태동하고, 
제2차 세계대전 중 잠수함에 승선해 해저 지도 제작에 참여한 지질학자들에 의해 바다 밑 지구의 실제 모습이 포착되면서 지질학은 판구조 혁명의 시기를 맞이했다. 
판구조론은 대륙 이동을 설명하는 지질학 이론으로 오늘날 대다수가 상식으로 받아들이는 과학 이론이다. 요즘 우리는 흔히 지구가 ‘오대양 육대륙(남극 대륙까지 포함하면 칠대륙)’으로 구성됐다고 말하지만 
시간을 2~3억 년 전으로 거슬러 올라가면 이야기가 달라진다.<br>
과거에 지구 대부분의 대륙은 하나의 판으로 모여 있었는데, 이를 ‘판게아’라고 부른다. ‘판게아’는 판구조학의 선구자 알프레트 베게너가 명명한 이름으로 ‘모든 땅’이라는 의미다. 
놀랍게도 ‘판게아’는 ‘초대륙(Supercontinent, 여러 대륙이 하나로 뭉친 대륙)’이라고 불리는 현상의 가장 최근 버전일 뿐이다. 
지질학자들의 연구에 따르면 지구가 탄생한 뒤로 약 45억 년에 이르는 기간 중 판게아 외에 적어도 두 번의 초대륙이 더 존재했다(‘로디니아’와 ‘컬럼비아’가 그것들이다).
또한 지질학자들은 판게아 이후 초대륙이 또 한 번 더 생성되리라고도 전망한다. 물론 2억 년도 더 뒤의 일이기는 하지만 말이다. 
한 컴퓨터 모델에 따르면 그때가 도래하면 남아메리카 서부 해안에 위치한 페루 리마와 미국 동부 해안가에 위치한 뉴욕시가 충돌할 것으로 예측된다. 
이처럼 지구의 판구조 운동은 하나의 도시를 다른 도시 위에 쌓아 올릴 만큼 강력하며, 하나의 대륙을 바다 깊은 곳으로 내려 보내 뜨거운 맨틀로 재활용하게 만드는 놀라운 메커니즘이다.',
'ㆍ 추천의 글<br>
ㆍ 서문<br><br>
ㆍ 역사는 반복된다<br>
ㆍ 판게아<br>
ㆍ 로디니아<br>
ㆍ 컬럼비아<br>
ㆍ 미지의 시생누대<br>
ㆍ 다가올 초대륙<br>
ㆍ 아마시아에서 살아남기<br><br>
ㆍ 감사의 말<br>
ㆍ 주',
'인류의 생존을 위협하는 기후 위기의 시대,<br>
우리에게 필요한 것은 지질 문해력이다!<br><br>
2002년 《내셔널 지오그래픽》은 ‘지리 문해력(Geo-literacy)’이라는 제목의 연구 보고서를 발표했다. 
지리 문해력이란 인간과 자연의 관계 및 자신이 속한 사회와 문화에 대한 이해력으로, 
이 보고서에 따르면 앞으로 인류가 자연과 문화 자원을 보호하고 각종 위기로부터 스스로를 지키기 위해서는 지리 문해력이 필요하다고 한다. 
여기에 착안해 《다가올 초대륙》의 저자는 우리 인류에게 그 어느 때보다 ‘지질 문해력’이 필요한 시기가 도래했다고 이야기한다. 
지구온난화와 같은 기후변화가 인류의 생존을 위협하는 현실에서 지구 전체의 물리적 구조와 메커니즘을 연구하는 지질학에 대한 이해 없이 
기후변화에 대응할 만한 의미 있는 논의를 진척시키기 어렵다는 지적이다.',100 , TO_DATE('2025-04-21'), 'cosmos.jpg', 360,'기타 규격' ,9788965967064,'n',5); -- 과학 10

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,123456,100, 'y', to_date('2025-04-23'), to_date('2025-04-23'),null);

--로맨스 11
insert into book values(BOOK_SEQ.nextval,11,22000,'온전한 결핍 1','김바림',
'STORY<br>
열일곱, 온주영의 목표는 하나였다. 좋은 대학에 가서 낡고 좁은 집에서 벗어나는 것. 그런 온주영 앞에 고태열이 나타났다. 불량해 보이는 태도와 다르게 꿈을 말하는 그의 눈에는 자신감이 가득했다. 태열의 곁에서라면 주영 역시 하고 싶은 일을 찾아볼 수 있을 것 같았다. 설렘과 기대도 잠시, 유일한 보호자인 엄마가 쓰러지고 주영 앞에 존재를 몰랐던 친부, 서재건이 나타난다. 건설사 대표인 친부의 집에서 경제적인 풍족을 누리지만 그럴수록 태열과의 물리적, 심리적 거리는 점점 멀어진다. 주영은 혼외자인 자신을 못마땅하게 여기는 친할머니의 압박을 이기지 못해 태열에게 이별을 고한다.
<br>서른둘, 서주영으로 성공적인 커리어를 이어가던 주영은 카페 프랜차이즈 대표가 된 태열과 재회한다. 집안이 맺어 준 약혼자와의 결혼을 앞두고 있지만, 여전히 자신을 온주영으로 보는 그에게 흔들리는데…….',
'1. 옆집 그 애<br>
2. 989889<br>
3. 사귈까<br>
4. 투 아웃<br>
5. 온성희, 서재건<br>
6. 성북동<br>
7. 우산만 빌릴게<br>
8. 안녕, 고태열<br>
9. “l’m on the right track, and you?”<br>
10. 다시 꺼내 볼 수 없는 새드 엔딩<br>
11. 카페 202<br>
12. 네가 아는 번호 11자리<br>
13. 김상진<br>
14. 기다린다고 했잖아',
'카카오페이지 기다리면 무료 작품!<br>
조회수 90만, 평점 9.8점!<br><br>
카카오페이지 론칭 이후 꾸준한 사랑을 받아 온 김바림 작가의 『온전한 결핍』이 책으로 출간된다.<br><br>
집안의 반대로 헤어져야만 했던 연인 온주영과 고태열의 애틋한 재회를 담았다. 꿈과 현실 사이에서 고민하는 두 주인공의 갈등과 성장을 현실적으로 표현하며 독자들에게 깊은 여운을 남겼다. 첫 작품이라 할 수 없을 만큼의 안정적인 필력과 묘사로 독자들의 호평을 받았다.',
100,TO_DATE('2025-03-27'), '온전한결핍1.jpg', 448,'130 * 190 * 25 mm / 566 g' ,9791172590802,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,123456,100, 'y', to_date('2025-03-27'), to_date('2025-03-27'),null);

insert into book values(BOOK_SEQ.nextval,11,12000,'사랑은 하트 모양이 아니야','김효인',
'정반대라고 해도 될 정도로 나와 다른 사람에게 끌리는 상황은 로맨스 장르의 유구한 클리셰 중 하나다. 
멀리 떨어져 있던 두 존재가 갖가지 난관을 헤치며 가까워지는 과정이란 그토록 매력적이다. 
《사랑은 하트 모양이 아니야》 또한 이 공식을 따르지만, 클리셰가 인물을 넘어 소재에도 적용되어 있다는 점에서 더 짙은 호소력을 지닌다.<br><br>

《사랑은 하트 모양이 아니야》의 두 수록작을 이끌어 가는 소재는 죽음과 호르몬이다. 
〈로으밤 로으밤〉의 주인공 록기는 자신이 며칠 뒤에 죽는다는 정보를 입수하고 마지막 여행길에 오른다. 
〈사랑은 하트 모양이 아니야〉의 주인공 세린은 ‘사랑 호르몬’을 잃은 상태이고 남편과 이혼을 준비 중이다. 
행복이며 낭만과는 거리가 한참 먼 곳에서 이야기를 시작한 두 사람은 독특한 출발점만큼이나 
색다른 전개를 거쳐 자신이 로맨스 스토리의 주인공임을 분명하게 보여 준다.<br><br>

김효인 작가는 한국판 오리지널 SF 앤솔로지로 화제를 모은 시네마틱 드라마 시리즈 ‘SF8’ 중 한 작품인 
〈우주인 조안〉의 원작자다. 황폐해진 세상에서도 빛을 발하는 사람과 삶에 대한 애정을 따스하게 그려 냈던 작가는 
《사랑은 하트 모양이 아니야》에서 보다 긴 호흡으로, 조금 더 낯선 각도로 사랑을 조명한다. 
‘사랑이란 무엇인가’라는 사유를 담은 작품들은 흥미로운 연애담이자 사랑의 본질에 대한 깊은 탐구의 기록이다.',
'로으밤 로으밤 · 6p<br>
사랑은 하트 모양이 아니야 · 108p<br><br>

작가의 말 · 218p<br>
프로듀서의 말 · 222p<br>
',
'사랑이란 ‘빠지는’ 것이 아니라 ‘행동하는’ 것<br>
세린은 집에 갇혀 있기도 하고 과학적 사실에 갇혀 있기도 하다. 
호르몬 수치가 곧 사랑의 지표라 굳게 믿고 있기에 호르몬의 작용만으로는 설명하기 어려운 감정과 행동을 쉽게 받아들이지 못한다. 
록기는 연애와 담을 쌓듯이 지내 온 자신의 과거와 머잖아 닥칠 자신의 죽음에 갇혀 있다. 사랑이 찾아왔음을 바로 감지하지 못하고, 
겨우 감지한 뒤에는 마음을 밖으로 꺼내지 못한다.',
100,TO_DATE('2025-02-14'), '사랑은하트모양이아니야.jpg', 228,'100*182mm' ,9791193024928,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,123456,100, 'y', to_date('2025-02-14'), to_date('2025-02-14'),null);
--헬스 12
insert into book values(BOOK_SEQ.nextval,12,20000,'귀하신 몸 근골격계','EBS 귀하신 몸',
'EBS 화제의 건강 프로그램 〈귀하신 몸〉 공식 단행본<br><br>
내 몸을 살리는 습관,<br>
관절을 지킬 골든타임을 사수하라!<br><br>
EBS 화제의 건강 프로그램 〈귀하신 몸〉의 방송 중 근골격계 관련 회차만을 엄선해 한 권으로 엮었다. 
《귀하신 몸: 근골격계》는 어깨, 목, 무릎, 허리, 골반, 발 등 
고질적인 관절 통증을 유발하는 부위와 해당 근골격계 질환을 정리해 식습관과 운동법 등 생활 습관의 변화만으로 통증을 없애는 솔루션을 제시한다.<br>
오십견, 골반 불균형, 목 디스크, 척추측만증 등 일상생활 속 누구나 ‘나도?’ 하고 생각해 봤을 질환들을 집에서 정확히 진단하는 방법을 소개하고, 그에 맞춰 통증을 개선하는 운동법을 제시한다. 책에서 소개하는 2주 솔루션을 따라 하다 보면 자연스럽게 몸의 변화를 체감할 수 있다. 국내 명의, 운동 전문가, 영양사로 구성된 대한민국 최고 전문가단이 처방한 2주 완성 홈케어 처방전은 뼈 건강을 걱정하는 모두를 위한 주치의가 되어 줄 것이다.',
'감수의 글<br>
프롤로그<br>
이 책의 활용법<br><br>
1장 삶을 짓누르는 어깨 통증<br>
2장 몸이 무너지는 신호, 골반 통증<br>
3장 척추측만증, 당신의 척추는 몇 도입니까?<br>
4장 구멍 난 뼈 건강, 골다공증은 습관이 약이다<br>
5장 수술 전, 내 무릎 지키는 법<br>
6장 지긋지긋한 허리 통증 탈출기<br>
7장 목 디스크 막는 2주의 기적<br>
8장 노화가 아니라 질병이다, 근감소증<br>
9장 걷는 족족 찌릿, 발 통증 탈출기<br>',
'★질환별 맞춤 운동법 동영상 QR 코드 수록★<br>
★유튜브 누적 조회수 4000만★<br><br>
“어깨가 안 아픈 사람도 있나요?”<br>
귀하신 당신의 몸을 위한 14일 통증 해방 프로젝트<br>
“허리가 왜 이렇게 찌뿌둥하지?” “어깨가 안 아픈 사람도 있나?” “삭신이 쑤시는 건 뭐 늘 있는 일이죠.” 경미한 관절 통증은 우리가 일상적으로 느끼는 것이라 감내하고 그냥 지나치기 마련이다. 잠깐 뼈가 쑤시는 정도로 병원에 가기엔 모두의 일상이 너무나도 빡빡하다. 하지만 초기 통증을 방치하다가는 큰 병이 되기 십상이고, 아차 싶을 때는 이미 돌이킬 수 없는 강을 건넌 후다. 몸을 귀하게 여기지 않는 사람들을 위하여, 오천만 국민의 만성 통증 해방을 목표로 EBS 〈귀하신 몸〉은 시작되었다. 《귀하신 몸: 근골격계》는 근골격계 관련 회차들을 엄선해 제작된 단행본으로, 단순한 정보 전달에서 그치지 않고 독자가 스스로 해낼 수 있는 정확한 진단법, 어디에서나 손쉽게 할 수 있는 맞춤형 운동법, 평생 습관이 되는 생활 교정법을 담았다. 이를 위해 국내 대학병원 명의, 자세 전문가, 영양사로 구성된 전문가단이 모여 직접 질환별 맞춤 진단법, 운동법, 생활 습관 교정법을 처방했다. 전문가단의 솔루션을 먼저 체험한 사례자들은 하나같이 찬사를 보냈다. “과연 2주로 될까 싶었는데 정말 통증이 없어졌어요.” 누구보다 귀하신 당신의 몸을 위하여, 이제 당신도 변할 시간이다.',
100 , TO_DATE('2025-04-30'), '귀하신몸.jpg', 276,'기타 규격' ,9788925573700,'n',33);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'n', to_date('2024-04-25'), null,null);

insert into book values(BOOK_SEQ.nextval,12,20000,'그림으로 요가하자 : 궁금해요가','오연진',
'저자가 처음 요가를 시작한 이유는 멋진 아사나에 대한 도전과 성취감 때문이니다. 하지만 시간이 지나면서 몸이 따라주지 않는 순간들이 찾아왔고, 기쁨보다 좌절과 괴로움이 커지기 시작했다. 그렇게 요가가 뜻대로 되지 않아 방황하던 시기에, 단 하나의 해결책을 만났다.
<br><br>
제주 수련에서 만난 이 단순한 가르침은 요가를 대하는 태도를 완전히 바꿔놓았다. ‘잘하고 싶다’는 욕심에서 벗어나, 요가는 어느새 자연스러운 일상이 되었다. 마음이 흔들릴 때도, 바람이 불어 호수가 일렁일 때도, 이제는 조급해하지 않고 그저 호흡을 하며 기다릴 수 있게 되었다.
<br><br>
이 책은 그런 변화의 기록이자, 요가를 통해 발견한 깨달음들을 그림으로 담아낸 이야기이다. 멋진 아사나를 꿈꾸는 사람, 요가를 하다 지치고 흔들리는 사람, 그리고 요가를 더 깊이 알고 싶은 모든 이들에게 전하는 따뜻한 경험담이자 공감의 기록이다.','-',
'“잘하고 싶은 마음에서, 그냥 하는 마음으로”<br>
처음 요가를 시작한 이유는 멋진 아사나에 대한 도전과 성취감 때문이었습니다. 하지만 시간이 지나면서 몸이 따라주지 않는 순간들이 찾아왔고, 기쁨보다 좌절과 괴로움이 커지기 시작했습니다. 그렇게 요가가 뜻대로 되지 않아 방황하던 시기에, 단 하나의 해결책을 만났습니다.
<br><br>
“그냥 해라! 그냥 하면 된다.”<br>
제주 수련에서 만난 이 단순한 가르침은 요가를 대하는 태도를 완전히 바꿔놓았습니다. 
‘잘하고 싶다’는 욕심에서 벗어나, 요가는 어느새 자연스러운 일상이 되었습니다. 마음이 흔들릴 때도, 바람이 불어 호수가 일렁일 때도,
이제는 조급해하지 않고 그저 호흡을 하며 기다릴 수 있게 되었습니다.',
100 , TO_DATE('2025-03-20'), '그림으로 요가하자.jpg', 232,'210*220mm' ,9791199176805,'n',11);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'n', to_date('2025-03-20'), null,null);

--역사 13
insert into book values(BOOK_SEQ.nextval,13,22000,'가요로 읽는 한국사 - 시대의 노래 역사가 되다','권경률',
'금지곡과 국민가요의 현대사를 관통하는 한국사 플레이리스트<br>
용비어천가부터 트로트까지, 신해철부터 소녀시대 ‘다시 만난 세계’까지<br><br>
노래는 시대와 교감한다. 동시대인이 꿈에 그리거나 가슴 아파하는 것을 건드렸을 때 노래는 의미를 확장하며 세상을 뒤흔든다.<br>
“사랑해 널 이 느낌 이대로 / 그려왔던 헤매임의 끝”<br>
2024년 12월, 서울 곳곳에서 소녀시대의 〈다시 만난 세계〉가 울려 퍼졌다. 대통령 탄핵 촉구 집회 현장에서였다. 
함께 부르면 힘이 난다는 이 노래는 2010년대부터 집회 현장에서 인기곡으로 부상했다. 
‘시대의 노래’는 사람들의 바람과 응어리가 투영되었을 때 탄생하며 이런 노래들은 역사 속으로 들어가는 또 하나의 ‘문’이다.<br>
《가요로 읽는 한국사》는 한국인이 사랑한 ‘노래’를 중심으로 한국사를 들여다본다. 용비어천가 등 고대가요부터 민족의 응어리를 응집한 ‘아리랑’, 전쟁 속의 인간성을 담았던 ‘굳세어라 금순아’, 7~80년대의 민중가요와 2000년대 k팝에 이르기까지 시대의 숨결과 맥박을 드러낸 가요를 통해 역사를 탐구한다. 아울러 금지곡과 군국가요 등 노래가 핍박받고 이용당한 어두운 면도 함께 살핀다.',
'
책을 펴내며_시대의 노래, 역사가 되다<br><br>
1부. 시대정신을 노래하다<br>
케이팝은 한국 민주주의의 결실이다 - 〈다시 만난 세계〉와 떼창의 힘<br>
‘마왕’ 신해철의 응원법 - 〈날아라 병아리〉와 뉴밀레니엄 시대<br>
상심한 어른을 응원한 아이들의 노래 - 창작동요 〈반달〉과 일제강점기 어린이 운동<br>
유행가에 비친 식민지 조선의 두 얼굴 - 트로트 황금기와 일제 침략전쟁<br>
독립군의 용진법, 항일운동의 용감력 - 독립군가와 항일가요<br>
정몽주는 과연 고려를 지키려고 이성계에 맞섰을까? - 〈단심가〉와 고려 멸망 비사<br>
육룡이 나르샤, 천명을 받아 나라 세웠으니 - 《용비어천가》에 담긴 조선 건국사<br><br>
2부. 권력과 노래<br>
박정희 대통령의 신청곡이 금지된 까닭은? - 〈동백아가씨〉와 한일 국교 정상화<br>
‘그리운 내 형제’는 왜 북송선에 탔을까? - 재일동포 모국 방문과 〈돌아와요 부산항에〉<br>
‘가요계 정화’ 표적 된 한국 록의 대부 - 〈미인〉과 유신헌법 긴급조치<br>
올림픽과 3S 정책에 매달린 정권 - 〈아! 대한민국〉과 제5공화국<br>
민주화운동 북돋운 저항의 노래 - 86세대 혈관 도는 민중가요<br>
‘천재 시인’ 정지상을 벤 라이벌의 시기심 - 〈송인〉과 서경천도운동<br>
수로부인은 비를 부르는 신녀였다 - 〈해가〉와 신라 기우제<br>',
null,
100,TO_DATE('2025-04-11'), '가요로읽는한국사.jpg', 340,'기타 규격' ,9791164712823,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,123456,100, 'y', to_date('2025-04-11'), to_date('2025-04-11'),null);

insert into book values(BOOK_SEQ.nextval,13,17500,'거꾸로 읽는 세계사','유시민',
'1988년 초판 출간 이후 스테디셀러로 굳건히 자리를 지켰던 유시민의 『거꾸로 읽는 세계사』의 전면개정판. 
‘전면개정’이라는 수식이 무색할 정도로 30년 넘게 축적된 정보를 꼼꼼하게 보완하고, 사건에 대한 해석을 바꿨으며,
같은 문장 하나 두지 않고 고쳐 쓴 ‘새로운’ 책이다.
<br><br>
『거꾸로 읽는 세계사』 독자 리뷰 중에는 세계사 공부의 길잡이 역할을 해줬다는 내용을 쉽게 찾을 수 있다. 애초에 한국사회를 바로 보기 위해 세계 곳곳에서 벌어진 일들을 공부했고, 그것을 나누고 싶어 쓴 책이기에 지식을 전달하는 안내자로서의 역할에 충실한 것이 사실이다. 그래서일까. 이 책은 쉽고 재미있다. 지식소매상 유시민만의 스토리텔링은 과감 없이 발휘되고, 짧게는 20년 길게는 100년 넘게 진행된 일련의 일들이 한 편의 영화처럼 흘러간다.',
'
서문: 오래된 책을 다시 펴내며<br><br>

1 드레퓌스 사건: 20세기의 개막<br>
반역자 드레퓌스 ｜ 피카르 중령이 찾은 진실 ｜ 에밀 졸라의 고발 ｜ 법률적 종결 ｜ 정치적 해결 ｜ 지식인의 시대<br><br>

2 사라예보 사건: 광야를 태운 한 점의 불씨<br>
사라예보의 총성 ｜ 유럽의 내전 ｜ 최초의 세계전쟁 ｜ 달도 삼켰을 제국주의<br><br>

3 러시아혁명: 아름다운 이상의 무모한 폭주<br>
핀란드역에서 ｜ 피의 일요일과 포템킨호 반란 ｜ 건전한 독재에서 국정농단과 혁명으로 ｜ 레닌, 싸우는 사람 ｜ 볼셰비키혁명 ｜ 이카로스의 추락
<br><br>
4 대공황: 자유방임 시장경제의 파산<br>
뉴욕의 ‘끔찍한 목요일’ ｜ 남아도는 오렌지, 굶주리는 아이들 ｜ 루스벨트와 히틀러 ｜ 케인스혁명 ｜ 대공황의 유산
<br><br>
5 대장정: 중화인민공화국 탄생의 신화<br>
여덟 번째 통일 영웅 ｜ 숙명의 라이벌 ｜ 홍군의 탈출 ｜ 양쯔강을 건너다 ｜ 지구전 ｜ 시안사건 ｜ 붉게 물든 대륙 ｜ 신민주주의
<br><br>
6 히틀러: 모든 악의 연대<br>
바이마르공화국 ｜ 나의 투쟁 ｜ 제2차 세계대전 ｜ 홀로코스트 ｜ 악의 비속함',
'한 시대를 풍미했던 베스트셀러의 귀환<br>
100만 독자를 사로잡은 ‘이야기의 힘’<br>',
100,TO_DATE('2021-10-29'), '거꾸로 읽는 세계사.jpg', 404,'152*223mm (A5신)' ,9791191438406,'n',12);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,123456,100, 'y', to_date('2024-04-11'), to_date('2025-04-11'),null);

--요리 14
insert into book values(BOOK_SEQ.nextval,14,16800,'최강록의 요리 노트-요리가 즐거워지는 셰프의 기본 공식','최강록',
'<마스터셰프 코리아 2> 우승자이자 현재 요리 유튜버로 활동 중인 셰프 최강록의 요리 에세이. 단순한 레시피나 맛집 소개가 아닌 주로 ‘재료와 맛’에 대한 설명을 담고 있다. 달걀은 몇 분 삶아야 하는지, 채소를 아삭하게 만드는 방법이나 고기를 맛있게 굽는 방법이 따로 있는지, 생선회를 제대로 즐기는 방법은 무엇인지 등 재료가 가진 맛을 제대로 이끌어낼 수 있도록 친절한 설명으로 독자들을 안내한다.',
'머리말: 어떻게 하면 요리를 잘할 수 있냐고요?<br><br>
맛을 쉽게 발견하는 방법<br><br>
밥<br>
라면<br>
달걀<br>
채소<br>
두부<br>
고기<br>
생선<br>
김치<br>
육수<br>
기름<br>
소금과 설탕<br>
간장과 된장<br>
식초와 미림<br><br>

부록: 냉장고 청소',
'20만 유튜버이자 셰프 최강록의 진심 가득한 요리 에세이<br>
냉장고 속 달걀, 채소, 두부, 고기, 생선 등 식재료부터<br>
간장, 소금, 설탕 등 조미료까지 최강록만의 100% 활용법<br>',
100 , TO_DATE('2023-08-14'), '최강록의요리노트.jpg', 200,'B6(188mm X 127mm, 사륙판)' ,9791192512419,'n',0);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'y', to_date('2024-06-18'), to_date('2024-06-18'),null);

insert into book values(BOOK_SEQ.nextval,14,25000,'더 페어링 - 술과 음식의 더 맛있는 만남','강지영외 4인',
'우리 음식문화에 가장 잘 맞는 실용 가이드북<br><br>
“이 음식에 가장 잘 어울리는 술은 무엇일까?”<br>
이 행복한 물음에 대한 답을 찾고자 오랜 기간 식문화 분야에서 지식과 경험을 축적해 온 전문가 5인이 『술과 음식의 더 맛있는 만남, 더 페어링』을 발간했다. 이 책은 우리가 좋아하고 쉽게 접근할 수 있는 다양한 음식 72가지를 선정하고, 각각의 음식을 맞는 십여 가지의 술 중 가장 잘 어울리는 술을 3순위까지 정리한 방대한 기록이다. 이론서에서 벗어나 실제로 저자들이 3년 동안 직접 찾고, 조합하고, 시음해 얻은 실제적 연구를 기반으로 상세한 설명을 곁들이고 있다는 점이 가장 큰 특징이다. 술 빚기 기초 지식부터 술을 고르고 보관하고 마시기까지의 전 과정, 쉽게 페어링하는 법, 재미있고 깊이 있는 음식이야기까지 흥미진진한 정보가 가득하다. 냉면이나 비빔밥 등 우리 전통 음식은 물론 각종 회나 스테이크, 곱창 등의 외식 메뉴, 전이나 파스타 등 집에서 쉽게 만들 수 있는 음식, 마라샹궈나 양꼬치 등 마니아층이 있는 요리, 사퀴트리나 디저트까지 풍성한 일상의 음식을 담고, 거기에 국내 최초로 와인 외에 전통주, 사케, 맥주까지 페어링의 영역을 확장하고 있다는 점도 큰 차별점이다. 따라서 이 책은 우리 일상의 음식과 술과의 조화를 제안함으로써 독자들에게 실용적이면서도 새로운 미각의 세계를 열어 주는 풍요로운 경험을 선사할 것이다. 동시에 전문가에게도, 혹은 페어링을 시도해 보고 싶은데 어떻게 시작할지 망설이는 초보자에게도, 그리고 술과 음식에 진심인 독자 모두에게 무척 반가운 안내서가 될 것이다.',
'프롤로그<br>
추천사<br>
1. 술과 음식<br>
각종 술의 특징<br>
술의 역사 / 술의 발효 방식 / 술의 원료 / 술맛의 요소 / 테이스팅 / 라벨로 술 고르기 / 술 보관 방법 / 알아 두면 자랑거리가 되는 술 용어 사전<br>
음식과 술의 페어링(마리아주)<br>
페어링의 정의 / 페어링의 필요성 / 페어링의 기본 자세 / 페어링의 기본 공식<br><br>
2. 외식·배달 음식과 어울리는 술<br>
KOREAN FOOD<br>
물냉면 / 비빔냉면 / 닭발 / 프라이드 치킨 / 간장 치킨 / 양념 치킨 / 목살 구이 / 삼겹살 구이 / 불족발 / 육회 / 소 곱창 구이 / 소 등심 구이 / 소 안심 구이
<br>CHINESE FOOD<br>
군만두 / 짜장면 / 짬뽕 / 탕수육 / 마라탕 / 마라샹궈 / 양꼬치 / 양갈비<br>
JAPANESE FOOD<br>
흰 살 생선 / 붉은 살 생선회 / 기름이 많은 생선회 / 회무침 / 물회 / 모둠 초밥 / 돈카츠<br><br>
3. 집에서 만드는 요리와 어울리는 술<br>
KOREAN FOOD<br>
간장 나물 비빔밥 / 고추장 나물 비빔밥 / 떡볶이 / 해물파전 / 김치전 / 들기름 막국수 / 보쌈 / 족발 / 제육볶음 / 삼계탕 / 닭볶음탕 / 간장찜닭<br>
INTERNATIONAL FOOD<br>
연어·튜나 포케 / 우삼겹 메밀면 샐러드 / 고이꾸온 / 짜조 / 얌운센 / 단호박 두부 샐러드 / 안초비 알리오 올리오 파스타 / 버섯 크림 파스타 / 해산물 바질 페스토 파스타 / 소고기 라구 토마토 파스타 / 치킨 시저 샐러드 / 홈메이드 페퍼로니 피자 / 홈메이드 치즈 버거 / 홈메이드 연어 스테이크 / 홈메이드 폭찹 스테이크 / 홈메이드 한우 스테이크 / 홈메이드 양고기 스테이크',
'',100 , TO_DATE('2025-04-25'), '더페어링.jpg', 344,'190x245' ,9791186519967,'n',25);

insert into booksellrequest values(BOOKSELLREQUEST_SEQ.nextval,BOOK_SEQ.CURRVAL,333333,100, 'n', to_date('2024-04-25'), null,null);