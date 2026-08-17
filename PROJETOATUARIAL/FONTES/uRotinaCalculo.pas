{===============================================================================
Unit    :  uRotinaCalculo
Form    :  frmRotinaCalculo

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 18/07/2000

Objetivo: Cadastrar Rotinas de Cálculo.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uRotinaCalculo;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
     TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
     wwdblook, Mask, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DBTables, Wwquery,
     CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmRotinaCalculo = class(TfrmCadastro)
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    DbGrdDet: TwwDBGrid;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    TbShObservacoes: TTabSheet;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    DBMemo2: TDBMemo;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PnlDetalhe: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DBEdit9: TDBEdit;
    LkcTbFormula: TwwDBLookupCombo;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryPrincipalCD_GRUPO_FORMULA: TFloatField;
    QryPrincipalDS_GRUPO_FORMULA: TStringField;
    QryPrincipalIR_GRUPO_CALCULO: TStringField;
    QryDetalhe: TwwQuery;
    DsDet: TwwDataSource;
    UpdtSQLDet: TUpdateSQL;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    qryAux: TwwQuery;
    qryNoFormula: TwwQuery;
    qryNoFormulaCD_FORMULA: TFloatField;
    qryNoFormulaNO_FORMULA: TStringField;
    Toolbar972: TToolbar97;
    SBtnGerar: TToolbarButton97;
    MontaSelect: TMontaSelect;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    qryAuxMAX_CD: TFloatField;
    QryFormula: TQuery;
    DtSrcFormula: TDataSource;
    QryFormulaCD_FORMULA: TFloatField;
    QryFormulaNO_FORMULA: TStringField;
    QryFormulaDS_FORMULA: TMemoField;
    QryFormulaNO_VARIAVEL_RESULT: TStringField;
    QryFormulaNO_VARIAVEL_INICIAL: TStringField;
    QryFormulaNO_VARIAVEL_FINAL: TStringField;
    QryFormulaIR_GRUPO_FORMULA: TStringField;
    QryDetalheCD_GRUPO_FORMULA: TFloatField;
    QryDetalheCD_FORMULA: TFloatField;
    QryDetalheNR_ORDEM_FORMULA: TFloatField;
    QryDetalheNR_ORDEM_APRESENTACAO: TFloatField;
    QryDetalheCD_FORMULA_1: TFloatField;
    QryDetalheNO_FORMULA: TStringField;
    QryDetalheDS_FORMULA: TMemoField;
    QryDetalheNO_VARIAVEL_RESULT: TStringField;
    QryDetalheNO_VARIAVEL_INICIAL: TStringField;
    QryDetalheNO_VARIAVEL_FINAL: TStringField;
    QryDetalheIR_GRUPO_FORMULA: TStringField;
    SBtnDuplicar: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    QryInsRotina: TwwQuery;
    QryInsSequencia: TwwQuery;
    Toolbar973: TToolbar97;
    qryNoFormulaDS_FORMULA: TMemoField;
    qryNoFormulaNO_VARIAVEL_RESULT: TStringField;
    qryNoFormulaNO_VARIAVEL_INICIAL: TStringField;
    qryNoFormulaNO_VARIAVEL_FINAL: TStringField;
    qryNoFormulaIR_GRUPO_FORMULA: TStringField;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    QryDetalheNO_VARIAVEL_INICIAL2: TStringField;
    QryPrincipalDS_OBSERV_FORMULA: TMemoField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure SBtnGerarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure QryDetalheNR_ORDEM_FORMULAChange(Sender: TField);
    procedure DBEdit9Exit(Sender: TObject);
    procedure QryDetalheAfterScroll(DataSet: TDataSet);
    procedure SBtnDuplicarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRotinaCalculo: TfrmRotinaCalculo;
  WidReg: Integer;  
  PrincipalPost: boolean;//Serve para verificar se Já foi inserido
                         //o Registro Pai         -(Master/Detail)  

implementation

uses DRelatsAtuarial, dBaseDados;

{$R *.DFM}

procedure TfrmRotinaCalculo.FormShow(Sender: TObject);
begin
   inherited;
   PgCtrlDetalhe.ActivePage := tbshDetalhe;
   DbGrdDet.Visible  := True;
   PageControl.Visible := True;
   PnlDetalhe.Visible:=False;
   PageControl.ActivePage := TabSheet1;
   qryDetalhe.Open;
   qryFormula.Open;
   qryNoFormula.Open;

   If qryPrincipal.RecordCount = 0 then
      PrincipalPost := false
   Else
   Begin
      BtIns.Enabled :=true;
      BtAlt.Enabled:=true;
      BtExcl.Enabled:=true;
      PrincipalPost := true;
   End;

   SBtnGerar.Enabled := SBtnAlterar.Enabled;
   SBtnDuplicar.Enabled := SBtnAlterar.Enabled;
end;

procedure TfrmRotinaCalculo.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
   inherited;
   qryDetalhe.Close;
   qryFormula.Close;
   qryNoFormula.Close;
end;

procedure TfrmRotinaCalculo.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmRotinaCalculo.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   PgCtrlDetalhe.ActivePage := tbshDetalhe;

   If qryPrincipal.RecordCount = 0 then
      PrincipalPost := false
   Else
   Begin
      BtIns.Enabled :=True;
      BtAlt.Enabled:=True;
      BtExcl.Enabled:=True;
      PrincipalPost := true;
      SBtnGerar.Enabled := true;
      SBtnDuplicar.Enabled := True;
   End; 
end;

procedure TfrmRotinaCalculo.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   PrincipalPost := false;
   BtIns.Enabled :=False;
   BtAlt.Enabled:=False;
   BtExcl.Enabled:=False;
   PgCtrlDetalhe.ActivePage := tbshObservacoes;
   DBEdit1.SetFocus;
end;

procedure TfrmRotinaCalculo.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   PrincipalPost := false;
   BtIns.Enabled :=False;
   BtAlt.Enabled:=False;
   BtExcl.Enabled:=False;
   PgCtrlDetalhe.ActivePage := tbshObservacoes;
   DBEdit1.SetFocus;
end;

procedure TfrmRotinaCalculo.sbtnApagarClick(Sender: TObject);
begin
   If QryDetalhe.RecordCount > 0 then
   Begin
      If MessageBox(0,'Deseja apagar a Rotina de Cálculo?','Cálculo Atuarial',4) = IdYes Then
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
      If MessageBox(0,'Deseja apagar a Rotina de Cálculo?','Cálculo Atuarial',4) <> IdYes Then
      Begin
         SBtnApagar.Down := false;
         exit;
      End;

   qryPrincipal.Delete;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
   SBtnApagar.Down := false;

   If qryPrincipal.RecordCount = 0 then
   Begin
      BtIns.Enabled :=false;
      BtAlt.Enabled:=false;
      BtExcl.Enabled:=false;
      PrincipalPost := false;
      SBtnGerar.Enabled := false;
      SBtnDuplicar.Enabled := False;
   End
   Else
   Begin
      BtIns.Enabled :=True;
      BtAlt.Enabled:=True;
      BtExcl.Enabled:=True;
      PrincipalPost := true;
      SBtnGerar.Enabled := true;
      SBtnDuplicar.Enabled := True;
   End;
end;

procedure TfrmRotinaCalculo.QryPrincipalBeforePost(DataSet: TDataSet);
begin
   inherited;

   If SBtnInserir.Down then
   Begin
      qryAux.Open;
      qryPrincipal.FieldByName('CD_GRUPO_FORMULA').AsInteger :=
                 (qryAux.FieldByName('Max_CD').asInteger + 1);
      qryAux.Close;

      qryPrincipal.FieldByName('IR_GRUPO_CALCULO').asString := 'A';
   End;

   wIdReg := Qryprincipal.FieldByName('CD_GRUPO_FORMULA').AsInteger;
end;

procedure TfrmRotinaCalculo.QryPrincipalAfterPost(DataSet: TDataSet);
begin
   Try
      inherited;
      qryPrincipal.ApplyUpdates;
      qryPrincipal.CommitUpdates;
      PrincipalPost := true;
   Except
      bbtnCancelar.Click;
      exit;
   end;
end;

procedure TfrmRotinaCalculo.BtInsClick(Sender: TObject);
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
      DbGrdDet.Visible  := False;
      PageControl.Visible := False;
      PnlDetalhe.Visible:=True;

      LkcTbFormula.Text := '';
      LkcTbFormula.Enabled := true;
      LkcTbFormula.Setfocus;

      // Inclui Novo Registro
      QryDetalhe.Append;
   End
   Else
   Begin
      BtIns.Down := false;
      exit;
   End;
end;

procedure TfrmRotinaCalculo.btAltClick(Sender: TObject);
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
      PageControl.Visible := False;
      PnlDetalhe.Visible:=True;

      LkcTbFormula.Text := qryDetalhe.FieldByName('NO_FORMULA').asString         + ' (' +
                           qryDetalhe.FieldByName('NO_VARIAVEL_RESULT').asString + ')';
      LkcTbFormula.Enabled := false;
      DBEdit9.SetFocus;

      // Alterar Registro
      QryDetalhe.Edit;
   End
   Else
   Begin
      BtAlt.Down := False;
      exit;
   End;
end;

procedure TfrmRotinaCalculo.BtExclClick(Sender: TObject);
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

procedure TfrmRotinaCalculo.BtProcClick(Sender: TObject);
begin
   // Muda Base de Dados e Executa Componente de Pesquisa
   SelDlgProcuraQry.DataSet:=QryDetalhe;
   SelDlgProcuraQry.Execute;

   // Volta Base de Dados Anterior
   SelDlgProcuraQry.DataSet:=QryPrincipal;
end;

procedure TfrmRotinaCalculo.bbtnOkDetClick(Sender: TObject);
begin
   If trim(LkcTbFormula.text) = '' then
   Begin
      ShowMessage('Campo Obrigatório não Preenchido !');
      LkcTbFormula.SetFocus;
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

procedure TfrmRotinaCalculo.bbtnCancelarDetClick(Sender: TObject);
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
   PageControl.Visible := True;
end;

procedure TfrmRotinaCalculo.QryDetalheBeforePost(DataSet: TDataSet);
begin
   // Caso Botao Incluir Cria Novo Registro
   If BtIns.Down Then
   Begin
      qryDetalhe.FieldByName('CD_GRUPO_FORMULA').AsInteger :=
                   qryPrincipal.FieldByName('CD_GRUPO_FORMULA').asInteger;
      qryDetalhe.FieldByName('CD_FORMULA').AsInteger :=
                   qryNoFormula.FieldByName('CD_FORMULA').asInteger;
   End;
      If trim(DBEdit9.Text) = '' Then
        qryDetalhe.FieldByname('NR_ORDEM_FORMULA').AsInteger :=
                     qryDetalhe.RecordCount + 1;
end;

procedure TfrmRotinaCalculo.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
   QryPrincipal.DisableControls;

   If wIdReg > 0 Then
      Qryprincipal.Locate('CD_GRUPO_FORMULA',wIdReg,[]);
   QryPrincipal.EnableControls;
end;

procedure TfrmRotinaCalculo.SBtnGerarClick(Sender: TObject);
begin
   SBtnGerar.Down := false;

   If qryPrincipal.IsEmpty then exit;

   dtmRelatsAtuarial.qryEmiteRotina.Close;
   dtmRelatsAtuarial.qryEmiteRotina.ParamByName('CD_GRUPO_FORMULA').asInteger :=
                          qryPrincipal.FieldByName('CD_GRUPO_FORMULA').asInteger;
   dtmRelatsAtuarial.qryEmiteRotina.Open;

   dtmRelatsAtuarial.rpRotina.Print;
end;

procedure TfrmRotinaCalculo.sbtnProcurarClick(Sender: TObject);
begin
   MontaSelect.Executar;

   If (MontaSelect.ValoresChave.Count > 0) and
      (MontaSelect.ValoresChave[0] <> '') then
      QryPrincipal.Locate('CD_GRUPO_FORMULA', MontaSelect.ValoresChave[0], []);

   sbtnProcurar.Down := False;
end;

procedure TfrmRotinaCalculo.QryDetalheNR_ORDEM_FORMULAChange(Sender: TField);
begin
   If (QryDetalhe.State in [dsInsert, dsEdit]) and (QryDetalheNR_ORDEM_APRESENTACAO.asInteger <= 0) then
      QryDetalheNR_ORDEM_APRESENTACAO.asInteger := QryDetalheNR_ORDEM_FORMULA.asInteger;
end;

procedure TfrmRotinaCalculo.DBEdit9Exit(Sender: TObject);
begin
   If QryDetalhe.State = dsInsert then
      QryDetalheNR_ORDEM_APRESENTACAO.asInteger := QryDetalheNR_ORDEM_FORMULA.asInteger;
end;

procedure TfrmRotinaCalculo.QryDetalheAfterScroll(DataSet: TDataSet);
begin
   DBMemo2.Refresh;
   DBEdit2.Refresh;
   DBEdit3.Refresh;
   DBEdit4.Refresh;
end;

procedure TfrmRotinaCalculo.SBtnDuplicarClick(Sender: TObject);
var iCD_GRUPO_FORMULA: Integer;
begin
   SBtnDuplicar.Down := False;

   If QryPrincipal.isEmpty then Exit;

   If Application.MessageBox('Deseja duplicar a Rotina selecionada?', 'Aviso', MB_ICONQUESTION + MB_YESNO) = IDYes then
   Begin
      qryAux.Open;
      iCD_GRUPO_FORMULA := (qryAuxMAX_CD.asInteger + 1);
      qryAux.Close;

      If not dtmBaseDados.dbBaseDados.inTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      //Duplica Rotina.
      QryInsRotina.ParamByName('CD_GRUPO_FORMULA').asInteger := iCD_GRUPO_FORMULA;
      QryInsRotina.ParamByName('DS_GRUPO_FORMULA').asString := 'Cópia de ' + QryPrincipalDS_GRUPO_FORMULA.asString;

      If QryPrincipalDS_OBSERV_FORMULA.IsNull then
         QryInsRotina.ParamByName('DS_OBSERV_FORMULA').Clear
      Else
         QryInsRotina.ParamByName('DS_OBSERV_FORMULA').asString := QryPrincipalDS_OBSERV_FORMULA.asString;

      If QryPrincipalIR_GRUPO_CALCULO.IsNull then
         QryInsRotina.ParamByName('IR_GRUPO_CALCULO').Clear
      Else
         QryInsRotina.ParamByName('IR_GRUPO_CALCULO').asString := QryPrincipalIR_GRUPO_CALCULO.asString;

      Try
         QryInsRotina.ExecSQL;
      Except on E: Exception do
         Begin
            dtmBaseDados.dbBaseDados.RollBack;
            MessageDlg('Não foi possível duplicar a Rotina.' + #13#10 + E.Message, mtError, [mbOk], 0);
            Exit;
         End;
      End;

      //Duplica Sequência de Fórmulas.
      Try
         QryDetalhe.DisableControls;
         QryDetalhe.First;

         While not QryDetalhe.Eof do
         Begin
            QryInsSequencia.ParamByName('CD_GRUPO_FORMULA').asInteger := iCD_GRUPO_FORMULA;
            QryInsSequencia.ParamByName('CD_FORMULA').asInteger := QryDetalheCD_FORMULA.asInteger;
            QryInsSequencia.ParamByName('NR_ORDEM_FORMULA').asInteger := QryDetalheNR_ORDEM_FORMULA.asInteger;

            If QryDetalheNR_ORDEM_APRESENTACAO.IsNull then
               QryInsSequencia.ParamByName('NR_ORDEM_APRESENTACAO').Clear
            Else
               QryInsSequencia.ParamByName('NR_ORDEM_APRESENTACAO').asInteger := QryDetalheNR_ORDEM_APRESENTACAO.asInteger;

            Try
               QryInsSequencia.ExecSQL;
            Except on E: Exception do
               Begin
                  dtmBaseDados.dbBaseDados.RollBack;
                  MessageDlg('Não foi possível duplicar a Rotina.' + #13#10 + E.Message, mtError, [mbOk], 0);
                  Exit;
               End;
            End;

            QryDetalhe.Next;
         End;

         dtmBaseDados.dbBaseDados.Commit;
         MessageDlg('Rotina duplicada com sucesso.', mtInformation, [mbOk], 0);
      Finally
         QryDetalhe.First;
         QryDetalhe.EnableControls;

         QryDetalhe.Close;
         QryPrincipal.Close;
         QryPrincipal.Open;
         QryDetalhe.Open;
      End;
   End; //if
end;

end.
