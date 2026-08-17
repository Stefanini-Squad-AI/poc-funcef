{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

Nº SIG.....: 60379
Data.......: 19/09/2019
Autor......: Everson Cunha
Descrição..: Inclusão do campo Nº Documento(s)
--------------------------------------------------------------------------------
}

(*******************************************************************************
 10/03/1999 - 02.05.08
 Implementação do Form Altera Dados Remessa.
 Permite Gerar remessa para alteração de documentos arquivos já enviados;
 11/03/1999 - 02.05.08
 Implementação do Método IeaCm.MostraFormAlteracao Para geração do Arquivo;
 17/03/1999 - 02.06.00
 Implementação de Alteração para todos os códigos de ocorrência do CNAB Itau
 *******************************************************************************)

Unit
  FAlteraDadosRemessaMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FProcuraCliFor, MontaSelect, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, Db,
  DBTables, Wwdatsrc, checklst, Machklb, IvDictio, IvMulti, 
  IvEMulti, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams,
  uCtrlParamIntegra, DBClient, uCMClientDataSet, uCtrlAlteraDadosRemessa;

Type
  TFrmAlteraDadosRemessaMT = class(TFrmProcuraCliFor)
    Panel1: TPanel;
    Panel2: TPanel;
    GrdDocSel: TwwDBGrid;
    Pnldocpago: TPanel;
    Panel8: TPanel;
    Panel3: TPanel;
    bbtnincluir: TBitBtn;
    bbtnExcluir: TBitBtn;
    bbtnSelecionaDoc: TToolbarButton97;
    SqlBanco: TCMSqlParams;
    SqlDocEmit: TCMSqlParams;
    DsDocEmit: TwwDataSource;
    SqlDocSel: TCMSqlParams;
    DsDocSel: TwwDataSource;
    GrdDocEmit: TwwDBGrid;
    PnlCamposParaAlteracao: TPanel;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    CklCampos: TCMchklistbox;
    GroupBox2: TGroupBox;
    CmbOperacao: TComboBox;
    Panel4: TPanel;
    BtnContinuar: TBitBtn;
    CdsDocEmi: TCMClientDataSet;
    CdsDocSel: TCMClientDataSet;
    CdsBanco: TCMClientDataSet;
    DbLcPortador: TwwDBLookupCombo;
    Label2: TLabel;
    dtedDataProg: TCMDateTimePicker;
    lblDataProgramada: TLabel;
    EdtNossoNum: TEdit;
    Label1: TLabel;
    mmoDocumento: TMemo;
    lblDocumento: TLabel;
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure GrdDocEmitCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnincluirClick(Sender: TObject);
    procedure bbtnExcluirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DbLcPortadorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    CtrlAlteraDadosRemessa  : TCtrlAlteraDadosRemessa;

     sOldPortador : String;  //Acumula o Portadorforma para garantir a seleção de boletos emitidos pelo mesmo PortadorForma

    //Executa o Cancel Updates Nas Queryes Emit e Sel e Limpa os Grids
    Procedure CancelaAteracoes(bTotal:Boolean);
    //Limpa e Monta o Check List Box Dos Campos Para Alteração
    procedure MontaListaCheckCampos;
  public
    { Public declarations }
  end;

Var
  FrmAlteraDadosRemessaMT: TFrmAlteraDadosRemessaMT;

Implementation

{$R *.DFM}

Uses
 uDataBase, uModulo, uSistema, uMensErro, uFuncaoGeral;

Procedure TFrmAlteraDadosRemessaMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlAlteraDadosRemessa := TCtrlAlteraDadosRemessa.Create;

  CtrlAlteraDadosRemessa.CdsDocEmi := CdsDocEmi;
  CtrlAlteraDadosRemessa.CdsDocSel := CdsDocSel;
  CtrlAlteraDadosRemessa.CdsBanco  := CdsBanco;

  CtrlAlteraDadosRemessa.IdEmpresa     := Sistema.IdEmpresa;
  CtrlAlteraDadosRemessa.IdModulo      := Sistema.IdModulo;
  CtrlAlteraDadosRemessa.IdUsuario     := Sistema.IdUsuario;
  CtrlAlteraDadosRemessa.IdEspAcesso   := Sistema.IdEspAcesso;
  CtrlAlteraDadosRemessa.UsaPlanoPatro := Sistema.UsaPlanoPatro;
  CtrlAlteraDadosRemessa.PlanoConta    := ParamIntegra.Plano;

  CtrlAlteraDadosRemessa.InitializeAs( ParamIntegra );

  SqlDocEmit.Open;
  SqlDocSel.Open;
  sOldPortador := '';
  MontaListaCheckCampos;
End;

Procedure TFrmAlteraDadosRemessaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
Begin
  CancelaAteracoes(True);
  Inherited;
End;

Procedure TFrmAlteraDadosRemessaMT.bbtnSelecionaDocClick(Sender: TObject);
Begin
  Inherited;
  If PnlCamposParaAlteracao.Visible Then Exit;

  If DbLcPortador.Text = '' Then
  Begin
    MsgDlg('Favor Indicar Tipo de Cobrança.','Atenção',mtinformation,[mbOK],0);
    DbLcPortador.SetFocus;
    DbLcPortador.DropDown; //Everson Cunha - SIG60379
    Exit;
  End;

  CancelaAteracoes((sOldPortador <> DbLcPortador.LookupValue));
  sOldPortador := DbLcPortador.LookupValue;

  If Not ( CtrlAlteraDadosRemessa.bbtnSelecionaDocClick( ParamIntegra.RecPag,
                                                         EdtNossoNum.Text,
                                                         DbLcPortador.Text,
                                                         DbLcPortador.LookUpValue,
                                                         dtedDataProg.Text,
                                                         mmoDocumento.Lines.Text, //Everson Cunha - SIG60379
                                                         CPForCli.ForCliReg.RazaoSocial,
                                                         CPForCli.ForCliReg.Id,
                                                         0 ) ) Then Begin

    MsgDlg( CtrlAlteraDadosRemessa.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
  End;
End;

Procedure TFrmAlteraDadosRemessaMT.GrdDocEmitCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
  If (Not (Sender As TwwDbGrid).DataSource.DataSet.IsEmpty) Then Begin

    If (Field.FieldName='SALDO') OR (Field.FieldName='VALOR') Then Begin
      AFont.Color:=clNavy;
      ABrush.Color:=$0080FFFF;{Amarelo claro}
    End;
  End;
End;

Procedure TFrmAlteraDadosRemessaMT.bbtnincluirClick(Sender: TObject);
Begin
  Inherited;
  If Not PnlCamposParaAlteracao.Visible Then
    FuncaoGeral.MoveRegistros(GrdDocEmit,GrdDocSel);
End;

Procedure TFrmAlteraDadosRemessaMT.bbtnExcluirClick(Sender: TObject);
Begin
  Inherited;
  If Not PnlCamposParaAlteracao.Visible Then
    FuncaoGeral.MoveRegistros(GrdDocSel,GrdDocEmit);
End;

Procedure TFrmAlteraDadosRemessaMT.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  CancelaAteracoes(True);
  PnlCamposParaAlteracao.Visible := False;
End;

Procedure TFrmAlteraDadosRemessaMT.CancelaAteracoes(bTotal:Boolean);
Begin
  Inherited;
  If ( CdsDocEmi.Active ) And
     ( CdsDocEmi.ChangeCount > 0 ) Then
    CdsDocEmi.CancelUpdates;

  If bTotal Then Begin
    If ( CdsDocSel.Active ) And
       ( CdsDocSel.ChangeCount > 0 ) Then
      CdsDocSel.CancelUpdates;
    CdsDocSel.Close;
    SqlDocSel.Open;
  End;
  If Not ( CtrlAlteraDadosRemessa.AbreCdsDocEmi ) Then
    MsgDlg( CtrlAlteraDadosRemessa.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
End;

Procedure TFrmAlteraDadosRemessaMT.FormActivate(Sender: TObject);
Begin
  Inherited;
  If Not ( CtrlAlteraDadosRemessa.AbreCdsBanco( Sistema.PrefixoServidor,
                                                ParamIntegra.RecPag ) ) Then Begin
    MsgDlg( CtrlAlteraDadosRemessa.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
  End;
End;

Procedure TFrmAlteraDadosRemessaMT.SpeedButton1Click(Sender: TObject);
Begin
  Inherited;
  PnlCamposParaAlteracao.Visible := False;
End;

Procedure TFrmAlteraDadosRemessaMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  If CmbOperacao.Text = '' Then
    MsgDlg('Favor Indicar o Código da Operação','Atenção',mtinformation,[mbOK],0)
  Else Begin
    If Not CdsDocSel.IsEmpty Then Begin
      If ( Not CtrlAlteraDadosRemessa.bbtnConfirmarClick( pnlCamposParaAlteracao,
                                                          CklCampos,
                                                          CmbOperacao.Text ) ) Then Begin

        MsgDlg( CtrlAlteraDadosRemessa.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
      End;

      MontaListaCheckCampos;
      CancelaAteracoes(True);
    End;
  End;
End;

Procedure TFrmAlteraDadosRemessaMT.MontaListaCheckCampos;
Var
  X:Integer;
Begin
  CklCampos.Items.Clear;
  For X:=0 To CdsDocEmi.FieldCount - 1 Do
      CklCampos.Items.Add(CdsDocEmi.Fields[X].DisplayLabel);
End;

Procedure TFrmAlteraDadosRemessaMT.DbLcPortadorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Var
  Lista : TStringList;
Begin
  Inherited;
  If ( Modified ) And
     ( DbLcPortador.LookupValue <> '' ) Then Begin
     
    CdsBanco.Locate('CODPORTFORMA',StrToInt( DbLcPortador.LookupValue ), [ ] );

    CmbOperacao.Clear;
    Lista := TStringList.Create;

    If ( CtrlAlteraDadosRemessa.EncheLista( Lista ) ) Then Begin

      CmbOperacao.Items := Lista;
    End;
    Lista.Free;
    CancelaAteracoes(True);
  End;
End;

End.

