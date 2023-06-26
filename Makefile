# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 17:27:55 by rrouille          #+#    #+#              #
#    Updated: 2023/06/26 17:50:17 by rrouille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Folders
SRCDIR		= srcs
OBJDIR		= objs/
HDRDIR		= includes

# Files
SRCS		= ${shell find ${SRCDIR} -name '*.c'}
OBJS		= ${SRCS:${SRCDIR}%.c=${OBJDIR}%.o}
NAME		= mylib.a

# Compilation
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror

# Usefuls commands
RM			= rm -rf
MV			= mv
MKDIR		= mkdir

# Archive
AR			= ar rcs

# Directories
SRCSDIR			= srcs/
OBJSDIR			= objs/
HDRDIR			= includes/

# Colors for the terminal
GRAY			= \033[0;90m
RED				= \033[0;91m
GREEN			= \033[0;92m
YELLOW			= \033[0;93m
BLUE			= \033[0;94m
MAGENTA			= \033[0;95m
CYAN			= \033[0;96m
WHITE			= \033[0;97m
ENDCOLOR		= \033[0m

# Background colors
BG_G			= \033[42m
BG_R			= \033[41m
BG_Y			= \033[43m
BG_B			= \033[44m
BG_M			= \033[45m
BG_C			= \033[46m
BG_W			= \033[47m

# Text formatting
BOLD			= \033[1m
UNDERLINE		= \033[4m
ITALIC			= \033[3m
INVERTED		= \033[7m

# Clear screen
CLEAR			= \033c

# Clear line
CLEARLN			= \r\033[K

# Sources
FTISDIR		= is
FTMEMDIR	= mem
FTPUTDIR	= put
FTTODIR		= to
FTSTRDIR	= str
FTLSTDIR	= lst
FTMATHDIR	= math
FTPRINTDIR	= print
FTGNLDIR	= gnl
FTGCDIR		= gc

# Progression bar
START		=		echo "${YELLOW}Start of librairy compilation\n${ENDCOLOR}"
END_COMP	=		echo "${GREEN}End of librairy compilation${ENDCOLOR}"
S_OBJS		=		echo "${RED}Library objects files cleaned!${ENDCOLOR}"
S_NAME		=		echo "${RED}Library files cleaned!${ENDCOLOR}"
CHARG_LINE	=		echo "${BG_G} ${ENDCOLOR}\c"
BS_N		=		echo "\n"

# Progress bar
PROGRESS_BAR_LENGTH = 50

# First rule
all:		clear start ${NAME}

start:
			@${START}

${NAME}:	${OBJS}
			@${BS_N}
			@${AR} ${NAME} ${OBJS}
			@ranlib ${NAME}
			@${END_COMP}

${OBJDIR}%.o : ${SRCDIR}%.c
			@mkdir -p ${OBJDIR}
			@mkdir -p ${OBJDIR}${FTISDIR}
			@mkdir -p ${OBJDIR}${FTMEMDIR}
			@mkdir -p ${OBJDIR}${FTPUTDIR}
			@mkdir -p ${OBJDIR}${FTTODIR}
			@mkdir -p ${OBJDIR}${FTSTRDIR}
			@mkdir -p ${OBJDIR}${FTLSTDIR}
			@mkdir -p ${OBJDIR}${FTMATHDIR}
			@mkdir -p ${OBJDIR}${FTPRINTDIR}
			@mkdir -p ${OBJDIR}${FTGNLDIR}
			@mkdir -p ${OBJDIR}${FTGCDIR}
			@${CHARG_LINE}
			@${CC} ${CFLAGS} -I ${HDRDIR} -c $< -o $@

# Norminette
norm:
			@norminette -R CheckForbiddenSourceHeader

# Git repo maker
git: fclean
			@git add *
			@echo "${CYAN}Added files to git !"
			@git commit -m "Auto-commit"
			@echo "${BLUE}Commited !"
			@git push
			@echo "${GREEN}All changed are now on github!${ENDCOLOR}"

###############################################################################
#                   ↓↓↓↓↓           CLEANING           ↓↓↓↓↓                  #
###############################################################################

# Clean object files and executable
clean:
			@echo "${CLEAR}\c"
			@${S_OBJS}
			@${RM} objs/
			@sleep 0.3
			@echo "${CLEAR}\c"
			@echo "${GREEN}✅ Simple clean completed! ✨\n"

# Clean everything
fclean: clean
			@${S_NAME}
			@${RM} ${NAME}
			@sleep 0.3
			@echo "${CLEAR}\c"
			@echo "${GREEN}✅ Deep clean completed! ✨"

# Clear the screen
clear:
			@echo "${CLEAR}\c"

# Rebuild the program
re: fclean all
