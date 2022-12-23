/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/04 12:46:09 by rrouille          #+#    #+#             */
/*   Updated: 2022/10/04 12:46:09 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mylib.h"

/**
 * @brief	This function calculates the length of a given string.
 * 			The function first declares a local size_t variable named len and
 * 			initializes it to 0. It then enters a loop that continues until the
 * 			character pointed to by str is the null character (i.e., the end of
 * 			the string). Inside the loop, the function increments len by one
 * 			and then advances the str pointer to the next character in the
 * 			string. After the loop ends, the function returns the value of len,
 * 			which is the length of the string.
 * @return	The ft_strlen function returns a size_t representing the length
 * 			of the string pointed to by the function's parameter.
 * @param	const_char_ptr	This parameter is a pointer to the string whose
 * 							length the function will calculate.
 */
size_t	ft_strlen(const char *str)
{
	size_t	len;

	len = 0;
	while (*(str++))
		len++;
	return (len);
}
