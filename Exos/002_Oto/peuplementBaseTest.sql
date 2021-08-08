USE oto;
-- Test Ajout Client
INSERT INTO client(id_client,id_commercial,request_client          ,name_client,lastName_client,mail_client          ,phoneNumber_client,status_client,adress_client                 ,zipCode_client,city_client,country_client)
VALUES            (DEFAULT  ,1            ,'achat'                 ,'Arthur'   ,'Roi          ',                     ,0612324520        ,'PART'       ,'3, Rue Bis'                  ,80000         ,'Kaamelot' ,'Angleterre'  )
--                (         ,             ,                        ,           ,               ,                     ,                  ,             ,                              ,              ,           ,              )