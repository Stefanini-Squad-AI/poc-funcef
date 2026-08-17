unit FCadFaixasPercentuais;

//------------------------------------------------------------------------------
// Alteracao  : (dfm upDet)
// Autor(a)   : Edilaine
// Data       : 01/04/2026
// WO         : 35547
// Descricao  : ajuste na Inclusão dos novos campos de % para abono
//------------------------------------------------------------------------------
// Autor(a)   : Leandro Pocebon
// Data       : 23/07/2025
// WO         : 22429
// Descricao  : Inclusão % para abono
//------------------------------------------------------------------------------
// Autor(a)   : Edilaine Ferraresi
// Data       : 29/12/2016
// SIG        : 36752
// Descricao  : Equacionamento - inclusao do cadastro de Faixas e Percentuais
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, wwdblook, StdCtrls, Mask, wwdbedit, Db, DBTables,
  Wwquery, CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker, uCMTypes,
  Provider, DBClient, uCMClientDataSet, uCmControlObject, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppVar,
  ppPrnabl, ppBands, ppCache, fPreview, UFuncoesUteis, uCmSqlParams;

type
  TTipoValidaDuplicidade = (vdValidaPerc, vdValidaDados);
  TFrmCadFaixasPercentuais = class(TfrmCadMestreDetalheCS)
    lblDescricao: TLabel;
    dbedtDescricao: TwwDBEdit;
    llbPatro: TLabel;
    dblcPatro: TwwDBLookupCombo;
    lblPlano: TLabel;
    dblcPlano: TwwDBLookupCombo;
    lblPlanoContab: TLabel;
    dblcPlanoContab: TwwDBLookupCombo;
    qryContab: TwwQuery;
    qryPlano: TwwQuery;
    qryPatro: TwwQuery;
    qryDet: TwwQuery;
    lblIniVigencia: TLabel;
    dbedDataInicio: TCMDateTimePicker;
    lblFaixa: TLabel;
    dbedPartAtivo: TwwDBEdit;
    lblPercPartAt: TLabel;
    dbedPatroAtivo: TwwDBEdit;
    lblPercPatroAt: TLabel;
    dbedPartAssist: TwwDBEdit;
    dbedPatroAssist: TwwDBEdit;
    lblPercPartAss: TLabel;
    lblPercPatroAss: TLabel;
    lblTipoContrib: TLabel;
    dblcTpContrib: TwwDBLookupCombo;
    qryTpContrib: TwwQuery;
    qryFaixa: TwwQuery;
    cbFaixa: TComboBox;
    bbtnHistorico: TBitBtn;
    qryAux: TwwQuery;
    updDet: TUpdateSQL;
    qryDuplicado: TwwQuery;
    updDup: TUpdateSQL;
    cdsDet: TCMClientDataSet;
    dsCdsDet: TDataSource;
    ppHstFaixa: TppBDEPipeline;
    rpHstFaixa: TppReport;
    dsHstFaixa: TDataSource;
    ppCabecalho: TppHeaderBand;
    ppDetalhe: TppDetailBand;
    ppRodape: TppFooterBand;
    ppImage2: TppImage;
    pplblEmpresa: TppLabel;
    pplblEnd1: TppLabel;
    pplblEnd2: TppLabel;
    pplblCNPJ: TppLabel;
    pplblTitulo: TppLabel;
    pplblEmissao: TppLabel;
    ppSysData: TppSystemVariable;
    pplinCabec: TppLine;
    pplblArea: TppLabel;
    ppSysPagina: TppSystemVariable;
    pplinRodape: TppLine;
    qryHstFaixa: TwwQuery;
    ppdbPercPatroAss: TppDBText;
    ppdbPercPartAss: TppDBText;
    ppdbPercPatroAt: TppDBText;
    ppdbPercPartAt: TppDBText;
    ppdbFaixa: TppDBText;
    ppdbInicioVig: TppDBText;
    ppshpDet: TppShape;
    pplinDet1: TppLine;
    pplinDet2: TppLine;
    pplinDet3: TppLine;
    pplinDet4: TppLine;
    pplinDet5: TppLine;
    ppshpCab: TppShape;
    pplblPatro: TppLabel;
    ppdbPatro: TppDBText;
    pplblInicioVig: TppLabel;
    pplinCab1: TppLine;
    ppdbPlano: TppDBText;
    pplblPlano: TppLabel;
    pplblFaixa: TppLabel;
    pplblPercPartAt: TppLabel;
    pplblPercPatroAt: TppLabel;
    pplblPercPartAss: TppLabel;
    pplblPercPatroAss: TppLabel;
    pplblDescricao: TppLabel;
    ppdbDescricao: TppDBText;
    ppdbContab: TppDBText;
    pplblContab: TppLabel;
    ppdbTpContrib: TppDBText;
    pplblTpContrib: TppLabel;
    pplinCab2: TppLine;
    pplinCab3: TppLine;
    pplinCab4: TppLine;
    pplinCab5: TppLine;
    pplblTitRodape: TppLabel;
    dspDet: TDataSetProvider;
    cdsDetIDPERCFAIXA: TFloatField;
    cdsDetIDFAIXA: TFloatField;
    cdsDetDATAINIVIG: TDateTimeField;
    cdsDetFAIXA: TFloatField;
    cdsDetPERCPARTAT: TFloatField;
    cdsDetPERCPATROAT: TFloatField;
    cdsDetPERCPARTAS: TFloatField;
    cdsDetPERCPATROAS: TFloatField;
    grdcdsDet: TwwDBGrid;
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label4: TLabel;
    wwDBEdit4: TwwDBEdit;
    procedure dblcPatroChange(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dblcPlanoChange(Sender: TObject);
    procedure dblcPlanoContabChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbedPartAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbedtDescricaoChange(Sender: TObject);
    procedure dblcPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnHistoricoClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dbedDataInicioExit(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure qryDetAfterPost(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    iIdFaixa : integer;

    function  VerificaDuplicidade(Op : TTipoValidaDuplicidade) : boolean;
    procedure CarregaFaixas(bAlterar : boolean);
    procedure FormataCampoFloat(_qry : TwwQuery);  
    procedure HabilitaBotoesDetalhe;
    procedure CopiaDados(dados : TDataSet);

  public
    { Public declarations }
  end;

var
  FrmCadFaixasPercentuais: TFrmCadFaixasPercentuais;

implementation

uses
    UDataBase, UMensErro, USistema;

{$R *.DFM}


procedure TFrmCadFaixasPercentuais.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if qry.State in [dsinsert] then
  begin
    iIdFaixa := LeUltRegistro(qryAux,'FAIXA');
    qry.FieldByName('IDFAIXA').AsInteger := iIdFaixa;

    HabilitaBotoesDetalhe();
  end;

  qryDet.close;
  qryDet.ParamByName('pIDFAIXA').AsInteger := qry.FieldByName('IDFAIXA').AsInteger;
  qryDet.open;
end;


procedure TFrmCadFaixasPercentuais.FormShow(Sender: TObject);
var
  sSQL : string;
begin
  inherited;

  iIdFaixa := -1;

  try
    // abre consultas
    qry.close;
    qry.ParamByName('pIDFAIXA').AsInteger := -1;
    qry.Open;

    qryDet.close;
    qryDet.ParamByName('pIDFAIXA').AsInteger := -1;
    qryDet.open;

    sSQL := qryDet.Sql.text;
    sSQL := StringReplace(sSQL, ':pIDFAIXA', '-1',  [rfReplaceAll]);
    qryAux.SQL.Text := sSQL;
    cdsDet.open;
  except
    raise;
  end;
end;


procedure TFrmCadFaixasPercentuais.dblcPatroChange(Sender: TObject);
begin
  inherited;
  dblcPlano.Enabled := (dblcPatro.text <> '');

  if (not dblcPlano.Enabled) and (qry.State in [dsInsert, dsEdit]) then
  begin
    dblcPlano.text := '';
    qry.FieldByName('IDPLANOPREV').AsString := '';
  end;
  HabilitaBotoesDetalhe();  
end;


procedure TFrmCadFaixasPercentuais.dblcPlanoChange(Sender: TObject);
begin
  inherited;
  dblcPlanoContab.Enabled := (dblcPlano.text <> '');

  if (not dblcPlanoContab.Enabled) and (qry.State in [dsInsert, dsEdit]) then
  begin
    dblcPlanoContab.text := '';
    qry.FieldByName('IDPLANPREVCONTAB').AsString := '';
  end;
  HabilitaBotoesDetalhe();  
end;


procedure TFrmCadFaixasPercentuais.dblcPlanoContabChange(Sender: TObject);
begin
  inherited;
  dblcTpContrib.Enabled := (dblcPlanoContab.text <> '');

  if (not dblcTpContrib.Enabled) and (qry.State in [dsInsert, dsEdit]) then
  begin
    dblcTpContrib.text := '';
    qry.FieldByName('IDTPCONTRIBUICAO').AsString := '';
    qry.FieldByName('IDPLANPREVCONTAB').AsString := '';
  end;
  HabilitaBotoesDetalhe();  
end;


procedure TFrmCadFaixasPercentuais.bbtnConfirmarClick(Sender: TObject);
begin
  // validações
  if dbedtDescricao.text = '' then
  begin
    MsgDlg('É necessário informar a descrição.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dbedtDescricao.SetFocus;
    Exit;
  end;

  if dblcPatro.text = '' then
  begin
    MsgDlg('É necessário selecionar a patrocinadora.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dblcPatro.SetFocus;
    Exit;
  end;

  if dblcPlano.text = '' then
  begin
    MsgDlg('É necessário selecionar o plano previdenciário.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dblcPlano.SetFocus;
    Exit;
  end;

  if dblcPlanoContab.text = '' then
  begin
    MsgDlg('É necessário selecionar o plano contábil.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dblcPlanoContab.SetFocus;
    Exit;
  end;

  if (qryDet.IsEmpty) then
  begin
    MsgDlg('A grid Faixas não possui nenhum registro.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;

  If VerificaDuplicidade(vdValidaDados) then
  begin
    MsgDlg('Existe um cadastro com as mesmas informações.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;


  // gravar tudo maiusculo
  qry.FieldByName('DESCRICAO').AsString := AnsiUpperCase(dbedtDescricao.text);

  inherited;


end;

procedure TFrmCadFaixasPercentuais.dbedPartAtivoKeyPress(Sender: TObject; var Key: Char);
var
  sValor : string;
  sDec   : string;
begin
  inherited;
  sValor := TwwDBEdit(Sender).text;
  if TwwDBEdit(Sender).SelLength = length(sValor) then
    sValor := '';

  sDec   := iff(pos(',', sValor) > 0, copy(sValor, pos(',', sValor)+1, length(svalor)), '');

  If not( key in['0'..'9', ',', #08] ) then
     key := #0;

  if (key in [',']) and ((length(sValor) = 0) or (pos(',', sValor) <> 0)) then     // virgula no inicio ou mais de uma
      key := #0;
     
  if (key <> #0) and (not (key in [',',#8])) and (length(sValor) >= 2) and (StrToFloat(sValor+Key) > 100) then
     key := #0;

  if (Key <> #0) and (sDec <> '') and (not (key in [',',#8])) and (length(sDec+Key)>2) then
     key := #0;
end;

procedure TFrmCadFaixasPercentuais.bbtnOkDetClick(Sender: TObject);
begin
  if dbedDataInicio.date = 0 then
  begin
    MsgDlg('É necessário informar a data de início da vigência.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dbedDataInicio.SetFocus;
    Exit;
  end;

  if cbFaixa.text = '' then
  begin
    MsgDlg('É necessário informar a faixa.','Aviso',mtInformation,[mbOk,mbHelp],0);
    cbFaixa.SetFocus;
    Exit;
  end;

  if dbedPartAtivo.text = '' then
  begin
    MsgDlg('É necessário informar o percentual participante ativo.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dbedPartAtivo.SetFocus;
    Exit;
  end;

  if dbedPatroAtivo.text = '' then
  begin
    MsgDlg('É necessário informar o percentual patrocinadora ativo.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dbedPatroAtivo.SetFocus;
    Exit;
  end;

  if dbedPartAssist.text = '' then
  begin
    MsgDlg('É necessário informar o percentual participante assistido.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dbedPartAssist.SetFocus;
    Exit;
  end;

  if dbedPatroAssist.text = '' then
  begin
    MsgDlg('É necessário informar o percentual patrocinadora assistido.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dbedPatroAssist.SetFocus;
    Exit;
  end;

  If VerificaDuplicidade(vdValidaPerc) then
  begin
    MsgDlg('Existe um cadastro com as mesmas informações.','Aviso',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;

  inherited;

end;


function TFrmCadFaixasPercentuais.VerificaDuplicidade(Op : TTipoValidaDuplicidade): boolean;
begin

  if (Op = vdValidaPerc) then     // validando percentuais e vigencia iguais
  begin
    if not qryDuplicado.isEmpty then
    begin
      qryDuplicado.First;
      result := qryDuplicado.Locate('DATAINIVIG;PERCPARTAT;PERCPATROAT;PERCPARTAS;PERCPATROAS;PERCPARTAS13;PERCPATROAS13;PERCPARTAT13;PERCPATROAT13',
                                     VarArrayOf([qryDet.FieldByName('DATAINIVIG').AsDateTime,
                                              qryDet.FieldByName('PERCPARTAT').AsFloat,
                                              qryDet.FieldByName('PERCPATROAT').AsFloat,
                                              qryDet.FieldByName('PERCPARTAS').AsFloat,
                                              qryDet.FieldByName('PERCPATROAS').AsFloat,
                                              qryDet.FieldByName('PERCPARTAS13').AsFloat,
                                              qryDet.FieldByName('PERCPATROAS13').AsFloat,
                                              qryDet.FieldByName('PERCPARTAT13').AsFloat,
                                              qryDet.FieldByName('PERCPATROAT13').AsFloat]), [loCaseInsensitive]);

      if (result) and (cmeDetalhe.operacao = opAlterar) then
         result := qryDuplicado.FieldByName('IDPERCFAIXA').AsInteger <> qryDet.FieldByName('IDPERCFAIXA').AsInteger;
    end
    else
      result := false;
  end
  else   // validando dados iguais
  begin
    qryDuplicado.close;
    qryDuplicado.Sql.Text := 'SELECT IDFAIXA FROM FAIXA '+
                             ' WHERE IDPESSJUR   = '+qry.FieldByName('IDPESSJUR').AsString +
                             '   AND IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString +
                             '   AND IDPLANPREVCONTAB = '+qry.FieldByName('IDPLANPREVCONTAB').AsString +
                             '   AND IDTPCONTRIBUICAO = '+qry.FieldByName('IDTPCONTRIBUICAO').AsString;
    if CmeCadastro.Operacao = opAlterar then
       qryDuplicado.Sql.Text := qryDuplicado.Sql.Text + '  AND IDFAIXA <> '+qry.FieldByName('IDFAIXA').AsString;

    qryDuplicado.open;
    Result := not qryDuplicado.eof;
  end;

end;


procedure TFrmCadFaixasPercentuais.CarregaFaixas(bAlterar : boolean);
var
  nFaixa : integer;
  sVigencia : string;
begin
  if not ((dbedDataInicio.text = '') or (bbtnCancelarDet.focused) or (bbtnVoltarDet.focused) or (bbtnConfirmar.focused)) then
  begin
    cbFaixa.Items.clear;

    qryFaixa.close;
    qryFaixa.Sql.Clear;
    qryFaixa.Sql.Add('SELECT VT.NUMFAIXA ');
    qryFaixa.Sql.Add('  FROM (SELECT column_value as numfaixa ');
    qryFaixa.Sql.Add('          FROM TABLE(fn_geralista(''1,2,3,4,5,6,7,8,9,10'')) ');
    qryFaixa.Sql.Add('       ) VT ');
    qryFaixa.Sql.Add('ORDER BY 1');
    qryFaixa.open;

    nFaixa := iff(bAlterar, qryDet.FieldByName('FAIXA').AsInteger, -1);
    if (bAlterar) then
       sVigencia := DateToStr(qryDet.FieldByName('DATAINIVIG').OldValue);

    while not qryFaixa.eof do
    begin
      qryDuplicado.First;
      if ((bAlterar) and (sVigencia = dbedDataInicio.text) and (qryFaixa.Fields[0].AsInteger = nFaixa)) or
         (not qryDuplicado.Locate('DATAINIVIG;FAIXA', VarArrayOf([dbedDataInicio.text, qryFaixa.Fields[0].AsInteger]), [])) then
         cbFaixa.Items.Add( qryFaixa.Fields[0].AsString );
      qryFaixa.Next;
    end;

    cbFaixa.ItemIndex := cbFaixa.Items.IndexOf( IntToStr(nFaixa) ); //wo22429 Leandro 

  end;
end;

procedure TFrmCadFaixasPercentuais.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (not MontaSelect.RetornouValor) or (MontaSelect.ValoresChave[0] = '') then Exit;

  iIdFaixa := StrToInt(MontaSelect.ValoresChave[0]);

  qry.close;
  qry.ParamByName('pIDFAIXA').AsInteger := iIdFaixa;
  qry.Open;

  qryPatro.close;
  qryPatro.open;

  qryPlano.Close;
  qryPlano.ParamByName('pIDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
  qryPlano.open;

  qryContab.Close;
  qryContab.ParamByName('pIDPLANOPREV').AsInteger :=  qry.FieldByName('IDPLANOPREV').AsInteger;
  qryContab.open;

  qryTpContrib.close;
  qryTpContrib.open;

  qryDet.close;
  qryDet.ParamByName('pIDFAIXA').AsInteger := iIdFaixa;
  qryDet.Open;

  CopiaDados(cdsDet);
end;

procedure TFrmCadFaixasPercentuais.dbedtDescricaoChange(Sender: TObject);
begin
  inherited;
  dblcPatro.enabled := (dbedtDescricao.text <> '');

  if (not dblcPatro.enabled) and (qry.State in [dsInsert, dsEdit]) then
  begin
    dblcPatro.text := '';
    qry.FieldByName('IDPESSJUR').AsString := '';
  end;

  HabilitaBotoesDetalhe();
end;

procedure TFrmCadFaixasPercentuais.dblcPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlano.close;

  if dblcPatro.text <> '' then
  begin
    qryPlano.ParamByName('pIDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
    qryPlano.open;
  end;
end;

procedure TFrmCadFaixasPercentuais.dblcPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  qryContab.close;

  if dblcPlano.text <> '' then
  begin
    qryContab.ParamByName('pIDPLANOPREV').AsInteger :=  qry.FieldByName('IDPLANOPREV').AsInteger;
    qryContab.open;
  end;
end;

procedure TFrmCadFaixasPercentuais.CmeDetalheInsert(Sender: TObject);
begin
  CopiaDados(qryDuplicado);
  
  inherited;
  CarregaFaixas(false);
  
  dbedDataInicio.setfocus;
end;


procedure TFrmCadFaixasPercentuais.FormataCampoFloat(_qry: TwwQuery);
var
   i : integer;
begin
  for i := 0 to _qry.fields.Count-1 do
  begin
    if (_qry.Fields[i].DataType = ftFloat) and (_qry.Fields[i].FieldName <> 'FAIXA') then
       TNumericField(_qry.Fields[i]).DisplayFormat := '#,##0.00';
  end;
end;


procedure TFrmCadFaixasPercentuais.qryDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataCampoFloat(qryDet);
end;


procedure TFrmCadFaixasPercentuais.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryPatro.close;
  qryPatro.open;

  qryTpContrib.close;
  qryTpContrib.open;

  dblcPatro.enabled := false;
  dblcPlano.enabled := false;
  dblcPlanoContab.enabled := false;
  dblcTpContrib.enabled   := false;

  dbedtDescricao.setfocus;
end;


procedure TFrmCadFaixasPercentuais.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  qryPatro.close;
  qryPatro.open;

  qryTpContrib.close;
  qryTpContrib.open;
  
  dblcPatro.enabled := true;
  dblcPlano.enabled := true;
  dblcPlanoContab.enabled := true;
  dblcTpContrib.enabled   := true;

  dbedtDescricao.setfocus;
end;


procedure TFrmCadFaixasPercentuais.CmeCadastroConfirma(Sender: TObject);
var
   op : TOperacao;
begin
   op := CmeCadastro.Operacao;

  try
     if Op = opApagar then
        AplicaAlteracoes([qryDet]);

     inherited;

     if Op <> opApagar then
        AplicaAlteracoes([qryDet]);
  except
     raise;
  end;

  qryDet.close;
  qryDet.ParamByName('pIDFAIXA').AsInteger := iIdFaixa;
  qryDet.open;

  CopiaDados(cdsDet);
end;

procedure TFrmCadFaixasPercentuais.HabilitaBotoesDetalhe;
var
  bTemDados : boolean;
begin
  bTemDados := (dbedtDescricao.text <> '')  and (dblcPatro.text <> '') and
               (dblcPlanoContab.text <> '') and (dblcPlano.text <> '');

  sbtnInsDet.Enabled := bTemDados;
  sbtnAltDet.Enabled := (bTemDados) and (not qryDet.isEmpty);
  sbtnExcluiDet.Enabled := (bTemDados) and (not qryDet.isEmpty);
end;


procedure TFrmCadFaixasPercentuais.bbtnHistoricoClick(Sender: TObject);
begin
  inherited;

  if (not (CmeCadastro.Operacao in [opVazio, opIdle])) or (iIdFaixa = -1) then
     exit;

  qryHstFaixa.Close;
  qryHstFaixa.ParamByName('pIDFAIXA').AsInteger := iIdFaixa;
  qryHstFaixa.Open;

  TFrmPreview.CreateModalPreview(Application, rpHstFaixa, 'Histórico de Faixas');

  dbgrdDet.setFocus;
end;

procedure TFrmCadFaixasPercentuais.CmeDetalheEdit(Sender: TObject);
begin
  CopiaDados(qryDuplicado);
  qryDet.Locate('IDPERCFAIXA', cdsDet.FieldByName('IDPERCFAIXA').AsInteger, []);

  inherited;
  CarregaFaixas(true);

  dbedDataInicio.setfocus;
end;

procedure TFrmCadFaixasPercentuais.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  grdcdsDet.visible := false;
  tbsDet.repaint;
  cbFaixa.ItemIndex := cbFaixa.Items.IndexOf( qryDet.FieldByName('FAIXA').AsString );
end;

procedure TFrmCadFaixasPercentuais.sbtnExcluiDetClick(Sender: TObject);
begin
  if MsgDlg('Deseja excluir o registro selecionado?','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo then
     Exit;

  qryDet.Locate('IDPERCFAIXA', cdsDet.FieldByName('IDPERCFAIXA').AsInteger, []);
  
  inherited;
end;

procedure TFrmCadFaixasPercentuais.CmeCadastroDelete(Sender: TObject);
begin
  // apaga itens do detalhe
  qryDet.DisableControls;
  qryDet.first;
  while not qryDet.eof do
     qryDet.delete;

  inherited;
end;

procedure TFrmCadFaixasPercentuais.dbedDataInicioExit(Sender: TObject);
begin
  inherited;
  CarregaFaixas(cmeDetalhe.operacao = opAlterar);
end;

procedure TFrmCadFaixasPercentuais.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryDet.State  in [dsInsert] then
  begin
    qryDet.FieldByName('IDPERCFAIXA').AsInteger := LeUltRegistro(nil,'PERCFAIXA');
    qryDet.FieldByName('IDFAIXA').AsInteger     := qry.FieldByName('IDFAIXA').AsInteger;
  end;
  qryDet.FieldByName('FAIXA').AsString        := cbFaixa.Items.Strings[cbFaixa.itemIndex];
end;


procedure TFrmCadFaixasPercentuais.CopiaDados(dados: TDataSet);
var
  index : TBookmark;
  i     : integer;
  campo : string;
  sSQL  : string;
begin
  if dados.ClassType = TwwQuery then
  begin
    // copiar dados antes de incluir/alterar para validar duplicação
    TwwQuery(dados).close;
    TwwQuery(dados).Sql.Text := qryDet.Sql.Text;
    TwwQuery(dados).Params[0].AsInteger := -1;
    TwwQuery(dados).open;
  end
  else
  begin
    if not cdsDet.isEmpty then
       index := cdsDet.GetBookmark;

    TClientDataSet(dados).EmptyDataSet;

    sSQL := qryDet.Sql.text;
    sSQL := StringReplace(sSQL, ':pIDFAIXA', IntToStr(iIdFaixa),  [rfReplaceAll]);
    qryAux.SQL.text := sSQL;
    TClientDataSet(dados).open;
  end;

  if not qryDet.isEmpty then
  begin
    try
      qryDet.First;
      while not qryDet.Eof do
      begin
        dados.Insert;
        for i := 0 to qryDet.FieldCount-1 do
        begin
          campo := qryDet.Fields[i].FieldName;
          dados.FieldByName(campo).Value := qryDet.FieldByName(campo).Value;
        end;
        dados.post;

        qryDet.next;
      end;
      qryDet.First;

      if not (dados.ClassType = TwwQuery) then
      begin
        cdsDet.GotoBookmark(index);
        cdsDet.FreeBookmark(index);
        if index = nil then
           cdsDet.first;

        if cdsDet.IndexName = '' then
           cdsDet.IndexName := 'Vigencia';
      end;

    except
      raise;
    end;
  end;
end;


procedure TFrmCadFaixasPercentuais.qryDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  CopiaDados(cdsDet);
end;

procedure TFrmCadFaixasPercentuais.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  grdcdsDet.visible := false;
  tbsDet.repaint;
end;

procedure TFrmCadFaixasPercentuais.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  grdcdsDet.visible := true;
end;

procedure TFrmCadFaixasPercentuais.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  grdcdsDet.visible := true;
end;

procedure TFrmCadFaixasPercentuais.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
  if not (qryDet.State in [dsInsert, dsEdit]) then
     grdcdsDet.visible := true;
end;

procedure TFrmCadFaixasPercentuais.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  grdcdsDet.visible := true;
  CopiaDados(cdsDet);
end;

end.
