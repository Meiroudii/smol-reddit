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

```
user:table

email:string [unique, present]
username:string [present]
password:salted_hash [present]
age:unsigned_integer
gender:string

id:integer
create_at:datetime
updated_at:datetime
```

```
country:table

id:integer
name:string
official_name:string [present]
iso_alpha2:string [2 characters]
iso_alpha3:string [3 characters]
iso_numeric:int

belongs_to user
has_many user
```

```
state:table

id:integer
created_at:datetime
updated_at:datetime

country_id:integer
population:integer

belongs_to country
has_many user

```

```
city:table

id:integer
created_at:datetime
updated_at:datetime

name:string

belongs_to state
belongs_to country
has_many user
```

Scenario 3:
You want to build a virtual pinboard, so you’ll have users on your platform who can create “pins”. Each pin will contain the URL to an image on the web. Users can comment on pins (but can’t comment on comments).
```
user:table

id:integer
created_at:datetime
updated_at:datetime

username:string [present]
email:string [unique, present]
password:salted_hash [ present ]

has_many pin
```

```
pin:table

image_url:string
comments:text

id:integer
created_at:datetime
updated_at:datetime

belongs_to user
```



Scenario 4:
You want to build a message board like Hacker News. Users can post links. Other users can comment on these submissions or comment on the comments. How would you make sure a comment knows where in the hierarchy it lives?

```
user:table

id:integer
username:string [present]
email:string [unique, present]
password:string [ preset ]

has_many comment_reply
has_many comment
has_many post

```

```
post:table

user_id:integer [reference]
links:string


has_many comment

```

```
comment:table

table_id:integer [reference]
user_id:integer [reference]
body:text

id:integer
created_at:datetime
updated_at:datetime

has_many comment_reply
```

```
comment_reply:table

user_id:integer [ reference ]
comment_id:integer [ reference ]
body:text

id:integer
created_at:datetime
updated_at:datetime

belongs_to comment
```

### Micro-Reddit Schema
---

```
user:table

id:integer
created_at:datetime
updated_at:datetim

email:string [presence, unique]
username:string [presence, unique]

has_many Post
```

```
post:table

id:integer
created_at:datetime
updated_at:datetim

title:string [present]
body:text [present]
comment:text

belongs_to user
```

