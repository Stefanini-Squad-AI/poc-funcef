{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 09/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlDicionarioDados;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH;

type
  TCtrlDicionarioDados = class(TCtrlCustomRH)
  public
    function ListGrupos: OleVariant;
    function ListTable: OleVariant;
    function ListCampos(Descricao: string): OleVariant;
    function ListCmpBd(Descricao: string): OleVariant;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDicionarioDados }

function TCtrlDicionarioDados.ListGrupos: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODGRUPOARQUIVO, DESCGRUPOARQUIVO AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  GRPARQUIVO');
end;

function TCtrlDicionarioDados.ListTable: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TABLENAME AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  DDTABLE');
end;

function TCtrlDicionarioDados.ListCampos(Descricao: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.*, CG.CODGRUPOARQUIVO, G.DESCGRUPOARQUIVO'+CR_LF+
    'FROM'+CR_LF+
    '  CMPBD C, CMPBDGRP CG, GRPARQUIVO G'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.ENTIDADE        = '+QuotedStr(Descricao)+') AND'+CR_LF+
    '  (G.CODGRUPOARQUIVO = CG.CODGRUPOARQUIVO) AND'+CR_LF+
    '  (C.IDCAMPO         = CG.IDCAMPO) AND'+CR_LF+
    '  (C.CAMPODOBANCO    > 0)');
end;
      
function TCtrlDicionarioDados.ListCmpBd(Descricao: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.*, CG.CODGRUPOARQUIVO, G.DESCGRUPOARQUIVO'+CR_LF+
    'FROM'+CR_LF+
    '  CMPBD C, CMPBDGRP CG, GRPARQUIVO G'+CR_LF+
    'WHERE'+CR_LF+
    '  (G.DESCGRUPOARQUIVO = '+QuotedStr(Descricao)+') AND'+CR_LF+
    '  (G.CODGRUPOARQUIVO  = CG.CODGRUPOARQUIVO) AND'+CR_LF+
    '  (CG.IDCAMPO         = C.IDCAMPO) AND'+CR_LF+
    '  (C.CAMPODOBANCO     > 0)');
end;

end.
