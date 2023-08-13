/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strndup.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/10 14:23:04 by rrouille          #+#    #+#             */
/*   Updated: 2023/08/13 16:09:28 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mylib.h"

char	*ft_strndup(const char *s, size_t n)
{
	char	*ret;
	size_t	i;

	i = 0;
	ret = ft_gc_malloc(sizeof(char) * (n + 1));
	if (!ret)
		return (NULL);
	while (i < n && s[i])
	{
		ret[i] = s[i];
		i++;
	}
	ret[i] = '\0';
	return (ret);
}
