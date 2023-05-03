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

int	base_adjustment(const char **ptr, int base)
{
	if (base == 0)
	{
		if (**ptr == '0' && ((*ptr)[1] == 'x' || (*ptr)[1] == 'X'))
			base = 16;
		else
			base = 10;
	}
	return (base);
}

long	check_base(const char **ptr, int base, bool *negative)
{
	while (ft_isspace((int)**ptr))
		(*ptr)++;
	*negative = (**ptr == '-');
	if (**ptr == '-' || **ptr == '+')
		(*ptr)++;
	base = base_adjustment(ptr, base);
	return (base);
}

long	calculate_result(const char **ptr, int base, bool negative, long result)
{
	int		digit;

	while (1)
	{
		if (ft_isdigit((int)**ptr))
			digit = **ptr - '0';
		else if (base == 16 && ft_isxdigit((int)**ptr))
			digit = 10 + (ft_tolower((int)**ptr) - 'a');
		else
			break ;
		if (digit >= base)
			break ;
		result = result * base + digit;
		ptr++;
	}
	if (negative)
		result = -result;
	return (result);
}

long	ft_strtol(const char *nptr, char **endptr, int base)
{
	const char	*ptr;
	bool		negative;
	long		result;

	ptr = nptr;
	negative = false;
	result = 0;
	if (base == 0 || base == 10 || base == 16)
		base = check_base(&ptr, base, &negative);
	result = calculate_result(&ptr, base, negative, result);
	if (endptr != NULL)
		*endptr = (char *)ptr;
	return (result);
}
