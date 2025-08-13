## Smol-Reddit (Micro-Reddit) 

### Warmup: Thinking data first

Scenario 1: 
You are building a blog for your startup which will have multiple authors and each author can write multiple posts.
```
author:table
username:string [ unqiue, 4-12 chars, present]
email:string [ unique, present]
password:string [ 6-12 chars (with mixed of capitalize, numerical, and symbol), present]
id:integer
created_at:datetime
updated_at:datetime

has_many posts
```

```
posts:table
title:string [ 1-50 chars, present ]
body:text [present]
author_id:foreign key [present]
id:integer
created_at:datetime
updated_at:datetime

belongs_to author

```

### Data model task

Scenario 1:
You are building an online learning platform (much like this!). You’ve got many different courses, each with a title and description, and each course has multiple lessons. Lesson content consists of a title and body text.

```
student:table
username:string [6-12 chars, present]
bio:text
email:string [unique, present]
password:string [6-18 alphanumerical combination, present]


id:integer
created_at:datetime
updated_at:datetime

has_many courses
has_many lessons
```
```
courses:table
title:string [uniq, 6-20 chars]
description:text [present]

has_many lessons
belongs_to student
```

```
lessons:table
title:string [ unique, 5-20 chars, present]
body:text [present]
course_id:integer 

belongs_to courses
```

Scenario 2:
You are building the profile tab for a new user on your site. You are already storing your user’s username and email, but now you want to collect demographic information like city, state, country, age and gender. Think – how many profiles should a user have? How would you relate this to the User model?

Scenario 3:
You want to build a virtual pinboard, so you’ll have users on your platform who can create “pins”. Each pin will contain the URL to an image on the web. Users can comment on pins (but can’t comment on comments).

Scenario 4:
You want to build a message board like Hacker News. Users can post links. Other users can comment on these submissions or comment on the comments. How would you make sure a comment knows where in the hierarchy it lives?
