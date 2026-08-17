{===============================================================================
Responsável : Thiago Melo
SOL / KIN   : 143297 / 928391
Descrição   : Inclusão de Grupo Mestre nos relatórios e gráficos
===============================================================================}

unit FCadGrupoRelatorioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlGrupoRelatorio, Wwquery
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TFrmCadGrupoRelatorio = class(TFrmCadastroMT)
    DbEdGrupo: TwwDBEdit;
    Label1: TLabel;
    sbtnGrupoMestre: TSpeedButton;
    lblGrupoMestre: TLabel;
    edtGrpMestre: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnGrupoMestreClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    FIdGrpMestre: Double;
    FOrigemGr: SmallInt;
    procedure SetIdGrpMestre(const Value: Double);
    procedure SetOrigemGr(const Value: SmallInt);
    { Private declarations }
  public
    { Public declarations }
    GrupoRelatorio: TCtrlGrupoRelatorio;
    // Thiago Melo SOL 143297 Kintana 928391
    property IdGrpMestre : Double read FIdGrpMestre write SetIdGrpMestre;
    property OrigemGr : SmallInt read FOrigemGr write SetOrigemGr;

    procedure Seleciona( IdGrupoRelatorio: Double = 0; OrigemCmGr: Double = -1; idGrupoMestre: Double = -1 );
    Function RetornaDescricaoGrupoRelatorio (idGrupoRelatorio, Origem, IdGrupoMestre : Double) : String;
    Function VerificaEGrupoMestre (idGrupoRelatorio, Origem : Double) : Boolean;
    Function VerificaDuplicidadeRegistro (Descricao : String; Origem : Double) : Boolean;
    Function VerificaVinculoReports (idGrupoRelatorio, Origem : Double) : Boolean;
    // Thiago Melo SOL 143297 Kintana 928391
  end;

var
  FrmCadGrupoRelatorio: TFrmCadGrupoRelatorio;

implementation

Uses uMensErro, dBasedados, uSistema, uMidasUtil, FCadSubGrpRelatoriosMT,
  FTelaAut;

{$R *.DFM}

procedure TFrmCadGrupoRelatorio.Seleciona( IdGrupoRelatorio: Double = 0; OrigemCmGr: Double = -1; idGrupoMestre: Double = -1 );
begin
  cds.Data := GrupoRelatorio.ListaGrupoRelatorio( IdGrupoRelatorio, OrigemCmGr, idGrupoMestre);
  // Thiago Melo SOL 143297 Kintana 928391
  edtGrpMestre.Text := RetornaDescricaoGrupoRelatorio(IdGrupoRelatorio, OrigemCmGr, idGrupoMestre);
end;

procedure TFrmCadGrupoRelatorio.FormCreate(Sender: TObject);
begin
  inherited;
  GrupoRelatorio := TCtrlGrupoRelatorio.Create();
  GrupoRelatorio.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  GrupoRelatorio.Cds := Cds;
// Thiago Melo SOL 143297 Kintana 928391  
  Seleciona( -1, -2, -1 );
end;

procedure TFrmCadGrupoRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GrupoRelatorio.Free;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ),
                StrToFloat( MontaSelect.ValoresChave[ 1 ] ),
                // Thiago Melo SOL 143297 Kintana 928391
                StrToFloat( MontaSelect.ValoresChave[ 2 ] ) );
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Thiago Melo SOL 143297 Kintana 928391      
  if (FIdGrpMestre > 0) and (not Cds.FieldByName( 'DESCRICAO' ).IsNull) then begin
    Cds.FieldByName('idgrupomestre').AsFloat := FIdGrpMestre;
  end;

  if VerificaDuplicidadeRegistro(Trim(Cds.FieldByName('descricao').AsString), FOrigemGr) then begin
     MsgDlg('Grupo de relatório já cadastrado', 'Atenção', MtInformation, [MbOk], 0);
     DbEdGrupo.SetFocus;
     Exit;
  end;

  Cds.FieldByName('origemcmgr').AsFloat := FOrigemGr;
  Accept := GrupoRelatorio.Gravar;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if VerificaEGrupoMestre(StrToFloat( MontaSelect.ValoresChave[ 0 ] ), StrToFloat( MontaSelect.ValoresChave[ 1 ] )) then begin
    MsgDlg( 'Existe(m) outro(s) grupo(s) vinculado(s) a este registro', 'Erro', mtError, [ mbOK ], 0 );
    Exit;
  end;

  if VerificaVinculoReports(StrToFloat( MontaSelect.ValoresChave[ 0 ] ), StrToFloat( MontaSelect.ValoresChave[ 1 ] )) then begin
    MsgDlg( 'Existe(m) Relatório(s) vinculado(s) a este grupo', 'Erro', mtError, [ mbOK ], 0 );
    Exit;
  end;

  // Thiago Melo SOL 143297 Kintana 928391
  if (FIdGrpMestre > 0) and (not Cds.FieldByName( 'DESCRICAO' ).IsNull) then begin
    Cds.FieldByName('idgrupomestre').AsFloat := FIdGrpMestre;
  end;
  Cds.FieldByName('origemcmgr').AsFloat := FOrigemGr;
  Accept := GrupoRelatorio.Gravar;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Thiago Melo SOL 143297 Kintana 928391
  if VerificaEGrupoMestre(StrToFloat( MontaSelect.ValoresChave[ 0 ] ), StrToFloat( MontaSelect.ValoresChave[ 1 ] )) then begin
    MsgDlg( 'Existe(m) outro(s) grupo(s) vinculado(s) a este registro', 'Erro', mtError, [ mbOK ], 0 );
    Exit;
  end;

  if VerificaVinculoReports(StrToFloat( MontaSelect.ValoresChave[ 0 ] ), StrToFloat( MontaSelect.ValoresChave[ 1 ] )) then begin
    MsgDlg( 'Existe(m) Relatório(s) vinculado(s) a este grupo', 'Erro', mtError, [ mbOK ], 0 );
    Exit;
  end;
  //

  Accept := GrupoRelatorio.Gravar;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedGrupo.SetFocus;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedGrupo.SetFocus;
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  // Thiago Melo SOL 143297 Kintana 928391
  if Pos(Trim(GrupoRelatorio.MessageInfo), 'O Campo Descrição não foi informado') > 0 then begin
    GrupoRelatorio.MessageInfo := 'É necessário preencher o campo Descrição, para vincular a um Grupo Mestre';
    MsgDlg( GrupoRelatorio.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
  end
  else begin
    MsgDlg( GrupoRelatorio.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
  end;
  // Tratando mensagem padrão de componente da CM
  // Thiago Melo SOL 143297 Kintana 928391
end;

procedure TFrmCadGrupoRelatorio.CmeCadastroConfirma(Sender: TObject);
begin
  if CmeCadastro.Operacao <> OpApagar then begin
    if Cds.FieldByName( 'DESCRICAO' ).IsNull Then Begin
      MsgDlg('Indicar a Descrição do Grupo de Relatórios', 'Atenção', MtInformation, [MbOk], 0);
      DbEdGrupo.SetFocus;
      Exit;
    end;
  end;

  inherited;
end;

procedure TFrmCadGrupoRelatorio.sbtnGrupoMestreClick(Sender: TObject);
begin
// Thiago Melo SOL 143297 Kintana 928391
  inherited;
  AbrirFormModal( frmCadSubGrpRelatorios, TfrmCadSubGrpRelatorios );

  if frmCadSubGrpRelatorios.Result = MB_OK then begin
    edtGrpMestre.Text := frmCadSubGrpRelatorios.DescricaoGrupoMestre;
    FIdGrpMestre      := frmCadSubGrpRelatorios.IdGrupoRelatorio;
    FOrigemGr         := frmCadSubGrpRelatorios.Origem;
  end
  else begin
    edtGrpMestre.Text := '';
    FIdGrpMestre      := 0;
    FOrigemGr         := 0;
  end;
end;

procedure TFrmCadGrupoRelatorio.SetIdGrpMestre(const Value: Double);
begin
  FIdGrpMestre := Value;
end;

procedure TFrmCadGrupoRelatorio.bbtnConfirmarClick(Sender: TObject);
begin
  //  Thiago Melo
  if (Trim(DbEdGrupo.Text) = '') AND (Trim(edtGrpMestre.Text) = '') then begin
    MsgDlg('O campo Descrição é de preenchimento obrigatório', 'Atenção', MtInformation, [MbOk], 0);
    Exit;
  end;
  //

  inherited;
  edtGrpMestre.Clear;
  FIdGrpMestre      := 0;
  FOrigemGr         := 0;
end;

function TFrmCadGrupoRelatorio.RetornaDescricaoGrupoRelatorio(
  idGrupoRelatorio, Origem, IdGrupoMestre: Double): String;
var
  qryDescrGrupoRelatorio : TwwQuery;
begin
  qryDescrGrupoRelatorio := TwwQuery.Create(Self);
  qryDescrGrupoRelatorio.DataBaseName := 'BaseDados';

  try
    with qryDescrGrupoRelatorio do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT X.IDGRUPORELATORIO,');
      Sql.Add(' X.ORIGEMCMGR,');
      Sql.Add(' X.DESCRICAO,');
      Sql.Add(' X.IDGRUPOMESTRE,');
      Sql.Add(' y.descricao as descricaogruporelatorio');
      Sql.Add('  FROM (SELECT DESCRICAO FROM GRUPORELATORIO WHERE IDGRUPORELATORIO = ' + FloatToStr(idGrupoMestre) + ') y,');
      Sql.Add(' gruporelatorio x');
      Sql.Add(' WHERE X.IDGRUPORELATORIO = ' + FloatToStr(idGrupoRelatorio));
      Sql.Add('   AND X.ORIGEMCMGR = ' + FloatToStr(Origem));
      Open;
    end;

    Result := qryDescrGrupoRelatorio.FieldByName('descricaogruporelatorio').AsString;
  finally
    qryDescrGrupoRelatorio.Close;
    FreeAndNil(qryDescrGrupoRelatorio);
  end;

end;

procedure TFrmCadGrupoRelatorio.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  edtGrpMestre.Clear;
end;

function TFrmCadGrupoRelatorio.VerificaEGrupoMestre(idGrupoRelatorio,
  Origem : Double): Boolean;
var
  qryGrupoMestre : TwwQuery;
begin
  qryGrupoMestre := TwwQuery.Create(Self);
  qryGrupoMestre.DataBaseName := 'BaseDados';

  try
    with qryGrupoMestre do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT IDGRUPORELATORIO');
      Sql.Add('  FROM GRUPORELATORIO');
      Sql.Add(' WHERE IDGRUPOMESTRE = ' + FloatToStr(idGrupoRelatorio));
      Sql.Add('   AND ORIGEMCMGR = ' + FloatToStr(Origem));
      Open;
    end;

    Result := (not qryGrupoMestre.IsEmpty);
  finally
    qryGrupoMestre.Close;
    FreeAndNil(qryGrupoMestre);
  end;

end;

function TFrmCadGrupoRelatorio.VerificaDuplicidadeRegistro(
  Descricao : String; Origem: Double): Boolean;
var
  qryVerDuplicidade : TwwQuery;
begin
  qryVerDuplicidade := TwwQuery.Create(Self);
  qryVerDuplicidade.DataBaseName := 'BaseDados';

  try
    qryVerDuplicidade.Close;
    qryVerDuplicidade.Sql.Clear;
    qryVerDuplicidade.Sql.Add('SELECT idgruporelatorio');
    qryVerDuplicidade.Sql.Add('  FROM GRUPORELATORIO');
    qryVerDuplicidade.Sql.Add(' WHERE descricao  = ' + Trim(QuotedStr(Descricao)));
    qryVerDuplicidade.Sql.Add('   AND origemcmgr = ' + FloatToStr(Origem));
    qryVerDuplicidade.Open;

    Result := (not qryVerDuplicidade.IsEmpty);
  finally
    qryVerDuplicidade.Close;
    FreeAndNil(qryVerDuplicidade);
  end;
end;

procedure TFrmCadGrupoRelatorio.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtGrpMestre.Clear;
end;

function TFrmCadGrupoRelatorio.VerificaVinculoReports(idGrupoRelatorio,
  Origem: Double): Boolean;
var
  qryReports : TwwQuery;
begin
  qryReports := TwwQuery.Create(Self);
  qryReports.DataBaseName := 'BaseDados';

  try
    qryReports.Close;
    qryReports.Sql.Clear;
    qryReports.Sql.Add('SELECT idreports, origemcmgr, idgruporelatorio');
    qryReports.Sql.Add('  FROM reports');
    qryReports.Sql.Add(' WHERE idgruporelatorio = ' + FloatToStr(idGrupoRelatorio));
    qryReports.Sql.Add('   AND origemcmgr       = ' + FloatToStr(Origem));
    qryReports.Open;

    Result := (not qryReports.IsEmpty);
  finally
    qryReports.Close;
    FreeAndNil(qryReports);
  end;
end;

procedure TFrmCadGrupoRelatorio.SetOrigemGr(const Value: SmallInt);
begin
  FOrigemGr := Value;
end;

procedure TFrmCadGrupoRelatorio.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  edtGrpMestre.Clear;
end;

end.
