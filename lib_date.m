lib_date: module
{
	PATH: con "tba";

	Date: adt {
		year: int;
		month: int;
		day: int;
		hours: int;
		minutes: int;
		seconds: int;
		eq: fn(me: self ref Date, other: ref Date): int;
		eq_t: fn(me: self ref Date, other: ref Date): int;
		eq_d: fn(me: self ref Date, other: ref Date): int;
		lt: fn(me: self ref Date, other: ref Date): int;
		lt_t: fn(me: self ref Date, other: ref Date): int;
		lt_d: fn(me: self ref Date, other: ref Date): int;
		gt: fn(me: self ref Date, other: ref Date): int;
		gt_t: fn(me: self ref Date, other: ref Date): int;
		gt_d: fn(me: self ref Date, other: ref Date): int;
		str: fn(me: self ref Date): string;
		str_d: fn(me: self ref Date): string;
		str_t: fn(me: self ref Date): string;
	};

	create: fn(year, month, day, hours, minutes, seconds: int): ref Date;
	create_d: fn(year, month, day: int): ref Date;
	create_t: fn(hours, minutes, seconds: int): ref Date;

	init: fn(nil: ref Draw->Context, argv: list of string);
};