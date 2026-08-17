unit RDemonstraConcessaoINSS;

{------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Alteração   : rpDemonstraConcessaoINSSBeforePrint         
WO          : WO23998
Responsável : Paulo Nobre
Data        : 04/08/2025
Descrição   : Voltar a mostrar o nome da Pessoa, para ser apresentado na
              assinatura do relatório.
--------------------------------------------------------------------------------
//Nº SIG.....: 89739
//Data.......: 05/11/2020
//Responsável: Taffarel Sevaybriker
//Descrição..: Inclusão do campo DATAFINAL no demonstrativo de concessão.
//------------------------------------------------------------------------------
Alteração  : (.dfm ) qryBenef
Nº SIG.....: 69204
Data.......: 29/05/2018
Responsável: edilaine
Descrição..: No requerimento INSS espécie 42 o sistema vinculou ao benefício o
             perfil REG/REPLAN não Saldado em vez do perfil REG/REPLAN SALDADO
-------------------------------------------------------------------------------
Alteração  : (.dfm ) rpDemonstraConcessaoINSS, qryBenef
Nº SIG.....: 61797
Data.......: 08/02/2017
Responsável: Luiz Carlos
Descrição..: Ajuste na exibição do campo plano contabil
-------------------------------------------------------------------------------
Alteração  : (.dfm NOMEPERFIL) rpDemonstraConcessaoINSS, sqlDemonstraINSS, MontaSQLRelatorio, qryBenef
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
-------------------------------------------------------------------------------
Alteração  : sqlDemonstraINSS(SQL da query), ppDemonstra, rpDemonstraConcessaoINSS
Nº SIG.....: 23985
Data       : 22/11/2016
Responsável: Darivaldo Alencar
Descrição..: Alterado modo de exibição da sqlDemonstraINSS para exibir de acordo
             que for cadastrado no componente:comDbChbBenef142 fonte:FCadRequerBenefParticip
{-------------------------------------------------------------------------------
Alteração  : (dfm) sqlDemonstraInss, CrmRptCMBeforePrint, rpDemonstraConcessaoFuncefBeforePrint,
             AbreConsultas, SalvarArquivoDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : rpDemonstraConcessaoinss, CrmRptCMBeforePrint, ppDetalheBeforePrint
Nº SOL.....: 253577-18094
KTN / PPM  : 1269549
Data       : 02/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associação de taxas
{-------------------------------------------------------------------------------
Alteração  : qryBenef, ppSubRelBenefPrint
Nº SOL.....: 263740
KTN / PPM  : 1122859
Data       : 26/10/2015
Responsável: Edilaine
Descrição..: historico de beneficio traz dados de outro processo
{-------------------------------------------------------------------------------
Alteração  : qryCorrecao, SubRelCorrecao
Nº SOL.....: 262968
KTN / PPM  : 1102753
Data       : 06/10/2015
Responsável: Edilaine
Descrição..: erro ao gerar demonstrativo quando há lançamento de alterador
{-------------------------------------------------------------------------------
Alteração  : criação do demonstrativo
Nº SOL.....: 253577-17464
KTN / PPM  : 955703
Data       : 21/07/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - concessão
-------------------------------------------------------------------------------}


interface              

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppParameter,
  ppModule, raCodMod, ppBands, ppClass, ppCtrls, ppReport, ppStrtch,
  ppSubRpt, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, Db,
  DBTables, Wwquery, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, USistema,
  ShellApi, FileCtrl, UFuncoesUteis, uBeneficio;

type
  TRptDemonstraConcessaoINSS = class(TFrmCmReport)
    rpDemonstraConcessaoINSS: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppImage2: TppImage;
    ppLine9: TppLine;
    dsDemonstra: TwwDataSource;
    ppDemonstra: TppBDEPipeline;
    ppBenef: TppBDEPipeline;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    sqlDemonstraINSS: TwwQuery;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText7: TppDBText;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    lblCapIsentoIRRF: TppLabel;
    lblIsentoIRRF: TppDBText;
    ppDBText12: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText13: TppDBText;
    ppLabel19: TppLabel;
    ppDBText14: TppDBText;
    ppLine1: TppLine;
    ppLabel20: TppLabel;
    ppLine6: TppLine;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    ppLabel31: TppLabel;
    lbl_banco: TppLabel;
    lbl_agencia: TppLabel;
    lbl_conta: TppLabel;
    lbl_conta2: TppLabel;
    lbl_banco2: TppLabel;
    lbl_agencia2: TppLabel;
    ppLabel38: TppLabel;
    ppLabel40: TppLabel;
    ppDBText25: TppDBText;
    lblCapSituacaoPlano: TppLabel;
    ppLine8: TppLine;
    plbl1: TppLabel;
    plblDEC: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plbl5: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppSubRelBenef: TppSubReport;
    ppChildReport1: TppChildReport;
    ppSubRelSoma: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel30: TppLabel;
    lbl_valortotalhis: TppLabel;
    ppLabel35: TppLabel;
    lbl_valortotalinss: TppLabel;
    ppLine7: TppLine;
    lbl_valortotalgeral: TppLabel;
    ppLabel39: TppLabel;
    ppLine4: TppLine;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape14: TppShape;
    ppShape13: TppShape;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLabel4: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLine49: TppLine;
    qryBenefMESREFERENCIA: TStringField;
    qryBenefMESCOMPREEM: TStringField;
    qryBenefVLRDESCONTAR: TFloatField;
    qryBenefVLRPAGAR: TFloatField;
    ppCalc21: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel27: TppLabel;
    ppLine5: TppLine;
    lblNomUsuario: TppLabel;
    lbl_usuario: TppLabel;
    lblHomolog: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    ppDBText32: TppDBText;
    SubRelCorrecao: TppSubReport;
    ppChildReport2: TppChildReport;
    qryCorrecao: TwwQuery;
    qryCorrecaoSTIPO: TStringField;
    qryCorrecaoNOME: TStringField;
    qryCorrecaoIDPESSOA: TFloatField;
    qryCorrecaoMESREFERENCIA: TStringField;
    qryCorrecaoRECEBER: TFloatField;
    qryCorrecaoPAGAR: TFloatField;
    qryCorrecaoNUMRECEBIMENTO: TFloatField;
    dsCorrecao: TwwDataSource;
    ppCorrecao: TppBDEPipeline;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLine3: TppLine;
    ppLine10: TppLine;
    ppLabel14: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText31: TppDBText;
	//Luiz Carlos - SIG61797 - Inicio
    qryBenefIDPLANPREVCONTAB: TStringField;
    ppLabel15: TppLabel;
    ppDBText33: TppDBText;
    //Luiz Carlos - SIG61797 - Fim
	procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure ppSubRelBenefPrint(Sender: TObject);
    procedure ppFooterBand2BeforePrint(Sender: TObject);
    procedure ppDBText23Print(Sender: TObject);
    procedure ppTitleBand1BeforePrint(Sender: TObject);
    procedure lbl_contaPrint(Sender: TObject);
    procedure SubRelCorrecaoPrint(Sender: TObject);
    procedure ppDBText29Print(Sender: TObject);
    procedure rpDemonstraConcessaoINSSBeforePrint(Sender: TObject);
  private
    { Private declarations }
    imprimiuRodapteGrupoRelatorio : boolean;
    rTotalHST  : currency;
    rTotalINSS : currency;
    sprocessos : string;               // edilaine - SOL 253577-18094 / PPM 1269549

  public
    { Public declarations }
    procedure AbreConsultas(sListaParametros : string);      // edilaine - SOL 253577-18174 / PPM 1327585
    procedure SalvarArquivoDemonstrativo;                    // edilaine - SOL 253577-18174 / PPM 1327585

  end;

var
  RptDemonstraConcessaoINSS: TRptDemonstraConcessaoINSS;

implementation

{$R *.DFM}

procedure TRptDemonstraConcessaoINSS.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  // edilaine - SOL 253577-18174 / PPM 1327585 - comentado inicio
  {sprocessos := copy(CmpRptCM.ParamValues[0].AsString, 5, length(CmpRptCM.ParamValues[0].AsString)); // edilaine - SOL 253577-18094 / PPM 1269549
  // dados gerais
  sqlDemonstraINSS.Close;
  sqlDemonstraINSS.Sql.Text := StringReplace( sqlDemonstraINSS.Sql.Text, '&NUMEROPROCESSO', sprocessos, [rfReplaceAll]); // edilaine - SOL 253577-18094 / PPM 1269549
  //sqlDemonstraINSS.ParamByName('NUMEROPROCESSO').AsString := CmpRptCM.ParamValues[0].AsInteger;                        // edilaine - SOL 253577-18094 / PPM 1269549
  sqlDemonstraINSS.ParamByName('NUMLOTE').AsString        := IntToStr(CmpRptCM.ParamValues[1].AsInteger);
  sqlDemonstraINSS.ParamByName('IDTITULAR').AsInteger     := CmpRptCM.ParamValues[7].AsInteger;
  sqlDemonstraINSS.ParamByName('SEQPROPOSTA').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
  sqlDemonstraINSS.ParamByName('IDPESSJUR').AsInteger     := CmpRptCM.ParamValues[3].AsInteger;
  sqlDemonstraINSS.ParamByName('IDPLANOPREV').AsInteger   := CmpRptCM.ParamValues[4].AsInteger;
  sqlDemonstraINSS.Open;

  lbl_usuario.Caption := Sistema.NomeUsuario;

  //homologação
  if Trim(CmpRptCM.ParamValues[8].AsString) = 'visualiza' then
     lblHomolog.Caption := 'Benefício Não Homologado - Apenas para Conferência'
  else
     lblHomolog.Caption := 'Benefício Homologado - '+CmpRptCM.ParamValues[8].AsString;
  }// edilaine - SOL 253577-18174 / PPM 1327585 - comentado fim
end;

procedure TRptDemonstraConcessaoINSS.ppGroupFooterBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  imprimiuRodapteGrupoRelatorio := true;
end;

procedure TRptDemonstraConcessaoINSS.ppSubRelBenefPrint(Sender: TObject);
begin
  inherited;

  imprimiuRodapteGrupoRelatorio := false;
  rTotalINSS := 0;
  rTotalHST  := 0;

  {historico de beneficio}
  qryBenef.Close;
  //qryBenef.ParamByName('IDPLANPREVCONT').AsInteger := CmpRptCM.ParamValues[5].AsInteger;     //edilaine - SIG53933
  qryBenef.ParamByName('IDPESSOA').AsInteger       := sqlDemonstraINSS.FieldByName('IDPESSOA').AsInteger;
  qryBenef.ParamByName('NUMEROPROCESSO').AsString  := sqlDemonstraINSS.FieldByName('NUMEROPROCESSO').AsString;// edilaine - SOL 253577-18094 / PPM 1269549
  //(SELECT NOME FROM PLANPREVCONTABIL WHERE IDPLANOPREV = :IDPLANPREVCONT) AS PLANOCONTABIL

  // edilaine - SOL 263740 / PPM 1122859 - comentado
  {qryBenef.ParamByName('IDPESSJUR').AsInteger      := CmpRptCM.ParamValues[3].AsInteger;
  qryBenef.ParamByName('IDTITULAR').AsInteger      := CmpRptCM.ParamValues[7].AsInteger;
  qryBenef.ParamByName('IDPLANOORIGEM').AsInteger  := CmpRptCM.ParamValues[6].AsInteger;
  qryBenef.ParamByName('IDPLANOPREV').AsInteger    := CmpRptCM.ParamValues[4].AsInteger;
  qryBenef.ParamByName('IDBENEFICIO').AsInteger    := sqlDemonstraINSS.FieldByName('IDBENEFICIO').AsInteger;
  }// edilaine - SOL 263740 / PPM 1122859 - fim
  qryBenef.open;

end;

procedure TRptDemonstraConcessaoINSS.ppFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;

  lblNomUsuario.visible := imprimiuRodapteGrupoRelatorio;
  lbl_usuario.visible   := imprimiuRodapteGrupoRelatorio;
end;


procedure TRptDemonstraConcessaoINSS.ppDBText23Print(Sender: TObject);
begin
  inherited;

  rTotalHST := rTotalHST - qryBenef.FieldByName('VLRDESCONTAR').AsCurrency +
                           qryBenef.FieldByName('VLRPAGAR').AsCurrency;

end;

procedure TRptDemonstraConcessaoINSS.ppTitleBand1BeforePrint(
  Sender: TObject);
begin
  inherited;

  rTotalINSS := 0;  {na concessão não são lançadas rubricas individuais, apenas em lote}

  {totalizadores}
  lbl_valortotalhis.caption   := 'R$ '+FormatFloat('#,##0.00', rTotalHST);
  lbl_valortotalinss.caption  := 'R$ '+FormatFloat('#,##0.00', rTotalINSS);
  lbl_valortotalgeral.caption := 'R$ '+FormatFloat('#,##0.00', rTotalHST+rTotalINSS);

end;

procedure TRptDemonstraConcessaoINSS.lbl_contaPrint(Sender: TObject);
begin
  inherited;
  lbl_conta.caption   := '';
  lbl_banco.caption   := '';
  lbl_agencia.caption := '';

  lbl_conta2.caption   := '';
  lbl_banco2.caption   := '';
  lbl_agencia2.caption := '';

  {Conta Bancária}
  with TwwQuery.create(nil) do
    try
      DatabaseName := 'BaseDados';

      SQL.Clear;
      SQL.Add('SELECT C.CONTACORRENTE, C.FLGCONTAPREF, C.TIPOCONTA, ');
      SQL.Add('       A.NUMAGENCIA, PB.NOME AS NOMEBANCO ');
      SQL.Add('  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C ');
      SQL.Add(' WHERE (C.IDAGENCIA = A.IDPESSOA)  ');
      SQL.Add('   AND (A.IDBANCO = B.IDPESSOA)    ');
      SQL.Add('   AND (B.IDPESSOA = PB.IDPESSOA)  ');
      SQL.Add('   AND (c.flgcontainativa = ''N'') ');
      SQL.Add('   AND ((c.tipoconta = 2) or (c.flgcontapref = 1)) ');
      SQL.Add('   AND (C.IDPESSOA = '+ sqlDemonstraINSS.FieldByName('IDPESSOA').AsString +') ');
      SQL.Add(' ORDER BY c.tipoconta desc ');
      Open;
      if not isEmpty then
      begin
        while not eof do
        begin
          if FieldByName('TIPOCONTA').AsInteger = 2 then   // conta salario
          begin
            lbl_conta.caption   := fieldbyname('CONTACORRENTE').text;
            lbl_banco.caption   := fieldbyname('NOMEBANCO').text;
            lbl_agencia.caption := fieldbyname('NUMAGENCIA').text;
          end
          else if FieldByName('FLGCONTAPREF').AsInteger = 1 then   // preferencial
          begin
            lbl_conta2.caption   := fieldbyname('CONTACORRENTE').text;
            lbl_banco2.caption   := fieldbyname('NOMEBANCO').text;
            lbl_agencia2.caption := fieldbyname('NUMAGENCIA').text;
          end;
          next;
        end;
      end
      else
        lbl_conta.caption := '< não cadastrada até o momento > ';

    finally
      Free;
    end;
end;


// edilaine - SOL 262968 / PPM 1102753 - inicio
procedure TRptDemonstraConcessaoINSS.SubRelCorrecaoPrint(Sender: TObject);
begin
  {Correçoes}
  qryCorrecao.Close;
  qryCorrecao.ParamByName('NUMPROCESSO').AsString := sqlDemonstraINSS.FieldByName('NUMEROPROCESSO').AsString;       // edilaine - SOL 253577-18094 / PPM 1269549
  qryCorrecao.ParamByName('IDPESSOA').AsInteger   := sqlDemonstraINSS.FieldByName('IDPESSOA').AsInteger;
  qryCorrecao.open;

end;

procedure TRptDemonstraConcessaoINSS.ppDBText29Print(Sender: TObject);
begin

 rTotalHST := rTotalHST + (qryCorrecao.FieldByName('RECEBER').AsCurrency -
                           qryCorrecao.FieldByName('PAGAR').AsCurrency)

end;
// edilaine - SOL 262968 / PPM 1102753 - fim

// edilaine - SOL 253577-18174 / PPM 1327585 - inicio
procedure TRptDemonstraConcessaoINSS.AbreConsultas( sListaParametros : string);
var
  sParams : TStringList;
  ind : integer;
begin
  {parse dos parametros}
  sParams := TStringList.create;
  Split('|', sListaParametros, sParams);
  for ind := 0 to sParams.count-1 do
  begin
    CmpRptCM.ParamValues[ind].AsString := sParams.Strings[ind];
  end;

  sprocessos := copy(CmpRptCM.ParamValues[0].AsString, 5, length(CmpRptCM.ParamValues[0].AsString));
  // dados gerais
  sqlDemonstraINSS.Close;
  sqlDemonstraINSS.Sql.Text := StringReplace( sqlDemonstraINSS.Sql.Text, '&NUMEROPROCESSO', sprocessos, [rfReplaceAll]);
  sqlDemonstraINSS.ParamByName('NUMLOTE').AsString        := IntToStr(CmpRptCM.ParamValues[1].AsInteger);
  sqlDemonstraINSS.ParamByName('IDTITULAR').AsInteger     := CmpRptCM.ParamValues[7].AsInteger;
  sqlDemonstraINSS.ParamByName('SEQPROPOSTA').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
  sqlDemonstraINSS.ParamByName('IDPESSJUR').AsInteger     := CmpRptCM.ParamValues[3].AsInteger;
  sqlDemonstraINSS.ParamByName('IDPLANOPREV').AsInteger   := CmpRptCM.ParamValues[4].AsInteger;
  sqlDemonstraINSS.Open;
end;


procedure TRptDemonstraConcessaoINSS.SalvarArquivoDemonstrativo;
var
   sCaminho, vBuffer, sNomeArq : string;
begin
  sCaminho := CaminhoParaSalvarArquivo(sqlDemonstraINSS.FieldByName('MATRICULATIT').AsString,
                                       sqlDemonstraINSS.FieldByName('MATRICULA').AsString);

  sNomeArq := 'Demonstrativo de Concessão de Benefícios INSS - ' + sqlDemonstraINSS.FieldByName('Matricula').AsString + ' - ' + FormatDateTime('DD-MM-YYYY' + ' - ' + 'HH-MM-SS', Now)+' - Confirmado';

  vBuffer := sCaminho + '\' + sNomeArq  + '.PDF';

  rpDemonstraConcessaoINSS.DeviceType       := 'PDFFile';
  rpDemonstraConcessaoINSS.AllowPrintToFile := True;
  rpDemonstraConcessaoINSS.ShowPrintDialog  := False;
  rpDemonstraConcessaoINSS.TextFileName     := vBuffer;
  rpDemonstraConcessaoINSS.print;

  ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TRptDemonstraConcessaoINSS.rpDemonstraConcessaoINSSBeforePrint(
  Sender: TObject);
begin
  inherited;

  // Paulo Nobre - WO23998 - Inicio
  //  lbl_usuario.Caption := Sistema.NomeUsuario;
  lbl_usuario.Caption := UBeneficio.RetornaNomePessoaXUsuarioSistema(Sistema.IdUsuario);
  // Paulo Nobre - WO23998 - Fim

  {homologação}
  if Trim(CmpRptCM.ParamValues[8].AsString) = 'visualiza' then
     lblHomolog.Caption := 'Benefício Não Homologado - Apenas para Conferência'
  else
     lblHomolog.Caption := 'Benefício Homologado - '+CmpRptCM.ParamValues[8].AsString;
     

end;
// edilaine - SOL 253577-18174 / PPM 1327585 - fim


end.
