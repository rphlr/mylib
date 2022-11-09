/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_recursive_power.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/13 17:53:11 by rrouille          #+#    #+#             */
/*   Updated: 2022/11/08 18:31:45 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/libft.h"

int	ft_recursive_power(int nb, int power)
{
	int	nombre;

	if (power < 0)
		return (0);
	if (power == 0)
		return (1);
	nombre = nb * ft_recursive_power(nb, power - 1);
	return (nombre);
}
