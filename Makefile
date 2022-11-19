# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 17:27:55 by rrouille          #+#    #+#              #
#    Updated: 2022/11/19 18:31:44 by rrouille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Folders
SRCDIR		= srcs
OBJDIR		= objs/
HDRDIR		= includes

# Files
SRCS		= ${shell find ${SRCDIR} -name '*.c'}
OBJS		= ${SRCS:${SRCDIR}%.c=${OBJDIR}%.o}
NAME		= libft.a
TESTER		= exec

# Compilation
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror

# Usefuls commands
RM			= rm -rf
MV			= mv
MKDIR		= mkdir

# Archive
AR			= ar rcs

# Colors
DEFCOLOR	= \033[0;39m
GRAY		= \033[0;90m
RED			= \033[0;91m
GREEN		= \033[0;92m
YELLOW		= \033[0;93m
BLUE		= \033[0;94m
MAGENTA		= \033[0;95m
CYAN		= \033[0;96m
WHITE		= \033[0;97m

#Sources
FTISDIR		= is
FTMEMDIR	= mem
FTPUTDIR	= put
FTTODIR		= to
FTSTRDIR	= str
FTLSTDIR	= lst
FTMATHDIR	= math
FTPRINTDIR	= print

# First rule
all:		${NAME}

${NAME}:	${OBJS}
			@${AR} ${NAME} ${OBJS}
			@ranlib ${NAME}
			@echo "${GREEN}Libft compiled!${DEFCOLOR}"

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
			@echo "${YELLOW}Compiling: $< ${DEFCOLOR}"
			@${CC} ${CFLAGS} -I ${HDRDIR} -c $< -o $@

basics-tests:
			@echo "${BLUE}"
			@${CC} ${CFLAGS} ${SRCDIR}/*.c ${SRCDIR}/*/*.c -I ${HDRDIR} -o ${TESTER}
			@echo "First test :"
			@./${TESTER} 0123456789 abcdefghijklmnopqrstuvwxyz
			@echo ""
			@echo "------------"
			@echo "Second test :"
			@./${TESTER} -2147483648 "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
			@echo ""
			@echo "------------"
			@echo "Third test :"
			@./${TESTER} 2147483647 "@!$#%^&*()_+<> ?:\\\"{}|,./;[]'"
			@echo ""
			@echo "------------"
			@echo "Fourth test :"
			@./${TESTER} 23846324087324 "\t\n\v\f\r\0"
			@echo "${DEFCOLOR}"
			@echo "${YELLOW}Testing done.${DEFCOLOR}"
			@echo ""

test:
			@echo "${CYAN}Running the basic tests for the printf project..."
			@echo "For more test try \"make moretest\" or \"make mt\"..."
			@echo "...${DEFCOLOR}"
			@mv ${SRCDIR}/tester.c.test ${SRCDIR}/tester.c
			@make basics-tests
			@echo "${CYAN}Cleaning testing files...${DEFCOLOR}"
			@${RM} ${TESTER}
			@mv ${SRCDIR}/tester.c ${SRCDIR}/tester.c.test
			@echo "${GREEN}Testing files cleaned !${DEFCOLOR}"

moretest:
			@echo "${CYAN}Running the tests for the printf project..."
			@echo "...${DEFCOLOR}"
			@make
			@mv ${SRCDIR}/tester.c.test ${SRCDIR}/tester.c
			@make basics-tests
			@echo "${RED}Running francinette...${DEFCOLOR}"
			@echo ""
			@/Users/rrouille/francinette/tester.sh
			@echo "${YELLOW}Testing done, well done.${DEFCOLOR}"
			@echo ""
			@echo "${CYAN}Cleaning testing files...${DEFCOLOR}"
			@${RM} ${TESTER}
			@make fclean
			@mv ${SRCDIR}/tester.c ${SRCDIR}/tester.c.test
			@echo "${GREEN}Testing files cleaned !${DEFCOLOR}"

mt:			moretest

# Norminette
norm:
			@norminette -R CheckForbiddenSourceHeader

# Cleaning
clean:
			@${RM} ${OBJDIR}
			@echo "${BLUE}Library objects files cleaned!${DEFCOLOR}"

fclean:		clean
			@${RM} ${NAME}
			@echo "${CYAN}Library executable files cleaned!${DEFCOLOR}"

re:			fclean all
			@echo "${GREEN}Cleaned and rebuilt the library correctly !${DEFCOLOR}"

.PHONY:		all clean fclean re norm
