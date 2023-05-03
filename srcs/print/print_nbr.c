/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_nbr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/19 14:45:27 by rrouille          #+#    #+#             */
/*   Updated: 2023/05/03 14:05:41 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mylib.h"

/**
* @notice	This function prints a number.
* @param	int					The number to print.
* @return	int					The lenght of characters of the printed
*								number.
*/
int	print_nbr(int num)
{
	int		len;
	char	*numchar;

	len = 0;
	numchar = ft_itoa(num);
	len = print_str(numchar);
	ft_gc_free(numchar);
	return (len);
}
