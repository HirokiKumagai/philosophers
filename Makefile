NAME = philo

CC = cc
CFLAGS = -Wall -Werror -Wextra
INCLUDE = -I./include

SRCS_DIR = ./src
SRCS = main.c
OBJS_DIR = ./objs
OBJS = $(addprefix $(OBJS_DIR)/, $(notdir $(SRCS:.c=.o)))

all: $(NAME)

$(NAME): $(OBJS_DIR)/.keep $(OBJS)
	$(CC) $(CFLAGS) ${INCLUDE} $(OBJS) -o $(NAME)

clean:
	rm -rf ${OBJS_DIR}

fclean: clean
	rm $(NAME)

re: fclean $(NAME)

$(OBJS):$(OBJS_DIR)%.o: $(SRCS_DIR)%.c
	$(CC) $(CFLAGS) ${INCLUDE} -c $< -o $@

$(OBJS_DIR)/.keep:
	mkdir -p $(@D)
	touch $@

.PHONY: all clean fclean re
