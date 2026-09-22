import {
  QueryClient,
  QueryCache,
  MutationCache,
} from '@tanstack/react-query'
import { toast } from '@funcef-componentes/react'

function makeQueryClient() {
  return new QueryClient({
    queryCache: new QueryCache({
      onError: (error) => {
        toast.error(error.message)
      },
    }),
    mutationCache: new MutationCache({
      onError: (error) => {
        toast.error(error.message)
      },
    }),
    defaultOptions: {
      queries: {
        staleTime: 60 * 1000,
        refetchOnWindowFocus: false,
        retry: 1,
      },
    },
  })
}

let browserQueryClient: QueryClient | undefined = undefined

export function getQueryClient() {
  if (typeof window === 'undefined') {
    return makeQueryClient()
  }
  if (!browserQueryClient) {
    browserQueryClient = makeQueryClient()
  }
  return browserQueryClient
}
