/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstlast_bonus.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/24 17:25:21 by rrouille          #+#    #+#             */
/*   Updated: 2022/10/26 10:50:56 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mylib.h"

/**
 * @brief	The ft_lstlast function takes in a t_list pointer as a
 * 			parameter. This t_list pointer points to the linked list of which
 * 			we want to find the last element. The function returns a t_list
 * 			pointer that points to the last element in the linked list. If the
 * 			linked list is empty, the function returns NULL.
 * @return	It returns a pointer to the last element of the linked list.
 * @param	t_list_ptr		This t_list pointer points to the linked list of
 * 							which we want to find the last element.
 */
t_list	*ft_lstlast(t_list *lst)
{
	if (lst == NULL)
		return (NULL);
	while (lst->next != NULL)
		lst = lst->next;
	return (lst);
}
