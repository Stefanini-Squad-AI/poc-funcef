'use client'

import { useState, useMemo, useCallback } from 'react'
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
  Badge,
  Skeleton,
  Button,
} from '@funcef-componentes/react'
import { ChevronRight, ChevronDown, ChevronsDownUp, ChevronsUpDown, FolderTree } from 'lucide-react'
import type { ContaContabil } from '../types'
import { GRUPO_LABELS, TIPO_LABELS } from '../types'

// ─────────────────────────────────────────────────────────────────────────────
// Tipos internos para a árvore hierárquica
// ─────────────────────────────────────────────────────────────────────────────

interface TreeNode {
  conta: ContaContabil
  children: TreeNode[]
  /** chave única para o estado de expansão */
  key: string
}

/**
 * Constrói uma árvore hierárquica a partir da lista plana de contas.
 * A hierarquia é determinada pelo código: um código "1.1.01" é filho de "1.1",
 * que é filho de "1".
 */
function buildTree(contas: ContaContabil[]): TreeNode[] {
  // Ordenar por código para que os pais venham antes dos filhos
  const sorted = [...contas].sort((a, b) => {
    const aParts = a.codigo.split('.').map(Number)
    const bParts = b.codigo.split('.').map(Number)
    for (let i = 0; i < Math.max(aParts.length, bParts.length); i++) {
      const aVal = aParts[i] ?? 0
      const bVal = bParts[i] ?? 0
      if (aVal !== bVal) return aVal - bVal
    }
    return 0
  })

  const roots: TreeNode[] = []
  // Mapa de código → nó para encontrar pais rapidamente
  const nodeMap = new Map<string, TreeNode>()

  for (const conta of sorted) {
    const node: TreeNode = {
      conta,
      children: [],
      key: `${conta.plano}-${conta.codigo}`,
    }
    nodeMap.set(conta.codigo, node)

    // Buscar o pai: remover o último segmento do código
    const parts = conta.codigo.split('.')
    if (parts.length > 1) {
      const parentCode = parts.slice(0, -1).join('.')
      const parent = nodeMap.get(parentCode)
      if (parent) {
        parent.children.push(node)
      } else {
        // Pai não encontrado, tratar como raiz
        roots.push(node)
      }
    } else {
      // Nível 1 = raiz
      roots.push(node)
    }
  }

  return roots
}

/**
 * Conta quantos nós tem uma árvore (incluindo filhos recursivamente).
 */
function countNodes(nodes: TreeNode[]): number {
  return nodes.reduce((acc, node) => acc + 1 + countNodes(node.children), 0)
}

/**
 * Coleta todas as chaves de uma árvore.
 */
function collectAllKeys(nodes: TreeNode[], keys: string[] = []): string[] {
  for (const node of nodes) {
    keys.push(node.key)
    collectAllKeys(node.children, keys)
  }
  return keys
}

// ─────────────────────────────────────────────────────────────────────────────
// Componente recursivo para cada nó da árvore
// ─────────────────────────────────────────────────────────────────────────────

function TreeNodeItem({
  node,
  depth,
  expandedKeys,
  onToggle,
}: {
  node: TreeNode
  depth: number
  expandedKeys: Set<string>
  onToggle: (key: string) => void
}) {
  const hasChildren = node.children.length > 0
  const isExpanded = expandedKeys.has(node.key)
  const { conta } = node

  return (
    <div>
      <div
        className="flex items-center justify-between rounded-md border border-border/50 p-2 transition-colors hover:bg-muted/50"
        style={{ marginLeft: `${depth * 20}px` }}
      >
        <div className="flex items-center gap-2 min-w-0 flex-1">
          {hasChildren ? (
            <button
              type="button"
              onClick={() => onToggle(node.key)}
              className="flex-shrink-0 p-0.5 rounded hover:bg-muted transition-colors"
              aria-label={isExpanded ? 'Colapsar' : 'Expandir'}
            >
              {isExpanded ? (
                <ChevronDown className="w-4 h-4" />
              ) : (
                <ChevronRight className="w-4 h-4" />
              )}
            </button>
          ) : (
            <span className="flex-shrink-0 w-5 inline-block" />
          )}
          <span className="font-mono text-sm font-semibold tabular-nums flex-shrink-0">
            {conta.codigo}
          </span>
          <span className="text-sm truncate">{conta.descricao}</span>
        </div>

        <div className="flex flex-wrap items-center gap-1.5 flex-shrink-0">
          <Badge variant="outline" className="text-xs">
            {TIPO_LABELS[conta.tipo] ?? conta.tipo}
          </Badge>
          <Badge variant="secondary" className="text-xs">
            {GRUPO_LABELS[conta.grupo] ?? conta.grupo}
          </Badge>
          {conta.inativa && (
            <Badge variant="outline" className="text-xs">
              Inativa
            </Badge>
          )}
          {conta.bloqueada && (
            <Badge variant="destructive" className="text-xs">
              Bloqueada
            </Badge>
          )}
        </div>
      </div>

      {hasChildren && isExpanded && (
        <div className="mt-1 space-y-1">
          {node.children.map((child) => (
            <TreeNodeItem
              key={child.key}
              node={child}
              depth={depth + 1}
              expandedKeys={expandedKeys}
              onToggle={onToggle}
            />
          ))}
        </div>
      )}
    </div>
  )
}

// ─────────────────────────────────────────────────────────────────────────────
// Componente principal: Árvore de Contas Contábeis
// ─────────────────────────────────────────────────────────────────────────────

export function ContasList({ contas }: { contas: ContaContabil[] }) {
  const tree = useMemo(() => buildTree(contas), [contas])
  const totalNodes = useMemo(() => countNodes(tree), [tree])
  const allKeys = useMemo(() => collectAllKeys(tree), [tree])

  // Por padrão, expandir apenas os nós raiz (nível 1)
  const [expandedKeys, setExpandedKeys] = useState<Set<string>>(
    () => new Set(tree.filter((n) => n.children.length > 0).map((n) => n.key)),
  )

  const handleToggle = useCallback((key: string) => {
    setExpandedKeys((prev) => {
      const next = new Set(prev)
      if (next.has(key)) {
        next.delete(key)
      } else {
        next.add(key)
      }
      return next
    })
  }, [])

  const handleExpandAll = useCallback(() => {
    setExpandedKeys(new Set(allKeys))
  }, [allKeys])

  const handleCollapseAll = useCallback(() => {
    setExpandedKeys(new Set())
  }, [])

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <div>
            <CardTitle className="flex items-center gap-2">
              <FolderTree className="w-5 h-5" />
              Árvore de Contas Contábeis
            </CardTitle>
            <CardDescription>
              {totalNodes} conta(s) encontrada(s) no plano de contas
            </CardDescription>
          </div>
          <div className="flex gap-2">
            <Button type="button" variant="outline" size="sm" onClick={handleExpandAll}>
              <ChevronsUpDown className="w-4 h-4 mr-1" />
              Expandir tudo
            </Button>
            <Button type="button" variant="outline" size="sm" onClick={handleCollapseAll}>
              <ChevronsDownUp className="w-4 h-4 mr-1" />
              Colapsar tudo
            </Button>
          </div>
        </div>
      </CardHeader>
      <CardContent className="space-y-1">
        {tree.map((node) => (
          <TreeNodeItem
            key={node.key}
            node={node}
            depth={0}
            expandedKeys={expandedKeys}
            onToggle={handleToggle}
          />
        ))}
      </CardContent>
    </Card>
  )
}

export function ContasListSkeleton() {
  return (
    <Card>
      <CardHeader>
        <Skeleton className="h-5 w-48" />
        <Skeleton className="h-4 w-32" />
      </CardHeader>
      <CardContent className="space-y-2">
        {Array.from({ length: 8 }).map((_, i) => (
          <div
            key={i}
            className="flex items-center justify-between rounded-md border border-border/50 p-3"
          >
            <Skeleton className="h-4 w-32" />
            <Skeleton className="h-4 w-16" />
          </div>
        ))}
      </CardContent>
    </Card>
  )
}
