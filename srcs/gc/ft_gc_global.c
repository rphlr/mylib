/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_gc_global.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/19 13:59:22 by rrouille          #+#    #+#             */
/*   Updated: 2023/05/30 14:42:26 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_gc_internal.h"

t_ptr	ft_gc_malloc(size_t sz)
{
	return (ft_gc_ctx_malloc(NULL, sz));
}

void	ft_gc_free(t_ptr p)
{
	ft_gc_ctx_free(NULL, p);
}

int	ft_gc_manage(void *p, void (*free_func)(void *))
{
	return (ft_gc_ctx_manage(NULL, p, free_func));
}

void	ft_gc_free_all(void)
{
	ft_gc_ctx_free_all(NULL);
	ft_gc_ctx_free_all(_get_wild());
}

void	ft_gc_destroy_all_contexts(void)
{
	t_ctx	**p_local;
	t_ctx	*cur;
	t_ctx	*tmp;

	p_local = _get_local_start();
	cur = *p_local;
	while (cur)
	{
		tmp = cur;
		cur = cur->next;
		ft_gc_ctx_destroy(tmp);
	}
	*p_local = NULL;
}
