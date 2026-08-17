unit uEnquadraParticipante;

interface

Uses Classes, stdctrls, sysutils, dbtables, db;

Type
   TEnquadraParticipante = Class
   Private
      //-- Listas de tabelas com seus atributos
      Fquery  : TQuery;
      sql     : String;
   Public
      function EnquadramentoCalculo (CD_VERSAO, CD_PARTIC : integer) : integer;
      function EnquadramentoExportacao (CD_VERSAO, CD_PARTIC : integer) : integer;

      Constructor Create (AOWner : TComponent);
      Destructor  Destroy; override;
   end;

implementation

uses uDtMdlSat, FAnimacao, uglobal, uFuncGerais;

{ Cronstructor e Destroy da Classe }
Constructor TEnquadraParticipante.Create (AOWner : TComponent);
Begin
   Inherited Create;

   Fquery  := TQuery.create(AOwner);
End;

Destructor TEnquadraParticipante.Destroy;
Begin
   Fquery.free;

  Inherited Destroy;
End;

{-------------------------------------------------------------------}
{Recupera enquadramento do Participante do partir do SQL
registrado em Grupo_Participante - Cálculo}
function TEnquadraParticipante.EnquadramentoCalculo (CD_VERSAO, CD_PARTIC : integer) : integer;
Var Temp:Integer;
begin
   //-- Recupera grupos de participante
   DtMdlSat.wwQryGrupoCalculo.Close;
   DtMdlSat.wwQryGrupoCalculo.ParamByName('CD_PESSOA_PATROC').AsInteger := WG_CD_PESSOA_PATROC;
   DtMdlSat.wwQryGrupoCalculo.ParamByName('CD_PESSOA_ENTID').AsInteger := WG_CD_PESSOA_ENTID;
   DtMdlSat.wwQryGrupoCalculo.ParamByName('CD_PLANO').AsInteger := WG_CD_PLANO;
   DtMdlSat.wwQryGrupoCalculo.open;

   If DtMdlSat.wwQryGrupoCalculo.eof then
   Begin
      frmAnimacao.Close;
      frmAnimacao.Free;
      Raise Exception.Create ('Falta cadastrar grupos de Participantes para realizar o enquadramento');
   End;

   Fquery.DataBaseName := 'BaseDados';

   EnquadramentoCalculo := 0; //-- Grupo básico

   While not DtMdlSat.wwQryGrupoCalculo.eof do
   Begin
      Temp := DtMdlSat.wwQryGrupoCalculo.fieldbyname('CD_GRUPO_PARTIC').AsInteger;

      If varisnull(DtMdlSat.wwQryGrupoCalculo.fieldbyname('DS_SQL_ENQUADRAMENTO').AsString) then
      Begin
         DtMdlSat.wwQryGrupoCalculo.next;
         continue;
      End;

      Fquery.close;
      Fquery.SQL.Clear;
      sql := DtMdlSat.wwQryGrupoCalculo.fieldbyname('DS_SQL_ENQUADRAMENTO').asstring;
      sql := AtualizaParametros (CD_VERSAO, CD_PARTIC, sql);
      Fquery.SQL.text := sql;

      Fquery.open;

      If Fquery.recordcount > 0 then
      Begin
         EnquadramentoCalculo := DtMdlSat.wwQryGrupoCalculo.fieldbyname('CD_GRUPO_PARTIC').asInteger;
         break;
      End;

      DtMdlSat.wwQryGrupoCalculo.next;
   end;
end;

{-------------------------------------------------------------------}
{Recupera enquadramento do Participante do partir do SQL
registrado em Grupo_Participante  Exportação}
function TEnquadraParticipante.EnquadramentoExportacao (CD_VERSAO, CD_PARTIC : integer) : integer;
begin
   Fquery.DataBaseName := 'BaseDados';

   EnquadramentoExportacao := 0; //-- Grupo básico

   If varisnull(DtMdlSat.wwQryGrupoExportacao.fieldbyname('DS_SQL_ENQUADRAMENTO').asstring) then
      exit;

   Fquery.close;
   Fquery.SQL.Clear;
   sql := DtMdlSat.wwQryGrupoExportacao.fieldbyname('DS_SQL_ENQUADRAMENTO').asstring;
   sql := AtualizaParametros (CD_VERSAO, CD_PARTIC, sql);
   Fquery.SQL.Add (sql);

   Fquery.open;

   If Fquery.recordcount > 0 then
      EnquadramentoExportacao := DtMdlSat.wwQryGrupoExportacao.fieldbyname('CD_GRUPO_PARTIC').asInteger;
end;

end.
