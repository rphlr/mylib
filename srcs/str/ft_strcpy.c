/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcpy.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/14 14:07:12 by rrouille          #+#    #+#             */
/*   Updated: 2023/02/06 13:04:25 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @brief	Copies the string pointed to by `src` (including the null
 * 			terminator) to the buffer pointed to by `dest`.
 * @return	Returns a pointer to the destination string `dest`.
 * @param	char_ptr	Pointer to the destination buffer where the string is
 * 						to be copied.
 * @param	char_ptr	Pointer to the null-terminated string to be copied.
 */
char	*ft_strcpy(char *dest, const char *src)
{
	int	i;

	i = 0;
	while (src[i] != '\0')
	{
		dest[i] = src[i];
		i++;
	}
	dest[i] = '\0';
	return (dest);
}

/**
 * @brief	Copies the string pointed to by `src` (including the null
 * 			terminator) to the buffer pointed to by `dest`.
 * @return	Returns a pointer to the destination string `dest`.
 * @param	char_ptr	Pointer to the destination buffer where the string is
 * 						to be copied.
 * @param	char_ptr	Pointer to the null-terminated string to be copied.
 */
void ft_strcpy_void(char *dest, char *src)
{
	int	i;

	i = 0;
	while (src[i] != '\0')
	{
		dest[i] = src[i];
		i++;
	}
	dest[i] = '\0';
}