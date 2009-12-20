#Makefile                                                                       
path = ./
find_files  = $(wildcard $(dir)/*.rb $(dir)/*.erb)
dirs    = $(path)app/controllers $(path)app/models $(path)app/views

APPS    = $(foreach dir,$(dirs),$(find_files))
OBJS    = $(path)start.rb $(APPS)
TARGET  = $(path)tmp/restart.txt

$(TARGET): $(OBJS)
	touch $(TARGET)
