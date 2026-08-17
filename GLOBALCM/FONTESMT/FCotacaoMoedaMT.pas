// Alterações:
{-------------------------------------------------------------------------------
Data       : 30/05/2023
SIG        : WO16558 (SIG135879)
Responsável: Everson Cunha
Descrição  : Chamada da procedure sp_Calcula_Indices para o INPC
--------------------------------------------------------------------------------
Data       : 09/04/2018
SIG        : 66391
Responsável: Taffarel Sevaybriker
Descrição  : Corrigida a funcionalidade de cotação de moeda para efetuar o
             commit da transação ao clicar no botão "OK".
--------------------------------------------------------------------------------
Data       : 29/08/2007
Pendencia  : 26229
Descrição  : Removido a crítica para Valor negativo e mantive o CDS aberto para
             mostrar na tela.
--------------------------------------------------------------------------------
Data       : 30/09/2004
Pendencia  : 17239
Descrição  : implementação da rotina ValidaMesRef para validar o mes de
             referência da cotação.
--------------------------------------------------------------------------------
Componente : dblkcmbMoeDesc
Data       : 21/05/2004
Pendencia  : 16205
Descrição  : Cadastro de moeda pela sigla.
--------------------------------------------------------------------------------}

unit FCotacaoMoedaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, ImgList, IvDictio,
  CmEventosCadastro, Wwdatsrc, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, Grids, Wwdbigrd, Wwdbgrid,
  UCtrlMoeda, uCtrlCotacaoMoeda, uCtrlUsrMoeda, uCmTypes, uAutorizacao,
  ComCtrls, DBCtrls, DBTables, wwstorep;

type
  TfrmCotacaoMoeda = class(TFrmCadastroMT)
    CdsMoeda: TCMClientDataSet;
    CdsCotacao: TCMClientDataSet;
    PnlMoeda: TPanel;
    lblMoeda: TLabel;
    dblkcmbMoeDesc: TCMDBLookupCombo;
    lblDataCotacao: TLabel;
    lblValorCotacao: TLabel;
    lblRefer: TLabel;
    LbldataFin: TLabel;
    Label3: TLabel;
    dbedCotValor: TDBRealEdit;
    dtCotacao: TCMDateTimePicker;
    DbDataFim: TCMDateTimePicker;
    EdtPrazo: TDBRealEdit;
    EdtRef: TwwDBEdit;
    dbGrd: TwwDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBMOBSERVACAO: TDBMemo;
    sp_Calcula_Indices: TwwStoredProc;
    procedure PegaRegCotacao( State: TDataSetState; PegaFilhos: Boolean = False );
    procedure CopiaRegCotacao( State: TDatasetState );
    procedure Seleciona(IdMoeda: Double = 0);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkcmbMoeDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure EdtRefExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    EMoedaCorrente, bAchou: boolean;
    MoedaCorrente: Double;
    CotacaoMoeda: TCtrlCotacaoMoeda;
    UsrxMoeda: TCtrlUsrMoeda;
    Moeda: TCtrlMoeda;
    dtCotacao_Del : TDateTime; //Everson Cunha - SIG135879

    procedure sp_CalculaIndices (dCotData : TDateTime; iOperacao : Integer);  //Everson Cunha - SIG135879
    function ValidaMesRef(sMesRef: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmCotacaoMoeda: TfrmCotacaoMoeda;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCotacaoMoeda.PegaRegCotacao( State: TDataSetState; PegaFilhos: Boolean = False );
begin
  If State = DsInsert Then
  begin

     cdsCotacao.Data := CotacaoMoeda.ListaCotacaoMoedasRef( -1 );
     
     // P.26229 29/08/2007 Traz as cotações no momento do insert.
     Seleciona(StrToFloat( dblkcmbMoeDesc.lookupvalue) );
  end
  Else
     cdsCotacao.Data := CotacaoMoeda.ListaCotacaoMoedasRef( Cds.FieldByName( 'IdCotacaoMoeda'{ivlm} ).AsFloat );
end;

procedure TfrmCotacaoMoeda.CopiaRegCotacao( State: TDatasetState );
var
  i: Integer;
  snome: String;
begin
  If State = dsInsert Then
     CdsCotacao.Append
  Else
     CdsCotacao.Edit;

  For i := 0 To Cds.Fields.Count - 1 Do Begin
      snome := Cds.Fields[ i ].FieldName;
      CdsCotacao.FieldByName( snome ).Value := Cds.FieldByName( snome ).Value;
  End;

  CdsCotacao.Post;
end;

procedure TfrmCotacaoMoeda.Seleciona( IdMoeda: Double );
begin
  Cds.Data := CotacaoMoeda.ListaCotacaoMoeda( IdMoeda );
  cds.FieldByName( 'COTMESREF'{ivlm} ).EditMask := '!99/9999;0; '{ivlm};
  dbGrd.Enabled := Not cds.IsEmpty;
end;

procedure TfrmCotacaoMoeda.FormCreate(Sender: TObject);
var
  cdsaux: TClientDataset;
begin
  inherited;
  bachou := True;
  Moeda := TCtrlMoeda.Create;
//Moeda.Initialize( DtmBaseDados.dbBaseDados, False, Sistema.ConnectionType,
  Moeda.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, //Taffarel - SIG66391
                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  UsrxMoeda := TCtrlUsrMoeda.Create;
  UsrxMoeda.InitializeAs( Moeda );

  CotacaoMoeda := TCtrlCotacaoMoeda.Create;
  CotacaoMoeda.InitializeAs( Moeda );
  CotacaoMoeda.cds := cdsCotacao;
  CdsMoeda.Data := Moeda.ListaMoeda( 0, False, True, '', Sistema.IdUsuario );
  MoedaCorrente    := Moeda.MoedaCorrente( Sistema.IdEmpresa );
  Seleciona( -1 );
  CdsCotacao.Data  := Cds.Data;
  CdsCotacao.EmptyDataSet;
end;

procedure TfrmCotacaoMoeda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CotacaoMoeda.Free;
  UsrxMoeda.Free;
  Moeda.Free;
end;

procedure TfrmCotacaoMoeda.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CopiaRegCotacao( DsInsert );
  Accept := CotacaoMoeda.Gravar;

  //Everson Cunha - SIG135879 : INI
  if (Accept) and (dblkcmbMoeDesc.LookupValue = '7') then //INPC
    sp_CalculaIndices(StrToDate(dtCotacao.Text), 1);
  //Everson Cunha - SIG135879 : FIM
end;

procedure TfrmCotacaoMoeda.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CopiaRegCotacao( DsEdit );
  Accept := CotacaoMoeda.Gravar;

  //Everson Cunha - SIG135879 : INI
  if (Accept) and (dblkcmbMoeDesc.LookupValue = '7') then //INPC
    sp_CalculaIndices(StrToDate(dtCotacao.Text), 2);
  //Everson Cunha - SIG135879 : FIM
end;

procedure TfrmCotacaoMoeda.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  CdsCotacao.Delete;
  Accept := CotacaoMoeda.Gravar;

  //Everson Cunha - SIG135879 : INI
  if (Accept) and (dblkcmbMoeDesc.LookupValue = '7') and (dtCotacao_Del <> 0) then //INPC
    sp_CalculaIndices(dtCotacao_Del, 3);
  //Everson Cunha - SIG135879 : FIM
end;

procedure TfrmCotacaoMoeda.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( CotacaoMoeda.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
  dblkcmbMoeDesc.Enabled := True;
  DbGrd.Enabled := ( Not Cds.IsEmpty );
end;

procedure TfrmCotacaoMoeda.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  Cds.Cancel;
  Cds.Append;
  PegaRegCotacao( DsInsert );

  // P.26229 29/08/2007 
  if Cds.state in [Dsbrowse] then
     Cds.Append;

  cds.FieldByName( 'COTMESREF'{ivlm} ).EditMask := '!99/9999;0; '{ivlm};
  Cds.FieldByName( 'MoeCodigo'{ivlm} ).AsFloat  := CdsMoeda.FieldByName( 'MoeCodigo'{ivlm} ).AsFloat;
  Cds.FieldByName( 'IdUsuarioInclusao'{ivlm} ).AsFloat := Sistema.IdUsuario;
  dblkcmbMoeDesc.Enabled := False;
  DtCotacao.SetFocus;
end;

procedure TfrmCotacaoMoeda.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  PegaRegCotacao( DsEdit );
  dblkcmbMoeDesc.Enabled := False;
  DtCotacao.SetFocus;
end;

procedure TfrmCotacaoMoeda.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 1 ] ) );
     Cds.Locate( 'IdCotacaoMoeda'{ivlm}, StrToFloat( MontaSelect.ValoresChave[ 0 ] ), [] );
     bachou := CdsMoeda.Locate( 'MoeCodigo'{ivlm}, StrToFloat( MontaSelect.ValoresChave[ 1 ] ), [] );
     dblkcmbMoeDesc.Value   := MontaSelect.ValoresChave[ 1 ];
     dblkcmbMoeDesc.Enabled := True;
     AutorizarForm(afNormal);
     sbtnInserir.Enabled := ( bachou And sbtnInserir.Enabled );
     sbtnApagar.Enabled  := ( bachou And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnApagar.Enabled );
     sbtnAlterar.Enabled := ( bachou And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnAlterar.Enabled );
  End;
end;

procedure TfrmCotacaoMoeda.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Seleciona( CdsMoeda.FieldByName( 'MoeCodigo'{ivlm} ).AsFloat );
  Cds.Locate( 'IdCotacaoMoeda'{ivlm}, CdsCotacao.FieldByName( 'IdCotacaoMoeda'{ivlm} ).AsFloat, [] );
  dblkcmbMoeDesc.Enabled := True;
  AutorizarForm(afNormal);
  sbtnInserir.Enabled := ( ( Not CdsMoeda.Eof ) And sbtnInserir.Enabled );
  sbtnApagar.Enabled  := ( ( Not CdsMoeda.Eof ) And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnApagar.Enabled );
  sbtnAlterar.Enabled := ( ( Not CdsMoeda.Eof ) And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnAlterar.Enabled );
end;

procedure TfrmCotacaoMoeda.bbtnConfirmarClick(Sender: TObject);
begin
  If Cds.FieldByName( 'CotMesRef'{ivlm} ).IsNull Or ( Trim( Cds.FieldByName( 'CotMesRef'{ivlm} ).AsString ) = '' ) Then Begin
     MsgDlg( 'O campo Referência deve ser preenchido.', 'Informação', mtInformation, [ mbOK ], 0 );
     EdtRef.SetFocus;
     Exit;
  End;

  If Cds.FieldByName( 'CotDataFim'{ivlm} ).AsDateTime < Cds.FieldByName( 'CotData'{ivlm} ).AsDateTime Then Begin
     MsgDlg( 'A Data Final deve maior ou igual a Data Inicial.', 'Informação', mtInformation, [ mbOK ], 0 );
     DtCotacao.SetFocus;
     Exit;
  End;

  // 26229 29/08/2007 Removido a critica, aceita valores negativos
  If ( Cds.FieldByName( 'COTVALOR'{ivlm} ).AsFloat = 0.00 ) Then
     If MsgDlg( 'O valor da cotação está igual a zero. Confirma o valor?',
                'Cotação igual a zero', mtConfirmation, [ mbYes, MbNo ], 0 ) <> MrYes Then Begin
        dbedCotValor.SetFocus;
        Exit;
     End;

  If CdsMoeda.FieldByName( 'FLGTESTADATASCOT'{ivlm} ).AsString <> 'N'{ivlm} Then
     If CmeCadastro.Operacao = OpInserir Then Begin
        If Not CotacaoMoeda.ValidaPeriodo( Cds.FieldByName( 'MoeCodigo'{ivlm} ).AsFloat,
                                           Cds.FieldByName( 'CotData'{ivlm} ).AsDateTime,
                                           Cds.FieldByName( 'CotDataFim'{ivlm} ).AsDateTime ) Then Begin
           MsgDlg( 'Já existe cotação para esta moeda no período informado.', 'Informação', mtInformation, [ mbOK ], 0 );
           dtCotacao.SetFocus;
           Exit;
        End;
     End Else
     If CmeCadastro.Operacao = OpAlterar Then
        If Not CotacaoMoeda.ValidaPeriodo( Cds.FieldByName( 'MoeCodigo'{ivlm} ).AsFloat,
                                           Cds.FieldByName( 'CotData'{ivlm} ).AsDateTime,
                                           Cds.FieldByName( 'CotDataFim'{ivlm} ).AsDateTime,
                                           Cds.FieldByName( 'IdCotacaoMoeda'{ivlm} ).AsFloat ) Then Begin
           MsgDlg( 'Já existe outra cotação para esta moeda no período informado.', 'Informação', mtInformation, [ mbOK ], 0 );
           dtCotacao.SetFocus;
           Exit;
        End;

  inherited;
end;

procedure TfrmCotacaoMoeda.dblkcmbMoeDescCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblkcmbMoeDesc.Text) = '' Then Exit;
  Seleciona( CdsMoeda.FieldByName('MOECODIGO'{ivlm}).AsFloat );
  EMoedaCorrente := ( MoedaCorrente = CdsMoeda.FieldByName( 'MOECODIGO'{ivlm} ).AsFloat );
  AutorizarForm(afNormal);
  sbtnInserir.Enabled := ( ( Not CdsMoeda.Eof ) And sbtnInserir.Enabled );
  sbtnApagar.Enabled  := ( ( Not CdsMoeda.Eof ) And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnApagar.Enabled );
  sbtnAlterar.Enabled := ( ( Not CdsMoeda.Eof ) And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnAlterar.Enabled );

  If Not Cds.IsEmpty Then
     CmeCadastro.Operacao := OpIdle;
end;

procedure TfrmCotacaoMoeda.CmeCadastroDelete(Sender: TObject);
begin
  PegaRegCotacao( DsEdit );
  inherited;
end;

procedure TfrmCotacaoMoeda.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  If bAchou Then Begin
   End Else Begin
     sbtnInserir.Enabled := False;
     sbtnAlterar.Enabled := False;
     sbtnApagar.Enabled  := False;
   End;
end;

procedure TfrmCotacaoMoeda.sbtnInserirClick(Sender: TObject);
begin
  If dblkcmbMoeDesc.Value <> '' Then
     inherited
  Else Begin
     MsgDlg( 'Primeiro selecione uma moeda.', 'Aviso', MtInformation, [MbOk], 0 );
     dblkcmbMoeDesc.SetFocus;
     sbtnInserir.Down := False;
     CmeCadastro.Operacao := OpIdle;
  End;
end;

procedure TfrmCotacaoMoeda.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DbGrd.Enabled := ( Not Cds.IsEmpty );
  dblkcmbMoeDesc.Enabled := True;
  AutorizarForm(afNormal);
  sbtnInserir.Enabled := ( ( Not CdsMoeda.Eof ) And sbtnInserir.Enabled );
  sbtnApagar.Enabled  := ( ( Not CdsMoeda.Eof ) And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnApagar.Enabled );
  sbtnAlterar.Enabled := ( ( Not CdsMoeda.Eof ) And ( Not Cds.IsEmpty ) And ( Not EMoedaCorrente ) And sbtnAlterar.Enabled );
end;


procedure TfrmCotacaoMoeda.FormShow(Sender: TObject);
begin
  inherited;
  dblkcmbMoeDesc.Enabled := sbtnInserir.Enabled Or sbtnAlterar.Enabled Or
                            sbtnApagar.Enabled Or sbtnProcurar.Enabled;
end;

procedure TfrmCotacaoMoeda.sbtnAlterarClick(Sender: TObject);
begin
  If sbtnAlterar.Enabled Then
    inherited;
end;

//início pendência 17239 - 30/09/2004
procedure TfrmCotacaoMoeda.EdtRefExit(Sender: TObject);
begin
  inherited;
  if not ValidaMesRef(copy(EdtRef.Text, 1, 2)+'/'+copy(EdtRef.Text, 3, 4)) then
  begin
    showMessage('Referência Inválida');
    EdtRef.SetFocus;
  end else
  begin
    if (trim(EdtRef.Text) = '') and (cds.state in [dsEdit, dsInsert]) then
      cds.FieldByName( 'COTMESREF').asString := '';
  end;
end;

function TfrmCotacaoMoeda.ValidaMesRef(sMesRef: String): Boolean;
var sAux : string;
begin
  result := true;
  sAux := '01/' + sMesRef;
  result := (length(sAux) = 10) and (length(sMesRef) = 7) and (pos(' ', sMesRef)= 0);
  result := result or (sMesRef = '/');
  if (sMesRef <> '/') then
  begin
    try
      strToDate(sAux);
    except
      result := false;
    end;
  end;
end;
//fim - pendência 17239 - 30/09/2004

//Everson Cunha - SIG135879 - Ini
procedure TfrmCotacaoMoeda.sp_CalculaIndices(dCotData: TDateTime; iOperacao: Integer);
begin
  try
    sp_Calcula_Indices.Close;
    sp_Calcula_Indices.ParamByName('PCOTDATA').AsDate := dCotData;
    sp_Calcula_Indices.ParamByName('POPERACAO').AsInteger := iOperacao;

    if not(sp_Calcula_Indices.Prepared) then
      sp_Calcula_Indices.Prepare;

    sp_Calcula_Indices.ExecProc;

    MessageDlg(sp_Calcula_Indices.ParamByName('V_OUTMENSAGEM').AsString, mtInformation, [mbOK], 0);

  except
    On E : Exception do
    Begin
      MessageDlg('Erro: ' + E.Message, mtError, [mbOK], 0);
    End;
  end;
end;
//Everson Cunha - SIG135879 - Fim

procedure TfrmCotacaoMoeda.sbtnApagarClick(Sender: TObject);
begin
  dtCotacao_Del := StrToDate(dtCotacao.Text);

  inherited;
end;

end.

