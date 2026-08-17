{===============================================================================
Unit    :  uGrupoParticipante
Form    :  frmGrupoParticipante

Autor   : Rômulo Róseo Rebouças
Empresa : Fórmula Informática Ltda.

Data    : 12/07/2000

Objetivo: Cadastrar Rotinas de Cálculo.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável          Descrição
----------    -----------------    ---------------------------------------------
01/08/2000    Rômulo C. de Melo    Alterados os Métodos de Inserção, Alteração e
                                   Exclusão dos Registros
================================================================================}
unit uComposicaoCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, DBCtrls, ComCtrls, cmseldlg, wwidlg, Db, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Wwdotdot, Mask, wwdbedit, wwdblook, DBTables, Wwquery, Grids,
  DBGrids, CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmComposicaoCalculo = class(TfrmCadastro)
    wwqryGrupoPartic: TwwQuery;
    wwqryTipoGrupoPartic: TwwQuery;
    wwQryTipoBenef: TwwQuery;
    wwQryRotCalculo: TwwQuery;
    wwQryComposicaoCalculo234: TwwQuery;
    wwQryComposicaoCalcBenef342: TwwQuery;
    UpdtSQLComposicaoCalculo234: TUpdateSQL;
    UpdtSQLComposicaoCalcBenef342: TUpdateSQL;
    UpdtSQLGrupoPartic: TUpdateSQL;
    wwDtSrcComposicaoCalculo234: TwwDataSource;
    wwDtSrcComposicaoCalcBenef342: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    wwDBLkpCmbRotinaCalc: TwwDBLookupCombo;
    wwDBLKpCmbTipoBenef: TwwDBLookupCombo;
    wwDBLkpCmbTipoGrupo: TwwDBLookupCombo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    DBMemocondicao: TDBMemo;
    wwqryGrupoParticCD_GRUPO_PARTIC: TFloatField;
    wwqryGrupoParticCD_PESSOA_PATROC: TFloatField;
    wwqryGrupoParticCD_PESSOA_ENTID: TFloatField;
    wwqryGrupoParticCD_PLANO: TFloatField;
    wwqryGrupoParticNR_ORDEM: TFloatField;
    wwqryGrupoParticNO_GRUPO_PARTIC: TStringField;
    wwQryTipoBenefCD_TIPO_BENEF: TFloatField;
    wwQryTipoBenefSG_TIPO_BENEF: TStringField;
    wwQryTipoBenefDS_TIPO_BENEF: TStringField;
    wwQryRotCalculoCD_GRUPO_FORMULA: TFloatField;
    wwQryRotCalculoDS_GRUPO_FORMULA: TStringField;
    wwQryRotCalculoIR_GRUPO_CALCULO: TStringField;
    dsTipoGrupoPartic: TDataSource;
    wwqryTipoGrupoParticNO_GRUPO_PARTIC: TStringField;
    wwqryTipoGrupoParticCD_GRUPO_PARTIC: TFloatField;
    wwqryTipoGrupoParticDS_CONDICAO_EQUADRAMENTO: TMemoField;
    wwqryTipoGrupoParticDS_SQL_ENQUADRAMENTO: TMemoField;
    qryCondicao: TwwQuery;
    dsCondicao: TDataSource;
    qryCondicaoDS_CONDICAO_EQUADRAMENTO: TMemoField;
    qryBeneficio: TwwQuery;
    qryRotina: TwwQuery;
    dsBeneficio: TwwDataSource;
    dsRotina: TwwDataSource;
    qryBeneficioDS_TIPO_BENEF: TStringField;
    qryRotinaDS_GRUPO_FORMULA: TStringField;
    wwQryComposicaoCalculo234CD_PESSOA_PATROC: TFloatField;
    wwQryComposicaoCalculo234CD_GRUPO_PARTIC: TFloatField;
    wwQryComposicaoCalculo234CD_PESSOA_ENTID: TFloatField;
    wwQryComposicaoCalculo234CD_PLANO: TFloatField;
    wwQryComposicaoCalculo234CD_GRUPO_FORMULA: TFloatField;
    wwQryComposicaoCalcBenef342CD_GRUPO_PARTIC: TFloatField;
    wwQryComposicaoCalcBenef342CD_PESSOA_PATROC: TFloatField;
    wwQryComposicaoCalcBenef342CD_PESSOA_ENTID: TFloatField;
    wwQryComposicaoCalcBenef342CD_PLANO: TFloatField;
    wwQryComposicaoCalcBenef342CD_TIPO_BENEF: TFloatField;
    wwQryComposicaoCalcBenef342CD_GRUPO_FORMULA: TFloatField;
    qryBeneficioDS_GRUPO_FORMULA: TStringField;
    wwQryComposicaoCalculo: TQuery;
    wwDtSrcComposicaoCalculo: TDataSource;
    UpdtSQLComposicaoCalculo: TUpdateSQL;
    wwQryComposicaoCalcBenef: TQuery;
    wwDtSrcComposicaoCalcBenef: TDataSource;
    UpdtSQLComposicaoCalcBenef: TUpdateSQL;
    wwQryComposicaoCalculoCD_PESSOA_PATROC: TFloatField;
    wwQryComposicaoCalculoCD_GRUPO_PARTIC: TFloatField;
    wwQryComposicaoCalculoCD_PESSOA_ENTID: TFloatField;
    wwQryComposicaoCalculoCD_PLANO: TFloatField;
    wwQryComposicaoCalculoCD_GRUPO_FORMULA: TFloatField;
    wwQryComposicaoCalcBenefCD_GRUPO_PARTIC: TFloatField;
    wwQryComposicaoCalcBenefCD_PESSOA_PATROC: TFloatField;
    wwQryComposicaoCalcBenefCD_PESSOA_ENTID: TFloatField;
    wwQryComposicaoCalcBenefCD_PLANO: TFloatField;
    wwQryComposicaoCalcBenefCD_TIPO_BENEF: TFloatField;
    wwQryComposicaoCalcBenefCD_GRUPO_FORMULA: TFloatField;
    MontaSelect: TMontaSelect;
    wwQryRotCalculoDS_OBSERV_FORMULA: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure wwqryGrupoParticBeforePost(DataSet: TDataSet);
    procedure wwqryGrupoParticAfterPost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwqryGrupoParticAfterOpen(DataSet: TDataSet);
    procedure wwDBLkpCmbTipoGrupoChange(Sender: TObject);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure wwQryComposicaoCalculoBeforePost(DataSet: TDataSet);
    procedure wwQryComposicaoCalculoAfterPost(DataSet: TDataSet);
    procedure wwQryComposicaoCalcBenefBeforePost(DataSet: TDataSet);
    procedure wwQryComposicaoCalcBenefAfterPost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComposicaoCalculo: TfrmComposicaoCalculo;
  wIdReg: Integer;
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)

implementation

uses uGlobal, FTelaAut, uVersaoBase;
{$R *.DFM}

procedure TfrmComposicaoCalculo.FormCreate(Sender: TObject);
begin
   If uGlobal.WG_CD_VERSAO = 0 then
   Begin
      ShowMessage('Selecione primerio uma Versão da Base !');
      AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
      close;
      exit;
   End
   Else
   Begin
      wwqryGrupoPartic.close;
      wwqryGrupoPartic.ParamByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
      wwqryGrupoPartic.ParamByName('CD_PESSOA_ENTID').asinteger := WG_CD_PESSOA_ENTID;
      wwqryGrupoPartic.ParamByName('CD_PLANO').asinteger := WG_CD_PLANO;
   End;

   inherited;
   wwQryComposicaoCalculo.Open;
   wwQryComposicaoCalcBenef.Open;

   qryBeneficio.Close;
   qryRotina.Close;
   qryBeneficio.Open;
   qryRotina.Open;

   wwqryTipoGrupoPartic.open;

   wwQryTipoBenef.close;
   wwQryTipoBenef.ParamByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
   wwQryTipoBenef.ParamByName('CD_PESSOA_ENTID').asinteger := WG_CD_PESSOA_ENTID;
   wwQryTipoBenef.ParamByName('CD_PLANO').asinteger := WG_CD_PLANO;
   wwQryTipoBenef.open;

   qryCondicao.Open;

   wwQryRotCalculo.open;

   If DBEdit1.Text = '' then
      DBMemoCondicao.Text := '';

   If DBEdit2.text = '' then
      DBEdit3.Text := qryRotina.FieldByName('DS_GRUPO_FORMULA').asString
   Else
      DBEdit3.Text := qryBeneficio.FieldByName('DS_GRUPO_FORMULA').asString;
end;

procedure TfrmComposicaoCalculo.wwqryGrupoParticBeforePost(DataSet: TDataSet);
begin
   inherited;
   wIdReg := 0;
   If wwqryGrupoPartic.State = dsInsert Then
      wIdReg := wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asinteger;
end;

procedure TfrmComposicaoCalculo.wwqryGrupoParticAfterPost(DataSet: TDataSet);
begin
   try
      inherited;
      wwqryGrupoPartic.ApplyUpdates;
      wwqryGrupoPartic.CommitUpdates;

      // Se o Campo DBEdit2 não estiver preenchido então apaga Composição_Calculo
      // Senão apaga Composição_Calculo_Benef
      If (DBEdit2.text  = '') and (not(wwQryComposicaoCalculo.isEmpty)) then
      Begin
         wwQryComposicaoCalculo.Delete;
         wwQryComposicaoCalculo.ApplyUpdates;
         wwQryComposicaoCalculo.CommitUpdates;
         wwQryComposicaoCalculo.Close;
         wwQryComposicaoCalculo.Open;
      End
      Else If not(wwQryComposicaoCalcBenef.isEmpty) then
      Begin
         wwQryComposicaoCalcBenef.Delete;
         wwQryComposicaoCalcBenef.ApplyUpdates;
         wwQryComposicaoCalcBenef.CommitUpdates;
         wwQryComposicaoCalcBenef.Close;
         wwQryComposicaoCalcBenef.Open;
      End;

      If DBEdit1.Text = '' then
         DBMemoCondicao.Text := '';

      PrincipalPost := true;
      If sbtnAlterar.Down Then
      Begin
         If wwDBLKpCmbTipoBenef.Text <> '' then
            wwQryComposicaoCalcBenef.Insert
         Else
            wwQryComposicaoCalculo.Insert;
      End;

      If wwDBLKpCmbTipoBenef.Text <> '' then
      Begin
         wwQryComposicaoCalcBenefBeforePost(wwQryComposicaoCalcBenef);
         wwQryComposicaoCalcBenefAfterPost(wwQryComposicaoCalcBenef);
      End
      Else
      Begin
         wwQryComposicaoCalculoBeforePost(wwQryComposicaoCalculo);
         wwQryComposicaoCalculoAfterPost(wwQryComposicaoCalculo);
      End;
   Except
      bbtnCancelar.Click;
      exit;
   End;
end;

procedure TfrmComposicaoCalculo.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   wwDBLkpCmbTipoGrupo.Visible := true;
   wwDBLKpCmbTipoBenef.Visible := true;
   PrincipalPost := false;
   wwDBLkpCmbTipoGrupo.Text := '';
   wwDBLKpCmbTipoBenef.Text := '';
   wwDBLkpCmbRotinaCalc.Text := '';
   DBMemoCondicao.Text := '';
   DBEdit1.Visible := false;
   DBEdit2.Visible := false;
   DBEdit3.Visible := false;
   DBEdit4.SetFocus;
end;

procedure TfrmComposicaoCalculo.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   wwDBLkpCmbTipoGrupo.Visible := true;
   wwDBLKpCmbTipoBenef.Visible := true;
   PrincipalPost := false;
   wwDBLkpCmbTipoGrupo.Text := DBEdit1.Text;
   wwDBLKpCmbTipoBenef.Text := DBEdit2.Text;
   wwDBLkpCmbRotinaCalc.Text := DBEdit3.Text;
   wwDBLkpCmbTipoGrupo.Enabled := false;
   DBEdit1.Visible := false;
   DBEdit2.Visible := false;
   DBEdit3.Visible := false;
   DBEdit4.SetFocus;
end;

procedure TfrmComposicaoCalculo.bbtnConfirmarClick(Sender: TObject);
begin
   If trim(wwDBLkpCmbTipoGrupo.text) = '' then
   Begin
      ShowMessage('Campo Obrigatório não Preenchido !');
      wwDBLkpCmbTipoGrupo.SetFocus;
      exit;
   End;

   inherited;

   If wwDBLKpCmbTipoBenef.Text = '' then
   Begin
      wwQryComposicaoCalculo.Close;
      wwQryComposicaoCalculo.Open;
   End
   Else
   Begin
      wwQryComposicaoCalcBenef.Close;
      wwQryComposicaoCalcBenef.Open;
   End;

   bbtnCancelar.click;
end;

procedure TfrmComposicaoCalculo.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   wwDBLkpCmbTipoGrupo.Enabled := true;
   wwDBLkpCmbTipoGrupo.Visible := false;
   wwDBLKpCmbTipoBenef.Visible := false;
   wwDBLkpCmbRotinaCalc.Visible := false;
   DBEdit1.Visible := true;
   DBEdit2.Visible := true;
   DBEdit4.SetFocus;

   qryBeneficio.Close;
   qryRotina.Close;
   qryBeneficio.Open;
   qryRotina.Open;
   If DBEdit2.text = '' then
      DBEdit3.Text := qryRotina.FieldByName('DS_GRUPO_FORMULA').asString
   Else
      DBEdit3.Text := qryBeneficio.FieldByName('DS_GRUPO_FORMULA').asString;
end;

procedure TfrmComposicaoCalculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   wwqryTipoGrupoPartic.Close;
   wwQryTipoBenef.Close;
   qryCondicao.Close;
   wwQryRotCalculo.Close;

   wwQryComposicaoCalculo.Close;
   wwQryComposicaoCalcBenef.Close;
   qryBeneficio.Close;
   qryRotina.Close;
end;

procedure TfrmComposicaoCalculo.wwqryGrupoParticAfterOpen(DataSet: TDataSet);
begin
   wwqryGrupoPartic.DisableControls;
   If wIdReg > 0 Then
   Begin
      wwqryGrupoPartic.Locate('CD_GRUPO_PARTIC',wIdReg,[]);
      wIdReg := 0;
   End;

   wwqryGrupoPartic.EnableControls;

   If DBEdit2.text = '' then
      DBEdit3.Text := qryRotina.FieldByName('DS_GRUPO_FORMULA').asString
   Else
      DBEdit3.Text := qryBeneficio.FieldByName('DS_GRUPO_FORMULA').asString;

   qryBeneficio.Close;
   qryRotina.Close;
   qryBeneficio.Open;
   qryRotina.Open;
end;

procedure TfrmComposicaoCalculo.wwDBLkpCmbTipoGrupoChange(Sender: TObject);
begin
   If SBtnAlterar.Down then exit;

   qryCondicao.Close;
   qryCondicao.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                  wwqryTipoGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
   qryCondicao.Open;
end;

procedure TfrmComposicaoCalculo.dbnavClick(Sender: TObject; Button: TNavigateBtn);
begin
   If DBEdit2.text = '' then
      DBEdit3.Text := qryRotina.FieldByName('DS_GRUPO_FORMULA').asString
   Else
      DBEdit3.Text := qryBeneficio.FieldByName('DS_GRUPO_FORMULA').asString;

   qryCondicao.Close;
   qryCondicao.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                      wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
   qryCondicao.Open;
end;

procedure TfrmComposicaoCalculo.wwQryComposicaoCalculoBeforePost(DataSet: TDataSet);
begin
   inherited;
   If (SBtnAlterar.Down) and (PrincipalPost) then
   Begin
      wwQryComposicaoCalculo.FieldByName('CD_PESSOA_PATROC').asinteger :=
                     wwqryGrupoPartic.FieldByName('CD_PESSOA_PATROC').asinteger;
      wwQryComposicaoCalculo.FieldByName('CD_PESSOA_ENTID').asinteger :=
                      wwqryGrupoPartic.FieldByName('CD_PESSOA_ENTID').asinteger;
      wwQryComposicaoCalculo.FieldByName('CD_PLANO').asinteger :=
                             wwqryGrupoPartic.FieldByName('CD_PLANO').asinteger;
      wwQryComposicaoCalculo.FieldByName('CD_GRUPO_PARTIC').asinteger :=
                      wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
      wwQryComposicaoCalculo.FieldByName('CD_GRUPO_FORMULA').asInteger :=
                      wwQryRotCalculo.FieldByName('CD_GRUPO_FORMULA').asInteger;
   End;
end;

procedure TfrmComposicaoCalculo.wwQryComposicaoCalculoAfterPost(DataSet: TDataSet);
begin
   Try
      inherited;
      If PrincipalPost then
      Begin
         PrincipalPost := false;
         wwQryComposicaoCalculo.ApplyUpdates;
         wwQryComposicaoCalculo.CommitUpdates;
      End;
   Except
      bbtnCancelar.Click;
      exit;
   End;
end;

procedure TfrmComposicaoCalculo.wwQryComposicaoCalcBenefBeforePost(DataSet: TDataSet);
begin
   inherited;
   If (SBtnAlterar.Down) and (PrincipalPost) then
   Begin
      wwQryComposicaoCalcBenef.FieldByName('CD_PESSOA_PATROC').asinteger :=
                     wwqryGrupoPartic.FieldByName('CD_PESSOA_PATROC').asinteger;
      wwQryComposicaoCalcBenef.FieldByName('CD_PESSOA_ENTID').asinteger :=
                      wwqryGrupoPartic.FieldByName('CD_PESSOA_ENTID').asinteger;
      wwQryComposicaoCalcBenef.FieldByName('CD_PLANO').asinteger :=
                             wwqryGrupoPartic.FieldByName('CD_PLANO').asinteger;
      wwQryComposicaoCalcBenef.FieldByName('CD_GRUPO_PARTIC').asinteger :=
                      wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
      wwQryComposicaoCalcBenef.FieldByName('CD_TIPO_BENEF').asinteger :=
                          wwQryTipoBenef.FieldByName('CD_TIPO_BENEF').asInteger;
      wwQryComposicaoCalcBenef.FieldByName('CD_GRUPO_FORMULA').asInteger :=
                      wwQryRotCalculo.FieldByName('CD_GRUPO_FORMULA').asInteger;
   End;
end;

procedure TfrmComposicaoCalculo.wwQryComposicaoCalcBenefAfterPost(DataSet: TDataSet);
begin
   Try
      inherited;

      If PrincipalPost then
      Begin
         PrincipalPost := false;
         wwQryComposicaoCalcBenef.ApplyUpdates;
         wwQryComposicaoCalcBenef.CommitUpdates;
      End;
   except
      bbtnCancelar.Click;
      exit;
   End;
end;

procedure TfrmComposicaoCalculo.sbtnProcurarClick(Sender: TObject);
begin
   MontaSelect.Executar;

   If (MontaSelect.ValoresChave.Count > 0) and
      (MontaSelect.ValoresChave[0] <> '') then
      wwqryGrupoPartic .Locate('CD_GRUPO_PARTIC', MontaSelect.ValoresChave[0], []);

   sbtnProcurar.Down := False;
end;

end.

