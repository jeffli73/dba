column o_name format a10
column lock_type format a15
column object_name format a15
column xidusn format 999999
column xidslot format 9999999
column xidsqn format 999999
select rpad(oracle_username,10) o_name,session_id sid,
	decode(locked_mode,0,'None',1,'Null',2,'Row share',
	3,'Row Exclusive',4,'Share',5,'Share Row Exclusive',6,'Exclusive') lock_type,
	object_name ,xidusn,xidslot,xidsqn
from gv$locked_object,all_objects
where gv$locked_object.object_id=all_objects.object_id
/
