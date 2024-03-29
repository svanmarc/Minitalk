# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: svanmarc <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/20 11:03:15 by svanmarc          #+#    #+#              #
#    Updated: 2023/07/07 17:02:53 by svanmarc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER_SRCS = src/server.c src/utils.c
CLIENT_SRCS = src/client.c src/utils.c
HEADERS = src/minitalk.h

CC = gcc 
CC_FLAGS = -Wall -Wextra -Werror -g

.PHONY: all libft clean fclean re

all: libft server client
	@echo ✅ "Jusqu'ici tout va bien\n"

libft:
	@make -s -C libft
	@echo ✅ "libft ok"

server: ${SERVER_SRCS:.c=.o} libft/libft.a
	@${CC} ${CC_FLAGS} $^ -o $@ -s

client: ${CLIENT_SRCS:.c=.o} libft/libft.a
	@${CC} ${CC_FLAGS} $^ -o $@ -s

src/server.o: src/server.c ${HEADERS}
src/client.o: src/client.c ${HEADERS}
src/utils.o: src/utils.c ${HEADERS}

%.o:%.c
	@${CC} -c $< -o $@ -s

clean:
	@rm -rf ${SERVER_SRCS:.c=.o} ${CLIENT_SRCS:.c=.o}
	@make -s clean -C libft
	@echo 🧹

fclean:
	@rm -rf client server
	@make -s fclean -C libft
	@echo 🧽

re: fclean all
