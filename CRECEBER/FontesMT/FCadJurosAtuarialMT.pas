(*******************************************************************************
 03/09/1999 - 02.13.03
  Inplementação da tela
*******************************************************************************)
Unit FCadJurosAtuarialMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fProcuraCliFor, CMProcuraSubTipo, Grids, Wwdbigrd, Wwdbgrid, TREdit, Wwdatsrc,
  wwdblook, CMDBLookupCombo, DBTables, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, uCtrlCadJurosAtuaria,
  wwclient;

Type
  TFrmCadJurosAtuarialMT = Class(TFrmProcuraCliFor)
    bbtnSelecionaDoc: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    ReValorJuros: TRealEdit;
    DsDocsAberto: TwwDataSource;
    Label2: TLabel;
    ReValorMulta: TRealEdit;
    Label3: TLabel;
    ReValorSimples: TRealEdit;
    Label4: TLabel;
    CmbIndCorr: TCMDBLookupCombo;
    SqlIndiceCorrecao: TCMSqlParams;
    CdsIndiceCorrecao: TCMClientDataSet;
    SqlDocsAberto: TCMSqlParams;
    CdsDocsAberto: TwwClientDataSet;
    Procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure FormCreate(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure bbtnSelecionaDocClick(Sender: TObject);
    Procedure SpeedButton1Click(Sender: TObject);
    Procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    CtrlCadJurosAtuaria: TCtrlCadJurosAtuaria;
  public
    { Public declarations }
  End;

Var
  FrmCadJurosAtuarialMT: TFrmCadJurosAtuarialMT;

Implementation

Uses uSistema, uFuncaoGeral, uMensErro, uDataBase, DBaseDados;

{$R *.DFM}

Procedure TFrmCadJurosAtuarialMT.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  Inherited;
  If (Field.FieldName = 'SALDO') Then
  Begin
    AFont.Color := clNavy;
    ABrush.Color := $0080FFFF; {Amarelo claro}
  End;
End;

Procedure TFrmCadJurosAtuarialMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlCadJurosAtuaria := TCtrlCadJurosAtuaria.Create;
  CtrlCadJurosAtuaria.InitializeAs(ParamIntegra);

  SqlDocsAberto.Prepare;
  SqlDocsAberto.Open;
  TFloatField(CdsDocsAberto.FieldByName('PERCJUROSATUARIAL')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDocsAberto.FieldByName('PERCJUROSSIMPLES')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDocsAberto.FieldByName('VLRMULTA')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDocsAberto.FieldByName('SALDO')).DisplayFormat := '#,##0.00';

  SqlIndiceCorrecao.Open;
End;

Procedure TFrmCadJurosAtuarialMT.bbtnConfirmarClick(Sender: TObject);
Var
  sSeparador: Char;
Begin
  Inherited;
  sSeparador := DecimalSeparator;
  DecimalSeparator := '.';

  If not CtrlCadJurosAtuaria.GravaCadJurosAtuaria(CdsDocsAberto.Data,
    ReValorJuros.Value,
    ReValorSimples.Value,
    ReValorMulta.Value,
    FuncaoGeral.Decode(Trim(CmbIndCorr.Text), '', 'NULL', CmbIndCorr.LookupValue)) Then
  Begin
    MsgDlg(CtrlCadJurosAtuaria.MessageInfo, 'Atenção', mtError, [mbOK], 0)
  End;
  DecimalSeparator := sSeparador;
  bbtnSelecionaDoc.Click;
End;

Procedure TFrmCadJurosAtuarialMT.bbtnSelecionaDocClick(Sender: TObject);
Begin
  Inherited;
  bbtnSelecionaDoc.SetFocus;
  If CPForCli.Text = '' Then
  Begin
    If ParamIntegra.RecPag = 'P' Then
      MsgDlg('Favor Indicar o Fornecedor', 'Atenção', mtError, [mbOK], 0)
    Else
      MsgDlg('Favor Indicar o Cliente', 'Atenção', mtError, [mbOK], 0);
  End
  Else
  Begin
    CdsDocsAberto.Close;
    CdsDocsAberto.Data := CtrlCadJurosAtuaria.ListaDocumentos(ParamIntegra.RecPag, sistema.idusuario,
      CPForCli.ForCliReg.Id, Sistema.IdEmpresa);
    TFloatField(CdsDocsAberto.FieldByName('PERCJUROSATUARIAL')).DisplayFormat := '#,##0.00';
    TFloatField(CdsDocsAberto.FieldByName('PERCJUROSSIMPLES')).DisplayFormat := '#,##0.00';
    TFloatField(CdsDocsAberto.FieldByName('VLRMULTA')).DisplayFormat := '#,##0.00';
    TFloatField(CdsDocsAberto.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
  End;

  bbtnConfirmar.Enabled := Not CdsDocsAberto.IsEmpty;
End;

Procedure TFrmCadJurosAtuarialMT.SpeedButton1Click(Sender: TObject);
Begin
  Inherited;
  CdsDocsAberto.DisableControls;
  CdsDocsAberto.First;
  While Not CdsDocsAberto.Eof Do
  Begin
    CdsDocsAberto.Edit;
    CdsDocsAberto.FieldByName('CALCULAJUROS').AsInteger := 1;
    CdsDocsAberto.Post;
    CdsDocsAberto.Next;
  End;
  CdsDocsAberto.First;
  CdsDocsAberto.EnableControls;
End;

Procedure TFrmCadJurosAtuarialMT.SpeedButton2Click(Sender: TObject);
Begin
  Inherited;
  CdsDocsAberto.DisableControls;
  CdsDocsAberto.First;
  While Not CdsDocsAberto.Eof Do
  Begin
    CdsDocsAberto.edit;
    CdsDocsAberto.FieldByName('CALCULAJUROS').AsInteger := CdsDocsAberto.FieldByName('CALCULAJUROS').AsInteger Xor 1;
    CdsDocsAberto.Post;

    {
        CdsDocsAberto.Edit;
        If CdsDocsAberto.FieldByName('CALCULAJUROS').AsInteger = 1 Then
          CdsDocsAberto.FieldByName('CALCULAJUROS').AsInteger := 0
        Else
          CdsDocsAberto.FieldByName('CALCULAJUROS').AsInteger := 1;
        CdsDocsAberto.Post;}
    CdsDocsAberto.Next;
  End;
  CdsDocsAberto.First;
  CdsDocsAberto.EnableControls;
End;

End.

