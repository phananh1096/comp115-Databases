drop table if exists routing cascade;
drop table if exists message cascade;
drop table if exists member cascade;
create table member(
    member_id serial primary key, 
    name varchar not null,
    birth_date date);

insert into member(name, birth_date) values
  ('Abderian', '1982/09/09')
, ('Anchusa', '1994/02/12')
, ('Bamboozled', '1987/03/11')
, ('Botuliform', '1986/06/11')
, ('Cephalophore', '2010/10/16')
, ('Cynosure', '1987/04/22')
, ('Flyaway', NULL)
, ('Froglet', '1993/10/03')
, ('Hindforemost', '1981/02/06')
, ('Intaglio', '1981/10/20')
, ('Lucarne', '1995/08/29')
, ('Moneyocracy', '1999/10/21')
, ('Normalcy', NULL)
, ('Oscitate', '1981/05/14')
, ('Salpiglossis', '2010/07/06')
, ('Squeezewas', '1983/06/29')
, ('Tweetii', '1989/10/01')
, ('Unguiferous', '2002/05/04')
, ('Zyrianyhippy', '2009/12/15')
, ('Ijreilly', '1950/12/25')
;
create table message(
    message_id serial primary key,
    message_date date not null,
    message_text varchar not null);

insert into message(message_date, message_text) values
  ('2016/05/18', '2o5JCl8HzlJrTwgFnAhL')
, ('2015/03/19', 'cvyWTYT1dFo')
, ('2016/03/18', '50LspyO99MOLVzo6zy')
, ('2015/11/27', '9kwG4Pxq7g')
, ('2016/01/22', 'RUNf1WCaAvY5')
, ('2017/01/01', 'YDgfnhg96tKx')
, ('2017/07/19', 'Mf8N9hRAwkOZKK')
, ('2015/04/28', 'CFgYr3qhToh5Dy2V')
, ('2017/02/14', 'rEW0xy9rfbTly')
, ('2017/07/24', 'cSkX0b67mis3Pf')
, ('2015/07/18', '3C2prWcWnp')
, ('2017/11/07', 'wVNra9sTX3b0571f')
, ('2015/06/25', 'zpxw3k4VnYQw5kZt')
, ('2016/10/20', 'GZf1qZ1ESXb24Q9qV')
, ('2016/07/02', 'vVGMeg4EOdmj7NLM4R')
, ('2017/02/23', '0lpU0DIXzhZbVQ6')
, ('2017/12/30', 'qCa3K7MVzhnVnYCwxb')
, ('2016/12/23', 'jmatdqQm4X9iTgSElzr')
, ('2017/02/14', 'IA3SeY7PTlhtv3JTHQJ')
, ('2015/09/26', 'KFeZ2qkpmPQ')
, ('2017/11/12', 'BqTzkrzVwr1gkwJRl')
, ('2016/11/06', '4WqcYfgWGfVa9uz')
, ('2016/05/18', '6giwwSHQm50oG')
, ('2016/03/16', 'ZZL3svQJx0Z')
, ('2017/01/16', 'AJmE3Ds7JEMrFuXDmm')
, ('2015/07/18', 'XhAauauPVmguxe')
, ('2016/01/09', 'Ik3v1fGgFUMysdS3Jf')
, ('2017/11/13', 'A9a8UUvCID')
, ('2016/04/15', 'W2yeUhfnj73yV')
, ('2016/01/26', 'NcMSVT7LbhuDjWXoAns')
, ('2017/12/24', 'TDVsaHZWy50jg')
, ('2016/01/28', '94U6Sm22WwihogbpgAU1')
, ('2017/12/30', 'NeRsHKNRGIXa0b')
, ('2017/05/21', 'FTjc1Dw9NhTW0y')
, ('2016/09/11', 'W97CKKWSDwzryVthY19')
, ('2015/04/16', 'Gq2d0BcNoQ')
, ('2015/04/19', '8rvTa4GYfZ4kcR1')
, ('2016/04/21', 'e7No3qcImkREyM')
, ('2017/08/10', 'WbnnL1MCIOr')
, ('2015/06/25', 'CSURz2K7Ts5')
, ('2015/02/06', 'zE3QkhgobdENDRocNz')
, ('2017/11/02', 'mB00W5f1oJahfWnp5U')
, ('2016/11/09', 'NnrOCysieyZezlA0o')
, ('2015/08/14', '5AJynlnVCTA6aIf')
, ('2015/12/10', '0jvPJrMRqJmmD')
, ('2015/03/05', 'YB9BgrElF1r2aI3au')
, ('2017/01/08', 'qrdkEQLLdHdMRgJ')
, ('2016/05/17', 'veHlZmynPLltnW')
, ('2016/10/05', 'n9QjQRyRQXLZ5oZcx')
, ('2017/04/10', 'kBB6OQZzGVrXd9uK')
, ('2015/05/23', 'Wh6hZqSA5X')
, ('2015/04/22', 'Dm5vyozM5lhMJpzr')
, ('2015/10/27', '80NWDc5rNcx')
, ('2016/09/12', '7EPl6seaHB')
, ('2015/08/08', 'jsYtNkUZrimV')
, ('2016/05/13', 'q9bL88x3BKKdxpYAUsJm')
, ('2016/02/14', 'z7cLu5V90V6Nwg')
, ('2016/07/05', 'kseyGlaQFLeedVTyQ1rp')
, ('2016/12/23', 'UDSf6MnrMZZL')
, ('2017/10/14', 'GNHSiKqQcY')
, ('2016/08/17', 'RGsSeMQlX0X')
, ('2016/02/17', 'kHe5bCbQ5dYIqMwl')
, ('2016/09/20', 'Mx1IcVYtric32')
, ('2016/09/08', 'vkCQacuFZwFAG')
, ('2016/06/28', 'UBZVFjge7HUqFQF')
, ('2017/10/11', 'Ax3ZRYxBa33as')
, ('2017/01/01', 'IeNUPw6SuAkln1b')
, ('2015/11/26', '0Wll913JBq5mlJot1')
, ('2017/11/04', 'h39JjyHhr4Dzvqv3')
, ('2015/12/08', 'DOQLxcv07N6')
, ('2015/01/17', 'KLpbUxdVXPzYG')
, ('2015/01/05', '4n32WcWQImtKRbaA')
, ('2017/10/02', 'SQz0R9VkZwn')
, ('2015/07/20', 'Nx9GnfbvEJkFJtvZvn')
, ('2016/10/22', 'Xadainihrnn')
, ('2015/10/05', 'x98BfzRJ9F')
, ('2017/09/08', 'Pp90DmI57xRe3amzvys')
, ('2016/09/30', '7ZKA3KnILKiTe1Mw7C6C')
, ('2016/09/12', 'o7DNeMHLKuw')
, ('2015/05/24', 'dLx4Or6CXA6WKReQWFW')
, ('2017/02/16', 'IbvisH2I84fg')
, ('2017/02/22', 'hyw8WqdJUMkzWN')
, ('2015/09/06', 'NpKRksbigc04yK72K')
, ('2016/07/17', '3IXbzDgZnsrS5z')
, ('2015/07/25', 'iyazr0Mah73')
, ('2015/10/30', 'wOIoZQHmG6')
, ('2017/07/06', 'JTzv14hdwdP')
, ('2016/03/02', 'o1fWQhDo7V')
, ('2015/01/05', '4lk1lJYHn2RJALTF')
, ('2015/06/19', '2R0MgfvcHMF3Fd1pALbM')
, ('2017/07/23', 'bD6GiwxgAz')
, ('2015/07/17', 'dNWcAnIqocgeQ4LX4sF')
, ('2017/10/24', 'K3vElEYBV4wkXhS2fiG')
, ('2015/07/01', 'M0AOmCoZ8rRR')
, ('2017/02/09', 'c0c28FEk0EizGNm')
, ('2015/06/15', 'RZz8Gjg5X98BtxVOkEFg')
, ('2016/05/16', 'RA5GUBipIxpaX')
, ('2016/09/12', '9X36fQ1ZorWujTH9I0BJ')
, ('2015/04/27', '8pHDhIJutfmLM7YD')
, ('2016/05/23', 'tuRDyvCbxIunxXH3rU9')
, ('2016/04/18', 'OzxykIVcxtbIG9Eiu')
, ('2016/05/08', 'YQLgVtiiP3G')
, ('2016/01/20', 'r8uRR9hHkwLd4T')
, ('2015/11/07', 'd1Ty2NAP7XfgV')
, ('2016/03/24', 'zhrUAaLLVeUcTcgfv')
, ('2015/02/11', 'HDpfmc3VpJ')
, ('2016/07/09', 'PlQea84NQSb7KuBqL8Xk')
, ('2015/04/15', 'RTRo3YSlrF6nUQpN6')
, ('2017/06/21', 'hxWj0d7pkY5i')
, ('2016/05/17', 'SM9xox2qf7o')
, ('2016/12/06', 'ygmDX9CESl19')
, ('2015/09/02', '8bCrpyhSuPRsY')
, ('2015/07/15', 'qC7wadCdU6')
, ('2017/09/02', 'zvJq5p2AjJhCJA')
, ('2016/06/17', 'xU0y1mWmW9FtNogGiK')
, ('2017/09/30', '45IaV8hwzuC')
, ('2017/01/09', 'nFkfFsZAkJnURGeY')
, ('2017/01/23', 'erERrIr315y')
, ('2017/11/05', 'zL9eIHCDS9QqjBbKmV')
, ('2017/05/17', 'KIHvM6Qz6Y')
, ('2015/11/01', '3JAc2QvyJnSPWoVuGj')
, ('2016/11/07', 'MTdlRuCfxRrj')
, ('2017/05/21', 'OUViUSpd3UH8RFs')
, ('2016/06/25', 'MDtZah1wZe')
, ('2016/01/18', '7W33U3xcbFBK')
, ('2015/11/09', 'rPWUSmqGVHk1IiVA')
, ('2016/12/09', 'WNTUgFvMiNaybW5HbamM')
, ('2015/12/09', 'sjF5WUmzDIxF8')
, ('2017/09/17', 'OCw3lNi6imlVJoOX')
, ('2017/03/08', 'lLyoKj8UpCrvq')
, ('2017/11/04', 'hmVJ5Afvs61Rh')
, ('2017/02/24', 's6LT0RpMdeLe78')
, ('2017/07/16', 'pLGCr9dAPFOX9tDt')
, ('2017/10/11', 'waLYFguWiRtCh')
, ('2016/05/17', 'MSSYPzmnDXeHm50f9gTs')
, ('2016/02/20', 'NtZcMUqEk6Zzj15E3Bc')
, ('2017/10/30', 'JwhoSerfabQA')
, ('2015/07/09', '5hBrKW3ZqxOZEgkv5prV')
, ('2015/02/17', 'db9souv5ifjr7')
, ('2015/06/25', '5KudkRIv3D')
, ('2016/09/10', 'M4mvSs0drK5iY8F')
, ('2016/01/28', 'RXUNaaAmlK')
, ('2016/01/20', '8KoD6GjqbM4qBuVZ')
, ('2016/02/14', 'awDi258ivIrbWe')
, ('2016/11/29', '4LdAJuoStSs1enLleV')
, ('2017/02/03', 'Lf1sUjnuEK2ComCxl')
, ('2017/06/17', 'SRxImBwTEs5gpZFRP')
, ('2015/08/15', 'JkcuAiQkcgTQpd9pOFSJ')
, ('2015/02/17', 'QHak9P8iMS')
, ('2016/03/09', 'qwQiE4qptzcAfk1Jbe')
, ('2016/06/02', 'uz1kjxNeGQtjDR1fbaM')
, ('2015/04/03', 'rWcrdUN8D1zI6KxCb')
, ('2016/08/13', 'T97xfyxMiv')
, ('2016/05/08', 'fetM4FyDSIQmpnpH')
, ('2016/08/05', '54LAqkXDFm5qQbC')
, ('2016/04/29', 'dOUTTeHTPEN')
, ('2017/02/20', '8GsYkRHMrpghVMY0xUM7')
, ('2017/04/03', 'S7AgxEmjGRELennsUFJV')
, ('2016/10/07', 'tKSWJmy8oSz')
, ('2015/07/08', '2GhwCmQN4sjRlrMY')
, ('2017/02/07', 'fYBapxZKjLR3w')
, ('2016/06/29', '0CJwYLy2Qy')
, ('2016/10/09', 'VHtqoTQg5ZMz')
, ('2017/09/08', 'Ozab37ShwCMHALt0')
, ('2017/07/23', 'H7Pv2oSN8ce3pTTr')
, ('2015/09/01', 'NbmXqIYisZfvI2Y')
, ('2016/11/21', 'I1rAzvS6ZZW')
, ('2016/07/03', 'KjV8YaGD4sS0nI')
, ('2016/03/16', 'frIV2zWDr3eALkrba')
, ('2015/01/21', 'KLLc7woFcaqrmyu0y87')
, ('2016/11/18', 'vNb6tF4eHcbTNc06g')
, ('2017/10/25', 'HWkIJZEISXkdJKQNK')
, ('2017/09/14', 'bIPKdKv0IGmQFB')
, ('2017/02/25', 'B6SVRFCBkt')
, ('2015/06/21', 'lpru4aDkIn7cP94')
, ('2015/04/30', 'MWCut6G0dI9O8koYrD0')
, ('2016/11/19', 'k7TA2Dqt7tudB')
, ('2017/11/12', 'ojfzaYXxacn0de')
, ('2016/01/29', '7cT2ww10F3O8oVz6tFt')
, ('2016/04/15', 'q93x8Aqnblkvk1XolR')
, ('2016/08/05', 'eN050fUwpWb1bh')
, ('2015/06/01', 'DjKKizokdPVw3DSzDt7G')
, ('2017/03/28', 'jE5hNBXnOxveA9G')
, ('2015/07/28', 'Nt8Gk5YUGtO1a2SCsyMa')
, ('2017/12/12', 'NJKeLh99uxCQ')
, ('2015/07/05', 'TNvvvvrPlFeqf0')
, ('2015/11/04', 'LgqxYR15YRWTSlG')
, ('2016/08/14', 'YNJvqE1QhU')
, ('2017/07/10', 'FCH5Ug7pRe3Rgc')
, ('2015/04/30', '1cNydD9Px8ir')
, ('2017/09/24', 'qNkFVbsP1bRSgQ9')
, ('2017/01/05', '6T59IqgYvAGZdbAZBQ')
, ('2017/01/03', 'Eoiks2XKVfH')
, ('2015/03/18', 'cpPJxiGEkA8')
, ('2016/06/01', 'MGuH2zcvZGybInv')
, ('2017/05/12', 'yjovI2rULAy1DLPe0b')
, ('2017/08/08', 'Wuf5wb8e8L1JesI')
, ('2015/04/16', 'QcVmybhzaKOp5gb7Nj')
, ('2016/04/29', 'a6nTopRJi2K5X0353')
, ('2015/11/27', 'Tn8NZgCowFLKS9')
, ('2017/09/18', 'FXcw8GmefoG57p')
, ('2017/12/02', 'XgcMpoGZOg')
, ('2017/10/19', 'oY53u38nlk0T')
, ('2015/06/30', '3Vb4CpTPPyKQofDaj')
, ('2015/04/01', 'XCl2D5YnoD')
, ('2015/03/26', 'RP5p1kJsrF0ooD')
, ('2017/11/04', 'yXAcaY0v73')
, ('2016/01/30', '0yS5ui57g8ak0m5pxm96')
, ('2016/02/18', 'bunGKO6El1cjitX')
, ('2017/05/05', 'B6YxomvviCWfGb9KLcbP')
, ('2016/09/14', '0Z0WyvqjDv58G')
, ('2016/05/07', '91lW8urcMPvvptefr')
, ('2016/07/15', 'vxwexDeijv')
, ('2017/09/12', 'Jxf5VjGaybtkoD4b')
, ('2017/03/02', 'QYVsf4pce2o4VO9Lhk')
, ('2017/10/21', '9YaVwG7K3Zhlo')
, ('2016/10/31', 'poOBH3HL8kdB8T')
, ('2017/06/25', 'w4C9tKqbob')
, ('2017/12/31', 'IbhF3ezdwB3')
, ('2017/03/21', 'vmmSBMGtPSg2NlkXwdd')
, ('2015/07/29', 'hGGho0zOznl')
, ('2015/07/24', '90rwEQeCpV3OsLM9s7t')
, ('2015/05/13', 'Hpnq6ZqldhoyQZ')
, ('2015/01/22', '0sffjOOJxdNOBwuA2e')
, ('2017/11/07', 'ZDwhI2FQzJlA')
, ('2016/05/04', '7ECdZ20FbFyBcA16b')
, ('2016/07/23', 'nhY2fhCK3z9lOyf18Y')
, ('2016/07/07', 'HPV2vjOgt3V3Q')
, ('2017/09/08', 'lB8P55ipuiECSLto')
, ('2017/07/06', '8mGlDmYFSoFRBnB')
, ('2016/08/30', 'SH10NR7lL570')
, ('2015/11/27', 'AARZyPI3GIG9MN')
, ('2016/06/08', 'Cf7myaa6cmdvRX')
, ('2015/11/15', 'uZN2Vjip6R0BN2Q')
, ('2017/01/04', '0qJDxHEaLOKxo')
, ('2015/04/01', 'bwF0FK5g7w2a0dN')
, ('2016/05/17', 'poUxOm1241yYgYYGKz')
, ('2015/11/04', 'OytyRFNLxnr5nxtPYn0P')
, ('2017/04/21', 'va4BfE7DQxcSIUc')
, ('2017/03/18', 'l0vopaIxbTI30jFS')
, ('2017/05/31', '8xixRr1qlb06Ms')
, ('2016/10/20', '3lPjWHQ6s9ejnBWDA')
, ('2017/01/25', 'pi27uUZ6IQYCL')
, ('2016/06/08', 'SoI0BziDMO6FubVo')
, ('2016/07/01', 'O4nkocl3NzZPYfnKeC')
, ('2017/12/14', 'U7gqdgzkxauY')
, ('2016/02/02', 'U3o65DU466gPp')
, ('2016/10/29', 'e3i0oEgvTHtA')
, ('2017/12/23', '8vdsqrT4sL9HvRC')
, ('2016/01/27', 'H6UFp6OuHqkiylsEKlY9')
;
create table routing(
    from_member_id int not null references member,
    to_member_id int not null references member,
    message_id int not null references message);

insert into routing(from_member_id, to_member_id, message_id) values
  (18, 12, 1)
, (18, 16, 1)
, (18, 4, 1)
, (13, 14, 2)
, (5, 3, 3)
, (5, 4, 3)
, (5, 19, 3)
, (12, 8, 4)
, (12, 7, 4)
, (12, 15, 4)
, (17, 1, 5)
, (2, 3, 6)
, (2, 7, 6)
, (14, 2, 7)
, (14, 3, 7)
, (14, 15, 7)
, (18, 4, 8)
, (18, 13, 8)
, (18, 17, 8)
, (14, 10, 9)
, (14, 5, 9)
, (3, 7, 10)
, (3, 4, 10)
, (3, 8, 10)
, (3, 13, 10)
, (16, 5, 11)
, (16, 13, 11)
, (14, 9, 12)
, (19, 7, 13)
, (19, 13, 13)
, (19, 14, 13)
, (19, 4, 13)
, (19, 6, 13)
, (6, 4, 14)
, (6, 3, 14)
, (6, 7, 14)
, (2, 6, 15)
, (2, 3, 15)
, (2, 11, 15)
, (19, 7, 16)
, (19, 15, 16)
, (19, 1, 16)
, (19, 6, 16)
, (13, 2, 17)
, (13, 13, 17)
, (9, 13, 18)
, (9, 18, 18)
, (9, 10, 18)
, (9, 16, 18)
, (6, 6, 19)
, (6, 14, 19)
, (7, 6, 20)
, (9, 4, 21)
, (9, 13, 21)
, (15, 1, 22)
, (1, 9, 23)
, (1, 12, 23)
, (1, 13, 23)
, (1, 4, 23)
, (7, 10, 24)
, (7, 4, 24)
, (7, 15, 24)
, (7, 3, 24)
, (7, 7, 24)
, (3, 6, 25)
, (3, 15, 25)
, (3, 1, 25)
, (3, 19, 25)
, (18, 15, 26)
, (18, 13, 26)
, (5, 10, 27)
, (19, 13, 28)
, (9, 7, 29)
, (9, 16, 29)
, (9, 6, 29)
, (18, 15, 30)
, (18, 4, 30)
, (18, 11, 30)
, (18, 6, 30)
, (18, 18, 30)
, (16, 4, 31)
, (16, 19, 31)
, (16, 1, 31)
, (16, 7, 31)
, (9, 16, 32)
, (9, 18, 32)
, (9, 15, 32)
, (16, 6, 33)
, (16, 8, 33)
, (16, 17, 33)
, (11, 5, 34)
, (11, 17, 34)
, (11, 1, 34)
, (11, 16, 34)
, (3, 18, 35)
, (18, 7, 36)
, (18, 9, 36)
, (18, 17, 36)
, (17, 15, 37)
, (17, 11, 37)
, (17, 2, 37)
, (17, 6, 37)
, (4, 11, 38)
, (4, 8, 38)
, (4, 14, 38)
, (6, 10, 39)
, (6, 3, 39)
, (2, 14, 40)
, (2, 7, 40)
, (2, 1, 40)
, (9, 2, 41)
, (13, 13, 42)
, (13, 3, 42)
, (13, 19, 42)
, (4, 1, 43)
, (18, 19, 44)
, (18, 1, 44)
, (18, 13, 44)
, (17, 5, 45)
, (17, 17, 45)
, (1, 6, 46)
, (1, 1, 46)
, (1, 15, 46)
, (1, 3, 46)
, (1, 4, 46)
, (16, 8, 47)
, (16, 13, 48)
, (16, 4, 48)
, (16, 3, 48)
, (16, 12, 48)
, (16, 2, 48)
, (18, 19, 49)
, (18, 16, 49)
, (6, 8, 50)
, (6, 3, 50)
, (1, 14, 51)
, (18, 7, 52)
, (18, 3, 52)
, (18, 2, 52)
, (18, 12, 52)
, (18, 6, 52)
, (17, 4, 53)
, (17, 17, 53)
, (5, 17, 54)
, (18, 2, 55)
, (18, 14, 55)
, (9, 19, 56)
, (9, 16, 56)
, (9, 1, 56)
, (9, 17, 56)
, (9, 14, 56)
, (13, 1, 57)
, (11, 17, 58)
, (11, 15, 58)
, (11, 11, 58)
, (11, 4, 58)
, (14, 18, 59)
, (14, 11, 59)
, (14, 14, 59)
, (17, 17, 60)
, (17, 16, 60)
, (17, 12, 60)
, (17, 11, 60)
, (17, 15, 60)
, (2, 18, 61)
, (13, 17, 62)
, (13, 18, 62)
, (13, 8, 62)
, (13, 2, 62)
, (13, 7, 62)
, (2, 15, 63)
, (1, 14, 64)
, (1, 7, 64)
, (1, 16, 64)
, (12, 18, 65)
, (12, 15, 65)
, (12, 19, 65)
, (12, 16, 65)
, (12, 5, 66)
, (12, 3, 66)
, (17, 11, 67)
, (17, 17, 67)
, (15, 7, 68)
, (15, 12, 68)
, (15, 10, 68)
, (1, 18, 69)
, (7, 9, 70)
, (14, 9, 71)
, (14, 12, 71)
, (14, 3, 71)
, (18, 5, 72)
, (13, 11, 73)
, (13, 17, 73)
, (13, 16, 73)
, (13, 18, 73)
, (13, 8, 73)
, (6, 12, 74)
, (6, 14, 74)
, (13, 13, 75)
, (13, 6, 75)
, (13, 12, 75)
, (16, 18, 76)
, (16, 10, 76)
, (16, 11, 76)
, (14, 15, 77)
, (14, 18, 77)
, (14, 13, 77)
, (14, 12, 77)
, (6, 13, 78)
, (6, 11, 78)
, (6, 10, 78)
, (6, 7, 78)
, (6, 6, 78)
, (2, 13, 79)
, (2, 15, 79)
, (2, 4, 79)
, (2, 18, 79)
, (2, 14, 79)
, (10, 9, 80)
, (14, 17, 81)
, (19, 6, 82)
, (19, 7, 82)
, (2, 12, 83)
, (2, 14, 83)
, (2, 19, 83)
, (2, 8, 83)
, (2, 7, 83)
, (11, 7, 84)
, (11, 5, 84)
, (11, 18, 84)
, (11, 17, 84)
, (4, 19, 85)
, (7, 18, 86)
, (14, 16, 87)
, (14, 13, 87)
, (14, 17, 87)
, (14, 9, 87)
, (13, 5, 88)
, (13, 12, 88)
, (13, 3, 88)
, (19, 8, 89)
, (19, 2, 89)
, (19, 1, 89)
, (19, 16, 89)
, (5, 1, 90)
, (17, 9, 91)
, (17, 7, 91)
, (2, 7, 92)
, (2, 16, 92)
, (2, 5, 92)
, (2, 18, 93)
, (4, 8, 94)
, (10, 18, 95)
, (10, 16, 95)
, (10, 7, 95)
, (10, 15, 95)
, (13, 18, 96)
, (3, 5, 97)
, (3, 18, 97)
, (3, 9, 97)
, (3, 4, 97)
, (4, 5, 98)
, (4, 13, 98)
, (4, 3, 98)
, (4, 4, 98)
, (16, 8, 99)
, (16, 19, 99)
, (16, 4, 99)
, (16, 13, 99)
, (4, 16, 100)
, (4, 19, 100)
, (4, 9, 100)
, (4, 2, 100)
, (4, 10, 100)
, (1, 11, 101)
, (1, 15, 101)
, (1, 10, 101)
, (1, 3, 101)
, (6, 3, 102)
, (6, 18, 102)
, (6, 6, 102)
, (6, 5, 102)
, (6, 1, 102)
, (3, 8, 103)
, (3, 16, 103)
, (3, 9, 103)
, (3, 7, 103)
, (3, 20, 103)
, (7, 12, 104)
, (2, 12, 105)
, (2, 1, 105)
, (2, 16, 105)
, (4, 11, 106)
, (18, 9, 107)
, (18, 17, 107)
, (18, 4, 107)
, (18, 8, 107)
, (18, 7, 107)
, (16, 1, 108)
, (16, 17, 108)
, (16, 11, 108)
, (16, 7, 108)
, (7, 3, 109)
, (7, 9, 109)
, (7, 10, 109)
, (7, 19, 109)
, (7, 8, 109)
, (1, 14, 110)
, (1, 1, 110)
, (1, 8, 110)
, (1, 6, 110)
, (1, 5, 110)
, (11, 7, 111)
, (11, 5, 111)
, (11, 12, 111)
, (11, 9, 111)
, (11, 18, 111)
, (17, 17, 112)
, (17, 18, 112)
, (6, 13, 113)
, (6, 14, 113)
, (11, 3, 114)
, (11, 7, 114)
, (11, 11, 114)
, (11, 17, 114)
, (11, 7, 115)
, (11, 2, 115)
, (11, 9, 115)
, (2, 19, 116)
, (2, 10, 116)
, (2, 18, 116)
, (11, 1, 117)
, (11, 11, 117)
, (11, 6, 117)
, (11, 14, 117)
, (13, 8, 118)
, (13, 9, 118)
, (13, 17, 118)
, (13, 6, 118)
, (13, 13, 118)
, (15, 2, 119)
, (15, 14, 119)
, (15, 6, 119)
, (10, 13, 120)
, (18, 14, 121)
, (18, 15, 121)
, (18, 13, 121)
, (18, 7, 121)
, (8, 13, 122)
, (8, 2, 122)
, (8, 15, 122)
, (8, 17, 122)
, (8, 12, 122)
, (16, 5, 123)
, (17, 13, 124)
, (1, 13, 125)
, (1, 10, 125)
, (1, 15, 125)
, (1, 8, 125)
, (1, 17, 125)
, (17, 14, 126)
, (17, 9, 126)
, (6, 13, 127)
, (6, 10, 127)
, (6, 12, 127)
, (6, 3, 127)
, (14, 18, 128)
, (6, 14, 129)
, (6, 1, 129)
, (2, 10, 130)
, (2, 13, 130)
, (2, 1, 130)
, (9, 19, 131)
, (3, 2, 132)
, (3, 12, 132)
, (3, 15, 132)
, (3, 1, 132)
, (2, 18, 133)
, (2, 9, 133)
, (2, 8, 133)
, (2, 6, 133)
, (2, 4, 133)
, (4, 4, 134)
, (4, 13, 134)
, (18, 12, 135)
, (18, 7, 135)
, (18, 17, 135)
, (18, 18, 135)
, (1, 17, 136)
, (1, 13, 136)
, (1, 14, 137)
, (1, 8, 137)
, (6, 15, 138)
, (3, 13, 139)
, (3, 5, 139)
, (3, 14, 139)
, (5, 12, 140)
, (5, 15, 140)
, (5, 3, 140)
, (1, 5, 141)
, (1, 7, 141)
, (1, 11, 141)
, (1, 8, 141)
, (1, 4, 141)
, (2, 7, 142)
, (2, 16, 142)
, (4, 15, 143)
, (4, 14, 143)
, (4, 4, 143)
, (19, 7, 144)
, (8, 12, 145)
, (7, 12, 146)
, (7, 15, 147)
, (7, 16, 147)
, (17, 10, 148)
, (7, 1, 149)
, (7, 8, 149)
, (7, 15, 149)
, (13, 16, 150)
, (13, 2, 150)
, (13, 6, 150)
, (13, 4, 150)
, (2, 15, 151)
, (17, 16, 152)
, (17, 5, 152)
, (17, 8, 152)
, (17, 18, 152)
, (17, 1, 152)
, (2, 8, 153)
, (18, 18, 154)
, (18, 11, 154)
, (18, 17, 154)
, (18, 13, 154)
, (18, 6, 154)
, (18, 20, 154)
, (19, 14, 155)
, (19, 8, 155)
, (19, 2, 155)
, (19, 17, 155)
, (15, 19, 156)
, (15, 10, 156)
, (15, 13, 156)
, (15, 1, 156)
, (15, 5, 156)
, (3, 10, 157)
, (3, 11, 157)
, (3, 18, 157)
, (3, 4, 157)
, (16, 19, 158)
, (10, 14, 159)
, (10, 18, 159)
, (10, 4, 159)
, (10, 13, 159)
, (10, 11, 159)
, (2, 13, 160)
, (2, 1, 160)
, (2, 2, 160)
, (2, 4, 160)
, (11, 4, 161)
, (11, 19, 161)
, (11, 14, 161)
, (11, 5, 161)
, (11, 8, 161)
, (18, 12, 162)
, (18, 10, 162)
, (3, 15, 163)
, (3, 8, 163)
, (3, 10, 163)
, (3, 16, 163)
, (3, 12, 163)
, (12, 16, 164)
, (12, 9, 164)
, (17, 6, 165)
, (17, 5, 165)
, (17, 12, 165)
, (17, 2, 165)
, (17, 9, 166)
, (17, 8, 166)
, (6, 11, 167)
, (6, 9, 167)
, (6, 18, 167)
, (10, 7, 168)
, (10, 18, 168)
, (10, 4, 168)
, (10, 13, 168)
, (10, 14, 168)
, (9, 8, 169)
, (9, 5, 169)
, (9, 13, 169)
, (9, 17, 169)
, (18, 8, 170)
, (18, 18, 170)
, (18, 1, 170)
, (18, 2, 170)
, (18, 10, 170)
, (17, 4, 171)
, (13, 13, 172)
, (12, 4, 173)
, (12, 13, 173)
, (12, 5, 173)
, (15, 16, 174)
, (15, 13, 174)
, (15, 12, 174)
, (15, 3, 174)
, (15, 4, 174)
, (14, 9, 175)
, (14, 11, 175)
, (14, 6, 175)
, (14, 3, 175)
, (14, 17, 175)
, (7, 15, 176)
, (9, 12, 177)
, (3, 9, 178)
, (3, 16, 178)
, (3, 5, 178)
, (3, 1, 178)
, (3, 18, 178)
, (1, 13, 179)
, (1, 7, 179)
, (1, 18, 179)
, (1, 6, 179)
, (15, 1, 180)
, (12, 19, 181)
, (12, 6, 181)
, (12, 13, 181)
, (12, 9, 181)
, (12, 1, 181)
, (7, 13, 182)
, (1, 16, 183)
, (1, 18, 183)
, (1, 17, 183)
, (1, 4, 184)
, (11, 17, 185)
, (11, 7, 185)
, (11, 14, 185)
, (11, 2, 185)
, (13, 17, 186)
, (13, 8, 187)
, (13, 13, 187)
, (13, 1, 187)
, (13, 4, 187)
, (13, 9, 187)
, (13, 13, 188)
, (4, 18, 189)
, (4, 8, 189)
, (4, 6, 189)
, (4, 13, 189)
, (19, 19, 190)
, (19, 16, 190)
, (19, 1, 190)
, (12, 12, 191)
, (12, 7, 191)
, (12, 15, 191)
, (13, 7, 192)
, (13, 11, 192)
, (13, 10, 192)
, (13, 12, 192)
, (13, 19, 192)
, (1, 5, 193)
, (12, 5, 194)
, (12, 14, 194)
, (16, 10, 195)
, (16, 2, 195)
, (16, 19, 195)
, (16, 13, 195)
, (17, 2, 196)
, (17, 13, 196)
, (5, 14, 197)
, (5, 17, 197)
, (5, 7, 197)
, (5, 15, 197)
, (5, 6, 197)
, (19, 13, 198)
, (19, 14, 198)
, (6, 16, 199)
, (6, 1, 199)
, (6, 9, 199)
, (6, 2, 199)
, (6, 3, 199)
, (13, 5, 200)
, (13, 10, 200)
, (8, 4, 201)
, (8, 18, 201)
, (8, 3, 201)
, (8, 6, 201)
, (8, 5, 201)
, (5, 5, 202)
, (5, 4, 202)
, (14, 5, 203)
, (14, 4, 203)
, (14, 9, 203)
, (7, 2, 204)
, (2, 13, 205)
, (2, 1, 205)
, (2, 17, 205)
, (2, 8, 205)
, (2, 9, 205)
, (10, 14, 206)
, (10, 2, 206)
, (4, 4, 207)
, (15, 15, 208)
, (1, 6, 209)
, (1, 5, 209)
, (1, 18, 209)
, (7, 12, 210)
, (3, 18, 211)
, (17, 8, 212)
, (17, 19, 212)
, (17, 12, 212)
, (17, 18, 212)
, (6, 3, 213)
, (6, 5, 213)
, (6, 13, 213)
, (6, 16, 213)
, (6, 4, 213)
, (10, 13, 214)
, (10, 1, 214)
, (12, 15, 215)
, (12, 1, 215)
, (12, 8, 215)
, (12, 17, 215)
, (12, 5, 215)
, (1, 18, 216)
, (1, 10, 216)
, (1, 13, 216)
, (12, 13, 217)
, (12, 19, 217)
, (12, 8, 217)
, (12, 17, 217)
, (12, 16, 217)
, (14, 17, 218)
, (14, 11, 218)
, (17, 19, 219)
, (17, 3, 219)
, (17, 8, 219)
, (1, 13, 220)
, (1, 8, 220)
, (1, 1, 220)
, (1, 6, 220)
, (1, 17, 220)
, (2, 4, 221)
, (2, 13, 221)
, (2, 17, 221)
, (2, 9, 221)
, (2, 3, 221)
, (2, 20, 221)
, (18, 1, 222)
, (11, 7, 223)
, (11, 10, 223)
, (11, 14, 223)
, (11, 3, 223)
, (11, 4, 223)
, (3, 7, 224)
, (3, 3, 224)
, (1, 9, 225)
, (1, 14, 225)
, (1, 16, 225)
, (1, 1, 225)
, (1, 8, 225)
, (10, 13, 226)
, (10, 15, 226)
, (10, 18, 226)
, (3, 17, 227)
, (3, 1, 227)
, (3, 18, 227)
, (9, 17, 228)
, (9, 15, 228)
, (5, 12, 229)
, (5, 8, 229)
, (5, 11, 229)
, (5, 11, 230)
, (5, 10, 230)
, (5, 15, 230)
, (5, 1, 230)
, (5, 18, 230)
, (9, 19, 231)
, (9, 15, 231)
, (9, 7, 231)
, (10, 16, 232)
, (10, 10, 232)
, (10, 4, 232)
, (10, 19, 233)
, (10, 3, 233)
, (19, 5, 234)
, (19, 14, 234)
, (19, 3, 234)
, (19, 18, 234)
, (3, 4, 235)
, (3, 18, 235)
, (3, 17, 235)
, (3, 14, 235)
, (4, 2, 236)
, (4, 1, 236)
, (4, 17, 236)
, (4, 12, 236)
, (14, 15, 237)
, (14, 3, 237)
, (14, 9, 237)
, (14, 7, 237)
, (19, 14, 238)
, (19, 4, 238)
, (19, 16, 238)
, (8, 4, 239)
, (8, 6, 239)
, (8, 3, 239)
, (8, 8, 239)
, (8, 19, 240)
, (8, 11, 240)
, (8, 9, 240)
, (8, 1, 240)
, (8, 20, 240)
, (7, 2, 241)
, (7, 1, 241)
, (7, 13, 241)
, (7, 18, 241)
, (18, 15, 242)
, (18, 9, 242)
, (15, 16, 243)
, (17, 17, 244)
, (17, 1, 244)
, (17, 18, 244)
, (18, 14, 245)
, (18, 5, 245)
, (18, 1, 245)
, (10, 9, 246)
, (10, 16, 246)
, (10, 18, 246)
, (18, 15, 247)
, (9, 17, 248)
, (9, 11, 248)
, (9, 4, 248)
, (9, 7, 248)
, (6, 19, 249)
, (6, 2, 249)
, (18, 3, 250)
, (18, 10, 250)
;
