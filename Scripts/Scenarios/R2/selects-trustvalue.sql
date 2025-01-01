

SOMENTE A TABLE DE APPROVALTXS captura o realmente o max agent value e todas as instancias.

Mesmo assim, para analisar no tempo, preciso usar a tabela de TRUSTCHANGES_SCENARIO2



select indexexecution, agentnumber, TIMEEXECUTION, NEWTRUSTVALUE 
INTO OUTFILE '/Users/suzana.moreno/PhD/19-ABSimulations/RawData/Scenarios/R2/trustchanges5.csv'
FIELDS TERMINATED BY ';\''
LINES TERMINATED BY '\n'
from TRUSTCHANGES_SCENARIO2 
order by indexexecution, agentnumber, TIMEEXECUTION;

select indexexecution, agentnumber, TIMEEXECUTION, NEWTRUSTVALUE 
from TRUSTCHANGES_SCENARIO2 
where indexexecution = 16069304
order by indexexecution, agentnumber, TIMEEXECUTION;







-------------

select indexexecution, agentnumber, max(agentscore) AS maxagentscore, 
max(agentvalue) as maxagentvalue, max(agentvalue)/max(agentscore) as increasevalue 
from APPROVALTXS_SCENARIO2 group by agentnumber, indexexecution
order by indexexecution, agentnumber;

indexexecution	agentnumber	maxagentscore	maxagentvalue	increasevalue
16069304	      1	         38.6995	    55.0908	        1.423552962405446
16069304	      2	         25.595	        37.599	        1.4689972839587686
16069304	3	82.7514	95.8665	1.1584880753378983
16069304	4	70.4866	99.9335	1.4177645514700676
16069304	5	88.8838	100	1.1250639689577382
16069304	6	30.788	52.52	1.705862521294149
16069304	7	73.3557	100	1.3632203418035378
16069304	8	75.3726	90.9394	1.2065317392426156
16069304	9	12.829	23.2633	1.813340999019042


select avg (increasevalue) from (
    select indexexecution, agentnumber, max(agentscore) AS maxagentscore, 
max(agentvalue) as maxagentvalue, max(agentvalue)/max(agentscore) as increasevalue 
from APPROVALTXS_SCENARIO2 group by agentnumber, indexexecution) as DT;
avg (increasevalue)
1.4290462510693953

select count(*) from (
    select indexexecution, agentnumber, max(agentscore) AS maxagentscore, 
max(agentvalue) as maxagentvalue, max(agentvalue)/max(agentscore) as increasevalue 
from APPROVALTXS_SCENARIO2 group by agentnumber, indexexecution) as DT;
900



--------------------------------------------------------------------------------------------------







ANTIGOS: Nao usados


select indexexecution, agentnumber, max(trustscore) AS maxagentscore, 
max(trustvalue) as maxagentvalue, max(trustvalue)/max(trustscore) as increasevalue 
from TRUSTCHANGES_SCENARIO2 group by agentnumber,indexexecution 
order by indexexecution, agentnumber;

indexexecution	agentnumber	maxagentscore	maxagentvalue	increasevalue
16069304	         1	     38.6995  	    54.6292	         1.4116242462799093
16069304	         2	     25.595	        37.2698	         1.4561344846917799
16069304	         3	     82.7514	    92.8338	         1.1218402957593159
16069304	4	70.4866	95.2375	1.351142558589154
16069304	5	88.8838	98.9027	1.112718582422146
16069304	6	30.788	50.2935	1.6335447477282214
16069304	7	73.3557	99.3066	1.35


select avg (increasevalue) from (select indexexecution, agentnumber, max(trustscore) AS maxagentscore, 
max(trustvalue) as maxagentvalue, max(trustvalue)/max(trustscore) as increasevalue 
from TRUSTCHANGES_SCENARIO2 group by agentnumber, indexexecution) as DT;





select indexexecution, agentnumber, max(trustscore) AS maxagentscore, 
max(newtrustvalue) as maxagentvalue, max(trustvalue)/max(trustscore) as increasevalue 
from TRUSTCHANGES_SCENARIO2 group by agentnumber,indexexecution 
order by indexexecution, agentnumber


indexexecution	agentnumber	maxagentscore	maxagentvalue	increasevalue
16069304	1	38.6995	55.0908	1.4116242462799093
16069304	2	25.595	37.599	1.4561344846917799
16069304	3	82.7514	95.8665	1.1218402957593159
16069304	4	70.4866	99.9335	1.351142558589154
16069304	5	88.8838	100	1.112718582422146
16069304	6	30.788	52.52	1.6335447477282214
16069304	7	73.3557	100	1.3537682217562779
16069304	8	75.3726	90.9394	1.1699589755767577
16069304	9	12.829	23.2633	1.8074863241252925


select avg (increasevalue) from (
    select indexexecution, agentnumber, max(trustscore) AS maxagentscore, 
max(newtrustvalue) as maxagentvalue, max(newtrustvalue)/max(trustscore) as increasevalue 
from TRUSTCHANGES_SCENARIO2 group by agentnumber,indexexecution 
order by indexexecution, agentnumber) as DT;

select count(*) from  (  select 1
from TRUSTCHANGES_SCENARIO2 group by agentnumber,indexexecution 
order by indexexecution, agentnumber) as DT;
892


--------------------------------------------------------------------------------------------------


