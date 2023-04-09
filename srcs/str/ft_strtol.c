/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtol.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/09 20:28:12 by marvin            #+#    #+#             */
/*   Updated: 2023/04/09 20:28:12 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mylib.h"

long ft_strtol(const char *nptr, char **endptr, int base)
{
    if (base != 0 && base != 10 && base != 16)
        return 0;
    const char *ptr = nptr;
    bool negative = false;
    while (ft_isspace(*ptr))
        ptr++;
    if (*ptr == '-')
	{
        negative = true;
        ptr++;
    } else if (*ptr == '+')
        ptr++;
    if (base == 0)
	{
        if (*ptr == '0' && (ptr[1] == 'x' || ptr[1] == 'X'))
		{
            base = 16;
            ptr += 2;
        } else
            base = 10;
    }
    long result = 0;
    while (true)
	{
        int digit;
        if (ft_isdigit(*ptr))
            digit = *ptr - '0';
        else if (base == 16 && isxdigit(*ptr))
            digit = 10 + (ft_tolower(*ptr) - 'a');
        else
            break;
        if (digit >= base)
            break;
        result = result * base + digit;
        ptr++;
    }
    if (endptr != NULL)
        *endptr = (char *)ptr;
    return negative ? -result : result;
}
