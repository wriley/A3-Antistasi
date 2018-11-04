// only execute on dedicated server or headless clients
if (hasInterface) exitWith {};

while {(true)} do
{
	diag_log format["DEBUG FPS : %1", diag_fps];
	sleep 10;
};