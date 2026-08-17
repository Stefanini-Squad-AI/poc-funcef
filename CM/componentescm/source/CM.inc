{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
   {$DEFINE CM3}
   {$IFNDEF VER100}
      {$DEFINE CM4}
      {$IFNDEF VER120}
         {$DEFINE CM5}
      {$ENDIF}
   {$ENDIF}
