truncate abuse cascade;
truncate accounts cascade;
truncate applications cascade;
truncate contact cascade;
truncate coverletters cascade;
truncate education cascade;
truncate files cascade;
truncate firstshortlist cascade;
truncate jobs cascade;
truncate mpesa cascade;
truncate pages cascade;
truncate paypal cascade;
truncate secondshortlist cascade;
truncate tellafriend cascade;
truncate thirdshortlist cascade;
truncate tiprate cascade;
truncate users cascade;
truncate work cascade;
truncate company cascade;
truncate registration cascade;
truncate seekers cascade;
truncate inmessage cascade;
truncate paypal cascade;

select setval('abuse_id_seq',1,false);
select setval('accounts_id_seq',1,false);
select setval('applications_id_seq',1,false);
select setval('contact_id_seq',1,false);
select setval('coverletters_id_seq',1,false);
select setval('education_id_seq',1,false);
select setval('files_id_seq',1,false);
select setval('firstshortlist_id_seq',1,false);
select setval('jobs_id_seq',1,false);
select setval('mpesa_id_seq',1,false);
select setval('pages_id_seq',1,false);
select setval('paypal_id_seq',1,false);
select setval('secondshortlist_id_seq',1,false);
select setval('tellafriend_id_seq',1,false);
select setval('thirdshortlist_id_seq',1,false);
select setval('tiprate_id_seq',1,false);
select setval('users_id_seq',1,false);
select setval('work_id_seq',1,false);
select setval('company_id_seq',1,false);
select setval('registration_id_seq',1,false);
select setval('seekers_id_seq',1,false);
select setval('inmessage_id_seq',1,false);
select setval('paypal_id_seq',1,false);
