#' Strongly connected components
#'
#' Compute the strongly connected component (SCC) of each vertex and return a
#'   DataFrame with each vertex assigned to the SCC containing that vertex.
#'
#' @template roxlate-gf-x
#' @param max_iter Maximum number of iterations.
#' @template roxlate-gf-dots
#' @export
gf_scc <- function(x, max_iter, ...) {
  max_iter <- ensure_scalar_integer(max_iter)

  gf <- spark_graphframe(x)

  algo <- gf %>%
    invoke("stronglyConnectedComponents") %>%
    invoke("maxIter", max_iter)

  algo %>%
    invoke("run") %>%
    sdf_register()
}
