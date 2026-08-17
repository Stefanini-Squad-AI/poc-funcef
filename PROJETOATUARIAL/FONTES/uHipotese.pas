{===============================================================================
Unit    :  uHipotese
Form    :  frmHipotese

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 01/08/2000

Objetivo: Cadastrar Hipóteses de Cálculo.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uHipotese;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, wwdblook, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmHipotese = class(TfrmCadastro)
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    qryItem: TwwQuery;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryRegra: TwwQuery;
    qryDetalhe: TwwQuery;
    dsDetalhe: TwwDataSource;
    UpdtSQLDetalhe: TUpdateSQL;
    QryPrincipalCD_HIPOTESE: TFloatField;
    QryPrincipalDS_HIPOTESE: TStringField;
    QryPrincipalDT_GERACAO: TDateTimeField;
    QryPrincipalNR_IDADE_MIN_TB_SERV: TFloatField;
    QryPrincipalNR_IDADE_MAX_TB_SERV: TFloatField;
    qryItemCD_ITEM_HIPOTESE: TFloatField;
    qryItemCD_TIPO_TABUA: TFloatField;
    qryItemDS_ITEM_HIPOTESE: TStringField;
    qryItemIR_ITEM_HIPOTESE: TStringField;
    qryItemNO_VARIAVEL: TStringField;
    dsItem: TwwDataSource;
    qryTabua_Mas: TwwQuery;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    PnlDetalhe: TPanel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DbGrdDet: TwwDBGrid;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    DBCmbBxItem: TwwDBLookupCombo;
    Label8: TLabel;
    Toolbar972: TToolbar97;
    SBtnGerar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    MontaSelect: TMontaSelect;
    qryDetalheCD_HIPOTESE: TFloatField;
    qryDetalheCD_ITEM_HIPOTESE: TFloatField;
    qryDetalheVL_HIPOTESE: TFloatField;
    qryDetalheIR_GERA_TAB_SERVICO: TStringField;
    qryDetalheDS_ITEM_HIPOTESE: TStringField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label4: TLabel;
    qryAux: TwwQuery;
    qryRegraDESCRICAOREGRA: TMemoField;
    qryRegraIDREGRA: TFloatField;
    qryRegraIDTIPOREGRA: TFloatField;
    qryRegraNOMEREGRA: TStringField;
    qryRegraPUBLICADA: TFloatField;
    QryPrincipalIDREGRA: TFloatField;
    plValor: TPanel;
    dbeVl_Hipotese: TDBEdit;
    Label6: TLabel;
    plTabua: TPanel;
    DBCmbBxTabua_Mas: TwwDBLookupCombo;
    Label5: TLabel;
    DBCmbBxTabua_Fem: TwwDBLookupCombo;
    Label1: TLabel;
    DBCmbBxTabua_Pen: TwwDBLookupCombo;
    Label2: TLabel;
    qryTabua_Fem: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField3: TStringField;
    FloatField6: TFloatField;
    qryTabua_Pen: TwwQuery;
    StringField4: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    StringField5: TStringField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    StringField6: TStringField;
    FloatField12: TFloatField;
    qryDetalheSQ_VERSAO_COMUTACAO_MAS: TFloatField;
    qryDetalheSQ_VERSAO_COMUTACAO_FEM: TFloatField;
    qryDetalheSQ_VERSAO_COMUTACAO_PEN: TFloatField;
    qryDetalheIR_ITEM_HIPOTESE: TStringField;
    qryTabua_MasSQ_VERSAO_COMUTACAO: TFloatField;
    qryTabua_MasCD_TABUA_ROTATIV: TFloatField;
    qryTabua_MasCD_TABUA_ENTRADA_INVALID: TFloatField;
    qryTabua_MasCD_TABUA_INVALID: TFloatField;
    qryTabua_MasCD_TABUA_MORTAL: TFloatField;
    qryTabua_MasIR_VERSAO_COMUTACAO: TStringField;
    qryTabua_MasDS_VERSAO_COMUTACAO: TStringField;
    qryTabua_MasDT_GERACAO: TDateTimeField;
    qryTabua_MasTRGDTINCLUSAO: TDateTimeField;
    qryTabua_MasTRGUSERINCLUSAO: TStringField;
    qryTabua_MasCD_GRUPO_FORMULA: TFloatField;
    qryDetalheDS_VERSAO_COMUTACAO_MAS: TStringField;
    qryDetalheDS_VERSAO_COMUTACAO_FEM: TStringField;
    qryDetalheDS_VERSAO_COMUTACAO_PEN: TStringField;
    procedure DBCmbBxItemChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure qryDetalheBeforePost(DataSet: TDataSet);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure SBtnGerarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHipotese: TfrmHipotese;
  wIdReg: Integer;  
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)

implementation

uses DRelatsAtuarial;

{$R *.DFM}

procedure TfrmHipotese.DBCmbBxItemChange(Sender: TObject);
begin

   If qryItem.FieldByName('IR_ITEM_HIPOTESE').asString <> 'T' then
   Begin
      plTabua.Visible := False; 
      plValor.Visible := True;  

      dbeVl_Hipotese.Enabled := True
   End
   Else
   Begin
      plTabua.Visible := True; 
      plValor.Visible := False; 

      dbeVl_Hipotese.Enabled := False;
   End
end;

procedure TfrmHipotese.FormCreate(Sender: TObject);
begin
   inherited;
   qryDetalhe.Open;
   qryItem.Open;
   qryTabua_Mas.Open;
   qryTabua_Fem.Open;
   qryTabua_Pen.Open;

   qryRegra.Open;  

   DbGrdDet.Visible  :=true;
   PnlDetalhe.Visible:=false;

   If (qryPrincipal.BOF) and (qryPrincipal.EOF) then
      PrincipalPost := false
   Else
      PrincipalPost := true;

   SBtnGerar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmHipotese.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
   inherited;
   qryDetalhe.Close;
   qryItem.Close;
   qryTabua_Mas.Close;
   qryTabua_Fem.Close;
   qryTabua_Pen.Close;
end;

procedure TfrmHipotese.bbtnConfirmarClick(Sender: TObject);
begin
   If trim(DBEdit1.text) = '' then
   Begin
      ShowMessage('Informe a Descrição !');
      DBEdit1.SetFocus;
      exit;
   End;

   inherited;

   bbtnCancelar.Click;
end;

procedure TfrmHipotese.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   PrincipalPost := false;

   DBEdit1.SetFocus;
end;

procedure TfrmHipotese.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   PrincipalPost := false;
   DBEdit1.SetFocus;
end;

procedure TfrmHipotese.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   DBEdit1.SetFocus;

   If qryPrincipal.RecordCount = 0 then
      PrincipalPost := false
   Else
   Begin
      PrincipalPost := true;
      SBtnGerar.Enabled := true;
   End;
end;

procedure TfrmHipotese.sbtnApagarClick(Sender: TObject);
begin
   If qryDetalhe.RecordCount > 0 then
   Begin
     If MessageBox(0,'Deseja apagar todas as Ocorrências?','Cálculo Atuarial',4) = IdYes Then
     Begin
        Repeat
           qryDetalhe.Delete;
           qryDetalhe.ApplyUpdates;
           qryDetalhe.CommitUpdates;
           qryDetalhe.Close;
           qryDetalhe.Open;
        Until qryDetalhe.RecordCount = 0;
     End
     Else
     Begin
        SBtnApagar.Down := false;
        exit;
     End;
   End
   Else
      If MessageBox(0,'Deseja realmente apagar esta Hipótese de Cálculo?','Cálculo Atuarial',4) <> IdYes Then
      Begin
         SBtnApagar.Down := false;
         exit;
      End;

      SBtnApagar.Down := false;
      qryPrincipal.Delete;
      qryPrincipal.ApplyUpdates;
      qryPrincipal.CommitUpdates;
      SBtnApagar.Down := false;

      If qryPrincipal.RecordCount = 0 then
      Begin
         PrincipalPost := false;
         SBtnProcurar.Click;
         SBtnGerar.Enabled := false;
      End
      Else
      Begin
         PrincipalPost := true;
         SBtnGerar.Enabled := true;
      End;
end;

procedure TfrmHipotese.QryPrincipalBeforePost(DataSet: TDataSet);
begin
   inherited;
   If SBtnInserir.Down Then
   Begin
      qryAux.Open;
      qryPrincipal.FieldByName('CD_HIPOTESE').asInteger :=
                                   (qryAux.FieldByName('Max_CD').asInteger + 1);
      qryAux.Close;

      qryPrincipal.FieldByName('DT_GERACAO').asDateTime := now;
   End;

   wIdReg := 0;
   If qryPrincipal.State = dsInsert Then
      wIdReg := Qryprincipal.FieldByName('CD_HIPOTESE').AsInteger;
end;

procedure TfrmHipotese.QryPrincipalAfterPost(DataSet: TDataSet);
begin
   Try
      inherited;
      qryPrincipal.ApplyUpdates;
      qryPrincipal.CommitUpdates;
      PrincipalPost := true;
   Except
      bbtnCancelar.Click;
      exit;
   End;
end;

procedure TfrmHipotese.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
   QryPrincipal.DisableControls;
   If wIdReg > 0 Then
   Begin
      Qryprincipal.Locate('CD_HIPOTESE',wIdReg,[]);
      wIdReg := 0;
   End;

   QryPrincipal.EnableControls;
end;

procedure TfrmHipotese.qryDetalheBeforePost(DataSet: TDataSet);
begin
   inherited;
   If BtIns.Down Then
   Begin
      qryDetalhe.FieldByName('CD_HIPOTESE').asInteger :=
                         qryPrincipal.FieldByName('CD_HIPOTESE').asInteger;
      qryDetalhe.FieldByName('CD_ITEM_HIPOTESE').asInteger :=
                         qryItem.FieldByName('CD_ITEM_HIPOTESE').asInteger;

      If trim(DBCmbBxTabua_Mas.Text) = '' then
         qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_MAS').Value := null
      Else
         qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_MAS').asInteger :=
                      qryTabua_Mas.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

      If trim(DBCmbBxTabua_Fem.Text) = '' then
         qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_FEM').Value := null
      Else
         qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_FEM').asInteger :=
                      qryTabua_Fem.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

      If trim(DBCmbBxTabua_Pen.Text) = '' then
         qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_PEN').Value := null
      Else
         qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_PEN').asInteger :=
                      qryTabua_Pen.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;
   End
   Else
      If BtAlt.Down Then
      Begin
         If trim(DBCmbBxTabua_Mas.Text) = '' then
            qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_MAS').Value := null
         Else
            qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_MAS').asInteger :=
                      qryTabua_Mas.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

         If trim(DBCmbBxTabua_Fem.Text) = '' then
            qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_FEM').Value := null
         Else
            qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_FEM').asInteger :=
                      qryTabua_Fem.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

         If trim(DBCmbBxTabua_Pen.Text) = '' then
            qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_PEN').Value := null
         Else
            qryDetalhe.FieldByName('SQ_VERSAO_COMUTACAO_PEN').asInteger :=
                      qryTabua_Pen.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;
      End;
end;

procedure TfrmHipotese.BtInsClick(Sender: TObject);
begin
   If PrincipalPost then
   Begin
      // Abaixa Botao
      BtIns.Down :=True;

      // Inabilita Botoes de Detalhe
      BtAlt.Enabled :=False;
      BtProc.Enabled:=False;
      BtExcl.Enabled:=False;

      // Esconde Grid Mostra Painel
      DbGrdDet.Visible  :=False;
      PnlDetalhe.Visible:=True;
      DBCmbBxItem.Enabled := true;
      DBCmbBxItem.SetFocus;

      DBCmbBxItem.Text := '';

      DBCmbBxTabua_Mas.Text := '';
      DBCmbBxTabua_Fem.Text := '';
      DBCmbBxTabua_Pen.Text := '';
      
      DBCmbBxItem.Enabled := true;

      // Inclui Novo Registro
      QryDetalhe.Append;
   End
   Else
   Begin
      BtIns.Down := false;
      exit;
   End;
end;

procedure TfrmHipotese.btAltClick(Sender: TObject);
begin
   If PrincipalPost then
   Begin
      // Se Nao Houverem Registros de Detalhe, Sai
      If QryDetalhe.RecordCount=0 then
      Begin
         BtAlt.Down := False;
         Exit;
      End;

      // Abaixa Botao
      BtAlt.Down    :=True;

      // Inabilita Botoes de Detalhe
      BtIns.Enabled :=False;
      BtProc.Enabled:=False;
      BtExcl.Enabled:=False;

      // Esconde Grid Mostra Painel
      DbGrdDet.Visible  :=False;
      PnlDetalhe.Visible:=True;

      qryItem.Locate('CD_ITEM_HIPOTESE', qryDetalhe.FieldByName('CD_ITEM_HIPOTESE').Value , []);

      DBCmbBxItem.Text := qryDetalheDS_ITEM_HIPOTESE.asString;

      If qryItem.FieldByName('IR_ITEM_HIPOTESE').asString <> 'T' then
         dbeVl_Hipotese.SetFocus
      Else
         DBCmbBxTabua_Mas.SetFocus;

      DBCmbBxTabua_Mas.Text := qryDetalheDS_VERSAO_COMUTACAO_MAS.asString;
      DBCmbBxTabua_Fem.Text := qryDetalheDS_VERSAO_COMUTACAO_FEM.asString;
      DBCmbBxTabua_Pen.Text := qryDetalheDS_VERSAO_COMUTACAO_PEN.asString;

      DBCmbBxItem.Enabled := false;

      // Alterar Registro
      QryDetalhe.Edit;
   End
   Else
   Begin
      BtAlt.Down := False;
      exit;
   End;
end;

procedure TfrmHipotese.BtExclClick(Sender: TObject);
begin
   If PrincipalPost then
   Begin
      // Executa query de Detalhe
      With QryDetalhe Do
      Begin
         // Se Nao Houverem Registros de Detalhe, Sai
         If QryDetalhe.RecordCount=0 then
         Begin
            Exit;
         End;

         // Se Confirmar, Exclui Registro Posicionado
         If MessageBox(0,'Deseja realmente apagar este registro ?','Cálculo Atuarial',4) = IdYes Then
         Begin
            Delete;
            ApplyUpdates;
            CommitUpDates;
            Close;
            Open;
         End;
      End;
   End
   Else
      exit;
end;

procedure TfrmHipotese.BtProcClick(Sender: TObject);
begin
  // Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalhe;
  SelDlgProcuraQry.Execute;

  // Volta Base de Dados Anterior
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

procedure TfrmHipotese.bbtnOkDetClick(Sender: TObject);
begin
   If trim(DBCmbBxItem.Text) = '' then
   Begin
      ShowMessage('Informe um Ítem de Hipótese');
      DBCmbBxItem.SetFocus;
      exit;
   End;

   If qryItem.FieldByName('IR_ITEM_HIPOTESE').asString = 'T' then
      If (qryTabua_MAS.RecordCount > 0) and
         (trim(DBCmbBxTabua_Mas.Text) = '') and
         (trim(DBCmbBxTabua_Fem.Text) = '') and
         (trim(DBCmbBxTabua_Pen.Text) = '') then
      Begin
         ShowMessage('Informe uma Tábua');
         DBCmbBxTabua_Mas.SetFocus;
         exit;
      End;

   With qryDetalhe do
   Begin
      Try
         Post;
         ApplyUpDates;
         CommitUpDates;
      Except
         bbtnCancelarDet.Click;
         exit;
      End;
   End;

   bbtnCancelarDet.Click;
end;

procedure TfrmHipotese.bbtnCancelarDetClick(Sender: TObject);
begin
   // Levanta Botoes
   BtIns.Down :=False;
   BtAlt.Down :=False;

   // Inabilita Botoes
   BtIns.Enabled :=True;
   BtAlt.Enabled :=True;
   BtProc.Enabled:=True;
   BtExcl.Enabled:=True;

   // ReExecuta a Query
   QryDetalhe.Close;
   QryDetalhe.Open;

   // Mostra Grid
   PnlDetalhe.Visible:=False;
   DbGrdDet.Visible  :=True;
end;

procedure TfrmHipotese.SBtnGerarClick(Sender: TObject);
begin
   SBtnGerar.Down := false;
   If qryPrincipal.IsEmpty then
      exit;

   dtmRelatsAtuarial.qryEmiteHipotese.ParamByName('CD_HIPOTESE').asInteger :=
                              qryPrincipal.FieldByName('CD_HIPOTESE').asInteger;
   dtmRelatsAtuarial.qryEmiteHipotese.Open;
   dtmRelatsAtuarial.rpHipotese.Print;
   dtmRelatsAtuarial.qryEmiteHipotese.Close;
end;

procedure TfrmHipotese.sbtnProcurarClick(Sender: TObject);
begin
   MontaSelect.Executar;

   If (MontaSelect.ValoresChave.Count > 0) and
      (MontaSelect.ValoresChave[0] <> '') then
      QryPrincipal.Locate('CD_HIPOTESE', MontaSelect.ValoresChave[0], []);

   sbtnProcurar.Down := False;
end;

end.
