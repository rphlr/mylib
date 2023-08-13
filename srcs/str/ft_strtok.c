/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtok.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/13 16:06:10 by rrouille          #+#    #+#             */
/*   Updated: 2023/08/13 16:10:46 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mylib.h"

static char	*g_next_token = NULL;

bool	is_delimiter(char c, const char *delimiters)
{
	while (*delimiters)
	{
		if (c == *delimiters)
			return (true);
		delimiters++;
	}
	return (false);
}

char	*ft_strtok(char *str, const char *delimiters)
{
	char	*start_of_token;

	if (str == NULL)
		str = g_next_token;
	if (str == NULL)
		return (NULL);
	while (*str && is_delimiter(*str, delimiters))
		str++;
	if (*str == '\0')
	{
		g_next_token = NULL;
		return (NULL);
	}
	start_of_token = str;
	while (*str && !is_delimiter(*str, delimiters))
		str++;
	if (*str)
	{
		*str = '\0';
		g_next_token = str + 1;
	}
	else
		g_next_token = NULL;
	return (start_of_token);
}
