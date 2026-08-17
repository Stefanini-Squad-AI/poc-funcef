unit FCadTipoClixHotelxCCMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  FCadastroMT, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, MontaSelect, TB97,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, ExtCtrls, wwdblook, uCmTypes,
  uCtrlTipoClixHotelxCC, CMProcuraMask, uCtrlTipoCliente, DBCtrls,
  CMDBLookupCombo, uCmSqlParams;

type
  TFrmCadTipoClixHotelxCC = class(TFrmCadastroMT)
    CdsTipoCliente: TCMClientDataSet;
    DsTipoCliente: TwwDataSource;
    PnlTipoCliente: TPanel;
    Label1: TLabel;
    dblcbTipoCliente: TCMDBLookupCombo;
    DbGrd: TwwDBGrid;
    CmProcContaDeb: TCMProcuraMaskContabil;
    CmProcContaCre: TCMProcuraMaskContabil;
    DsTipoCliXHotelXCC: TwwDataSource;
    CdsTipoCliXHotelXCC: TCMClientDataSet;
    Label2: TLabel;
    CdsEmpresa: TCMClientDataSet;
    DsEmpresa: TwwDataSource;
    DbLcbEmpresa: TDBLookupComboBox;
    CdsCentCusto: TCMClientDataSet;
    SqlCentCusto: TCMSqlParams;
    CdsParamContab: TCMClientDataSet;
    DbLcbCentroCusto: TwwDBLookupCombo;
    Label3: TLabel;
    Sql: TCMSqlParams;
    procedure PegaRegTipoCli( State: TDataSetState );
    procedure CopiaRegTipoCli( State: TDatasetState );
    Procedure Seleciona( IdTipoCliente: Double );
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dblcbTipoClienteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure DbLcbEmpresaCloseUp(Sender: TObject);
    procedure CmProcContaDebExit(Sender: TObject);
    procedure CmProcContaCreExit(Sender: TObject);
    procedure DbLcbCentroCustoExit(Sender: TObject);
    procedure CmProcContaCreChange(Sender: TObject);
    procedure DbLcbCentroCustoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdTipoCliente: Double;
    TipoCliente: TCtrlTipoCliente;
    TipoClixHotelxCC: TCtrlTipoClixHotelxCC;
  end;

var
  FrmCadTipoClixHotelxCC: TFrmCadTipoClixHotelxCC;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil, uCtrlParamIntegra;

procedure TFrmCadTipoClixHotelxCC.PegaRegTipoCli( State: TDataSetState );
begin
  If State = DsInsert Then
     CdsTipoCliXHotelXCC.Data := TipoCliXHotelXCc.ListaTipoClixHotelxCC( -1 )
  Else
     CdsTipoCliXHotelXCC.Data := TipoCliXHotelXCc.ListaTipoClixHotelxCC( Cds.FieldByName( 'IDTIPOCLIENTE'{ivlm} ).AsFloat,
                                                                         Cds.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat );
end;

procedure TFrmCadTipoClixHotelxCC.CopiaRegTipoCli( State: TDatasetState );
var
  i: Integer;
  snome: String;
begin
  If State = dsInsert Then
     CdsTipoCliXHotelXCC.Append
  Else
     CdsTipoCliXHotelXCC.Edit;

  For i := 0 To Cds.Fields.Count - 1 Do Begin
      snome := Cds.Fields[ i ].FieldName;
      CdsTipoCliXHotelXCC.FieldByName( snome ).Value := Cds.FieldByName( snome ).Value;
  End;

  If CdsTipoCliXHotelXCC.FieldByName( 'PLANO'{ivlm} ).IsNull Then
     CdsTipoCliXHotelXCC.FieldByName( 'PLANO'{ivlm} ).AsInteger := CdsParamContab.FieldByName( 'PLANO'{ivlm} ).AsInteger;
     
  CdsTipoCliXHotelXCC.Post;
end;

Procedure TFrmCadTipoClixHotelxCC.Seleciona( IdTipoCliente: Double );
Begin
  cds.Data := TipoClixHotelxCC.ListaTipoClixHotelxCC( IdTipoCliente );
  dbGrd.Enabled := Not cds.IsEmpty;
end;

procedure TFrmCadTipoClixHotelxCC.FormCreate(Sender: TObject);
begin
  inherited;
  TipoClixHotelxCC := TCtrlTipoClixHotelxCC.Create;
  TipoClixHotelxCC.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  TipoClixHotelxCC.Cds := CdsTipoCliXHotelXCC;

  TipoCliente := TCtrlTipoCliente.Create;
  TipoCliente.InitializeAs( TipoClixHotelxCC );

  CmProcContaCre.Mascara := ParamIntegra.MascaraPlano;
  CmProcContaDeb.Mascara := ParamIntegra.MascaraPlano;
  //CmProcContaCre.Plano   := ParamIntegra.Plano;
  //CmProcContaDeb.Plano   := ParamIntegra.Plano;

  iIdTipoCliente := -1;
  CmeCadastro.RepetirInsert := False;
  CdsEmpresa.Data := TipoClixHotelxCC.GetDataPacket( 'SELECT IDPESSOA, NOMEEMPRESA FROM EMPRESAPROP ORDER BY NOMEEMPRESA'{ivlm} );
  CdsParamContab.Data := TipoClixHotelxCC.GetDataPacket( 'SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = -1'{ivlm} );
  Seleciona( iIdTipoCliente );
  CdsTipoCliente.Data := TipoCliente.ListaTipoCliente();
  CdsTipoCliXHotelXCC.Data := Cds.Data;
  CdsTipoCliXHotelXCC.EmptyDataSet;
end;

procedure TFrmCadTipoClixHotelxCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipoCliente.Free;
  TipoClixHotelxCC.Free;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     iIdTipoCliente := StrToFloat( MontaSelect.ValoresChave[ 0 ] );
     Seleciona( iIdTipoCliente );

     Cds.Locate( 'IDTIPOCLIENTE;IDPESSOA'{ivlm}, VarArrayOf( [ StrToFloat( MontaSelect.ValoresChave[ 0 ] ),
                                                               StrToFloat( MontaSelect.ValoresChave[ 1 ] ) ] ), [] );
     CdsTipoCliente.Locate( 'IDTIPOCLIENTE'{ivlm}, StrToFloat( MontaSelect.ValoresChave[ 0 ] ), [] );
     dblcbTipoCliente.Value   := MontaSelect.ValoresChave[ 0 ];
     dblcbTipoCliente.Enabled := True;

     CdsCentCusto.Close;
     SqlCentCusto.Prepare;
     SqlCentCusto.ParamByName( 'idempresa'{ivlm} ).AsFloat := Cds.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat;
     SqlCentCusto.ParamByName( 'plano'{ivlm} ).AsFloat     := Cds.FieldByName( 'PLANO'{ivlm} ).AsFloat;
     SqlCentCusto.ParamByName( 'placonta'{ivlm} ).AsString := Cds.FieldByName( 'PLACONTACRE'{ivlm} ).AsString;
     SqlCentCusto.Open;
  End;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  inherited;
  Seleciona( CdsTipoCliente.FieldByName( 'IDTIPOCLIENTE'{ivlm} ).AsFloat );
  Cds.Locate( 'IDTIPOCLIENTE'{ivlm}, CdsTipoClixHotelxCC.FieldByName( 'IDTIPOCLIENTE'{ivlm} ).AsFloat, [] );
  dblcbTipoCliente.Enabled := True;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Cancel;
  Cds.Append;
  PegaRegTipoCli( DsInsert );
  Cds.FieldByName( 'IDTIPOCLIENTE'{ivlm} ).AsFloat  := CdsTipoCliente.FieldByName( 'IDTIPOCLIENTE'{ivlm} ).AsFloat;
  dblcbTipoCliente.Enabled := False;
  DbLcbEmpresa.Enabled := True;
  DbLcbEmpresa.SetFocus;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  If Trim( DbLcbTipoCliente.Value ) <> '' Then Begin
     Seleciona( iIdTipoCliente );
  End Else Begin
     Seleciona( -1 );
     DbLcbTipoCliente.Clear;
  End;
end;

procedure TFrmCadTipoClixHotelxCC.bbtnConfirmarClick(Sender: TObject);
begin
  If Cds.FieldByName( 'IDPESSOA'{ivlm} ).IsNull Or ( Trim( Cds.FieldByName( 'IDPESSOA'{ivlm} ).AsString ) = '' ) Then Begin
     MsgDlg( 'O campo Empresa deve ser preenchido.', 'Informação', mtInformation, [ mbOK ], 0 );
     DbLcbEmpresa.SetFocus;
     Exit;
  End;

  If Cds.FieldByName( 'PLACONTA'{ivlm} ).IsNull Or ( Trim( Cds.FieldByName( 'PLACONTA'{ivlm} ).AsString ) = '' ) Then Begin
     MsgDlg( 'A Conta de Débito deve ser preenchida.', 'Informação', mtInformation, [ mbOK ], 0 );
     CmProcContaDeb.SetFocus;
     Exit;
  End;

  If Cds.FieldByName( 'PLACONTACRE'{ivlm} ).IsNull Or ( Trim( Cds.FieldByName( 'PLACONTACRE'{ivlm} ).AsString ) = '' ) Then Begin
     MsgDlg( 'A Conta de Crédito deve ser preenchida.', 'Informação', mtInformation, [ mbOK ], 0 );
     CmProcContaCre.SetFocus;
     Exit;
  End;

  If CmeCadastro.Operacao = OpInserir Then 
     If TipoClixHotelxCC.ExisteRelacao( Cds.FieldByName( 'IDTIPOCLIENTE'{ivlm} ).AsFloat,
                                        Cds.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat ) Then Begin
        MsgDlg( 'O relacionamento deste Tipo de Cliente com a Empresa informada já existe.',
                'Informação', mtInformation, [ mbOK ], 0 );
        DbLcbEmpresa.SetFocus;
        Exit;
     End;

  inherited;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( TipoCliXHotelXCC.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
  dblcbTipoCliente.Enabled := True;
  DbGrd.Enabled := ( Not Cds.IsEmpty );
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CopiaRegTipoCli( DsEdit );
  Accept := TipoClixHotelxCC.Gravar;
end;

procedure TFrmCadTipoClixHotelxCC.sbtnInserirClick(Sender: TObject);
begin
  If Trim( dblcbTipoCliente.Value ) <> '' Then Begin
     inherited;
  End Else Begin
     MsgDlg( 'Primeiro selecione um Tipo de Cliente.', 'Aviso', MtInformation, [MbOk], 0 );
     dblcbTipoCliente.SetFocus;
     sbtnInserir.Down := False;
     CmeCadastro.Operacao := OpIdle;
  End;
end;

procedure TFrmCadTipoClixHotelxCC.dblcbTipoClienteCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  iIdTipoCliente := CdsTipoCliente.FieldByName( 'IDTIPOCLIENTE'{ivlm} ).AsFloat;
  Seleciona( iIdTipoCliente );

  If Not Cds.IsEmpty Then Begin
     CmeCadastro.Operacao := OpIdle;
     sbtnAlterar.Enabled  := True;
     sbtnApagar.Enabled   := True;
  End;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroDelete(Sender: TObject);
begin
  PegaRegTipoCli( DsEdit );
  inherited;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao = OpInserir Then
     sbtnAlterar.Enabled := False;

  If CmeCadastro.Operacao = OpIdle Then
     sbtnApagar.Enabled  := Not cds.IsEmpty;
end;

procedure TFrmCadTipoClixHotelxCC.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DbGrd.Enabled := ( Not Cds.IsEmpty );
  dblcbTipoCliente.Enabled := True;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  PegaRegTipoCli( DsEdit );
  dblcbTipoCliente.Enabled := False;
  DbGrd.Enabled := False;
  DbLcbEmpresa.Enabled := False;
  CmProcContaDeb.SetFocus;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.FieldByName( 'PLANO'{ivlm} ).AsFloat := CdsParamContab.FieldByName( 'PLANO' ).AsInteger;
  CopiaRegTipoCli( DsInsert );
  Accept := TipoClixHotelxCC.Gravar;
end;

procedure TFrmCadTipoClixHotelxCC.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsTipoCliXHotelXCC.Delete;
  Accept := TipoClixHotelxCC.Gravar;
end;

procedure TFrmCadTipoClixHotelxCC.DbLcbEmpresaCloseUp(Sender: TObject);
begin
  inherited;
  Cds.FieldByName( 'NOMEEMPRESA'{ivlm} ).AsString := CdsEmpresa.FieldByName( 'NOMEEMPRESA'{ivlm} ).AsString;
  CdsParamContab.Data := TipoClixHotelxCC.GetDataPacket( 'SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = '{ivlm} +
                         FloatToStr( CdsEmpresa.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat ) );
  Cds.FieldByName( 'PLANO'{ivlm} ).AsInteger := CdsParamContab.FieldByName( 'PLANO'{ivlm} ).AsInteger;
  CmProcContaCre.Plano := CdsParamContab.FieldByName( 'PLANO'{ivlm} ).AsInteger;
  CmProcContaDeb.Plano := CdsParamContab.FieldByName( 'PLANO'{ivlm} ).AsInteger;
end;

procedure TFrmCadTipoClixHotelxCC.CmProcContaDebExit(Sender: TObject);
begin
  inherited;
  Cds.FieldByName( 'PLANOME'{ivlm} ).AsString := CmProcContaDeb.Conta.Nome;
end;

procedure TFrmCadTipoClixHotelxCC.CmProcContaCreExit(Sender: TObject);
begin
  inherited;
  Cds.FieldByName( 'PLANOMECRE'{ivlm} ).AsString := CmProcContaCre.Conta.Nome;
end;

procedure TFrmCadTipoClixHotelxCC.DbLcbCentroCustoExit(Sender: TObject);
begin
  inherited;
  If Trim( DbLcbCentroCusto.Value ) <> '' Then Begin
     Cds.FieldByName( 'IDEMPRESA'{ivlm} ).AsFloat   := Cds.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat;
     Cds.FieldByName( 'NOMECCUSTO'{ivlm} ).AsString := CdsCentCusto.FieldByName( 'NOME'{ivlm} ).AsString;
  End Else Begin
     Cds.FieldByName( 'IDEMPRESA'{ivlm} ).Clear;
     Cds.FieldByName( 'NOMECCUSTO'{ivlm} ).Clear;
  End;
end;

procedure TFrmCadTipoClixHotelxCC.CmProcContaCreChange(Sender: TObject);
begin
  inherited;
  If Cds.Active Then Begin
     If Cds.FieldByName( 'PLACONTACRE'{ivlm} ).IsNull Then Begin
        DbLcbCentroCusto.Clear;
        CdsCentCusto.Close;
        Cds.FieldByName( 'IDEMPRESA'{ivlm} ).Clear;
        Cds.FieldByName( 'NOMECCUSTO'{ivlm} ).Clear;
     End Else
        If CmProcContaCre.Conta.Numero <> Cds.FieldByName( 'PLACONTACRE'{ivlm} ).AsString Then Begin
           SqlCentCusto.Prepare;
           SqlCentCusto.ParamByName( 'idempresa'{ivlm} ).AsFloat := Cds.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat;
           SqlCentCusto.ParamByName( 'plano'{ivlm} ).AsFloat     := Cds.FieldByName( 'PLANO'{ivlm} ).AsFloat;
           SqlCentCusto.ParamByName( 'placonta'{ivlm} ).AsString := Cds.FieldByName( 'PLACONTACRE'{ivlm} ).AsString;
           SqlCentCusto.Open;
        End;
  End;
end;

procedure TFrmCadTipoClixHotelxCC.DbLcbCentroCustoEnter(Sender: TObject);
begin
  inherited;
  SqlCentCusto.Prepare;
  SqlCentCusto.ParamByName( 'idempresa'{ivlm} ).AsFloat := Cds.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat;
  SqlCentCusto.ParamByName( 'plano'{ivlm} ).AsFloat     := Cds.FieldByName( 'PLANO'{ivlm} ).AsFloat;
  SqlCentCusto.ParamByName( 'placonta'{ivlm} ).AsString := Cds.FieldByName( 'PLACONTACRE'{ivlm} ).AsString;
  SqlCentCusto.Open;
end;

procedure TFrmCadTipoClixHotelxCC.FormShow(Sender: TObject);
begin
  inherited;
  dblcbTipoCliente.Enabled := sbtnInserir.Enabled Or sbtnAlterar.Enabled Or sbtnApagar.Enabled;
end;

end.

