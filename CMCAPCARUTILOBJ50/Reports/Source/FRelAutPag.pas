{-------------------------------------------------------------------------------
Rotina........: bbtnSelecionaClick 
N. SIG........: 37065
Data..........: 05/01/2017
Responsável...: Peterson Victor
Descrição.....: Deixar no Memo apenas o documento selecionado
--------------------------------------------------------------------------------
Rotina.......: CrmRptCMBeforePrint
N. do SIG....:  26501
Data.........: 02/09/2016
Responsável..: Darivaldo Alencar
Descrição....: A pedido pela Tesouraria, solicitamos que quando da impressão da
               autorização de pagamento AP - modelo 2, for feita utilizando o
               parâmetro utilizar mais de um documento por centro de responsa-
               bilidade, o número de páginas seja quebrado por número de AP.
--------------------------------------------------------------------------------
Rotina........: CrmRptCMBeforePrint
N. Sol........: 244390
N. Kintana....: 618021
Data..........: 26/12/2014
Responsável...: Marcio Sanches Spinosa SOL 244390 PPM 618021
Descrição.....: Ajuste para gerar a AP para grupos.
--------------------------------------------------------------------------------
// Daniel Simões - pendência 15387 e 15388 - 10/01/2006
//    Adicionado o campo CODEXTERNO da tabela CENTRESPON e exibido na combo
//    dblcCentroRespon.
// -----------------------------------------------------------------------------
// André Tavares - pendência 16330 - 03/05/2004 - inserido os joins abaixo na
//    query do montaselect
//DOCUMENTO.CODTIPDOC = TIPODOCRECPAG.CODTIPDOC
//TIPODOCRECPAG.FLGIMPRIMEAP IS NULL OR TIPODOCRECPAG.FLGIMPRIMEAP = 'S'
}
Unit FRelAutPag;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, wwdbedit,
  MontaSelect, Db, DBTables, Wwquery, wwdblook, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uCMTypes, fParamReports_Padrao,
  CmParamReport, uCtrlParamIntegra, uCmSqlParams, DBClient,
  uCMClientDataSet, CMProcura;

//Darivaldo Alencar SIG 26501 -inicio
const
  MSG1 = 'Preencha os filtros para emissão da Autorização de Pagamento';
  MSG2 = 'Preenchimento incorreto das datas de Emissão. Verifique !';
  MSG3 = 'Preenchimento incorreto das datas de Lançamento. Verifique !';
  MSG4 = 'Preenchimento incorreto das datas de Vencimento. Verifique !';
  MSG5 = 'Preenchimento incorreto das datas Programadas. Verifique !';
  MSG6 = 'Preenchimento incorreto das datas de Inclusão. Verifique !';
  MSG7 = 'Preenchimento incorreto do campo Número do Documento. Verifique !';
  MSG8 = 'Preenchimento incorreto do campo Valor Moeda Corrente. Verifique !';
//Darivaldo Alencar SIG 26501 -fim

Type
  TFrmRelAutPag = Class(TfrmParamReports_Padrao)
    msDoc: TMontaSelect;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Label2: TLabel;
    bbtnSeleciona: TBitBtn;
    MemDocs: TMemo;
    CdsCentroRespon: TCMClientDataSet;
    SqlCentroRespon: TCMSqlParams;
    gbxDatas: TGroupBox;
    lblInclusao: TLabel;
    dtpInclusaoInicio: TCMDateTimePicker;
    dtpVencimentoFim: TCMDateTimePicker;
    dtpVencimentoInicio: TCMDateTimePicker;
    dtpProgramadaFim: TCMDateTimePicker;
    dtpProgramadaInicio: TCMDateTimePicker;
    dtpLancamentoFim: TCMDateTimePicker;
    dtpLancamentoInicio: TCMDateTimePicker;
    dtpEmissaoFim: TCMDateTimePicker;
    dtpEmissaoInicio: TCMDateTimePicker;
    dtpInclusaoFim: TCMDateTimePicker;
    lblEmissao: TLabel;
    lblADT1: TLabel;
    lblLancamento: TLabel;
    lblVencimento: TLabel;
    lblProgramada: TLabel;
    lblADT2: TLabel;
    lblADT3: TLabel;
    lblADT4: TLabel;
    lblADT5: TLabel;
    gbxFavorecido: TGroupBox;
    ProcFavorcecido: TCMProcura;
    gbxNumDoc: TGroupBox;
    gbxMoedaCorren: TGroupBox;
    lblDeNumDOC: TLabel;
    lblANumDoc: TLabel;
    lblDeVlrMoeda: TLabel;
    lblAVlrMoeda: TLabel;
    edtNumDocInicio: TEdit;
    edtNumDocFim: TEdit;
    edtVlrMoedaInicio: TEdit;
    edtVlrMoedaFim: TEdit;
    dblcTipoDoc: TwwDBLookupCombo;
    dblcModuloLanc: TwwDBLookupCombo;
    dblcUsuLanc: TwwDBLookupCombo;
    dblcContaCaixa: TwwDBLookupCombo;
    lblContaCaixa: TLabel;
    lblTipoDoc: TLabel;
    lblUsuLanc: TLabel;
    lblModLanc: TLabel;
    msFavorecido: TMontaSelect;
    sqlModLanc: TCMSqlParams;
    sqlConCxFormPag: TCMSqlParams;
    sqlTipoDoc: TCMSqlParams;
    sqlUsuLanc: TCMSqlParams;
    cdsModLanc: TCMClientDataSet;
    cdsConCxFormPag: TCMClientDataSet;
    cdsUsuLanc: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    CdsUpd: TCMClientDataSet;
    SqlUpd: TCMSqlParams;
    dtsUpd: TDataSource;
    Procedure bbtnSelecionaClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    //Darivaldo Alencar SIG 26501 -inicio
    function ValidaEntrada: boolean;
    procedure ShowAviso(sMsg: String);
    function ValidaDatas(dtIni,dtFim: TDate):boolean;
    function ValidaDeAte(CampoIni, CampoFim: String):boolean;
    //Darivaldo Alencar SIG 26501 -fim
  public
    { Public declarations }
    doc: String;
  End;

Var
  FrmRelAutPag: TFrmRelAutPag;

Implementation

Uses
  udatabase, usistema, DBaseDados, umenserro, uString;

{$R *.DFM}

Procedure TFrmRelAutPag.bbtnSelecionaClick(Sender: TObject);
Begin
  Inherited;
  If (msDoc.Executar = MrOk) Then
  Begin
    MemDocs.Lines.Clear; //Peterson Victor SIG37065
    doc := MsDoc.ValoresChave[0];
    //Darivaldo Alencar SIG 26501 -inicio
    //MemDocs.Lines.Add(' Nº Ap: ............ ' + MsDoc.ValoresChave[9]);
    MemDocs.Lines.Add(' Nº da Ap: ......... ' + MsDoc.ValoresChave[9]);
    MemDocs.Lines.Add(' Nº Documento: ..... ' + MsDoc.ValoresChave[7]);
    MemDocs.Lines.Add(' Complemento: ...... ' + MsDoc.ValoresChave[1]);
    //    MemDocs.Lines.Add(' Data Vencimento: .. ' + MsDoc.ValoresChave[2]);
    //    MemDocs.Lines.Add(' Data Programada: .. ' + MsDoc.ValoresChave[3]);
    //    MemDocs.Lines.Add(' Operacao: ......... ' + MsDoc.ValoresChave[4]);
    //    MemDocs.Lines.Add(' Data Emissão: ..... ' + MsDoc.ValoresChave[5]);
    MemDocs.Lines.Add(' Data Emissão: ..... ' + MsDoc.ValoresChave[5]);
    MemDocs.Lines.Add(' Data Lançamento: .. ' + MsDoc.ValoresChave[12]);
    MemDocs.Lines.Add(' Data Vencimento: .. ' + MsDoc.ValoresChave[2]);
    MemDocs.Lines.Add(' Data Programada: .. ' + MsDoc.ValoresChave[3]);
    //Darivaldo Alencar SIG 26501 -fim

    MemDocs.Lines.Add(' Valor: ............ ' + MsDoc.ValoresChave[6]);
    MemDocs.Lines.Add(' Razão Social: ..... ' + MsDoc.ValoresChave[8]);

  End;
End;

Procedure TFrmRelAutPag.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  //Darivaldo Alencar SIG 26501 -inicio
  //If (trim(doc) = '') And (trim(dblcCentroRespon.text) = '') And (trim(DateEdit1.text) = '') Then//Darivaldo Alenar SIG 26501
  //  Begin
  //    MsgDlg('Faltam parâmetros para seleção de documentos Selecionar Documento(s).', 'Erro', mtError, [mbOk], 0);
  //  End
  //  else begin
  //    Cmp_Padrao.ParamValues[0].AsString := Doc;
  //    Cmp_Padrao.ParamValues[1].AsString := dblcCentroRespon.LookupValue ;
  //    Cmp_Padrao.ParamValues[2].AsString := DateEdit1.text;
  //    Cmp_Padrao.ParamValues[3].AsString := IntToStr(RadioGroup1.itemindex);
  //   end;
  if not (ValidaEntrada) then
    abort
  else
  begin
    Cmp_Padrao.ParamValues[0].AsString  := Doc;
    Cmp_Padrao.ParamValues[1].AsString  := dblcCentroRespon.LookupValue ;
    //Cmp_Padrao.ParamValues[2].AsString := DateEdit1.text; //Darivaldo Alencar SIG 26501
    Cmp_Padrao.ParamValues[2].AsString  := dtpInclusaoInicio.text;//Darivaldo Alencar SIG 26501
    Cmp_Padrao.ParamValues[3].AsString  := IntToStr(RadioGroup1.itemindex);
    Cmp_Padrao.ParamValues[4].AsString  := dtpInclusaoFim.Text;
    Cmp_Padrao.ParamValues[5].AsString  := dtpLancamentoInicio.Text;
    Cmp_Padrao.ParamValues[6].AsString  := dtpLancamentoFim.Text;
    Cmp_Padrao.ParamValues[7].AsString  := dtpVencimentoInicio.Text;
    Cmp_Padrao.ParamValues[8].AsString  := dtpVencimentoFim.Text;
    Cmp_Padrao.ParamValues[9].AsString  := dtpProgramadaInicio.Text;
    Cmp_Padrao.ParamValues[10].AsString := dtpProgramadaFim.Text;
    Cmp_Padrao.ParamValues[11].AsString := dblcContaCaixa.LookupValue;
    Cmp_Padrao.ParamValues[12].AsString := dblcTipoDoc.LookupValue;
    Cmp_Padrao.ParamValues[13].AsString := dblcModuloLanc.LookupValue;
    Cmp_Padrao.ParamValues[14].AsString := dblcUsuLanc.LookupValue;
    Cmp_Padrao.ParamValues[15].AsString := edtNumDocInicio.Text;
    Cmp_Padrao.ParamValues[16].AsString := edtNumDocFim.Text;
    Cmp_Padrao.ParamValues[17].AsString := edtVlrMoedaInicio.Text;
    Cmp_Padrao.ParamValues[18].AsString := edtVlrMoedaFim.Text;
    if (msFavorecido.RetornouValor) then
       Cmp_Padrao.ParamValues[19].AsString := msFavorecido.ValoresChave[0]
    else Cmp_Padrao.ParamValues[19].AsString:= EmptyStr;
    Cmp_Padrao.ParamValues[20].AsString := dtpEmissaoInicio.Text;
    Cmp_Padrao.ParamValues[21].AsString := dtpEmissaoFim.Text;
  end;
  //Darivaldo Alenar SIG 26501 -fim
End;

Procedure TFrmRelAutPag.FormCreate(Sender: TObject);
Begin
  Inherited;
  msDoc.Filtro.Add('Documento.RECPAG = ''' + ParamIntegra.RecPag + '''');
  msDoc.Filtro.Add('Documento.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  msDoc.Filtro.Add('Documento.CODTIPDOC in ' +
    '   (SELECT CODTIPDOC ' +
    '    FROM TIPODOCRECPAG a ' +
    '    WHERE a.RECPAG = ''' + ParamIntegra.RecPag + ''' and ' +
    '          not exists (select 1 ' +
    '                      from UsuarioxTpdocto b ' +
    '                      where recpag = ' + #39 + ParamIntegra.RecPag + #39 + ' and ' +
    '                            b.idusuario = ' + IntToStr(Sistema.IdUsuario) +
    '                      ) ' +
    '    UNION ' +
    '    SELECT CODTIPDOC ' +
    '    FROM TIPODOCRECPAG a ' +
    '    WHERE a.RECPAG = ''' + ParamIntegra.RecPag + ''' and ' +
    '          exists (select 1 ' +
    '                  from UsuarioxTpdocto b ' +
    '                  where recpag = ' + #39 + ParamIntegra.RecPag + #39 + ' and ' +
    '                        a.codtipdoc = b.codtipdoc and ' +
    '                        b.idusuario = ' + IntToStr(Sistema.IdUsuario) +
    '                  )' +
    '    )');
  With SqlCentroRespon Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT CODCENTRORESPON, NOME, ANALITICOSINTET, CODCENTROCUSTO  ');
    SQL.Add('FROM CENTRESPON                                                ');
    SQL.Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
    SQL.Add('  AND CODCENTRORESPON <> ''9999999999''                        ');
    SQL.Add('ORDER BY CODCENTRORESPON                                       ');
    open;
  End;

  //Darivaldo Alencar SIG 26501 -inicio
  With sqlConCxFormPag Do
  Begin
    SQL.Clear;
    SQL.Add(' SELECT CODPORTFORMA,DESCRICAO FROM PORTADORFORMA WHERE RECPAG ='+QuotedStr('P'));
    SQL.Add(' ORDER BY DESCRICAO');
    open;
  end;

  With sqlTipoDoc Do
  Begin
    SQL.Clear;
    SQL.Add(' SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG WHERE RECPAG = '+ QuotedStr('P'));
    SQL.Add(' ORDER BY DESCRICAO');
    open;
  end;

  With sqlModLanc Do
  Begin
     SQL.Clear;
     SQL.Add(' SELECT IDMODULO,NOMEMODULO FROM MODULO ');
     SQL.Add(' ORDER BY NOMEMODULO');
     open;
  end;

  With sqlUsuLanc Do
  Begin
     SQL.Clear;
     SQL.Add(' SELECT IDUSUARIO,NOMEUSUARIO FROM  USUARIOSISTEMA ');
     SQL.Add(' ORDER BY NOMEUSUARIO');
     open;
  end;

  with SqlUpd do
  begin
     SQL.Clear;
     SQL.Add(' SELECT IDPESSOA, RAZAOSOCIAL FROM PESSOA ');
     SQL.Add(' WHERE 1=0');
     open;
  end;
  CdsUpd.Append;
  //Darivaldo Alencar SIG 26501 -fim  
End;

procedure TFrmRelAutPag.FormShow(Sender: TObject);
begin
  inherited;
  //Petri Nocentini SOL 244390 PPM 618021
  PageControl1.activePAge := TabSheet1;
end;

//Darivaldo Alencar SIG 26501 -inicio
function TFrmRelAutPag.ValidaEntrada: boolean;
begin
  result:= false;
  If(doc                      = EmptyStr) And
    (dtpEmissaoInicio.text    = EmptyStr) And
    (dtpEmissaoFim.text       = EmptyStr) And
    (dtpLancamentoInicio.text = EmptyStr) And
    (dtpLancamentoFim.text    = EmptyStr) And
    (dtpVencimentoInicio.text = EmptyStr) And
    (dtpVencimentoFim.text    = EmptyStr) And
    (dtpProgramadaInicio.text = EmptyStr) And
    (dtpProgramadaFim.text    = EmptyStr) And
    (dtpInclusaoInicio.text   = EmptyStr) And
    (dtpInclusaoFim.text      = EmptyStr) And
    (edtNumDocInicio.text     = EmptyStr) And
    (edtNumDocFim.text        = EmptyStr) And
    (edtVlrMoedaInicio.text   = EmptyStr) And
    (dblcContaCaixa.text      = EmptyStr) And
    (dblcTipoDoc.text         = EmptyStr) And
    (dblcCentroRespon.text    = EmptyStr) And
    (dblcModuloLanc.text      = EmptyStr) And
    (dblcUsuLanc.text         = EmptyStr) And
    (ProcFavorcecido.text     = EmptyStr)
  Then
       ShowAviso(MSG1)
  else if not(ValidaDatas(dtpEmissaoInicio.date,dtpEmissaoFim.date)) then
       ShowAviso(MSG2)
  else if not(ValidaDatas(dtpLancamentoInicio.date,dtpLancamentoFim.date)) then
       ShowAviso(MSG3)
  else if not(ValidaDatas(dtpVencimentoInicio.date,dtpVencimentoFim.date)) then
       ShowAviso(MSG4)
  else if not(ValidaDatas(dtpProgramadaInicio.date,dtpProgramadaFim.date)) then
       ShowAviso(MSG5)
  else if not(ValidaDatas(dtpInclusaoInicio.date,dtpInclusaoFim.date)) then
       ShowAviso(MSG6)
  else if not(ValidaDeAte(edtNumDocInicio.text,edtNumDocFim.text)) then
       ShowAviso(MSG7)
  else if not(ValidaDeAte(edtVlrMoedaInicio.text,edtVlrMoedaFim.text)) then
       ShowAviso(MSG8)
  else result:= true;
end;

procedure TFrmRelAutPag.ShowAviso(sMsg: String);
begin
  MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
  ModalResult:= mrNone;
end;

function TFrmRelAutPag.ValidaDatas(dtIni, dtFim: TDate): boolean;
begin
  if ((dtIni = 0) and (dtFim = 0)) then     //nenhuma data informada
     result:= true
  else if ((dtIni <> 0) and (dtFim <> 0))  then //duas datas informadas
      begin
         if (dtFim < dtIni) then
              result:= false
         else result:= true;
      end
  else result:= true;//Somente uma das datas informadas
end;

function TFrmRelAutPag.ValidaDeAte(CampoIni, CampoFim: String): boolean;
begin
  if (CampoIni = EmptyStr)then
      CampoIni := '0';

  if (CampoFim = EmptyStr) then
      CampoFim := '0';

  if ((StrToFloat(CampoIni) = 0) and (StrToFloat(CampoFim) = 0)) then
     result:= true
  else if ((StrToFloat(CampoIni) <> 0) and (StrToFloat(CampoFim) <> 0))  then
      begin
         if (StrToFloat(CampoFim) < StrToFloat(CampoIni)) then
              result:= false
         else result:= true;
      end
  else result:= true;
end;


procedure TFrmRelAutPag.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex:= 1;
  dtpEmissaoInicio.Clear;
  dtpEmissaoFim.Clear;
  dtpLancamentoInicio.Clear;
  dtpLancamentoFim.Clear;
  dtpVencimentoInicio.Clear;
  dtpVencimentoFim.Clear;
  dtpProgramadaInicio.Clear;
  dtpProgramadaFim.Clear;
  dtpInclusaoInicio.Clear;
  dtpInclusaoFim.Clear;
  edtNumDocInicio.Clear;
  edtNumDocFim.Clear;
  edtVlrMoedaInicio.Clear;
  edtVlrMoedaFim.Clear;
  dblcContaCaixa.Text:= EmptyStr;
  dblcTipoDoc.Text:= EmptyStr;
  dblcCentroRespon.Text:= EmptyStr;
  dblcModuloLanc.Text:= EmptyStr;
  dblcUsuLanc.Text:= EmptyStr;
  ProcFavorcecido.Text := EmptyStr;
  doc:= EmptyStr;
  MemDocs.Lines.Clear;
end;
//Darivaldo Alencar SIG 26501 -fim
End.

