{===============================================================================
Unit    :  uGrupoParticipante
Form    :  frmGrupoParticipante

Autor   : Rômulo Róseo Rebouças
Empresa : Fórmula Informática Ltda.

Data    : 12/07/2000

Objetivo: Cadastrar grupo de participantes para cálculo, crítica e exportação de dados.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável          Descrição
----------    -----------------    ---------------------------------------------

================================================================================}
unit UGrupoParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, DBCtrls, ComCtrls, cmseldlg, wwidlg, Db, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Wwdotdot, Mask, wwdbedit, wwdblook, DBTables, Wwquery,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmGrupoParticipante = class(TfrmCadastro)
    GrpBxRotCalc: TGroupBox;
    DBMemocondicao: TDBMemo;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    wwqryGrupoPartic: TwwQuery;
    UpdtSQLGrupoPartic: TUpdateSQL;
    DBEditNomeGrupo: TDBEdit;
    wwqryGrupoParticCD_GRUPO_PARTIC: TFloatField;
    wwqryGrupoParticNO_GRUPO_PARTIC: TStringField;
    wwqryGrupoParticDS_CONDICAO_EQUADRAMENTO: TMemoField;
    wwqryGrupoParticDS_SQL_ENQUADRAMENTO: TMemoField;
    qryAux: TwwQuery;
    BtBtnFormula: TBitBtn;
    Query1: TQuery;
    qryCalculo: TwwQuery;
    qryExportacao: TwwQuery;
    qryCritica: TwwQuery;
    qryInsCalculo: TwwQuery;
    qryInsExportacao: TwwQuery;
    qryInsCritica: TwwQuery;
    qryAuxCalculo: TwwQuery;
    qryAuxExportacao: TwwQuery;
    qryAuxCritica: TwwQuery;
    GroupBox: TGroupBox;
    ChkBxCalculo: TCheckBox;
    ChkBxExportacao: TCheckBox;
    ChkBxCritica: TCheckBox;
    qryDelCalculo: TwwQuery;
    qryDelExportacao: TwwQuery;
    qryDelCritica: TwwQuery;
    MontaSelect: TMontaSelect;
    qryDelExportPartic: TwwQuery;
    qryDelGrupoParticipante: TwwQuery;
    procedure GroupRefresh;
    procedure FormCreate(Sender: TObject);
    procedure wwqryGrupoParticBeforePost(DataSet: TDataSet);
    procedure wwqryGrupoParticAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwqryGrupoParticAfterOpen(DataSet: TDataSet);
    procedure BtBtnFormulaClick(Sender: TObject);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure DBEditNomeGrupoChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
     w_sql_condicao, w_sql_comando : string;

    { Public declarations }
  end;

var
  frmGrupoParticipante: TfrmGrupoParticipante;
  wIdReg: Integer;
  calculo, exportacao, critica: boolean;

implementation

uses uGlobal, uQueryCondicao, DBaseDados, FTelaAut, uVersaoBase;
{$R *.DFM}

procedure TfrmGrupoParticipante.GroupRefresh;
begin
  with qryCalculo do
   begin
     Close;
     ParamByName('CD_GRUPO_PARTIC').asInteger :=
       wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
     ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
     ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
     Open;
   end;
  with qryExportacao do
   begin
     Close;
     ParamByName('CD_GRUPO_PARTIC').asInteger :=
       wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
     ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
     ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
     Open;
   end;
  with qryCritica do
   begin
     Close;
     ParamByName('CD_GRUPO_PARTIC').asInteger :=
       wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
     ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
     ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
     Open;
   end;


  chkbxCalculo.Checked := qryCalculo.Locate('CD_GRUPO_PARTIC',
          wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger, [loPartialKey]);
  chkbxExportacao.Checked := qryExportacao.Locate('CD_GRUPO_PARTIC',
          wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger, [loPartialKey]);
  chkbxCritica.Checked := qryCritica.Locate('CD_GRUPO_PARTIC',
          wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger, [loPartialKey]);
end;

procedure TfrmGrupoParticipante.FormCreate(Sender: TObject);
begin
  if uGlobal.WG_CD_VERSAO = 0 then
   begin
     MessageDlg('Selecione uma Versão da Base de Trabalho !',
        mtWarning, [mbOk], 0);
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
     exit;
   end;

  inherited;

  GroupRefresh;
end;

procedure TfrmGrupoParticipante.wwqryGrupoParticBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if wwqryGrupoPartic.State = dsInsert Then
     begin
       qryAux.Close;
       qryAux.Open;
       wIdReg := (qryAux.FieldByName('Max_CD').asInteger + 1);
       wwqryGrupoPartic.fieldbyname('CD_GRUPO_PARTIC').asinteger := wIdReg;
     end;

end;

procedure TfrmGrupoParticipante.wwqryGrupoParticAfterPost(
  DataSet: TDataSet);
begin
  Try
   inherited;
   wwqryGrupoPartic.ApplyUpdates;
   wwqryGrupoPartic.CommitUpdates;

   if DtmBaseDados.dbBaseDados.InTransaction then
     DtmBaseDados.dbBaseDados.Commit;

   DtmBaseDados.dbBaseDados.StartTransaction;

   if sbtnInserir.Down then
    begin
      if chkbxCalculo.Checked then
       begin
         qryAuxCalculo.Close;
         qryAuxCalculo.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
         qryAuxCalculo.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
         qryAuxCalculo.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
         qryAuxCalculo.Open;

         qryInsCalculo.Close;
         qryInsCalculo.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                         wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
         qryInsCalculo.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
         qryInsCalculo.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
         qryInsCalculo.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
         qryInsCalculo.ParamByName('NR_ORDEM').asInteger :=
                         qryAuxCalculo.FieldByName('Max_CD').asInteger + 1;

         qryInsCalculo.ExecSQL;

         qryAuxCalculo.Close;
       end;

      if chkbxExportacao.Checked then
       begin
         qryAuxExportacao.Close;
         qryAuxExportacao.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
         qryAuxExportacao.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
         qryAuxExportacao.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
         qryAuxExportacao.Open;

         qryInsExportacao.Close;
         qryInsExportacao.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                         wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
         qryInsExportacao.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
         qryInsExportacao.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
         qryInsExportacao.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
         qryInsExportacao.ParamByName('NR_ORDEM').asInteger :=
                         qryAuxExportacao.FieldByName('Max_CD').asInteger + 1;

         qryInsExportacao.ExecSQL;

         qryAuxExportacao.Close;
       end;

      if chkbxCritica.Checked then
       begin
         qryAuxCritica.Close;
         qryAuxCritica.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
         qryAuxCritica.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
         qryAuxCritica.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
         qryAuxCritica.Open;

         qryInsCritica.Close;
         qryInsCritica.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                         wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
         qryInsCritica.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
         qryInsCritica.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
         qryInsCritica.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
         qryInsCritica.ParamByName('NR_ORDEM').asInteger :=
                         qryAuxCritica.FieldByName('Max_CD').asInteger + 1;

         qryInsCritica.ExecSQL;

         qryAuxCritica.Close;
       end;
      qryCalculo.Close;
      qryExportacao.Close;
      qryCritica.Close;
      qryCalculo.Open;
      qryExportacao.Open;
      qryCritica.Open;
      GroupRefresh;
    end

   else if sbtnAlterar.Down then
    begin
      if chkbxCalculo.Checked then
       begin
          qryAuxCalculo.Close;
          qryAuxCalculo.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
          qryAuxCalculo.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
          qryAuxCalculo.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
          qryAuxCalculo.Open;

          qryInsCalculo.Close;
          qryInsCalculo.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                          wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
          qryInsCalculo.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
          qryInsCalculo.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
          qryInsCalculo.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
          qryInsCalculo.ParamByName('NR_ORDEM').asInteger :=
                          qryAuxCalculo.FieldByName('Max_CD').asInteger + 1;

          Try
            qryInsCalculo.ExecSQL;
          Except End;  

          qryAuxCalculo.Close;
       end;

      if chkbxExportacao.Checked then
       begin
          qryAuxExportacao.Close;
          qryAuxExportacao.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
          qryAuxExportacao.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
          qryAuxExportacao.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
          qryAuxExportacao.Open;

          qryInsExportacao.Close;
          qryInsExportacao.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                          wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
          qryInsExportacao.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
          qryInsExportacao.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
          qryInsExportacao.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
          qryInsExportacao.ParamByName('NR_ORDEM').asInteger :=
                          qryAuxExportacao.FieldByName('Max_CD').asInteger + 1;

          Try
            qryInsExportacao.ExecSQL;
          Except End;  

          qryAuxExportacao.Close;
       end;

      if chkbxCritica.Checked then
       begin
          qryAuxCritica.Close;
          qryAuxCritica.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
          qryAuxCritica.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
          qryAuxCritica.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
          qryAuxCritica.Open;

          qryInsCritica.Close;
          qryInsCritica.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                          wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
          qryInsCritica.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
          qryInsCritica.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
          qryInsCritica.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
          qryInsCritica.ParamByName('NR_ORDEM').asInteger :=
                          qryAuxCritica.FieldByName('Max_CD').asInteger + 1;

          Try
            qryInsCritica.ExecSQL;
          Except End;  

          qryAuxCritica.Close;
       end;
      qryCalculo.Close;
      qryExportacao.Close;
      qryCritica.Close;
      qryCalculo.Open;
      qryExportacao.Open;
      qryCritica.Open;
      GroupRefresh;
    end;

    DtmBaseDados.dbBaseDados.Commit;

    bbtnCancelar.Click;
  Except
    DtmBaseDados.dbBaseDados.RollBack;
    bbtnCancelar.Click;
    exit;
  End;
end;

procedure TfrmGrupoParticipante.sbtnApagarClick(Sender: TObject);
begin
  sbtnApagar.Down := false;
  If wwqryGrupoPartic.isEmpty then
    exit;

  if MessageBox(0,'Deseja apagar o Grupo de Participantes?','Cálculo Atuarial',4) <> IdYes Then
     exit;

     qryDelGrupoParticipante.ParamByName('CD_GRUPO').asInteger :=
                      wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     qryDelGrupoParticipante.ExecSQL;


     qryDelExportPartic.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                      wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     qryDelExportPartic.ExecSQL;


     qryDelCritica.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                       wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     qryDelCritica.ExecSQL;


     qryDelCalculo.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                      wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     qryDelCalculo.ExecSQL;


     qryDelExportacao.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                       wwqryGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
     qryDelExportacao.ExecSQL;

  wwqryGrupoPartic.Delete;
  wwqryGrupoPartic.ApplyUpdates;
  wwqryGrupoPartic.CommitUpdates;
  wwqryGrupoPartic.Close;
  wwqryGrupoPartic.Open;

  qryCalculo.Close;
  qryExportacao.Close;
  qryCritica.Close;
  qryCalculo.Open;
  qryExportacao.Open;
  qryCritica.Open;
  GroupRefresh;
end;

procedure TfrmGrupoParticipante.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEditNomeGrupo.SetFocus;
  GroupBox.Enabled := true;
  chkbxCalculo.Checked := false;
  chkbxExportacao.Checked := false;
  chkbxCritica.Checked := false;
end;

procedure TfrmGrupoParticipante.sbtnAlterarClick(Sender: TObject);
begin
  DBEditNomeGrupo.SetFocus;
  GroupBox.Enabled := true;
  calculo := chkbxCalculo.Checked;
  exportacao := chkbxExportacao.Checked;
  critica := chkbxCritica.Checked;
  
  inherited;

end;

procedure TfrmGrupoParticipante.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEditNomeGrupo.text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    DBEditNomeGrupo.SetFocus;
    exit;
   end;

  if sBtnAlterar.Down then
    GroupBox.Enabled := false;

  inherited;

  DBEditNomeGrupo.SetFocus;
  if sBtnInserir.Down then
   begin
     chkbxCalculo.Checked := false;
     chkbxExportacao.Checked := false;
     chkbxCritica.Checked := false;
   end;
   
  GroupRefresh;
end;

procedure TfrmGrupoParticipante.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEditNomeGrupo.SetFocus;
  GroupBox.Enabled := false;

  qryCalculo.Close;
  qryExportacao.Close;
  qryCritica.Close;
  qryCalculo.Open;
  qryExportacao.Open;
  qryCritica.Open;
  GroupRefresh;
end;

procedure TfrmGrupoParticipante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  wwqryGrupoPartic.Close;
  qryCalculo.close;
  qryExportacao.close;
  qryCritica.close;
end;

procedure TfrmGrupoParticipante.wwqryGrupoParticAfterOpen(
  DataSet: TDataSet);
begin
  wwqryGrupoPartic.DisableControls;
  If wIdReg > 0 Then
     Begin
       wwqryGrupoPartic.Locate('CD_GRUPO_PARTIC',wIdReg,[]);
       wIdReg := 0;
     End;
  wwqryGrupoPartic.EnableControls;
  GroupRefresh;
end;

procedure TfrmGrupoParticipante.BtBtnFormulaClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   Application.CreateForm(TfrmQueryCondicao, frmQueryCondicao);
   frmQueryCondicao.EditExpressao.text := wwqryGrupoPartic.fieldbyname('ds_condicao_equadramento').asstring;
   frmQueryCondicao.bbtnConfirmar.Enabled := False;
   frmQueryCondicao.showmodal;

   Screen.Cursor := crDefault;

   if frmQueryCondicao.bbtnSair.modalresult = mryes then
     begin
      wwqryGrupoPartic.edit;

      wwqryGrupoPartic.fieldbyname('ds_condicao_equadramento').clear;
      wwqryGrupoPartic.fieldbyname('ds_condicao_equadramento').asstring :=
                                    frmQueryCondicao.EditExpressao.Text;
      wwqryGrupoPartic.fieldbyname('ds_sql_enquadramento').clear;
      wwqryGrupoPartic.fieldbyname('ds_sql_enquadramento').asstring :=
                                    frmQueryCondicao.EditSQLExpressao.Text;

      wwqryGrupoPartic.post;

     end;
end;

procedure TfrmGrupoParticipante.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  GroupRefresh;
end;

procedure TfrmGrupoParticipante.DBEditNomeGrupoChange(Sender: TObject);
begin
  if (sbtnInserir.Down = false) and (sbtnAlterar.Down = false) then
    GroupRefresh;
end;

procedure TfrmGrupoParticipante.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   wwqryGrupoPartic.Locate('CD_GRUPO_PARTIC', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;

  GroupRefresh;
end;

end.

