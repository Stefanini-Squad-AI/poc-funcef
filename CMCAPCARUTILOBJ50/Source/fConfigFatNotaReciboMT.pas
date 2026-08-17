unit fConfigFatNotaReciboMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, StdCtrls, ExtCtrls, DBCtrls, ppDB, ppDBPipe, ppDBBDE,
  ppCache, ppClass, ppBands, ppRelatv, ppProd, ppReport, ppComm, ppEndUsr,
  Menus, uCmSqlParams, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, Buttons, Mask, wwdbedit, wwdblook,
  CMDBLookupCombo, uCtrlParamIntegra, Grids, Wwdbigrd, Wwdbgrid, uCtrlConfigFatNotaRecibo,
  wwdbdatetimepicker, CMDateTimePicker, CMProcuraSubTipo, ppPrnabl, ppCtrls,
  ppVar, ppModule, raCodMod;

type
  TFrmConfigFatNotaReciboMT = class(TFrmConfigRelatorioMT)
    RgTipoFatura: TDBRadioGroup;
    Label3: TLabel;
    EdtCodReduz: TwwDBEdit;
    Label5: TLabel;
    dblkAlterador: TwwDBLookupCombo;
    sqlAlt: TCMSqlParams;
    cdsAlt: TCMClientDataSet;
    CPForCli: TCMProcuraForCli;
    GpDataLancto: TGroupBox;
    DtFim: TCMDateTimePicker;
    DtIni: TCMDateTimePicker;
    PnlTitGrid: TPanel;
    GrdDocs: TwwDBGrid;
    sqlDocs: TCMSqlParams;
    cdsDocs: TCMClientDataSet;
    BtnSelDoc: TBitBtn;
    CkbListaImp: TCheckBox;
    dsDocs: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DeRelatorioEnter(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure BtnSelDocClick(Sender: TObject);
    procedure GrdDocsCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BtnImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CdsReportsAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    _ConfigFatNotaRecibo : TCtrlConfigFatNotaRecibo;

  protected
    Procedure SelModelo; Override;
    function  TestaImpressao: Boolean; Override;
    Procedure SelDados; Override;

    procedure InsereCdsPrincipal; Override;
    procedure AbreCdsPrincipal(iId: Integer); Override;
  public
    { Public declarations }
    procedure HabilitaImpressao(bImprime:Boolean); Override;
  end;

var
  FrmConfigFatNotaReciboMT: TFrmConfigFatNotaReciboMT;

implementation

uses uFuncaoGeral, uModulo, uSistema, uCtrlPadroes, uCMTypes;

{$R *.DFM}

procedure TFrmConfigFatNotaReciboMT.FormCreate(Sender: TObject);
begin
  inherited;
  _ConfigFatNotaRecibo := TCtrlConfigFatNotaRecibo.Create;
  _ConfigFatNotaRecibo.InitializeAs(Padroes);
  _ConfigFatNotaRecibo.OnMessageInfo := Mensagem;
  MontaSelect.Filtro.Clear;

  If ParamIntegra.RecPag = 'P' Then begin
    Self.Caption     :=  'Configuração de Faturas e  Notas de Débito';
    CPForCli.Hint    := 'Pesquisa Fornecedor';
    CPForCli.Caption := ' Fornecedor ';
    CPForCli.ForCli  := fcFornecedor;
  End Else Begin
    Self.Caption     :=  'Configuração de Faturas e  Notas de Crédito';
    CPForCli.Hint    := 'Pesquisa Cliente';
    CPForCli.Caption := ' Cliente ';
    CPForCli.ForCli  := FcCliente;
  End;
  CPForCli.Mensagens.EmBranco := CPForCli.Caption + CPForCli.Mensagens.EmBranco;
  CPForCli.Mensagens.NaoExiste:= CPForCli.Caption + CPForCli.Mensagens.NaoExiste;

  sqlAlt.Prepare;
  sqlAlt.ParamByname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  sqlAlt.ParamByname('RECPAG').AsString  := ParamIntegra.RecPag;
  sqlAlt.Open;

  sqlDocs.Open;
end;

procedure TFrmConfigFatNotaReciboMT.DeRelatorioEnter(Sender: TObject);
var
  sDescricao :String;
begin
  inherited;
  if ds.State in [dsInsert] Then
  begin
     sDescricao := RgTipoFatura.Items[RgTipoFatura.ItemIndex];
     Delete(sDescricao,1,1);
     cds.FieldByName('DESCTIPOFATURA').AsString :=  sDescricao + ' Tipo ' + EdtCodReduz.Text;
  end;
end;

procedure TFrmConfigFatNotaReciboMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if RgTipoFatura.CanFocus then RgTipoFatura.SetFocus;
  cds.FieldByName('FLGTIPOFATURA').AsString := 'F';
end;

procedure TFrmConfigFatNotaReciboMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  RgTipoFatura.Enabled := False;
end;

function TFrmConfigFatNotaReciboMT.TestaImpressao: Boolean;
begin
  Result := (Trim(CmbModelo.Text) <> '') And (Not cdsDocs.IsEmpty);
end;

procedure TFrmConfigFatNotaReciboMT.BtnSelDocClick(Sender: TObject);
Begin
  if cdsModelo.FieldByName('FLGTIPOFATURA').AsString <> '' then
  begin
    with sqlDocs.SQL do
    begin
      Clear;
      Append('SELECT ');
      Append('  (''N'') AS EMITE, ');
      Append('  D.NODOCUMENTO, D.COMPLDOCUMENTO,');
      Append('  L.VALOR, L.DATALANCTO, L.NUMFATURA, L.FLGTIPOFATURA, L.FLGFATEMITIDA,');
      Append('  P.RAZAOSOCIAL, L.HISTORICOCOMPL, L.OPERACAO,');
      Append('  E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP, C.NOME AS NOMECIDADE,');
      Append('  ES.NOMEESTADO, PA.NOMEPAIS, L.NUMLANCTO, D.CODDOCUMENTO');
      Append('FROM');
      Append('  DOCUMENTO D, LANCTODOCUM L, PESSOA P, CLASFISCLIFOR C,');
      Append(   FuncaoGeral.Decode(ParamIntegra.RecPag,'P',' FORNSERV S, ',' CLIENTEPESS S,'));
      Append('  ENDPESS E, CIDADES C, ESTADO ES, PAIS PA, TIPOFATXCLASFIS TF ');
      Append('WHERE');
      Append(' d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE');
      Append(' a.RECPAG = ' + QuotedStr(ParamIntegra.RecPag) + ' and not exists  ');
      Append(' (select 1 from UsuarioxTpdocto b where recpag = '+ QuotedStr(ParamIntegra.RecPag));
      Append(' and b.idusuario='+inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM');
      Append(' TIPODOCRECPAG a WHERE a.RECPAG = '+ QuotedStr(ParamIntegra.RecPag));
      Append(' and exists (select 1 from UsuarioxTpdocto b where recpag = '+ QuotedStr(ParamIntegra.recpag));
      Append(' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+')) and ');
      Append('   (TF.IDTIPOFATURA = ' + IntToStr(cdsModelo.FieldByName('IDTIPOFATURA').AsInteger) + ') AND ');
      Append('   (D.RECPAG = ''' + ParamIntegra.RecPag + ''') AND ');
      Append('   (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ');
// -----------------------------------------------------------------------------
      if cdsModelo.FieldByName('FLGTIPOFATURA').AsString = 'N' then
      begin
        { Nota de Crédito: Impresso para lançamentos de débito }
        Append(' (L.DEBCRE = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag,'R','C','D') + ''') AND ');
        Append(' (D.OPERACAO     = L.OPERACAO) ');
      end;
      if cdsModelo.FieldByName('FLGTIPOFATURA').AsString = 'F' then
      begin
        { Fatura: Impresso para lançamentos de crédito }
        Append(' (L.DEBCRE = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag,'R','D','C') + ''') AND ');
        Append(' (D.OPERACAO     = L.OPERACAO) ');
      end;
      if cdsModelo.FieldByName('FLGTIPOFATURA').AsString = 'R' then
       { Recibo: Impresso para lançamentos de baixa }
        Append(' ((L.OPERACAO = 5) OR (L.OPERACAO = 15)) ');
// -----------------------------------------------------------------------------

      if (CPForCli.Text <> '') then
        Append(' AND (S.IDPESSOA = ' + IntToStr(CPForCli.ForCliReg.Id) + ') ');

      if (DtIni.Text <> '') and (DtFim.Text <> '') then
        Append(' AND (L.DATALANCTO BETWEEN TO_DATE(''' + DtIni.Text + ''',''DD/MM/YYYY'') AND TO_DATE(''' + DtFim.Text + ''',''DD/MM/YYYY'')) ');

      if not CkbListaImp.Checked then
        Append(' AND (L.FLGFATEMITIDA IS NULL)');

      Append(' AND (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ');
      Append(' (D.IDFORCLI         = P.IDPESSOA) AND ');
      Append(' (S.IDPESSOA         = P.IDPESSOA) AND ');
      Append(' (C.IDCLASFISCLIFOR  = S.IDCLASFISCLIFOR) AND ');
      Append(' (C.IDCLASFISCLIFOR  = TF.IDCLASFISCLIFOR) AND ');
      Append(' (P.IDENDCOMERCIAL   = E.IDENDERECO(+)) AND ');
      Append(' (E.IDCIDADES        = C.IDCIDADES(+)) AND ');
      Append(' (C.CODESTADO        = ES.CODESTADO(+)) AND ');
      Append(' (ES.IDPAIS          = PA.IDPAIS(+)) ');
    end;
    sqlDocs.Open;
  end;
end;

procedure TFrmConfigFatNotaReciboMT.GrdDocsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName = 'EMITE') then
    ABrush.Color := $00BFFFFF;
end;

procedure TFrmConfigFatNotaReciboMT.BtnImprimeClick(Sender: TObject);
begin
  try
    cdsDocs.First;
    while not cdsDocs.Eof do
    begin
      if (cdsDocs.FieldByName('EMITE').AsString = 'S') and
         (Modulo.GravaNumFatura(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger,
                                cdsDocs.FieldByName('NUMLANCTO').AsInteger,
                                cdsDocs.FieldByName('NUMFATURA').AsString, 'F', '')) then
        inherited;
      cdsDocs.Next;
    end;
  finally
    BtnSelDoc.Click;
  end;
end;

procedure TFrmConfigFatNotaReciboMT.SelDados;
begin
  sqlDados.Prepare;
  sqlDados.ParamByName('CODDOCUMENTO').AsFloat := cdsDocs.FieldByName('CODDOCUMENTO').AsFloat;
  if cdsModelo.IsEmpty then
    sqlDados.ParamByName('CODALTERADOR').AsFloat    := 0
  else
    sqlDados.ParamByName('CODALTERADOR').AsFloat    := cdsModelo.FieldByName('CODALTERADOR').AsFloat;
  sqlDados.Open;
end;

procedure TFrmConfigFatNotaReciboMT.InsereCdsPrincipal;
begin
  Cds.FieldByName('IDTIPOFATURA').AsFloat    := -1;
  Cds.FieldByName('IDREPORTS').AsInteger     := -1;
  Cds.FieldByName('ORIGEMCM').AsInteger      := 0;
end;

procedure TFrmConfigFatNotaReciboMT.AbreCdsPrincipal(iId: Integer);
begin
  Sql.Prepare;
  Sql.ParamByname('IDTIPOFATURA').AsFloat := iId;
  Sql.Open;
end;

procedure TFrmConfigFatNotaReciboMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _ConfigFatNotaRecibo.Free;
end;

procedure TFrmConfigFatNotaReciboMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ConfigFatNotaRecibo.ProcessaConfig(Cds.Data, CdsReports.Data, OpInserir);
end;

procedure TFrmConfigFatNotaReciboMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ConfigFatNotaRecibo.ProcessaConfig(Cds.Data, CdsReports.Data, OpAlterar);
end;

procedure TFrmConfigFatNotaReciboMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ConfigFatNotaRecibo.ProcessaConfig(Cds.Data, CdsReports.Data, OpApagar);
end;

procedure TFrmConfigFatNotaReciboMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  RgTipoFatura.Enabled := True;
end;

procedure TFrmConfigFatNotaReciboMT.SelModelo;
begin
  sqlModelo.Open;
end;

procedure TFrmConfigFatNotaReciboMT.HabilitaImpressao(bImprime: Boolean);
begin
  inherited;
  If bImprime Then
  Begin
     Width  := 743;
     Height := 370;
     Top  := Round((Screen.Height - Height - 100)/2);
     Left := Round((Screen.Width - Width)/2);
  End
  Else
  Begin
     Width  := 474;
     Height := 297;
  End;
end;
procedure TFrmConfigFatNotaReciboMT.CdsReportsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if CdsReports.IsEmpty then Cds.Edit;
end;

procedure TFrmConfigFatNotaReciboMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if CdsReports.IsEmpty And (Cds.State in [DsEdit, DsInsert]) then Cds.Post;
end;

end.
