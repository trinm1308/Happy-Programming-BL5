create database elearning;
use elearning;

create table category
(
    id          int auto_increment
        primary key,
    name        varchar(256) charset utf8 not null,
    description longtext                  null,
    thumbnail   varchar(256)              null
);

create table course
(
    id          int auto_increment
        primary key,
    category_id int                       not null,
    name        varchar(256) charset utf8 not null,
    description longtext                  null,
    thumbnail   varchar(256)              null,
    price       float                     null,
    rating      float                     null,
    content     longtext                  null,
    level       int                       null,
    duration    int                       null,
    constraint course_ibfk_1
        foreign key (category_id) references category (id)
);

create index category_id
    on course (category_id);

create table course_topic
(
    id          int auto_increment
        primary key,
    course_id   int                       not null,
    name        varchar(256) charset utf8 not null,
    description longtext                  null,
    material    varchar(256) charset utf8 null,
    constraint course_topic_ibfk_1
        foreign key (course_id) references course (id)
);

create index course_id
    on course_topic (course_id);

create table topic_lesson
(
    id          int auto_increment
        primary key,
    topic_id    int                       not null,
    name        varchar(256) charset utf8 not null,
    description longtext                  null,
    material    varchar(256) charset utf8 null,
    constraint topic_lesson_ibfk_1
        foreign key (topic_id) references course_topic (id)
);

create table quiz
(
    id            int auto_increment
        primary key,
    name          varchar(256) charset utf8 not null,
    description   longtext                  null,
    thumbnail     varchar(256) charset utf8 null,
    categoryid    int                       null,
    courseid      int                       null,
    topicid       int                       null,
    lessonid      int                       null,
    numofquest    int                       not null,
    timelimit     int                       not null,
    level         int                       not null,
    created_date  datetime                  not null,
    modified_date datetime                  null,
    publish       bit                       not null,
    constraint quiz_ibfk_1
        foreign key (categoryid) references category (id),
    constraint quiz_ibfk_2
        foreign key (courseid) references course (id),
    constraint quiz_ibfk_3
        foreign key (topicid) references course_topic (id),
    constraint quiz_ibfk_4
        foreign key (lessonid) references topic_lesson (id)
);

create index categoryid
    on quiz (categoryid);

create index courseid
    on quiz (courseid);

create index lessonid
    on quiz (lessonid);

create index topicid
    on quiz (topicid);

create table quiz_question
(
    id           int auto_increment
        primary key,
    quizid       int      null,
    content      longtext not null,
    mark         int      not null,
    type         int      not null,
    created_date datetime null,
    constraint quiz_question_ibfk_1
        foreign key (quizid) references quiz (id)
);

create table quiz_answer
(
    id         int auto_increment
        primary key,
    questionid int         null,
    choice     varchar(10) null,
    content    longtext    not null,
    isCorrect  bit         null,
    constraint quiz_answer_ibfk_1
        foreign key (questionid) references quiz_question (id)
);

create index questionid
    on quiz_answer (questionid);

create index quizid
    on quiz_question (quizid);

create index topic_id
    on topic_lesson (topic_id);

create table user
(
    id       int auto_increment
        primary key,
    username varchar(32)               not null,
    email    varchar(100)              not null,
    name     varchar(100) charset utf8 null,
    dob      date default '2001-01-01' null,
    gender   int                       null,
    phone    varchar(15)               null,
    bio      longtext                  null,
    avatar   varchar(100)              null,
    level    int  default 1            null,
    role     int                       not null,
    status   int                       not null,
    password varchar(100)              null,
    created  datetime                  null
);

create table blog
(
    id          int auto_increment
        primary key,
    user_id     int                       not null,
    content     longtext                  not null,
    create_time datetime                  not null,
    summary     longtext charset utf8     null,
    title       varchar(250) charset utf8 null,
    constraint blog_ibfk_1
        foreign key (user_id) references user (id)
);

create index user_id
    on blog (user_id);

create table course_review
(
    id        int auto_increment
        primary key,
    user_id   int           not null,
    course_id int           not null,
    content   longtext      not null,
    rating    int default 1 not null,
    constraint course_review_ibfk_1
        foreign key (user_id) references user (id),
    constraint course_review_ibfk_2
        foreign key (course_id) references course (id)
);

create index course_id
    on course_review (course_id);

create index user_id
    on course_review (user_id);

create table discussion
(
    id            int auto_increment
        primary key,
    author_id     int                                 not null,
    title         varchar(50)                         not null,
    create_time   timestamp default CURRENT_TIMESTAMP null,
    modified_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    lesson_id     int                                 not null,
    constraint discussion_ibfk_1
        foreign key (author_id) references user (id),
    constraint lesson_fk
        foreign key (lesson_id) references topic_lesson (id)
);

create table comment
(
    id            int auto_increment
        primary key,
    lesson_id     int                                 not null,
    content       longtext                            null,
    author_id     int                                 not null,
    create_time   timestamp default CURRENT_TIMESTAMP not null,
    modified_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    discussion_id int                                 not null,
    constraint comment_discussion_id_fk
        foreign key (discussion_id) references discussion (id),
    constraint comment_ibfk_1
        foreign key (lesson_id) references topic_lesson (id),
    constraint comment_user_id_fk
        foreign key (author_id) references user (id)
);

create index lesson_id
    on comment (lesson_id);

create table comment_reply
(
    id            int auto_increment
        primary key,
    comment_id    int                                 not null,
    content       longtext                            null,
    create_time   timestamp default CURRENT_TIMESTAMP not null,
    modified_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    author_id     int                                 not null,
    constraint comment_reply_ibfk_1
        foreign key (comment_id) references comment (id),
    constraint comment_reply_user_id_fk
        foreign key (author_id) references user (id)
);

create index discussion_id
    on comment_reply (comment_id);

create index author_id
    on discussion (author_id);

create table lesson_note
(
    id        int auto_increment
        primary key,
    user_id   int      not null,
    lesson_id int      not null,
    content   longtext not null,
    constraint lesson_note_ibfk_1
        foreign key (user_id) references user (id),
    constraint lesson_note_ibfk_2
        foreign key (lesson_id) references topic_lesson (id)
);

create index lesson_id
    on lesson_note (lesson_id);

create index user_id
    on lesson_note (user_id);

create table user_course
(
    course_id  int                                 not null,
    user_id    int                                 not null,
    lesson_id  int                                 not null,
    status     bit       default b'0'              not null,
    start_date timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    constraint user_course_ibfk_1
        foreign key (course_id) references course (id),
    constraint user_course_ibfk_2
        foreign key (user_id) references user (id),
    constraint user_course_ibfk_3
        foreign key (lesson_id) references topic_lesson (id)
);

create index course_id
    on user_course (course_id);

create index lesson_id
    on user_course (lesson_id);

create index user_id
    on user_course (user_id);

create table user_quiz_answer
(
    id         int auto_increment
        primary key,
    userid     int         not null,
    quizid     int         not null,
    questionid int         not null,
    answer     varchar(10) null,
    constraint user_quiz_answer_ibfk_1
        foreign key (userid) references user (id),
    constraint user_quiz_answer_ibfk_2
        foreign key (quizid) references quiz (id),
    constraint user_quiz_answer_ibfk_3
        foreign key (questionid) references quiz_question (id)
);

create index questionid
    on user_quiz_answer (questionid);

create index quizid
    on user_quiz_answer (quizid);

create index userid
    on user_quiz_answer (userid);

create table user_quiz_taken
(
    id           int auto_increment
        primary key,
    quizid       int        not null,
    userid       int        null,
    grade        varchar(3) null,
    time_started datetime   not null,
    time_ended   datetime   not null,
    time_submit  datetime   null,
    constraint user_quiz_taken_ibfk_1
        foreign key (quizid) references quiz (id),
    constraint user_quiz_taken_ibfk_2
        foreign key (userid) references user (id)
);

create index quizid
    on user_quiz_taken (quizid);

create index userid
    on user_quiz_taken (userid);

create table user_token_log
(
    id           int          not null,
    token        varchar(100) not null,
    action       varchar(10)  not null,
    valid        bit          not null,
    created_time datetime     not null,
    expired_time datetime     not null,
    constraint user_token_log_ibfk_1
        foreign key (id) references user (id)
);

create index id
    on user_token_log (id);

create table wishlist
(
    id           int auto_increment
        primary key,
    uid          int      not null,
    courseid     int      not null,
    created_date datetime null,
    constraint wishlist_ibfk_1
        foreign key (uid) references user (id),
    constraint wishlist_ibfk_2
        foreign key (courseid) references course (id)
);

create index courseid
    on wishlist (courseid);

create index uid
    on wishlist (uid);


# category
insert into elearning.category (id, name, description, thumbnail)
values  (1, 'Bakery', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/cornbread.jpg'),
        (3, 'Python', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/pane-sciocco.jpg'),
        (4, 'Excel', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/boule.jpg'),
        (5, 'Web developement', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/barmbrack.jpg'),
        (6, 'Javascript', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/bauernbrot.jpg'),
        (7, 'AWS Certification', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/buccellato-di-lucca.jpg'),
        (10, 'Drawing', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/pullman-loaf.jpg'),
        (11, 'Data science', 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', 'img/product/small/pain-de-campagne.jpg');

# course
insert into elearning.course (id, category_id, name, description, thumbnail, price, rating, content, level, duration)
values  (1, 1, 'Introduce to Bread Making', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/baguette.jpg', 81, 3, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 0, 160),
        (2, 1, 'Better Ways to Mix Dough for the Molds', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/barmbrack.jpg', 0, 4, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 240),
        (3, 1, 'Apple Cake Recipe', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/pain-de-campagne.jpg', 6, 5, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 2, 355),
        (4, 1, 'Cooking Tips the Perfect Burger', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/sandwich-bread.jpg', 65, 4, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 3, 245),
        (5, 1, 'Fruit Decorations', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/michetta.jpg', 0, 4, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 0, 212),
        (6, 1, 'Recipes for Sweet and Healty Treats', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/bauernbrot.jpg', 23, 3, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 273),
        (7, 1, 'Better Ways to Mix Dough for the Molds', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/cornbread.jpg', 0, 5, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 2, 254),
        (8, 1, 'Carrot Cake Gingerbread', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/zopf.jpg', 53, 4, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 3, 168),
        (9, 1, 'Facts About Sugar Products', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/rugbraud.jpg', 60, 5, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 0, 184),
        (10, 1, 'Introduction to Baking Cakes', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/guernsey-gache.jpg', 30, 4, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 240),
        (11, 1, 'Apple Cake Recipe for Starters', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/pullman-loaf.jpg', 0, 5, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 2, 355),
        (12, 1, 'Advanced Sandwich Making Techniques', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', '/resources/img/product/small/pane-sciocco.jpg', 0, 3, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 3, 245),
        (14, 3, 'Microsoft Excel - Excel from Beginner to Advanced', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/793796_0e89_2.jpg', 0, 2, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 212),
        (15, 3, 'Beginner to Pro in Excel: Financial Modeling and Valuation', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/321410_d9c5_4.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 273),
        (16, 3, 'Microsoft Excel - Data Analysis with Excel Pivot Tables', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/977438_476d_10.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 254),
        (17, 3, 'The Ultimate Excel Programmer Course', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/506788_75b6.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 240),
        (18, 4, 'The Web Developer Bootcamp 2021', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/625204_436a_3.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 355),
        (19, 4, 'The Complete 2021 Web Development Bootcamp', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/1565838_e54e_12.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 245),
        (20, 4, 'The Complete Web Developer Course 2.0', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/764164_de03_2.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 212),
        (21, 4, 'The Advanced Web Developer Bootcamp', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/1430746_2f43_10.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 273),
        (22, 5, 'The Complete JavaScript Course 2021: From Zero to Expert!', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/851712_fc61_6.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 254),
        (23, 5, 'Modern JavaScript From The Beginning', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/364426_2991_6.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 207),
        (24, 5, 'JavaScript: Understanding the Weird Parts', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/1463348_52a4_2.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 111),
        (25, 5, 'JavaScript: The Advanced Concepts (2022 Update)', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/2508942_11d3_3.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 70),
        (26, 6, 'Machine Learning A-Z™: Hands-On Python & R In Data Science', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/950390_270f_3.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 240),
        (27, 6, 'Python for Data Science and Machine Learning Bootcamp', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/903744_8eb2.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 355),
        (28, 6, 'The Data Science Course 2021: Complete Data Science Bootcamp', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/1754098_e0df_3.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 245),
        (29, 6, 'Data Science A-Z™: Real-Life Data Science Exercises Included', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/513244_b831_3.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 212),
        (30, 7, 'Ultimate AWS Certified Solutions Architect Associate 2021', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/2196488_8fc7_7.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 273),
        (31, 7, 'Ultimate AWS Certified Developer Associate 2021 - NEW!', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/1921420_384a_12.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 254),
        (32, 7, 'Amazon Web Services (AWS) Certified 2021 - 4 Certifications!', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/1047846_83ef_29.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 240),
        (33, 7, 'Ultimate AWS Certified SysOps Administrator Associate 2021', 'Tired of baking bricks when everyone else is baking super gorgeous sourdough bread with a holey crumb and crispy crust? Change all of that by enrolling in "Sourdough Bread Baking 101."

This is the sourdough baking course you need if you are just starting out in sourdough bread baking. In my other courses, I teach how to bake all sorts of sourdough breads, but in this course, I won''t load you down with lots of information, just enough so it is easy and fun to bake your first loaf of sourdough.

You will first learn how to make your own sourdough starter at home, day by day with detailed instructions, videos and a free pdf downloadable booklet.

Next, you''ll move onto baking waffles to test your new sourdough starter and then onto your first sourdough test loaf. Once you''ve taken a basic white sourdough loaf, steaming hot, out of your own oven, you will be ready to move on to more complex formulas.

There are two basic sourdough bread formulas in this course. I call them "First Loaf" and "Second Loaf." We will follow the easy step by step directions of the process together. The first loaf is easy. It is a one day round boule with a lower hydration dough, which means it is not too wet or sticky. The second loaf is a two day high hydration dough and is a batard or French style loaf.  Working together, I will show you how to handle a wet, sticky dough and how to do an autolyse. This bread results in a lovely tasting bread with large holes and a wonderful crispy crust.

This course is for BEGINNERS who have no idea of how to bake with sourdough or those who have tried and stumbled. I have fifteen years of experience teaching the newbie sourdough baker, so come on! Let''s have some fun! You know want to!

This course would make an excellent gift for the aspiring baker in your family circle, whether an older baker or a young new baker.

Some skills you will learn:

How to make and care for your own sourdough starter

Why it''s important to weigh ingredients.

Gathering some basic baking equipment

How to mix and fold dough. No kneading here.

Shaping, scoring and baking the dough.

What to do after you''ve baked your first loaf... hint (bake your second loaf!)

When you have finished Sourdough Bread Baking 101, you will have the confidence to not only bake using your own sourdough starter, you will be ready for more advanced sourdough baking techniques which will enable you to bake all sorts of sourdough artisan breads.



Some Student Reviews:

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Amanda H - Fantastic Class

I absolutely loved Teresa''s Sourdough 101 class. Her directions were easy to follow, full of great info, and I was able to bake incredible sourdough bread!!! I loved it so much that I have already signed up for her other three courses. My family and I say "thank you Teresa"!!

by Samira M - Very good

For the first time I could bake a bread a reaaly sourdough bread. The course is really good. Simple and direct. Thank you so much Teresa.

by Ban S  - excellent course for sourdough baking

an excellent course for beginners in sourdough baking and excellent instructor with great experience.

by Robin E - More, More, More

Can''t get enough! I love Teresa Greenway''s courses. She is so complete and does not just leave you hanging. She is there for you just like in a classroom and helps troubleshoot and encourage. Thank you so much I look forward to the future bakes and classes.

by Simon H - Brilliant!

I''ve checked out many sourdough baking texts and videos but then I discovered Teresa! Absolutely brilliant, not least, Teresa uses highly accurate gram measurements and not flippin'' cups (what''s more she explains why cups are an inaccurate measure). The course takes the student by the hand and slow, confidently and kindly walks through each step simply. There''s no technical jargon and no assumption that the student knows this or that before setting out. The texts are clear, the videos are clear. This is without doubt the best sourdough bread making course I''ve ever seen. Thank you Teresa!

by Jeni H - Absolutely fantastic!

I have enjoyed this course so much, I''m baking my loafs right now! I found this course answered so many questions I had about making sourdough, I would highly recommend it to anyone starting out!

by Pam H - Outstanding

This is an outstanding class on sourdough - well written text lectures, great videos and clear recipes/formulas. I''ve been a bread baker for 40 years - this class has taken my sourdough baking skill to a whole new level.

by Trish D - Perfect for beginners

This is another great course from Teresa. I have also completed two other sourdough courses of Teresa''s and totally recommend them. If you are new to sourdough....start here and learn from a friendly and informative teacher. Teresa takes you through the process of sourdough baking and you learn at your own pace. Perfect place to start to enter the wonderful world of sourdough baking. A+++', 'https://img-c.udemycdn.com/course/240x135/3142166_a637.jpg', 0, 1, 'Nam cursus eu justo nec dictum. Suspendisse dapibus nibh id mattis semper. Vestibulum dapibus sit amet magna vitae cursus. Nam quis tincidunt diam', 1, 355);

# course_topic
insert into elearning.course_topic (id, course_id, name, description, material)
values (7, 1, 'Introduction to Bread Making',
        'Aliquam erat volutpat. Integer non nisl eleifend, facilisis libero tincidunt, molestie ex. Mauris fringilla bibendum libero ac vestibulum. Integer gravida pellentesque neque nec egestas. Suspendisse in bibendum odio. Praesent fringilla, urna ac fermentum hendrerit, nisi erat feugiat velit, sit amet ornare elit metus nec nibh. Duis venenatis, leo vitae tincidunt ullamcorper, urna tellus luctus purus, vitae maximus arcu justo sit amet dui. In et facilisis dolor.',
        null),
       (8, 1, 'Molding Technique',
        'Fusce et aliquet massa, a semper ipsum. Praesent eget viverra diam. Suspendisse ut ligula tincidunt, fermentum nulla at, malesuada dui. Proin maximus dui vitae lorem dictum facilisis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris ligula felis, interdum eu nisi ac, volutpat facilisis purus. Suspendisse potenti. Vestibulum ullamcorper convallis ultrices. Aliquam semper sodales nulla, sit amet feugiat velit. Quisque efficitur risus aliquam ex commodo, ac iaculis est pulvinar. Sed ac arcu libero. Phasellus rhoncus, felis vitae accumsan vestibulum, nisi lorem accumsan metus, eu vehicula orci elit ut ligula. Nulla sit amet lacinia augue, eget molestie sem. Suspendisse potenti. Donec molestie turpis id quam eleifend, eget imperdiet mi bibendum. Pellentesque vestibulum convallis sodales.',
        null),
       (9, 1, 'Baking the Right Way',
        'Morbi id pretium purus. Sed varius tellus eget ante eleifend, quis semper elit eleifend. Mauris efficitur tellus nibh, vel placerat turpis viverra non. Praesent vel rutrum leo. Sed orci metus, lobortis id scelerisque eget, dictum eu augue. Maecenas vel odio ex. Duis eu magna et magna blandit congue. Ut convallis luctus porta. Pellentesque ut nunc laoreet, sagittis odio sed, feugiat massa. Etiam pretium pulvinar turpis vitae egestas.',
        null),
       (10, 1, 'Presentation',
        'Phasellus laoreet euismod fermentum. Pellentesque et elit enim. Proin in libero magna. Fusce mi velit, viverra eget orci eu, luctus blandit est. Donec rhoncus eu augue eget posuere. Aliquam euismod massa at velit porttitor luctus. Aliquam fringilla mollis diam, vel faucibus dolor consectetur non. Fusce et diam quis augue venenatis ullamcorper ut ut diam.',
        null),
       (11, 1, 'Conclusion',
        'Sed elementum magna at elit aliquam consequat. Praesent nisi ante, vulputate sit amet arcu convallis, euismod porttitor massa. Mauris rutrum eleifend risus vitae posuere. Aliquam erat volutpat. In et velit nec dui mollis condimentum. Aliquam semper suscipit mauris sed tincidunt. Fusce vitae dui erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla nec justo ac elit fringilla porta. Nunc mattis nulla et elit faucibus, et varius arcu dignissim.',
        null),
       (12, 1, 'What is Next?',
        'Mauris sed posuere odio. Nulla non congue urna, in semper ligula. Sed vestibulum bibendum porta. Morbi in mauris eros. Donec sodales, arcu at tristique hendrerit, dui tortor scelerisque mauris, tempus sollicitudin dui eros eget lectus. Nunc bibendum, velit lacinia bibendum tincidunt, libero diam aliquet dolor, ac semper odio augue sed lacus. Praesent iaculis, ipsum et tempor lobortis, lorem erat finibus ante, id faucibus tortor purus fringilla nisl. Cras id convallis metus. Nulla facilisi. Mauris tortor nulla, molestie vel tempus eget, sodales ut mi. Cras eleifend risus ligula, quis posuere ipsum eleifend eu. Nullam ante justo, lobortis eu nibh eget, gravida imperdiet libero. Sed quis tellus sagittis, eleifend risus imperdiet, volutpat dolor. Duis congue ipsum sit amet lacus lobortis, in dapibus neque congue.',
        null);

# topic_lesson
insert into elearning.topic_lesson (id, topic_id, name, description, material)
values (1, 7, 'Candy cake gummi bears',
        'Sed varius tellus eget ante eleifend, quis semper elit eleifend. Mauris efficitur tellus nibh, vel placerat turpis viverra non. ',
        'ZRLjZ4f1NyU'),
       (2, 8, 'Gummi bears dessert muffin pie',
        'Praesent vel rutrum leo. Sed orci metus, lobortis id scelerisque eget, dictum eu augue. Maecenas vel odio ex. Duis eu magna et magna blandit congue.',
        '_XVNvnQLo44'),
       (3, 9, 'Lemon drops wafer brownie pastry',
        'Ut convallis luctus porta. Pellentesque ut nunc laoreet, sagittis odio sed, feugiat massa. Etiam pretium pulvinar turpis vitae egestas.',
        'J70el4lrtIM'),
       (4, 10, 'Danish cake gummies jelly oat cake',
        'Phasellus laoreet euismod fermentum. Pellentesque et elit enim. Proin in libero magna.', 'L4wSpD1iaPE'),
       (5, 11, 'Sweet roll candy muffin chocolate',
        'Donec rhoncus eu augue eget posuere. Aliquam euismod massa at velit porttitor luctus. Aliquam fringilla mollis diam, vel faucibus dolor consectetur non. Fusce et diam quis augue venenatis ullamcorper ut ut diam.',
        'cDHh1ZuiiKQ'),
       (6, 12, 'Danish cake gummies jelly oat cake advance',
        'Ut a porta ligula. Fusce gravida erat libero, vel tincidunt mauris semper ornare. Aenean fringilla justo vel arcu ultricies, vel iaculis turpis suscipit. Maecenas sapien dui, pharetra ultrices erat scelerisque, aliquet cursus sapien.',
        'vxRuzZXdb_Q'),
       (7, 7, 'French Banana Bread',
        'Vestibulum id vehicula dolor, sed scelerisque orci. In sollicitudin magna ligula, vel faucibus magna gravida id. Sed molestie metus quis dui ornare posuere. Vestibulum nibh odio, laoreet sed velit nec, imperdiet pretium nunc. Pellentesque ultricies maximus nunc, eget luctus ante vestibulum sit amet. Duis tristique leo sed dui aliquet, a ullamcorper felis faucibus. Vestibulum quis ullamcorper lectus, et ullamcorper urna. Nunc euismod hendrerit libero in malesuada. Fusce sit amet arcu urna. Integer arcu risus, imperdiet ac eros et, laoreet congue ex. Maecenas luctus gravida lectus non pharetra. Duis aliquam feugiat ante, id bibendum lorem accumsan id. Duis ut tempor urna. Quisque ut tincidunt arcu, id dapibus massa. Vivamus eget ornare lorem. Nullam augue neque, ultrices at nulla tristique, scelerisque condimentum lorem.',
        '6S6Kf7FadC0');

# quiz
insert into elearning.quiz (id, name, description, thumbnail, categoryid, courseid, topicid, lessonid, numofquest,
                            timelimit, level, created_date, modified_date, publish)
values (1, 'Quiz1', 'test quiz1', 'plate-1.png', 1, 1, null, null, 5, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (2, 'Quiz2', 'test quiz2', 'plate-2.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (3, 'Quiz3', 'test quiz3', 'plate-3.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (4, 'Quiz4', 'test quiz4', 'plate-4.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (5, 'Quiz5', 'test quiz5', 'plate-1.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (6, 'Quiz6', 'test quiz6', 'plate-2.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (7, 'Quiz7', 'test quiz7', 'plate-3.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (8, 'Quiz8', 'test quiz8', 'plate-4.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (9, 'Quiz9', 'test quiz9', 'plate-1.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (10, 'Quiz10', 'test quiz10', 'plate-2.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (11, 'Quiz11', 'test quiz11', 'plate-3.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true),
       (12, 'Quiz12', 'test quiz12', 'plate-4.png', 1, 1, null, null, 10, 14, 1, '2021-10-16 14:53:40',
        '2021-10-16 14:53:42', true);

# quiz_question
insert into elearning.quiz_question (id, quizid, content, mark, type, created_date)
values (1, 1, 'Thời gian thực dân Pháp tiến hành khai thác thuộc địa lần thứ nhất ở Việt Nam khi nào?', 2, 1,
        '2021-10-16 15:54:20'),
       (2, 1,
        'Trong đợt khai thác thuộc địa lần thứ nhất của thực dân Pháp ở nước ta có giai cấp mới nào được hình thành?',
        2, 1, '2021-10-16 16:27:26'),
       (3, 1, 'Trước Chiến tranh thế giới thứ nhất, ở Việt Nam có những giai cấp nào?', 2, 1, '2021-10-17 19:53:37'),
       (4, 1, 'Dưới chế độ thực dân phong kiến, giai cấp nông dân Việt Nam có yêu cầu bức thiết nhất là gì?', 2, 1,
        '2021-10-17 19:53:38'),
       (5, 1, 'Mâu thuẫn cơ bản và chủ yếu ở Việt Nam đầu thế kỷ XX là mâu thuẫn nào?', 2, 1, '2021-10-17 19:53:38'),
       (6, 2, 'Đặc điểm ra đời của giai cấp công nhân Việt Nam như thế nào?', 2, 1, '2021-10-17 19:53:39'),
       (7, 2, 'Những giai cấp bị trị ở Việt Nam dưới chế độ thuộc địa của đế quốc Pháp là:', 2, 1,
        '2021-10-17 19:53:40'),
       (8, 2, 'Khi nào phong trào công nhân Việt Nam hoàn toàn trở thành một phong trào tự giác?', 2, 1,
        '2021-10-17 19:53:40'),
       (9, 2,
        'Nguyễn ái Quốc lựa chọn con đường giải phóng dân tộc theo khuynh hướng chính trị vô sản vào thời gian nào?', 2,
        1, '2021-10-17 19:53:41'),
       (10, 2, 'Báo Đời sống công nhân là của tổ chức nào?  ', 2, 1, '2021-10-17 19:53:42');

# quiz_answer
insert into elearning.quiz_answer (id, questionid, choice, content, isCorrect)
values (1, 1, 'A', '1858-1884', false),
       (2, 1, 'B', '1884-1896', false),
       (3, 1, 'C', '1896-1913', true),
       (4, 1, 'D', '1914-1918', false),
       (5, 2, 'A', 'Giai cấp tư sản', false),
       (6, 2, 'B', 'Giai cấp tư sản và công nhân', false),
       (7, 2, 'C', 'Giai cấp công nhân', true),
       (8, 2, 'D', 'Giai cấp tiểu tư sản', false),
       (9, 3, 'A', 'Địa chủ phong kiến và nông dân', false),
       (10, 3, 'B', 'Địa chủ phong kiến, nông dân, tư sản, tiểu tư sản và công nhân', false),
       (11, 3, 'C', 'Địa chủ phong kiến, nông dân và công nhân', true),
       (12, 3, 'D', 'Địa chủ phong kiến, nông dân và tiểu tư sản', false),
       (13, 4, 'A', 'Độc lập dân tộc', true),
       (14, 4, 'B', 'Ruộng đất', false),
       (15, 4, 'C', 'Quyền bình đẳng nam, nữ', false),
       (16, 4, 'D', 'Được giảm tô, giảm tức', false),
       (17, 5, 'A', 'Mâu thuẫn giữa giai cấp nông dân với giai cấp địa chủ phong kiến', false),
       (18, 5, 'B', 'Mâu thuẫn giữa giai cấp công nhân với giai cấp tư sản', false),
       (19, 5, 'C', 'Mâu thuẫn giữa công nhân và nông dân với đế quốc và phong kiến', false),
       (20, 5, 'D', 'Mâu thuẫn giữa dân tộc Việt Nam với đế quốc xâm lược và tay sai của chúng', true),
       (21, 6, 'A', 'Ra đời trước giai cấp tư sản, trong cuộc khai thác thuộc địa lần thứ nhất của thực dân Pháp',
        false),
       (22, 6, 'B', 'Phần lớn xuất thân từ nông dân', false),
       (23, 6, 'C', 'Chịu sự áp bức và bóc lột của đế quốc, phong kiến và tư sản', false),
       (24, 6, 'D', 'Cả a, b và c', true),
       (25, 7, 'A', 'Công nhân và nông dân', false),
       (26, 7, 'B', 'Công nhân, nông dân, tiểu tư sản', false),
       (27, 7, 'C', 'Công nhân, nông dân, tiểu tư sản, tư sản dân tộc', false),
       (28, 7, 'D', 'Công nhân, nông dân, tiểu tư sản, tư sản dân tộc, địa chủ vừa và nhỏ', true),
       (29, 8, 'A', 'Công nhân, nông dân, tiểu tư sản, tư sản dân tộc, địa chủ vừa và nhỏ', false),
       (30, 8, 'B', 'Năm 1925 (cuộc bãi công Ba Son)', false),
       (31, 8, 'C', 'Năm 1929 (sự ra đời ba tổ chức cộng sản)', false),
       (32, 8, 'D', 'Năm 1930 (Đảng Cộng sản Việt Nam ra đời)', true),
       (33, 9, 'A', '1917', false),
       (34, 9, 'B', '1918', false),
       (35, 9, 'C', '1919', false),
       (36, 9, 'D', '1920', true),
       (37, 10, 'A', 'Đảng Xã hội Pháp', false),
       (38, 10, 'B', 'Đảng Cộng sản Pháp', false),
       (39, 10, 'C', 'Tổng Liên đoàn Lao động Pháp', true),
       (40, 10, 'D', 'Hội Liên hiệp thuộc địa', false);

# user
insert into elearning.user (id, username, email, name, dob, gender, phone, bio, avatar, level, role, status, password, created)
values  (1, 'admin1', 'admin1@gmail.com', 'Nguyễn Văn An', '2021-12-12', 0, '0987654321', 'My name is Alex Drysdale and I am a Junior Web Developer for Oswald Technologies. I am an accomplished coder and programmer, and I enjoy using my skills to contribute to the exciting technological advances that happen every day at Oswald Tech. I graduated from the California Institute of Technology in 2016 with a Bachelor''s Degree in Software Development. While in school, I earned the 2015 Edmund Gains Award for my exemplary academic performance and leadership skills.', 'profile-1.jpg', 1, 1, 1, '$2b$10$5swOA7vNuMcey7jFDrzP4OP1U44u/4wEEn/fjSieMcvMTqNbrSbfK', '2021-09-18 20:01:46'),
        (2, 'admin2', 'admin2@gmail.com', 'Nguyễn Văn Bê', '2021-11-11', 0, '0989878787', 'test2', 'profile-2.jpg', 1, 1, 1, '$2b$10$5swOA7vNuMcey7jFDrzP4OP1U44u/4wEEn/fjSieMcvMTqNbrSbfK', '2021-09-18 20:01:46'),
        (3, 'admin3', 'admin3@gmail.com', 'Nguyễn Văn Cê', '2021-10-10', 0, '0987677777', 'test3', 'profile-3.jpg', 1, 1, 1, '$2b$10$5swOA7vNuMcey7jFDrzP4OP1U44u/4wEEn/fjSieMcvMTqNbrSbfK', '2021-09-18 20:01:46'),
        (4, 'admin4', 'admin4@gmail.com', 'Nguyễn Văn Đê', '2021-09-09', 0, '0987654543', 'test4', 'profile-4.jpg', 1, 1, 1, '$2b$10$5swOA7vNuMcey7jFDrzP4OP1U44u/4wEEn/fjSieMcvMTqNbrSbfK', '2021-09-18 20:01:46'),
        (5, 'admin5', 'admin5@gmail.com', 'Nguyễn Văn Ê', '2021-08-08', 0, '0987676756', 'test5', 'profile-1.jpg', 1, 1, 1, '$2b$10$5swOA7vNuMcey7jFDrzP4OP1U44u/4wEEn/fjSieMcvMTqNbrSbfK', '2021-09-18 20:01:46'),
        (6, 'admin6', 'admin6@gmail.com', 'Nguyễn Văn Gờ', '2021-07-07', 0, '0987765765', 'test6', 'profile-2.jpg', 1, 1, 1, '$2b$10$5swOA7vNuMcey7jFDrzP4OP1U44u/4wEEn/fjSieMcvMTqNbrSbfK', '2021-09-18 20:01:46'),
        (7, 'admin7', 'admin7@gmail.com', 'Nguyễn Thị Hát', '2021-12-05', 1, '0987890987', 'test7', 'profile-3.jpg', 1, 1, 1, '$2b$10$5swOA7vNuMcey7jFDrzP4OP1U44u/4wEEn/fjSieMcvMTqNbrSbfK', '2021-09-18 20:01:46'),
        (8, 'user1', 'user1@gmail.com', 'Nguyễn Văn I', '2021-11-12', 0, '0982345678', 'test8', 'profile-4.jpg', 1, 0, 1, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46'),
        (9, 'user2', 'user2@gmail.com', 'Nguyễn Văn J', '2021-10-12', 0, '0982345678', 'test9', 'profile-1.jpg', 1, 0, -1, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46'),
        (10, 'user3', 'user3@gmail.com', 'Nguyễn Thị Ka', '2021-09-12', 1, '0987656565', 'test10', 'profile-2.jpg', 1, 0, 0, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46'),
        (11, 'user4', 'user4@gmail.com', 'Nguyễn Văn L', '2021-12-12', 0, '0987676765', 'test11', 'profile-3.jpg', 1, 0, 1, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46'),
        (12, 'user5', 'user5@gmail.com', 'Nguyễn Thị Mờ', '2021-07-12', 1, '0989898987', 'test12', 'profile-4.jpg', 1, 0, 1, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46'),
        (13, 'user6', 'user6@gmail.com', 'Nguyễn Văn Nờ', '2021-02-12', 2, '0986438212', 'test13', 'profile-1.jpg', 1, 0, 1, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46'),
        (14, 'user7', 'user7@gmail.com', 'Nguyễn Văn O', '2021-04-12', 0, '0976543523', 'test14', 'profile-2.jpg', 1, 0, 1, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46'),
        (15, 'user8', 'user8@gmail.com', 'Nguyễn Thị Pê', '2021-01-12', 1, '0987654321', 'test15', 'profile-3.jpg', 1, 0, 1, '$2b$10$PiPMn/wYaasvhTdVwcaNYOL52tJzHHDvVCSDh2uY0MKxCqypPcMAG', '2021-09-18 20:01:46');

# blog
insert into elearning.blog (id, user_id, content, create_time, summary, title)
values (1, 1,
        '{"ops":[{"insert":"Carrot Cake Gingerbread"},{"attributes":{"header":2},"insert":"\\n"},{"insert":"Toffee croissant icing toffee. Sweet roll chupa chups marshmallow muffin liquorice chupa chups soufflÃ© bonbon. Liquorice gummi bears cake donut chocolate lollipop gummi bears. Cotton candy cupcake ice cream gummies dessert muffin chocolate jelly. Danish brownie chocolate bar lollipop cookie tootsie roll candy canes. Jujubes lollipop cheesecake gummi bears cheesecake. Cake jujubes soufflÃ©.\\nCake chocolate bar biscuit sweet roll liquorice jelly jujubes. Gingerbread icing macaroon bear claw jelly toffee. Chocolate cake marshmallow muffin wafer. Pastry cake tart apple pie bear claw sweet. Apple pie macaroon sesame snaps cotton candy jelly "},{"attributes":{"underline":true},"insert":"pudding lollipop caramels"},{"insert":" marshmallow. Powder halvah dessert ice cream. Carrot cake gingerbread chocolate cake tootsie roll. Oat cake jujubes jelly-o jelly chupa chups lollipop jelly wafer soufflÃ©.\\nSesame Snaps Lollipop Macaroon"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Jelly-o jelly oat cake cheesecake halvah. Cupcake sweet roll donut. Sesame snaps lollipop macaroon. "},{"attributes":{"link":"http://localhost:9090/blog/detail#"},"insert":"Icing tiramisu"},{"insert":" oat cake chocolate cake marzipan pudding danish gummies. DragÃ©e liquorice jelly beans jelly jelly sesame snaps brownie. Cheesecake chocolate cake sweet roll cupcake dragÃ©e croissant muffin. Lemon drops cupcake croissant liquorice donut cookie cake. Gingerbread biscuit bear claw marzipan tiramisu topping. Jelly-o croissant chocolate bar gummi bears dessert lemon drops gingerbread croissant. Donut candy jelly.\\nCroissant"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Sesame snaps"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Ice cream"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Candy canes"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Lemon drops"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Muffin Sweet Roll Apple Pie"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Carrot cake gummi bears wafer sesame snaps soufflÃ© cheesecake cheesecake cake. Sweet roll apple pie tiramisu bonbon sugar plum muffin sesame snaps chocolate. Lollipop sweet roll gingerbread halvah sesame snaps powder. Wafer halvah chocolate soufflÃ© icing. Cotton candy danish lollipop jelly-o candy caramels.\\n"}]}',
        '2021-05-19 22:30:43', 'Caramels tart danish jelly lemon drops cotton candy muffin. Icing fruitcake bear claw fruitcake tart ice cream chocolate bar sweet roll.
Cupcake gummi bears fruitcake. Fruitcake cake liquorice fruitcake caramels marshmallow lollipop. Chocolate gummies cake sweet. Bonbon donut
muffin. Biscuit donut powder sugar plum pastry.
                  ', 'Carrot Cake'),
       (2, 2,
        '{"ops":[{"insert":"Carrot Cake Gingerbread"},{"attributes":{"header":2},"insert":"\\n"},{"insert":"Toffee croissant icing toffee. Sweet roll chupa chups marshmallow muffin liquorice chupa chups soufflÃ© bonbon. Liquorice gummi bears cake donut chocolate lollipop gummi bears. Cotton candy cupcake ice cream gummies dessert muffin chocolate jelly. Danish brownie chocolate bar lollipop cookie tootsie roll candy canes. Jujubes lollipop cheesecake gummi bears cheesecake. Cake jujubes soufflÃ©.\\nCake chocolate bar biscuit sweet roll liquorice jelly jujubes. Gingerbread icing macaroon bear claw jelly toffee. Chocolate cake marshmallow muffin wafer. Pastry cake tart apple pie bear claw sweet. Apple pie macaroon sesame snaps cotton candy jelly "},{"attributes":{"underline":true},"insert":"pudding lollipop caramels"},{"insert":" marshmallow. Powder halvah dessert ice cream. Carrot cake gingerbread chocolate cake tootsie roll. Oat cake jujubes jelly-o jelly chupa chups lollipop jelly wafer soufflÃ©.\\nSesame Snaps Lollipop Macaroon"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Jelly-o jelly oat cake cheesecake halvah. Cupcake sweet roll donut. Sesame snaps lollipop macaroon. "},{"attributes":{"link":"http://localhost:9090/blog/detail#"},"insert":"Icing tiramisu"},{"insert":" oat cake chocolate cake marzipan pudding danish gummies. DragÃ©e liquorice jelly beans jelly jelly sesame snaps brownie. Cheesecake chocolate cake sweet roll cupcake dragÃ©e croissant muffin. Lemon drops cupcake croissant liquorice donut cookie cake. Gingerbread biscuit bear claw marzipan tiramisu topping. Jelly-o croissant chocolate bar gummi bears dessert lemon drops gingerbread croissant. Donut candy jelly.\\nCroissant"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Sesame snaps"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Ice cream"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Candy canes"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Lemon drops"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Muffin Sweet Roll Apple Pie"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Carrot cake gummi bears wafer sesame snaps soufflÃ© cheesecake cheesecake cake. Sweet roll apple pie tiramisu bonbon sugar plum muffin sesame snaps chocolate. Lollipop sweet roll gingerbread halvah sesame snaps powder. Wafer halvah chocolate soufflÃ© icing. Cotton candy danish lollipop jelly-o candy caramels.\\n"}]}',
        '2021-10-20 13:45:11', 'Chocolate cake biscuit donut cotton candy soufflé cake macaroon. Halvah chocolate cotton candy sweet roll jelly-o candy danish dragée. Apple
pie cotton candy tiramisu biscuit cake muffin tootsie roll bear claw cake. Cupcake cake fruitcake. Powder chocolate bar soufflé gummi bears
topping donut.', 'Haha Cake'),
       (3, 2,
        '{"ops":[{"insert":"Carrot Cake Gingerbread"},{"attributes":{"header":2},"insert":"\\n"},{"insert":"Toffee croissant icing toffee. Sweet roll chupa chups marshmallow muffin liquorice chupa chups soufflÃ© bonbon. Liquorice gummi bears cake donut chocolate lollipop gummi bears. Cotton candy cupcake ice cream gummies dessert muffin chocolate jelly. Danish brownie chocolate bar lollipop cookie tootsie roll candy canes. Jujubes lollipop cheesecake gummi bears cheesecake. Cake jujubes soufflÃ©.\\nCake chocolate bar biscuit sweet roll liquorice jelly jujubes. Gingerbread icing macaroon bear claw jelly toffee. Chocolate cake marshmallow muffin wafer. Pastry cake tart apple pie bear claw sweet. Apple pie macaroon sesame snaps cotton candy jelly "},{"attributes":{"underline":true},"insert":"pudding lollipop caramels"},{"insert":" marshmallow. Powder halvah dessert ice cream. Carrot cake gingerbread chocolate cake tootsie roll. Oat cake jujubes jelly-o jelly chupa chups lollipop jelly wafer soufflÃ©.\\nSesame Snaps Lollipop Macaroon"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Jelly-o jelly oat cake cheesecake halvah. Cupcake sweet roll donut. Sesame snaps lollipop macaroon. "},{"attributes":{"link":"http://localhost:9090/blog/detail#"},"insert":"Icing tiramisu"},{"insert":" oat cake chocolate cake marzipan pudding danish gummies. DragÃ©e liquorice jelly beans jelly jelly sesame snaps brownie. Cheesecake chocolate cake sweet roll cupcake dragÃ©e croissant muffin. Lemon drops cupcake croissant liquorice donut cookie cake. Gingerbread biscuit bear claw marzipan tiramisu topping. Jelly-o croissant chocolate bar gummi bears dessert lemon drops gingerbread croissant. Donut candy jelly.\\nCroissant"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Sesame snaps"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Ice cream"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Candy canes"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Lemon drops"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Muffin Sweet Roll Apple Pie"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Carrot cake gummi bears wafer sesame snaps soufflÃ© cheesecake cheesecake cake. Sweet roll apple pie tiramisu bonbon sugar plum muffin sesame snaps chocolate. Lollipop sweet roll gingerbread halvah sesame snaps powder. Wafer halvah chocolate soufflÃ© icing. Cotton candy danish lollipop jelly-o candy caramels.\\n"}]}',
        '2021-10-20 14:45:23', 'Oat cake soufflé gummi bears donut sweet. Gummies chocolate liquorice chocolate cake jelly-o cake. Toffee cupcake gummi bears gummies dragée
danish chocolate bar. Jelly-o gingerbread lollipop tootsie roll cupcake sugar plum jelly donut. Soufflé cupcake sesame snaps oat cake.
Liquorice jelly powder fruitcake oat cake.
                  ', 'Hoho Cake'),
       (4, 3,
        '{"ops":[{"insert":"Carrot Cake Gingerbread"},{"attributes":{"header":2},"insert":"\\n"},{"insert":"Toffee croissant icing toffee. Sweet roll chupa chups marshmallow muffin liquorice chupa chups soufflÃ© bonbon. Liquorice gummi bears cake donut chocolate lollipop gummi bears. Cotton candy cupcake ice cream gummies dessert muffin chocolate jelly. Danish brownie chocolate bar lollipop cookie tootsie roll candy canes. Jujubes lollipop cheesecake gummi bears cheesecake. Cake jujubes soufflÃ©.\\nCake chocolate bar biscuit sweet roll liquorice jelly jujubes. Gingerbread icing macaroon bear claw jelly toffee. Chocolate cake marshmallow muffin wafer. Pastry cake tart apple pie bear claw sweet. Apple pie macaroon sesame snaps cotton candy jelly "},{"attributes":{"underline":true},"insert":"pudding lollipop caramels"},{"insert":" marshmallow. Powder halvah dessert ice cream. Carrot cake gingerbread chocolate cake tootsie roll. Oat cake jujubes jelly-o jelly chupa chups lollipop jelly wafer soufflÃ©.\\nSesame Snaps Lollipop Macaroon"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Jelly-o jelly oat cake cheesecake halvah. Cupcake sweet roll donut. Sesame snaps lollipop macaroon. "},{"attributes":{"link":"http://localhost:9090/blog/detail#"},"insert":"Icing tiramisu"},{"insert":" oat cake chocolate cake marzipan pudding danish gummies. DragÃ©e liquorice jelly beans jelly jelly sesame snaps brownie. Cheesecake chocolate cake sweet roll cupcake dragÃ©e croissant muffin. Lemon drops cupcake croissant liquorice donut cookie cake. Gingerbread biscuit bear claw marzipan tiramisu topping. Jelly-o croissant chocolate bar gummi bears dessert lemon drops gingerbread croissant. Donut candy jelly.\\nCroissant"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Sesame snaps"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Ice cream"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Candy canes"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Lemon drops"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Muffin Sweet Roll Apple Pie"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Carrot cake gummi bears wafer sesame snaps soufflÃ© cheesecake cheesecake cake. Sweet roll apple pie tiramisu bonbon sugar plum muffin sesame snaps chocolate. Lollipop sweet roll gingerbread halvah sesame snaps powder. Wafer halvah chocolate soufflÃ© icing. Cotton candy danish lollipop jelly-o candy caramels.\\n"}]}',
        '2021-10-15 13:45:43', 'Carrot cake jelly-o lemon drops toffee tootsie roll. Brownie topping toffee apple pie apple pie. Wafer pudding chocolate bar pastry bear
claw tart carrot cake lemon drops icing. Gingerbread toffee topping. Tootsie roll cotton candy muffin cheesecake liquorice sweet. Sugar plum
tart tart marshmallow chocolate wafer apple pie candy canes. Chocolate cake biscuit donut cotton candy soufflé cake macaroon.
                  ', 'Hehe Cake'),
       (5, 4,
        '{"ops":[{"insert":"Carrot Cake Gingerbread"},{"attributes":{"header":2},"insert":"\\n"},{"insert":"Toffee croissant icing toffee. Sweet roll chupa chups marshmallow muffin liquorice chupa chups soufflÃ© bonbon. Liquorice gummi bears cake donut chocolate lollipop gummi bears. Cotton candy cupcake ice cream gummies dessert muffin chocolate jelly. Danish brownie chocolate bar lollipop cookie tootsie roll candy canes. Jujubes lollipop cheesecake gummi bears cheesecake. Cake jujubes soufflÃ©.\\nCake chocolate bar biscuit sweet roll liquorice jelly jujubes. Gingerbread icing macaroon bear claw jelly toffee. Chocolate cake marshmallow muffin wafer. Pastry cake tart apple pie bear claw sweet. Apple pie macaroon sesame snaps cotton candy jelly "},{"attributes":{"underline":true},"insert":"pudding lollipop caramels"},{"insert":" marshmallow. Powder halvah dessert ice cream. Carrot cake gingerbread chocolate cake tootsie roll. Oat cake jujubes jelly-o jelly chupa chups lollipop jelly wafer soufflÃ©.\\nSesame Snaps Lollipop Macaroon"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Jelly-o jelly oat cake cheesecake halvah. Cupcake sweet roll donut. Sesame snaps lollipop macaroon. "},{"attributes":{"link":"http://localhost:9090/blog/detail#"},"insert":"Icing tiramisu"},{"insert":" oat cake chocolate cake marzipan pudding danish gummies. DragÃ©e liquorice jelly beans jelly jelly sesame snaps brownie. Cheesecake chocolate cake sweet roll cupcake dragÃ©e croissant muffin. Lemon drops cupcake croissant liquorice donut cookie cake. Gingerbread biscuit bear claw marzipan tiramisu topping. Jelly-o croissant chocolate bar gummi bears dessert lemon drops gingerbread croissant. Donut candy jelly.\\nCroissant"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Sesame snaps"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Ice cream"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Candy canes"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Lemon drops"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Muffin Sweet Roll Apple Pie"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Carrot cake gummi bears wafer sesame snaps soufflÃ© cheesecake cheesecake cake. Sweet roll apple pie tiramisu bonbon sugar plum muffin sesame snaps chocolate. Lollipop sweet roll gingerbread halvah sesame snaps powder. Wafer halvah chocolate soufflÃ© icing. Cotton candy danish lollipop jelly-o candy caramels.\\n"}]}',
        '2021-10-15 13:45:47', 'Dragée dessert gummies liquorice halvah chocolate. Danish oat cake pudding. Caramels lollipop soufflé chocolate bar halvah. Liquorice
marzipan bear claw. Tiramisu sweet dragée chocolate sugar plum pie. Gingerbread caramels topping gummi bears halvah dessert cake.
                  ', 'Hihi Cake'),
       (6, 5,
        '{"ops":[{"insert":"Carrot Cake Gingerbread"},{"attributes":{"header":2},"insert":"\\n"},{"insert":"Toffee croissant icing toffee. Sweet roll chupa chups marshmallow muffin liquorice chupa chups soufflÃ© bonbon. Liquorice gummi bears cake donut chocolate lollipop gummi bears. Cotton candy cupcake ice cream gummies dessert muffin chocolate jelly. Danish brownie chocolate bar lollipop cookie tootsie roll candy canes. Jujubes lollipop cheesecake gummi bears cheesecake. Cake jujubes soufflÃ©.\\nCake chocolate bar biscuit sweet roll liquorice jelly jujubes. Gingerbread icing macaroon bear claw jelly toffee. Chocolate cake marshmallow muffin wafer. Pastry cake tart apple pie bear claw sweet. Apple pie macaroon sesame snaps cotton candy jelly "},{"attributes":{"underline":true},"insert":"pudding lollipop caramels"},{"insert":" marshmallow. Powder halvah dessert ice cream. Carrot cake gingerbread chocolate cake tootsie roll. Oat cake jujubes jelly-o jelly chupa chups lollipop jelly wafer soufflÃ©.\\nSesame Snaps Lollipop Macaroon"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Jelly-o jelly oat cake cheesecake halvah. Cupcake sweet roll donut. Sesame snaps lollipop macaroon. "},{"attributes":{"link":"http://localhost:9090/blog/detail#"},"insert":"Icing tiramisu"},{"insert":" oat cake chocolate cake marzipan pudding danish gummies. DragÃ©e liquorice jelly beans jelly jelly sesame snaps brownie. Cheesecake chocolate cake sweet roll cupcake dragÃ©e croissant muffin. Lemon drops cupcake croissant liquorice donut cookie cake. Gingerbread biscuit bear claw marzipan tiramisu topping. Jelly-o croissant chocolate bar gummi bears dessert lemon drops gingerbread croissant. Donut candy jelly.\\nCroissant"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Sesame snaps"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Ice cream"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Candy canes"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Lemon drops"},{"attributes":{"list":"bullet"},"insert":"\\n"},{"insert":"Muffin Sweet Roll Apple Pie"},{"attributes":{"header":6},"insert":"\\n"},{"insert":"Carrot cake gummi bears wafer sesame snaps soufflÃ© cheesecake cheesecake cake. Sweet roll apple pie tiramisu bonbon sugar plum muffin sesame snaps chocolate. Lollipop sweet roll gingerbread halvah sesame snaps powder. Wafer halvah chocolate soufflÃ© icing. Cotton candy danish lollipop jelly-o candy caramels.\\n"}]}',
        '2021-10-15 13:45:47', 'Jujubes brownie marshmallow apple pie donut ice cream jelly-o jelly-o gummi bears. Tootsie roll chocolate bar dragée bonbon cheesecake
icing. Danish wafer donut cookie caramels gummies topping.
                  ', 'Lala Cake');

# course_review
insert into elearning.course_review (id, user_id, course_id, content, rating)
values (1, 1, 2, '2', 2),
       (2, 1, 2, '3', 4);

# wishlist
insert into elearning.wishlist (id, uid, courseid, created_date)
values (1, 1, 1, '2021-10-21 12:20:27'),
       (2, 1, 2, '2021-10-21 12:20:31');
