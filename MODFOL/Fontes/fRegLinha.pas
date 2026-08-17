unit fRegLinha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmRegLinha = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    dblcLinhaTransp: TwwDBLookupCombo;
    Label5: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    qryDet: TwwQuery;
    qryDetIDPESSOA: TFloatField;
    qryDetIDLINHATRANSP: TFloatField;
    qryDetQTDDIARIA: TFloatField;
    qryDetTIPOLINHATRANSP: TStringField;
    qryDetDESCRICAO: TStringField;
    qryDetNUMLINHATRANSP: TStringField;
    qryDetVLRLINHATRANSP: TFloatField;
    updDet: TUpdateSQL;
    qryLinhaTransp: TwwQuery;
    dbtxtSituacao: TDBText;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    qryRadInst: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblcLinhaTranspCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmRegLinha: TfrmRegLinha;
  iIdTipoProcesso: LongInt;

implementation

uses uMensErro, uDataBase, DBaseDados, uRAD, UsoGeralRH, uSistema;

{$R *.DFM}

procedure TfrmRegLinha.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  if sUsoGeralIdPessoa <> '' then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = ' + sUsoGeralIdPessoa);

  with (MontaSelect.Filtro) do
  begin
    Add ('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add ('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add ('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qry.Prepare;
  qry.Close;
  qry.ParamByName('IDPESSOA').asInteger := -1;
  qry.Open;

  qryDet.Prepare;
  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger := -1;
  qryDet.Open;

  qryLinhaTransp.Open;

  iIdTipoProcesso := -1;
  If Sistema.UsaRAD Then
  Begin
     Rad := TRad.Create;
     If Fazquery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO WHERE (IDREFERENCIA = 23)') Then
        iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
  End;

  sbtnProcurarClick(Sender);
end;

procedure TfrmRegLinha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;  
  qryLinhaTransp.Close;
  inherited;
end;

procedure TfrmRegLinha.dblcLinhaTranspCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryDet.FieldByName('TIPOLINHATRANSP').asString := qryLinhaTransp.FieldByName('TIPOLINHATRANSP').asString;
  qryDet.FieldByName('DESCRICAO').asString       := qryLinhaTransp.FieldByName('DESCRICAO').asString;
  qryDet.FieldByName('NUMLINHATRANSP').asString  := qryLinhaTransp.FieldByName('NUMLINHATRANSP').asString;
  qryDet.FieldByName('VLRLINHATRANSP').asString  := qryLinhaTransp.FieldByName('VLRLINHATRANSP').asString;
end;

procedure TfrmRegLinha.sbtnAlterarClick(Sender: TObject);
begin
  if (qry.FieldbyName('TIPOSIT').Value <> 'A') then
  begin
    MsgDlg('Situação Funcional não permite esta operação','Aviso', mtInformation,[mbOk,mbHelp],0);
    sbtnAlterar.Down := false;
    exit;
  end;
  inherited;
end;

procedure TfrmRegLinha.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmRegLinha.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
    qry.Close;
    qry.ParamByName('IDPESSOA').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    if (qry.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (qry.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (qry.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;

    qryDet.Close;
    qryDet.ParamByName('IDPESSOA').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;
  end;
end;

procedure TfrmRegLinha.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcLinhaTransp.Text) = '') then
  begin
    MsgDlg('Selecione uma Linha de Transporte !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblcLinhaTransp.SetFocus;
    exit;
  end;
  inherited;
end;

procedure TfrmRegLinha.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDPESSOA').asInteger      := qry.FieldByName('IDPESSOA').asInteger;
  qryDet.FieldByName('QTDDIARIA').asInteger     := 1;
  qryDet.FieldByName('IDLINHATRANSP').asInteger := 0;
end;

procedure TfrmRegLinha.CmeCadastroConfirma(Sender: TObject);
var
  iIdProcesso: Integer;
  sSql: String;
begin
  If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) then
  begin
     qryRadInst.Close;
     qryRadInst.ParamByName('IDPESSRESP').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
     qryRadInst.Open;
     if not qryRadInst.Eof Then
     Begin
        sSQL :=  'UPDATE RADINSTPROCESSO SET FLGOK = ''S''' +
                 ' WHERE IDPROCESSO = ' + qryRadInst.FieldByName('IDPROCESSO').AsString;
        DtmBaseDados.qry.Close;
        DtmBaseDados.qry.SQL.Clear;
        DtmBaseDados.qry.SQL.Add(sSQL);
        try
          if sSQL <> ''
          then DtmBaseDados.qry.ExecSQL;
        except
              MsgDlg('Erro ao tentar atualizar o processo no R.A.D.','Erro',mtError,[mbOK],0);
              Abort;
        end;//try

     End;

     Rad.TipoProcesso    := iIdTipoProcesso;
     Rad.IdPessoa        := Sistema.IdEmpresa;
     Rad.IdPessResp      := qry.FieldByName('IDPESSOA').AsInteger;
     //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
     //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
     Rad.OBS             := 'Vale Transporte : ' + dbedNome.Text;
     //Rad.Valor           := EdValorTotal.Value;
     //Rad.CodGrupoProd    := sGrupoProd;
     //
     with (DtmBaseDados.qry) do
     begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT IDEMPRESA, CODCENTROCUSTO FROM FUNCIONARIO WHERE IDPESSOA = '+
                 qry.FieldByName('IDPESSOA').asString);
        Open;
        if not IsEmpty then
        begin
           Rad.IdEmpresa       := FieldByName('IDEMPRESA').AsInteger;
           Rad.CodCentroCusto  := FieldByName('CODCENTROCUSTO').AsString;
        end;
        Close;
     end;
     iIdProcesso :=  Rad.IniciarProcesso;
     if iIdProcesso < 0 Then
     Begin
        MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
        Abort;
     End;

     qryRadInst.Close;

  end;


  inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

end.
