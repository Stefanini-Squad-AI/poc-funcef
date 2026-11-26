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
If (Params.Values['USER NAME']  <> DeCriptografarString(UserName,CKEYCRIPTO)) Or
   (Params.Values['PASSWORD']  <> DeCriptografarString(Password,CKEYCRIPTO)) Or
   (Params.Values['SERVER NAME'] <> DeCriptografarString(ServerName,CKEYCRIPTO)) Then
Begin

   If Connected Then Close;

   Params.Values['USER NAME']  := DeCriptografarString(UserName,CKEYCRIPTO);
   Params.Values['PASSWORD']  := DeCriptografarString(Password,CKEYCRIPTO);
   Params.Values['SERVER NAME']  := DeCriptografarString(ServerName,CKEYCRIPTO);   
End;
