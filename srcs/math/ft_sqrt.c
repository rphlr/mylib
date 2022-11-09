/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_sqrt.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/14 08:49:09 by rrouille          #+#    #+#             */
/*   Updated: 2022/11/08 18:32:10 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/libft.h"

int	ft_sqrt(int nb)
{
	unsigned int	i;

	i = 0;
	if (nb < 0)
		return (0);
	if (nb <= 1)
		return (nb);
	while (i * i < (unsigned int) nb)
		i++;
	if (i * i == (unsigned int) nb)
		return (i);
	return (0);
}
