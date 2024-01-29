# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 17:27:55 by rrouille          #+#    #+#              #
#    Updated: 2024/01/29 15:42:29 by rrouille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Folders
SRCSDIR		= srcs
OBJSDIR		= objs
HDRDIR		= includes

# Files
SRCS		= ${shell find ${SRCSDIR} -type f -name '*.c'}
OBJS		= ${SRCS:${SRCSDIR}/%.c=${OBJSDIR}/%.o}
NAME		= mylib.a

# Compilation
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror

# Operating System
OS				:= ${shell uname}

# Usefuls commands
RM			= rm -rf
MV			= mv
MKDIR		= mkdir -p

# If using Linux ${ECHO} command must be `${ECHO} -e`
ifeq ($(OS),Linux)
	ECHO = echo -e
else ifeq ($(OS),Darwin) # Darwin est le nom de retour de `uname` pour macOS
	ECHO = echo
else
	$(error OS not supported)
endif

# Archive
AR			= ar rcs

# Colors for the terminal
GRAY			= \033[0;90m
RED				= \033[0;91m
GREEN			= \033[0;92m
YELLOW			= \033[0;93m
BLUE			= \033[0;94m
MAGENTA			= \033[0;95m
CYAN			= \033[0;96m
WHITE			= \033[0;97m
GRAY			= \033[0;90m
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

# Progression bar
START		=		${ECHO} "${YELLOW}Start of librairy compilation\n${ENDCOLOR}"
END_COMP	=		${ECHO} "${GREEN}End of librairy compilation${ENDCOLOR}"
S_OBJS		=		${ECHO} "${RED}Library objects files cleaned!${ENDCOLOR}"
S_NAME		=		${ECHO} "${RED}Library files cleaned!${ENDCOLOR}"
CHARG_LINE	=		${ECHO} "${BG_G} ${ENDCOLOR}\c"
BS_N		=		${ECHO} "\n"

# Progress bar
PROGRESS_BAR_LENGTH = 50

# First rule
all:		${NAME}

${NAME}:	${OBJS}
			@printf "┌──────────\n├─>>> ${GREEN}${NAME}${ENDCOLOR} compiled!\n└──────────\n"

${OBJSDIR}/%.o:	${SRCSDIR}/%.c
				@${MKDIR} ${OBJSDIR}
				@${MKDIR} ${@D}
				@if [[ $(if $(filter dbg,${MAKECMDGOALS}),1,0) == "1" ]]; then \
					printf "│\t > ${CYAN}DEBUG${ENDCOLOR} Compiling ${CYAN}$<${ENDCOLOR} with ${CYAN}${DFLAGS}${ENDCOLOR} and ${CYAN}${LDFLAGS}${ENDCOLOR}...\r"; \
					${CC} -D ${DFLAGS} -c $< -o $@ ${LDFLAGS}; \
				else \
					printf "│\t > Compiling ${CYAN}$<${ENDCOLOR} for ${GREEN}${NAME}${ENDCOLOR}...\r"; \
					${CC} ${CFLAGS} -c $< -o $@ -I${HDRDIR}; \
				fi
				@printf "\33[2K"

###############################################################################
#                  ↓↓↓↓↓           UTILITIES           ↓↓↓↓↓                  #
###############################################################################

# Drawings
draw_norm_yes:
			@${ECHO} "${CLEAR}${GREEN}${BOLD}\c"
			@cat ascii_art/obama
			@${ECHO} "${ENDCOLOR}"

draw_norm_no:
			@${ECHO} "${CLEAR}${RED}${BOLD}\c"
			@cat ascii_art/obama_sad
			@${ECHO} "${ENDCOLOR}"

# Norminette
norm:
			@norminette ${SRCSDIR} >/dev/null 2>&1 && norminette ${HDRDIR} >/dev/null 2>&1 && $(MAKE) draw_norm_yes || $(MAKE) draw_norm_no && norminette ${SRCSDIR} && norminette ${HDRDIR}

n:		norm

# fast
fast: fast_mode ${OBJS}
			@${AR} ${NAME} ${OBJS}
			@ranlib ${NAME}
			@${ECHO} "${CLEAR}${GREEN}✅ Fast compilation completed! ✨${ENDCOLOR}"

fast_mode:
			@${ECHO} "${CLEAR}\c"
			@${ECHO} "${YELLOW}✅ Fast mode enabled !${ENDCOLOR}"

# Git repo maker
git: fclean
			@git add *
			@${ECHO} "${CYAN}Added files to git !"
			@git commit -m "Auto-commit"
			@${ECHO} "${BLUE}Commited !"
			@git push
			@${ECHO} "${GREEN}All changed are now on github!${ENDCOLOR}"

################################################################################
#                       Cleaning and Maintenance                               #
################################################################################

# Clean object files and executable
clean:
		@if [[ $(if $(filter r,${MAKECMDGOALS}),1,0) == "1" ]]; then \
			printf "├──────────\n"; \
		else \
			printf "┌──────────\n"; \
		fi
		@if [ -d "./${OBJSDIR}" ]; then \
			printf "│\tRemoving ${CRED}${OBJSDIR}${ENDCOLOR} for ${CYAN}${NAME}${ENDCOLOR}\n"; \
			rm -rf ${OBJSDIR}; \
		else \
			printf "│\t${CRED}${OBJSDIR}${ENDCOLOR} already removed for ${CYAN}${NAME}${ENDCOLOR}!\n"; \
		fi
		@if [[ $(if  $(filter fclean,${MAKECMDGOALS}),1,0) == "1" ]]; then \
			printf ""; \
		else \
			printf "└──────────\n"; \
		fi

# Clean everything including the executable
fclean: clean
		@if [ -e "./${NAME}" ]; then \
			if [[ $(if $(filter r,${MAKECMDGOALS}),1,0) == "1" ]]; then \
				printf "│\tRemoving ${CYAN}${NAME}${ENDCOLOR}\n├──────────\n"; \
			else \
				printf "│\tRemoving ${CYAN}${NAME}${ENDCOLOR}\n└──────────\n"; \
			fi; \
			rm -f ${NAME}; \
		else \
			if [[ $(if $(filter r,${MAKECMDGOALS}),1,0) == "1" ]]; then \
				printf "│\t${CYAN}${NAME}${ENDCOLOR} already removed!\n├──────────\n"; \
			else \
				printf "│\t${CYAN}${NAME}${ENDCOLOR} already removed!\n└──────────\n"; \
			fi; \
		fi

# Clear the screen
clear:
			@${ECHO} "${CLEAR}\c"

# Rebuild the program
re: fclean all
