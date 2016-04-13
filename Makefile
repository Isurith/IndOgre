.PHONY			: 			clean fclean re all

DEBUG				=				false

NORMAL			=				"\033[0m"
BOLD				=				"\033[1m"
UNBOLD			=				"\033[21m"
UNDERLINE		=				"\033[4m"
UNUNDERLINE	=				"\033[24m"
SURLIGNE		=				"\033[7m"
UNSURLIGNE	=				"\033[27m"

RED					=				"\033[31m"
GREEN				=				"\033[32m"
YELLOW			=				"\033[33m"
DARKBLUE		=				"\033[34m"
PINK				=				"\033[35m"
TEAL				=				"\033[36m"

NAME 				=				alpha
PSRC				=				./src/app/
SRC 				=				$(PSRC)testfile1.cpp \
										$(PSRC)TutorialApplication.cpp \
										$(PSRC)BaseApplication.cpp
OBJS				=				$(SRC:.cpp=.o)

CXX					=				g++-4.8
##ifeq 								($(DEBUG),true)
##	CXXFLAGS			=				-Wall -Wextra -Werror -std=c++11 -g3
##else
##	CXXFLAGS			=				-Wall -Wextra -Werror -std=c++11
##endif
CXXFLAGS		+=			-I ./inc/
OGREFLAGS		=				-lboost_system -lOgreMain -lOgreOverlay -lOIS -lpng

all					 : $(NAME)
ifeq ($(DEBUG),true)
	@echo $(BOLD)$(RED)"COMPILED WITH DEBUG MODE"$(NORMAL)
else
	@echo $(BOLD)$(RED)"COMPILED WITHOUT DEBUG MODE"$(NORMAL)
endif

%.o					 :  %.cpp
								@$(CXX) -o $@ -c $< $(CXXFLAGS)
								@echo $(BOLD)$(PINK)"[GENERATING]    "$(NORMAL)$@$(BOLD)$(YELLOW)" [FROM] "$(NORMAL)$<

$(NAME)			 :	$(OBJS)
								@printf $(TEAL)$(BOLD)"[GENERATING]"$(NORMAL)
								@printf "%30s          " $@
								@printf $(NORMAL)"\n"
								@$(CXX) $(CXXFLAGS) -o $(NAME) $(OBJS) $(OGREFLAGS)
								@echo	$(BOLD)$(GREEN)"#------------------------------------------------------#"
								@printf $(BOLD)$(GREEN)"[COMPILED EXEC]"$(NORMAL)
								@printf "%5s"$(NAME)
								@printf "\n"
								@echo	$(BOLD)$(GREEN)"#------------------------------------------------------#"
								@printf "\n"


clean				 :
								@rm -rf $(OBJS)
								@echo $(BOLD)$(RED)"OBJECT FILES DELETED"$(NORMAL)

fclean			 :	clean
								@rm -rf $(NAME)
								@echo $(BOLD)$(RED)"EXEC FILE DELETED\n"$(NORMAL)

re					 :	fclean all
