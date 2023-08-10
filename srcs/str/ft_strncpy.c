/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strncpy.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/10 12:31:04 by rrouille          #+#    #+#             */
/*   Updated: 2023/08/10 12:32:31 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mylib.h"

char *ft_strncpy(char *dest, const char *src, size_t n)
{
    size_t i;

	i = -1;
    while (i < n && src[i] != '\0')
        dest[i] = src[i];
    while (i++ < n)
        dest[i] = '\0';
    return (dest);
}