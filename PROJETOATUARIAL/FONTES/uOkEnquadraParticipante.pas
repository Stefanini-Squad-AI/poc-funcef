{===============================================================================
Unit    :  uOkEnquadraParticipante
Form    :  frmOkEnquadraParticipante

Autor   : Rômulo R Rebouças
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Enquadaramento de participantes para cálculo ou exportação de Cadastros

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------
27/09/2000    Cori             Alterado a opção de Exportação de Cadastro
                               devido a mudanças no Modelo de Dados:
                               Incluída a Tabela FI_GRUPO_EXPORT_PARTIC
----------    -----------      -------------------------------------------------
02/05/2006    Claudio R.       Alterado o caption do Form para
                               "Associação de versão a processo"
----------    -----------      -------------------------------------------------
07/07/2006    Claudio R.       Criado a função de desfazer um enquadramento
==============================================================================  }
unit uOkEnquadraParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, uEnquadraParticipante, comctrls,
  uMensErro;

type
  TfrmOkEnquadraParticipante = class(TfrmOkCancelar)
    RadioGroupTipo: TRadioGroup;
    wwQryParticipante: TwwQuery;
    wwQryAtuGrupoPartic: TwwQuery;
    QryInsGrupoExport: TwwQuery;
    QryDelGrupoExportacao: TwwQuery;
    wwQryParticipanteCD_VERSAO: TFloatField;
    wwQryParticipanteCD_PARTIC: TFloatField;
    wwQryParticipanteCD_PESSOA_PATROC: TFloatField;
    wwQryParticipanteCD_PESSOA_ENTID: TFloatField;
    wwQryParticipanteCD_PLANO: TFloatField;
    wwQryParticipanteCD_TIPO_CAT_PROF_ESP: TFloatField;
    wwQryParticipanteNR_MATRICULA: TStringField;
    wwQryParticipanteNO_PESSOA: TStringField;
    wwQryParticipanteCD_ESTADO_CIVIL: TStringField;
    wwQryParticipanteIR_SEXO: TStringField;
    wwQryParticipanteTP_PARTICIPANTE: TStringField;
    wwQryParticipanteIR_CONDICAO_TRABALHO: TStringField;
    wwQryParticipanteCD_GRUPO_CALCULO: TFloatField;
    wwQryParticipanteDS_REGIONAL: TStringField;
    wwQryParticipanteCD_SITUACAO_PATROC: TFloatField;
    wwQryParticipanteCD_SITUACAO_FUNDACAO: TFloatField;
    wwQryParticipanteNR_CPF: TStringField;
    qryInsCalculo: TwwQuery;
    QryPlanosVersao: TwwQuery;
    QryOrdemGrupo: TwwQuery;
    qryCalculoAtuarial: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure EnquadraParticCalculo (CD_VERSAO, CD_PARTIC : integer);
    procedure EnquadraParticExportacao (CD_VERSAO, CD_PARTIC : integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure inserePlanosGrupo(iCD_GRUPO: Integer);
  public
    { Public declarations }
    procedure DesfazAssociacao; 
  end;

var
  frmOkEnquadraParticipante: TfrmOkEnquadraParticipante;
  w_linhas, w_linha_Atual : integer;
  w_EnquadraParticipante : TEnquadraParticipante;

implementation

uses uGlobal, FAnimacao, DBaseDados,  uVersaoBase, FTelaAut, uDtMdlSat;

{$R *.DFM}

procedure TfrmOkEnquadraParticipante.bbtnConfirmarClick(Sender: TObject);
begin
   If RadioGroupTipo.ItemIndex = 2 Then
   Begin
      DesfazAssociacao;
      Exit;
   End;

   w_EnquadraParticipante := TEnquadraParticipante.create(self);

   {Recuperar participantes }
   wwQryParticipante.Close;
   wwQryParticipante.ParamByName('CD_VERSAO').asinteger := WG_CD_VERSAO ;
   wwQryParticipante.open;

   If wwQryParticipante.recordcount = 0 then
   begin
      MessageDlg('Falta cadastrar Participantes para realizar o enquadramento',
                 mtWarning, [mbOk], 0);
      exit;
   End;

   //-- Cria Form de Animação
   Application.CreateForm(TfrmAnimacao, frmAnimacao);

   w_linhas := wwQryParticipante.recordcount;
   w_linha_Atual := 0;

   frmAnimacao.SetAnimacao ('Enquadrando Participantes nos grupos ...',
                            w_linhas,True,True,aviCopyFiles);

   If RadioGroupTipo.itemindex = 1 then
   Begin
      qryDelGrupoExportacao.ParamByName('CD_VERSAO').asInteger :=
                           wwQryParticipante.fieldbyname('CD_VERSAO').asinteger;

      qryDelGrupoExportacao.ExecSQL;
   end;

   While not wwQryParticipante.eof do
   Begin
      w_linha_atual := w_linha_atual + 1;
      frmAnimacao.SetProgressBar( w_linha_atual );
      If frmAnimacao.Cancel Then
      Begin
         frmAnimacao.Close;
         frmAnimacao.Free;
         ShowMessage('Processamento cancelado por intervenção do usuário');
         Exit;
      End;

      With dtmBaseDados.dbBaseDados do
      Begin

         If not InTransaction then
            StartTransaction;

         Try
            If RadioGroupTipo.itemindex = 0 then
               //-- Enquadra participante para Cálculo
               EnquadraParticCalculo (wwQryParticipante.fieldbyname('CD_VERSAO').asinteger,
                                      wwQryParticipante.fieldbyname('CD_PARTIC').asinteger)
            Else
               //-- Enquadra Participante para Exportação
               EnquadraParticExportacao(wwQryParticipante.fieldbyname('CD_VERSAO').asinteger,
                                        wwQryParticipante.fieldbyname('CD_PARTIC').asinteger);
            If InTransaction then
               commit;

         Except
            On E: Exception do
            Begin
               rollback;
               frmAnimacao.Close;
               frmAnimacao.Free;
               MessageDlg('Erro na atualização do enquadramento do grupo do Participante'
                          + #13#10 + E.Message, mtError, [mbOk], 0);
               exit;
            End;
         End;
      End;

      wwQryParticipante.next;

   End;

   w_EnquadraParticipante.Free;
   frmAnimacao.Close;
   frmAnimacao.Free;
end;

procedure TfrmOkEnquadraParticipante.EnquadraParticCalculo (CD_VERSAO, CD_PARTIC : integer) ;
var w_grupo : integer;
begin

   //-- Recupera grupo de enquadramento do Participante
   w_grupo := w_EnquadraParticipante.EnquadramentoCalculo (CD_VERSAO, CD_PARTIC);

   inserePlanosGrupo(w_grupo);

   //-- Atualiza enquadramento no cadastro
   wwQryAtuGrupoPartic.Close;
   wwQryAtuGrupoPartic.ParamByName('CD_VERSAO').asinteger    := CD_VERSAO;
   wwQryAtuGrupoPartic.ParamByName('CD_PARTIC').asinteger    := CD_PARTIC;

   If w_grupo = 0 then
      wwQryAtuGrupoPartic.ParamByName('CD_GRUPO_CALCULO').clear
   Else
      wwQryAtuGrupoPartic.ParamByName('CD_GRUPO_CALCULO').asinteger := w_grupo;

   wwQryAtuGrupoPartic.execsql;

end;

procedure TfrmOkEnquadraParticipante.EnquadraParticExportacao (CD_VERSAO, CD_PARTIC : integer);
var w_grupo : integer;
begin
   //-- Recupera grupos de participante
   DtMdlSat.wwQryGrupoExportacao.Close;
   DtMdlSat.wwQryGrupoExportacao.ParamByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
   DtMdlSat.wwQryGrupoExportacao.ParamByName('CD_PESSOA_ENTID').asinteger := WG_CD_PESSOA_ENTID;
   DtMdlSat.wwQryGrupoExportacao.ParamByName('CD_PLANO').asinteger := WG_CD_PLANO;
   DtMdlSat.wwQryGrupoExportacao.open;

   If DtMdlSat.wwQryGrupoExportacao.eof then
   Begin
      frmAnimacao.Close;
      frmAnimacao.Free;
      MessageDlg('Falta cadastrar grupos de Participantes para realizar o enquadramento !',
                 mtWarning, [mbOk], 0);
      exit;
   End;

   While not(DtMdlSat.wwQryGrupoExportacao.eof) do
   Begin
      //-- Recupera grupo de enquadramento do Participante
      w_grupo := w_EnquadraParticipante.EnquadramentoExportacao (CD_VERSAO, CD_PARTIC);

      If w_grupo > 0 then
      Begin
         QryInsGrupoExport.ParamByName('CD_VERSAO').asInteger := CD_VERSAO;
         QryInsGrupoExport.ParamByName('CD_PARTIC').asInteger := CD_PARTIC;
         QryInsGrupoExport.ParamByName('CD_GRUPO_PARTIC').asInteger := w_grupo;
         QryInsGrupoExport.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
         QryInsGrupoExport.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
         QryInsGrupoExport.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
         QryInsGrupoExport.execsql;
      End;

      DtMdlSat.wwQryGrupoExportacao.next;
   End;

   DtMdlSat.wwQryGrupoExportacao.close;
end;

procedure TfrmOkEnquadraParticipante.FormCreate(Sender: TObject);
Var n:Integer;
begin
   inherited;

   If uGlobal.WG_CD_VERSAO = 0 then
   Begin
      ShowMessage('Selecione primerio uma Versão da Base !');
      AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
      close;
      exit;
   End;
end;

procedure TfrmOkEnquadraParticipante.inserePlanosGrupo(iCD_GRUPO: Integer);
begin
   Try
      QryPlanosVersao.Close;
      QryPlanosVersao.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
      QryPlanosVersao.Open;

      While not QryPlanosVersao.Eof do
      Begin
         QryOrdemGrupo.Close;
         QryOrdemGrupo.ParamByName('CD_GRUPO_PARTIC').asInteger := iCD_GRUPO;
         QryOrdemGrupo.Open;

         qryInsCalculo.Close;
         qryInsCalculo.ParamByName('CD_GRUPO_PARTIC').asInteger := iCD_GRUPO;
         qryInsCalculo.ParamByName('CD_PESSOA_PATROC').asInteger :=
                      QryPlanosVersao.FieldByName('CD_PESSOA_PATROC').asInteger;
         qryInsCalculo.ParamByName('CD_PESSOA_ENTID').asInteger :=
                       QryPlanosVersao.FieldByName('CD_PESSOA_ENTID').asInteger;
         qryInsCalculo.ParamByName('CD_PLANO').asInteger :=
                       QryPlanosVersao.FieldByName('CD_PLANO').asInteger;
         qryInsCalculo.ParamByName('NR_ORDEM').asInteger :=
                              QryOrdemGrupo.FieldByName('MAX_CD').asInteger + 1;

         Try
            qryInsCalculo.ExecSQL;
         Except End;

         QryPlanosVersao.Next;
      End;
   Finally
      QryPlanosVersao.Close;
      QryOrdemGrupo.Close;
   End;
end;

procedure TfrmOkEnquadraParticipante.DesfazAssociacao;
Var iContador:Integer;
    lstGruposDesfeitos:TStringList;
    sMensagem:String;
begin
   Try
      iContador := 0;
      lstGruposDesfeitos := TStringList.Create;

      { Cria Form de Animação }
      Application.CreateForm(TfrmAnimacao, frmAnimacao);

      if not dtmBaseDados.dbBaseDados.inTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

      DtMdlSat.wwQryGrupoCalculo.Close;
      DtMdlSat.wwQryGrupoCalculo.ParamByName('CD_PESSOA_PATROC').AsInteger := WG_CD_PESSOA_PATROC;
      DtMdlSat.wwQryGrupoCalculo.ParamByName('CD_PESSOA_ENTID').AsInteger  := WG_CD_PESSOA_ENTID;
      DtMdlSat.wwQryGrupoCalculo.ParamByName('CD_PLANO').AsInteger         := WG_CD_PLANO;
      DtMdlSat.wwQryGrupoCalculo.Open;

      frmAnimacao.SetAnimacao ('Desfazento a associação do participante ...',
                               DtMdlSat.wwQryGrupoCalculo.RecordCount,
                               True,True,aviCopyFiles);

      wwQryAtuGrupoPartic.Close;
      wwQryAtuGrupoPartic.SQL[5] := 'CD_GRUPO_CALCULO = :CD_GRUPO_CALCULO_OLD';

      While not DtMdlSat.wwQryGrupoCalculo.EOF do
      Begin
         qryCalculoAtuarial.Close;
         qryCalculoAtuarial.ParamByName('CD_PESSOA_PATROC').AsInteger := WG_CD_PESSOA_PATROC;
         qryCalculoAtuarial.ParamByName('CD_PESSOA_ENTID').AsInteger  := WG_CD_PESSOA_ENTID;
         qryCalculoAtuarial.ParamByName('CD_PLANO').AsInteger         := WG_CD_PLANO;
         qryCalculoAtuarial.ParamByName('CD_VERSAO').AsInteger        := WG_CD_VERSAO;
         qryCalculoAtuarial.Open;

         If qryCalculoAtuarial.IsEmpty Then
         Begin
            wwQryAtuGrupoPartic.ParamByName('CD_GRUPO_CALCULO').Clear;
            wwQryAtuGrupoPartic.ParamByName('CD_VERSAO').AsInteger := WG_CD_VERSAO;
            wwQryAtuGrupoPartic.ParamByName('CD_GRUPO_CALCULO_OLD').AsInteger :=
                      DtMdlSat.wwQryGrupoCalculo.FieldByName('CD_GRUPO_PARTIC').AsInteger;
            wwQryAtuGrupoPartic.ExecSQL;
         End
         Else
            lstGruposDesfeitos.Add(DtMdlSat.wwQryGrupoCalculo.FieldByName('NO_GRUPO_PARTIC').AsString);

         Inc(iContador);
         frmAnimacao.SetProgressBar( iContador );
         DtMdlSat.wwQryGrupoCalculo.Next;
      End;

      frmAnimacao.Close;
      frmAnimacao.Free;

      sMensagem := '     Os grupos abaixo não foram desfeitos pois já existem cálculos para esses' + chr(13) +
                   ' grupos nessa versão.' + chr(13) + chr(13) +
                   lstGruposDesfeitos.Text + chr(13) + chr(13) +
                   'Confirma o desfazer?';

      If lstGruposDesfeitos.Count > 0 Then
      Begin
         If MsgDlg(sMensagem,'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
            dtmBaseDados.dbBaseDados.Commit
         Else
            dtmBaseDados.dbBaseDados.Rollback;
      End
      Else
         dtmBaseDados.dbBaseDados.Commit;
   Finally
      wwQryAtuGrupoPartic.Close;
      wwQryAtuGrupoPartic.SQL[5] := ' CD_PARTIC     = :CD_PARTIC';
   End;
end;

end.
