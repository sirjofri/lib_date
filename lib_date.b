implement lib_date;

include "sys.m";
sys: Sys;
include "draw.m";

include "lib_date.m";

Date.eq(me: self ref Date, other: ref Date): int
{
	return (me.year == other.year &&
	        me.month == other.month &&
	        me.day == other.day &&
	        me.hours == other.hours &&
	        me.minutes == other.minutes &&
	        me.seconds == other.seconds);
}

Date.eq_d(me: self ref Date, other: ref Date): int
{
	return (me.year == other.year &&
	        me.month == other.month &&
	        me.day == other.day);
}

Date.eq_t(me: self ref Date, other: ref Date): int
{
	return (me.hours == other.hours &&
	        me.minutes == other.minutes &&
	        me.seconds == other.seconds);
}

Date.lt(me: self ref Date, other: ref Date): int
{
	# if difference compare difference
	if(me.year != other.year)
		return (me.year < other.year);
	if(me.month != other.month)
		return (me.month < other.month);
	if(me.day != other.day)
		return (me.day < other.day);
	if(me.hours != other.hours)
		return (me.hours < other.hours);
	if(me.minutes != other.minutes)
		return (me.minutes < other.minutes);
	return (me.seconds < other.seconds);
}

Date.lt_d(me: self ref Date, other: ref Date): int
{
	# if difference compare difference
	if(me.year != other.year)
		return (me.year < other.year);
	if(me.month != other.month)
		return (me.month < other.month);
	return (me.day < other.day);
}

Date.lt_t(me: self ref Date, other: ref Date): int
{
	# if difference compare difference
	if(me.hours != other.hours)
		return (me.hours < other.hours);
	if(me.minutes != other.minutes)
		return (me.minutes < other.minutes);
	return (me.seconds < other.seconds);
}

Date.gt(me: self ref Date, other: ref Date): int
{
	# if difference compare difference
	if(me.year != other.year)
		return (me.year > other.year);
	if(me.month != other.month)
		return (me.month > other.month);
	if(me.day != other.day)
		return (me.day > other.day);
	if(me.hours != other.hours)
		return (me.hours > other.hours);
	if(me.minutes != other.minutes)
		return (me.minutes > other.minutes);
	return (me.seconds > other.seconds);
}

Date.gt_t(me: self ref Date, other: ref Date): int
{
	# if difference compare difference
	if(me.hours != other.hours)
		return (me.hours > other.hours);
	if(me.minutes != other.minutes)
		return (me.minutes > other.minutes);
	return (me.seconds > other.seconds);
}

Date.gt_d(me: self ref Date, other: ref Date): int
{
	# if difference compare difference
	if(me.year != other.year)
		return (me.year > other.year);
	if(me.month != other.month)
		return (me.month > other.month);
	return (me.day > other.day);
}

Date.str(me: self ref Date): string
{
	if(sys == nil)
		sys = load Sys Sys->PATH;

	return sys->sprint("%d %d %d %d:%d:%d", me.year, me.month, me.day, me.hours, me.minutes, me.seconds);
}

Date.str_d(me: self ref Date): string
{
	if(sys == nil)
		sys = load Sys Sys->PATH;

	return sys->sprint("%d %d %d", me.year, me.month, me.day);
}

Date.str_t(me: self ref Date): string
{
	if(sys == nil)
		sys = load Sys Sys->PATH;

	return sys->sprint("%d:%d:%d", me.hours, me.minutes, me.seconds);
}

create(year, month, day, hours, minutes, seconds: int): ref Date
{
	d := Date(year, month, day, hours, minutes, seconds);
	return ref d;
}

create_d(year, month, day: int): ref Date
{
	d := create(year, month, day, 0, 0, 0);
	return d;
}

create_t(hours, minutes, seconds: int): ref Date
{
	d := create(0, 0, 0, hours, minutes, seconds);
	return d;
}

init(nil: ref Draw->Context, nil: list of string)
{
	sys = load Sys Sys->PATH;
	sys->print("Running some tests\n");

	year, month, day: int;
	year = 2018;
	month = 02;
	day = 10;
	d, e: ref Date;
	d = create_d(year, month, day);
	e = create_d(year-1, month, day);

	sys->print("Date d: %d %d %d\n", d.day, d.month, d.year);
	sys->print("Date e: %d %d %d\n", e.day, e.month, e.year);
	sys->print("Eq: %d\n", d.eq(e));
	sys->print("lt: %d\n", d.lt(e));
	sys->print("gt: %d\n", d.gt(e));
	sys->print("eq_d: %d\n", d.eq_d(e));
	sys->print("eq_t: %d\n", d.eq_t(e));
	sys->print("str: %s\n", d.str());
}