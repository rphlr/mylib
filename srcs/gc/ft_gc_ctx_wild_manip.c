/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_gc_ctx_wild_manip.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rrouille <rrouille@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/30 02:24:13 by rrouille              #+#    #+#             */
/*   Updated: 2023/05/03 11:17:02 by rrouille         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_gc_internal.h"

void	ft_gc_ctx_release(t_ctx *ctx, t_ptr p)
{
	ft_gc_ctx_transfer(_get_wild(), ctx, p);
}

void	ft_gc_ctx_release_all(t_ctx *ctx)
{
	ft_gc_ctx_transfer_all(_get_wild(), ctx);
}

void	ft_gc_ctx_obtain_wild(t_ctx *ctx)
{
	ft_gc_ctx_transfer_all(ctx, _get_wild());
}
