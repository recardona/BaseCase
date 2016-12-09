(define (problem 01)
	(:domain VBASE)
	(:objects 
		JANE FOX SOLDIER
		HAL
		CELL_DOOR
		EXIT_DOOR
		DORM_DOOR
		OUTSIDE_DOOR
		CELL HUB DORM EXIT OUTSIDE ESCAPE
		CARD FOXCARD
	)
	(:init    
		(player jane) (character jane) (at jane hub) (type jane ripley) (inventory)
		(character fox) (at fox cell) (type fox prisoner) (tied fox)
		(character soldier) (at soldier dorm) (type soldier soldier) (captor soldier fox)
		
		(key card) (thing card) (type card keycard) (at card hub)
			(opens card cell_door)
			
		(key foxcard) (thing foxcard) (type foxcard keycard) (has fox foxcard)
			(opens foxcard outside_door)

		(door cell_door) (thing cell_door) (type cell_door door) 
			(between cell_door hub cell) 
			(between cell_door cell hub) 
			(locked cell_door)
			
		(door exit_door) (thing exit_door) (type exit_door door) 
			(between exit_door hub exit)
			(between exit_door exit hub) 
			
		(door dorm_door) (thing dorm_door) (type dorm_door door) 
			(between dorm_door dorm hub)
			(between dorm_door hub dorm)
			
		(door outside_door) (thing outside_door) (type outside_door door) 
			(between outside_door exit outside)
			(between outside_door outside exit)
			(locked outside_door)
		
		(location cell) (type cell base) 
			(connected cell hub)
			
		(location hub) (type hub base) 
			(connected hub cell)
			(connected hub exit)
			(connected hub dorm)
			
		(location exit) (type exit base) 
			(connected exit hub) 
			(connected exit outside)
			
		(location outside) (type outside woods)
			(connected outside exit)
			(connected outside escape)
			
		(location escape) (type escape woods)
			(connected escape outside)
			
		(location dorm) (type dorm base) 
			(connected dorm hub)
	)
	(:goal 
		(and
			(at fox outside) (at jane outside) (at soldier hub)
		)
	)
)