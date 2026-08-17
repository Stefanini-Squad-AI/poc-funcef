unit RPontoPessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppRegion, IvDictio, IvMulti,
  TXRB, uCtrlAssociaHorario, uCtrlHorarioVariavel, uCtrlHoraTrab, uCtrlFerias,
  uCtrlListTerceirosRH, uCtrlPessoaFuncionario, uCtrlBancoHoras, uCtrlGlobalRH, ppMemo;

type
  TRptPontoPessoa = class(TFrmCmReport)
    rpPontoPessoa: TppReport;
    rpOcorrPessHdrBnd: TppHeaderBand;
    ppLabel1: TppLabel;
    rpOcorrPessLbl2: TppLabel;
    rpOcorrPessLbl3: TppLabel;
    rpOcorrPessDBTxt1: TppDBText;
    rpOcorrPessSysVar1: TppSystemVariable;
    rpOcorrPessSysVar2: TppSystemVariable;
    rpOcorrPessLbl4: TppLabel;
    rpOcorrPessLblDATAINI: TppLabel;
    rpOcorrPessLbl5: TppLabel;
    rpOcorrPessLblDATAFINAL: TppLabel;
    rpOcorrPessDtlBnd: TppDetailBand;
    rpOcorrPessDBTxt6: TppDBText;
    rpOcorrPessDBTxt7: TppDBText;
    ppDBText1: TppDBText;
    rpOcorrPessSmryBnd: TppSummaryBand;
    rpOcorrPessGrp1: TppGroup;
    rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand;
    rpOcorrPessGrpFootBnd1: TppGroupFooterBand;
    rpOcorrPessLbl14: TppLabel;
    rpOcorrPessLbl15: TppLabel;
    rpOcorrPessGrp2: TppGroup;
    rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand;
    rpOcorrPessLbl6: TppLabel;
    rpOcorrPessLbl7: TppLabel;
    rpOcorrPessLbl8: TppLabel;
    ppShape1: TppShape;
    rpOcorrPessDBTxt3: TppDBText;
    rpOcorrPessDBTxt4: TppDBText;
    rpOcorrPessDBTxt5: TppDBText;
    rpOcorrPessGrpFootBnd2: TppGroupFooterBand;
    ppPontoPessoa: TppBDEPipeline;
    dsPontoPessoa: TwwDataSource;
    sqlPontoPessoa: TCMSqlParams;
    CdsPontoPessoa: TCMClientDataSet;
    ppLabel3: TppLabel;
    ppRegCab: TppRegion;
    rpOcorrPessLbl9: TppLabel;
    ppLabel4: TppLabel;
    rpOcorrPessLbl10: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLblEntrada: TppLabel;
    ppLblIntervalo: TppLabel;
    ppLblSaida: TppLabel;
    CdsHorarioVariavel: TCMClientDataSet;
    CdsHorario: TCMClientDataSet;
    ppLabel11: TppLabel;
    ppDBText2: TppDBText;
    ppLabel13: TppLabel;
    ppDBText3: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLine5: TppLine;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppLabel14: TppLabel;
    ppDBText7: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLblHoraExtra: TppLabel;
    ppLblAtraso: TppLabel;
    ppLblHoraExtraPessoa: TppLabel;
    ppLblAtrasoPessoa: TppLabel;
    ppLblHoraExtraTotal: TppLabel;
    ppLblAtrasoTotal: TppLabel;
    CdsFeriados: TCMClientDataSet;
    CdsFerias: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    ppLblAcessosPessoa: TppLabel;
    ppLblAcessosTotal: TppLabel;
    rpMarcacaoPontoAssinatura: TppMemo;
    lblSaldoBHAntes: TppLabel;
    lblSaldoBHApos: TppLabel;
    CdsPontoPessoa2: TCMClientDataSet;
    sqlPontoPessoa2: TCMSqlParams;
    ppLabel17: TppLabel;
    ppLblAdNot: TppLabel;
    ppLblAdNotPessoa: TppLabel;
    ppLblAdNotTotal: TppLabel;
    ppLabel18: TppLabel;
    ppLblHrTrbTotal: TppLabel;
    ppLabel19: TppLabel;
    ppLblHrTrbPessoa: TppLabel;
    ppLabel20: TppLabel;
    ppDBText8: TppDBText;
    rpCartaoPontoDBTxt3: TppDBText;
    rpCartaoPontoDBTxt4: TppDBText;
    rpCartaoPontoDBTxt2: TppDBText;
    ppDBText9: TppDBText;
    CdsFunc2: TCMClientDataSet;
    ppLabel21: TppLabel;
    CdsAfast: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsPontoPessoaAfterScroll(DataSet: TDataSet);
    procedure rpOcorrPessDtlBndBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rpOcorrPessGrpFootBnd2BeforePrint(Sender: TObject);
    procedure rpOcorrPessGrpFootBnd1BeforePrint(Sender: TObject);
    procedure rpOcorrPessGrpHdrBnd2BeforePrint(Sender: TObject);
  private
    iIdHorario, iHoraExtraTotal, iAtrasoTotal, iHoraExtraPessoa, iAtrasoPessoa,
    iAcessosTotal, iAcessosPessoa, iLin: Integer;
    sCampos, sHoraMin: string;
    iSaldoAntes, iSaldoApos, iTotAdicNot, iAdNotPessoa, iAdNotTotal: integer;
    ArrayEntradas, ArrayPassadas: variant;
    iHoraExtra, iAtraso, iMultExtra, iMultAtraso, iMultHoras, iMultNormal,
    iTotBatidas, iNumBatida: integer;
    // ECF 28/08/07 Alteração para totalizar Horas Trabalhadas
    iHorasTrab, iHrTrbPessoa, iHrTrbTotal: integer;
    //
    sHoraEnt, sHoraSai, sData, sMultHoraEnt, sMultHoraSai,
    sAdNotIni, sAdNotFim, sAdNotF24: string;
    dHoraEnt, dHoraSai: TDateTime;
    bMultBatida: boolean;

    CtrlAssociaHorario: TCtrlAssociaHorario;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlFerias: TCtrlFerias;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlBancoHoras: TCtrlBancoHoras;
    CtrlGlobalRH: TCtrlGlobalRH;
    procedure GerarDadosRelatorio;
    function  ConverteMinutos(Minutos: integer): string;
  end;

var
  RptPontoPessoa: TRptPontoPessoa;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptPontoPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAssociaHorario := TCtrlAssociaHorario.Create;
  CtrlAssociaHorario.InitializeAs(Padroes);

  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);

  CtrlFerias := TCtrlFerias.Create;
  CtrlFerias.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlBancoHoras := TCtrlBancoHoras.Create;
  CtrlBancoHoras.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  sCampos := 'ES.IDPAIS, E.IDCIDADES, RTRIM(ES.CODESTADO) AS UF, PJ.RAZAOSOCIAL, '+
    'PJ.NUMDOCUMENTO, C.NOME AS CIDADE, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO';

  sAdNotIni := '22:00'; // CdsEstab.FieldByName('ADICNOTURINI').asString;
  sAdNotFim := '05:00'; // CdsEstab.FieldByName('ADICNOTURFIM').asString;
  sAdNotF24 := IntToStr(FU.StrInt(Copy(sAdNotFim,1,2)) + 24) + Copy(sAdNotFim,3,3);
end;

procedure TRptPontoPessoa.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlAssociaHorario);
  FreeAndNil(CtrlHorarioVariavel);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlBancoHoras);
  FreeAndNil(CtrlGlobalRH);
end;

procedure TRptPontoPessoa.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lblSaldoBHAntes.Visible := (CmpRptCM.ParamByName('SaldoBanco').asBoolean);
  lblSaldoBHApos.Visible := (CmpRptCM.ParamByName('SaldoBanco').asBoolean);
  rpOcorrPessGrp2.NewPage := CmpRptCM.ParamByName('QuebaPag').asBoolean;
  rpMarcacaoPontoAssinatura.Visible := CmpRptCM.ParamByName('QuebaPag').asBoolean;
  rpOcorrPessGrpFootBnd1.Visible := CmpRptCM.ParamByName('Resumo').asBoolean;
  rpCartaoPontoDBTxt2.DisplayFormat := '99.999.999/9999-99;0;_';

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA,');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  F.MATRICULA, F.IDHORARIO,');
    Add('  RTRIM(PF.NOME) AS NOME,');
    Add('  C.TITULO AS CARGO,');
    Add('  CC.NOME AS SETOR,');
    Add('  AF.ENTRADA, AF.SAIDAINTERVALO, AF.RETORNOINTERVALO,');
    Add('  TO_CHAR(AF.ENTRADA,''HH24:MI'') AS HORAENTRA,');
    Add('  TO_CHAR(AF.SAIDAINTERVALO,''HH24:MI'') AS HORAINT1,');
    Add('  TO_CHAR(AF.RETORNOINTERVALO,''HH24:MI'') AS HORAINT2,');
    Add('  TO_CHAR(AF.SAIDA,''HH24:MI'') AS HORASAIDA,');
    Add('  TO_CHAR(AF.SAIDA,''DD/MM HH24:MI'') AS SAIDA, TO_DATE(TO_CHAR(AF.ENTRADA,''DD/MM/YYYY''),''DD/MM/YYYY'') AS DATAREF, 0 AS FALTAS,');
    Add('  DECODE(NVL(AF.FLGABONADO,0), 0, ''   '', ''Sim'') AS ABONO,');
    Add('  AF.CODTIPOOCMED, M.DESCRTIPOOCMED AS DESCRICAO, AF.OBSERVACAO,');
    Add('  CGC.NUM AS CGC,');
    Add('  CGC.MASCARA AS MASCARA_CGC,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  RTRIM(ES.CODESTADO) AS UF,');
    Add('  (');
    Add('    RTRIM(E.LOGRADOURO) ||');
    Add('    (CASE');
    Add('       WHEN E.NUMERO IS NULL THEN ''''');
    Add('       ELSE '', ''|| TO_CHAR(E.NUMERO)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN E.COMPLEMENTO IS NULL THEN ''''');
    Add('       ELSE '' - '' || RTRIM(E.COMPLEMENTO)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN E.BAIRRO IS NULL THEN ''''');
    Add('       ELSE '' - '' || RTRIM(E.BAIRRO)');
    Add('     END)');
    Add('  ) AS ENDERECO,');
    Add('  RTRIM(ES.NOMEESTADO) AS ESTADO');
    Add('FROM');
    Add('  PESSOA PF, PESSOA PJ, PESSOAFISICA PEFIS, FUNCIONARIO F, ACESSOFUNC AF,');
    Add('  CARGO C, CENTCUST CC, ENDPESS E, ESTADO ES, CIDADES,');
    // -------------------------------------------------------------------- //
    Add('  (SELECT CODTIPOOCMED, DESCRTIPOOCMED FROM TIPOCMED');
    if (CmpRptCM.ParamByName('ListaIdMotAbono').asString <> '') then
    begin
      Add('    WHERE ');
      if (Pos(',', CmpRptCM.ParamByName('ListaIdMotAbono').asString) > 0) then
        Add('  (CODTIPOOCMED IN (' +CmpRptCM.ParamByName('ListaIdMotAbono').asString+ '))')
      else
        Add('  (CODTIPOOCMED  = ' +CmpRptCM.ParamByName('ListaIdMotAbono').asString+ ')');
    end;
    Add('    ) M, ');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, TDP.MASCARA,');
    Add('          RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA) AND');
    Add('          (DP.IDDOCUMENTO      = TDP.IDDOCUMENTO)) CGC');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    // Funcionários selecionados
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (PF.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,8))
    else
      Add('  (PF.IDPESSOA         = -1) AND');

    Add('  (AF.ENTRADA         >= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  (AF.ENTRADA         <= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')+1) AND');
    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
    Add('  (PF.IDPESSOA         = AF.IDPESSOA) AND');

    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA         = CGC.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL   = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA         = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO    = ES.IDESTADO) AND');

    if (CmpRptCM.ParamByName('Motivo').asBoolean) then
      Add('  (AF.CODTIPOOCMED     = M.CODTIPOOCMED) AND')
    else
      Add('  (AF.CODTIPOOCMED     = M.CODTIPOOCMED(+)) AND');

    Add('  (AF.INDFUNCAO        = ''P'') AND');

    if (CmpRptCM.ParamByName('Observ').asBoolean) then
      Add('  (AF.OBSERVACAO    IS NOT NULL) AND');

    Add('  (F.IDCARGO           = C.IDCARGO(+))');
    Add('ORDER BY');
    Add('  UPPER(NOME), AF.ENTRADA');
    SaveToFile('C:\qry.txt');
  end;
  GerarDadosRelatorio;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsPontoPessoa.RecordCount;

  rpOcorrPessLblDATAINI.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  rpOcorrPessLblDATAFINAL.Caption := CmpRptCM.ParamByName('DataFinal').asString;
  frmAguarde.Apaga;
end;

procedure TRptPontoPessoa.CdsPontoPessoaAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptPontoPessoa.GerarDadosRelatorio;
var
  c: byte;
  sIdPessoa, sNome, sMatricula, sCargo: string;
  bIncEmpregado: boolean;
  SalvaiIdHorario: integer;
begin
  dmCds.sql.Open;
  sqlPontoPessoa.Open;
  sqlPontoPessoa2.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    sIdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asString;
    sNome := dmCds.Cds.FieldByName('NOME').asString;
    sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
    sCargo := dmCds.Cds.FieldByName('CARGO').asString;
    iIdHorario := dmCds.Cds.FieldByName('IDHORARIO').asInteger;
    bIncEmpregado := true;
    while not(dmCds.Cds.EOF) do
    begin
      CdsPontoPessoa.Append;
      for c:=0 to dmCds.Cds.FieldCount-1 do
        CdsPontoPessoa.FieldByName(dmCds.Cds.Fields[c].FieldName).Value :=
          dmCds.Cds.FieldByName(dmCds.Cds.Fields[c].FieldName).Value;

      // ECF 23/08/07 OBSERVAÇÃO PARA OS DIAS COM BATIDAS INCOMPLETAS
      if ((not CdsPontoPessoa.FieldByName('ENTRADA').isNull) and
          (CdsPontoPessoa.FieldByName('SAIDA').isNull)) or
         ((not CdsPontoPessoa.FieldByName('SAIDAINTERVALO').isNull) and
          (CdsPontoPessoa.FieldByName('RETORNOINTERVALO').isNull)) or
         ((CdsPontoPessoa.FieldByName('SAIDAINTERVALO').isNull) and
          (not CdsPontoPessoa.FieldByName('RETORNOINTERVALO').isNull)) then
        CdsPontoPessoa.FieldByName('OBSERVACAO').asString := 'Dados Incompletos';

      CdsPontoPessoa2.Append;
      for c:=0 to dmCds.Cds.FieldCount-1 do
        CdsPontoPessoa2.FieldByName(dmCds.Cds.Fields[c].FieldName).Value :=
          dmCds.Cds.FieldByName(dmCds.Cds.Fields[c].FieldName).Value;

      // ECF 23/08/07 OBSERVAÇÃO PARA OS DIAS COM BATIDAS INCOMPLETAS
      if ((not CdsPontoPessoa2.FieldByName('ENTRADA').isNull) and
          (CdsPontoPessoa2.FieldByName('SAIDA').isNull)) or
         ((not CdsPontoPessoa2.FieldByName('SAIDAINTERVALO').isNull) and
          (CdsPontoPessoa2.FieldByName('RETORNOINTERVALO').isNull)) or
         ((CdsPontoPessoa2.FieldByName('SAIDAINTERVALO').isNull) and
          (not CdsPontoPessoa2.FieldByName('RETORNOINTERVALO').isNull)) then
        CdsPontoPessoa2.FieldByName('OBSERVACAO').asString := 'Dados Incompletos';

      if (bIncEmpregado) then
      begin
        CdsPontoPessoa.FieldByName('NUMEMPREGADO').asInteger := 1;
        bIncEmpregado := false;
      end;

      CdsPontoPessoa.Post;

      dmCds.Cds.Next;

      if (sIdPessoa <> dmCds.Cds.FieldByName('IDPESSOA').asString) or (dmCds.Cds.Eof) then
      begin
        // Rotina de inserir os dias de falta, férias, folgas ou feriados caso sejam pedidos
        if ((CmpRptCM.ParamByName('Falta').asBoolean) or
            (CmpRptCM.ParamByName('Ferias').asBoolean) or
            (CmpRptCM.ParamByName('Feriado').asBoolean)) and
           (not CmpRptCM.ParamByName('Motivo').asBoolean) and
           (not CmpRptCM.ParamByName('Observ').asBoolean) then
          for c := 0 to round(CmpRptCM.ParamByName('DataFinal').asDateTime - CmpRptCM.ParamByName('DataInicial').asDateTime) do
          begin
            SalvaiIdHorario := iIdHorario;
            // Preencher o horário da pessoa
            CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
              StrToFloat(sIdPessoa),
              DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime + c),
              DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime + c));

            if not (CdsHorarioVariavel.IsEmpty) then
              iIdHorario := CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;

            // VERIFICAR AFASTAMENTOS, FERIADOS E FERIAS
            CdsFerias.Data := CtrlFerias.ListFeriasNoDia(sIdPessoa,
              CmpRptCM.ParamByName('DataInicial').asDateTime + c);
            if (not CdsFerias.IsEmpty) then
              iIdHorario := -1;

            CdsAfast.Data := CtrlPessoaFuncionario.ListSitFuncionarioNaData(sIdPessoa,
              CmpRptCM.ParamByName('DataInicial').asDateTime + c);
            if (CdsAfast.FieldByName('TIPOSIT').asString = 'F') then
              iIdHorario := -1;

            CdsFunc.Data := CtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(StrToFloat(sIdPessoa), sCampos);
            CdsFunc2.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(StrToFloat(sIdPessoa));

            CdsFeriados.Data := CtrlListTerceirosRH.ListFeriados(
              CdsFunc.FieldByName('IDCIDADES').asInteger,
              CdsFunc.FieldByName('IDPAIS').asInteger,
              CdsFunc.FieldByName('UF').asString,
              CmpRptCM.ParamByName('DataInicial').asDateTime + c, CmpRptCM.ParamByName('DataInicial').asDateTime + c);
            if (not CdsFeriados.IsEmpty) then
              iIdHorario := -1;

            CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(iIdHorario);
            if (CmpRptCM.ParamByName('Falta').asBoolean) and
               (CdsHorario.Locate('IDDIASEMANA',
                DayOfWeek(CmpRptCM.ParamByName('DataInicial').asDateTime + c), [])) and
               (not CdsPontoPessoa.Locate('IDPESSOA;DATAREF',
                  VarArrayOf([StrToFloat(sIdPessoa),
                    StrToDate(DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime + c))]), [])) then
            begin
              // DAR APPEND EM CdsPontoPessoa DO DIA DE FALTA
              CdsPontoPessoa.Append;
              CdsPontoPessoa.FieldByName('IDPESSOA').asString := sIdPessoa;
              CdsPontoPessoa.FieldByName('NOME').asString := sNome;
              CdsPontoPessoa.FieldByName('MATRICULA').asString := sMatricula;
              CdsPontoPessoa.FieldByName('CARGO').asString := sCargo;
              CdsPontoPessoa.FieldByName('DATAREF').asDateTime := CmpRptCM.ParamByName('DataInicial').asDateTime + c;
              CdsPontoPessoa.FieldByName('FALTAS').asInteger := 1;
              CdsPontoPessoa.FieldByName('EMPRESA').asString := CdsFunc.FieldByName('RAZAOSOCIAL').asString;
              CdsPontoPessoa.FieldByName('CGC').asString := CdsFunc.FieldByName('NUMDOCUMENTO').asString;
              CdsPontoPessoa.FieldByName('SETOR').asString := CdsFunc2.FieldByName('CENTROCUSTO').asString;
              CdsPontoPessoa.FieldByName('CIDADE').asString := CdsFunc.FieldByName('CIDADE').asString;
              CdsPontoPessoa.FieldByName('UF').asString := CdsFunc.FieldByName('UF').asString;
              CdsPontoPessoa.FieldByName('ENDERECO').asString :=
                trim(CdsFunc.FieldByName('LOGRADOURO').asString)+
                FU.IFF(CdsFunc.FieldByName('NUMERO').asString='','',', '+trim(CdsFunc.FieldByName('NUMERO').asString))+
                FU.IFF(CdsFunc.FieldByName('COMPLEMENTO').asString='','',' - '+trim(CdsFunc.FieldByName('COMPLEMENTO').asString))+
                FU.IFF(CdsFunc.FieldByName('BAIRRO').asString='','',' - '+trim(CdsFunc.FieldByName('BAIRRO').asString));
              CdsPontoPessoa.Post;
            end;

            // INSERIR FÉRIAS
            if (not CdsFerias.IsEmpty) and
               (CmpRptCM.ParamByName('Ferias').asBoolean) and
               (not CdsPontoPessoa.Locate('IDPESSOA;DATAREF',
                  VarArrayOf([StrToFloat(sIdPessoa),
                    StrToDate(DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime + c))]), [])) then
            begin
              // DAR APPEND EM CdsPontoPessoa DO DIA DE FÉRIAS
              CdsPontoPessoa.Append;
              CdsPontoPessoa.FieldByName('IDPESSOA').asString := sIdPessoa;
              CdsPontoPessoa.FieldByName('NOME').asString := sNome;
              CdsPontoPessoa.FieldByName('MATRICULA').asString := sMatricula;
              CdsPontoPessoa.FieldByName('CARGO').asString := sCargo;
              CdsPontoPessoa.FieldByName('DATAREF').asDateTime := CmpRptCM.ParamByName('DataInicial').asDateTime + c;
              CdsPontoPessoa.FieldByName('OBSERVACAO').asString := 'FÉRIAS';
              CdsPontoPessoa.FieldByName('EMPRESA').asString := CdsFunc.FieldByName('RAZAOSOCIAL').asString;
              CdsPontoPessoa.FieldByName('CGC').asString := CdsFunc.FieldByName('NUMDOCUMENTO').asString;
              CdsPontoPessoa.FieldByName('SETOR').asString := CdsFunc2.FieldByName('CENTROCUSTO').asString;
              CdsPontoPessoa.FieldByName('CIDADE').asString := CdsFunc.FieldByName('CIDADE').asString;
              CdsPontoPessoa.FieldByName('UF').asString := CdsFunc.FieldByName('UF').asString;
              CdsPontoPessoa.FieldByName('ENDERECO').asString :=
                trim(CdsFunc.FieldByName('LOGRADOURO').asString)+
                FU.IFF(CdsFunc.FieldByName('NUMERO').asString='','',', '+trim(CdsFunc.FieldByName('NUMERO').asString))+
                FU.IFF(CdsFunc.FieldByName('COMPLEMENTO').asString='','',' - '+trim(CdsFunc.FieldByName('COMPLEMENTO').asString))+
                FU.IFF(CdsFunc.FieldByName('BAIRRO').asString='','',' - '+trim(CdsFunc.FieldByName('BAIRRO').asString));
              CdsPontoPessoa.Post;
            end;

            // INSERIR AFASTAMENTO
            if (CdsFerias.IsEmpty) and (CdsAfast.FieldByName('TIPOSIT').asString = 'F') and
               (CmpRptCM.ParamByName('Ferias').asBoolean) and
               (not CdsPontoPessoa.Locate('IDPESSOA;DATAREF',
                  VarArrayOf([StrToFloat(sIdPessoa),
                    StrToDate(DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime + c))]), [])) then
            begin
              // DAR APPEND EM CdsPontoPessoa DO DIA DE AFASTAMENTO
              CdsPontoPessoa.Append;
              CdsPontoPessoa.FieldByName('IDPESSOA').asString := sIdPessoa;
              CdsPontoPessoa.FieldByName('NOME').asString := sNome;
              CdsPontoPessoa.FieldByName('MATRICULA').asString := sMatricula;
              CdsPontoPessoa.FieldByName('CARGO').asString := sCargo;
              CdsPontoPessoa.FieldByName('DATAREF').asDateTime := CmpRptCM.ParamByName('DataInicial').asDateTime + c;
              CdsPontoPessoa.FieldByName('OBSERVACAO').asString := CdsAfast.FieldByName('DESCRICAO').asString;
              CdsPontoPessoa.FieldByName('EMPRESA').asString := CdsFunc.FieldByName('RAZAOSOCIAL').asString;
              CdsPontoPessoa.FieldByName('CGC').asString := CdsFunc.FieldByName('NUMDOCUMENTO').asString;
              CdsPontoPessoa.FieldByName('SETOR').asString := CdsFunc2.FieldByName('CENTROCUSTO').asString;
              CdsPontoPessoa.FieldByName('CIDADE').asString := CdsFunc.FieldByName('CIDADE').asString;
              CdsPontoPessoa.FieldByName('UF').asString := CdsFunc.FieldByName('UF').asString;
              CdsPontoPessoa.FieldByName('ENDERECO').asString :=
                trim(CdsFunc.FieldByName('LOGRADOURO').asString)+
                FU.IFF(CdsFunc.FieldByName('NUMERO').asString='','',', '+trim(CdsFunc.FieldByName('NUMERO').asString))+
                FU.IFF(CdsFunc.FieldByName('COMPLEMENTO').asString='','',' - '+trim(CdsFunc.FieldByName('COMPLEMENTO').asString))+
                FU.IFF(CdsFunc.FieldByName('BAIRRO').asString='','',' - '+trim(CdsFunc.FieldByName('BAIRRO').asString));
              CdsPontoPessoa.Post;
            end;

            // INSERIR FERIADO
            if (CdsFerias.IsEmpty) and (not CdsFeriados.IsEmpty) and
               (CmpRptCM.ParamByName('Feriado').asBoolean) and
               (not CdsPontoPessoa.Locate('IDPESSOA;DATAREF',
                  VarArrayOf([StrToFloat(sIdPessoa),
                    StrToDate(DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime + c))]), [])) then
            begin
              // DAR APPEND EM CdsPontoPessoa DO DIA FERIADO
              CdsPontoPessoa.Append;
              CdsPontoPessoa.FieldByName('IDPESSOA').asString := sIdPessoa;
              CdsPontoPessoa.FieldByName('NOME').asString := sNome;
              CdsPontoPessoa.FieldByName('MATRICULA').asString := sMatricula;
              CdsPontoPessoa.FieldByName('CARGO').asString := sCargo;
              CdsPontoPessoa.FieldByName('DATAREF').asDateTime := CmpRptCM.ParamByName('DataInicial').asDateTime + c;
              CdsPontoPessoa.FieldByName('OBSERVACAO').asString := 'FERIADO';
              CdsPontoPessoa.FieldByName('EMPRESA').asString := CdsFunc.FieldByName('RAZAOSOCIAL').asString;
              CdsPontoPessoa.FieldByName('CGC').asString := CdsFunc.FieldByName('NUMDOCUMENTO').asString;
              CdsPontoPessoa.FieldByName('SETOR').asString := CdsFunc2.FieldByName('CENTROCUSTO').asString;
              CdsPontoPessoa.FieldByName('CIDADE').asString := CdsFunc.FieldByName('CIDADE').asString;
              CdsPontoPessoa.FieldByName('UF').asString := CdsFunc.FieldByName('UF').asString;
              CdsPontoPessoa.FieldByName('ENDERECO').asString :=
                trim(CdsFunc.FieldByName('LOGRADOURO').asString)+
                FU.IFF(CdsFunc.FieldByName('NUMERO').asString='','',', '+trim(CdsFunc.FieldByName('NUMERO').asString))+
                FU.IFF(CdsFunc.FieldByName('COMPLEMENTO').asString='','',' - '+trim(CdsFunc.FieldByName('COMPLEMENTO').asString))+
                FU.IFF(CdsFunc.FieldByName('BAIRRO').asString='','',' - '+trim(CdsFunc.FieldByName('BAIRRO').asString));
              CdsPontoPessoa.Post;
            end;

            // INSERIR FOLGA
            if (CdsFerias.IsEmpty) and (CdsFeriados.IsEmpty) and
               (CmpRptCM.ParamByName('Feriado').asBoolean) and
               (not CdsHorario.Locate('IDDIASEMANA',
                DayOfWeek(CmpRptCM.ParamByName('DataInicial').asDateTime + c), [])) and
               (not CdsPontoPessoa.Locate('IDPESSOA;DATAREF',
                  VarArrayOf([StrToFloat(sIdPessoa),
                    StrToDate(DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime + c))]), [])) then
            begin
              // DAR APPEND EM CdsPontoPessoa DO DIA DE FOLGA
              CdsPontoPessoa.Append;
              CdsPontoPessoa.FieldByName('IDPESSOA').asString := sIdPessoa;
              CdsPontoPessoa.FieldByName('NOME').asString := sNome;
              CdsPontoPessoa.FieldByName('MATRICULA').asString := sMatricula;
              CdsPontoPessoa.FieldByName('CARGO').asString := sCargo;
              CdsPontoPessoa.FieldByName('DATAREF').asDateTime := CmpRptCM.ParamByName('DataInicial').asDateTime + c;
              CdsPontoPessoa.FieldByName('OBSERVACAO').asString :=
                FU.IFF(DayOfWeek(CmpRptCM.ParamByName('DataInicial').asDateTime + c)=1, 'DOMINGO',
                FU.IFF(DayOfWeek(CmpRptCM.ParamByName('DataInicial').asDateTime + c)=7, 'SÁBADO','FOLGA'));
              CdsPontoPessoa.FieldByName('EMPRESA').asString := CdsFunc.FieldByName('RAZAOSOCIAL').asString;
              CdsPontoPessoa.FieldByName('CGC').asString := CdsFunc.FieldByName('NUMDOCUMENTO').asString;
              CdsPontoPessoa.FieldByName('SETOR').asString := CdsFunc2.FieldByName('CENTROCUSTO').asString;
              CdsPontoPessoa.FieldByName('CIDADE').asString := CdsFunc.FieldByName('CIDADE').asString;
              CdsPontoPessoa.FieldByName('UF').asString := CdsFunc.FieldByName('UF').asString;
              CdsPontoPessoa.FieldByName('ENDERECO').asString :=
                trim(CdsFunc.FieldByName('LOGRADOURO').asString)+
                FU.IFF(CdsFunc.FieldByName('NUMERO').asString='','',', '+trim(CdsFunc.FieldByName('NUMERO').asString))+
                FU.IFF(CdsFunc.FieldByName('COMPLEMENTO').asString='','',' - '+trim(CdsFunc.FieldByName('COMPLEMENTO').asString))+
                FU.IFF(CdsFunc.FieldByName('BAIRRO').asString='','',' - '+trim(CdsFunc.FieldByName('BAIRRO').asString));
              CdsPontoPessoa.Post;
            end;

            iIdHorario := SalvaiIdHorario;
          end;

        bIncEmpregado := true;
        sIdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asString;
        sNome := dmCds.Cds.FieldByName('NOME').asString;
        sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
        sCargo := dmCds.Cds.FieldByName('CARGO').asString;
      end;
    end;
    CdsPontoPessoa.First;
  end;
end;

procedure TRptPontoPessoa.rpOcorrPessDtlBndBeforePrint(Sender: TObject);
var
  dtSaidaIntervalo, dtRetornoIntervalo: TDateTime;
begin
  inherited;
  rpOcorrPessDtlBnd.Visible := true; // em princípio, será impresso

  dtSaidaIntervalo := 0;   dtRetornoIntervalo := 0;

  // Desprezar estes registros (tem motivo, mas este não foi selecionado)
  if (CdsPontoPessoa.FieldByName('CODTIPOOCMED').asInteger > 0) and
     (CdsPontoPessoa.FieldByName('DESCRICAO').asString = '') then
  begin
    rpOcorrPessDtlBnd.Visible := false;
    exit;
  end;

  // Preencher o horário da pessoa
  CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
    CdsPontoPessoa.FieldByName('IDPESSOA').asFloat,
    CdsPontoPessoa.FieldByName('DATAREF').asString,
    CdsPontoPessoa.FieldByName('DATAREF').asString);

  if (CdsHorarioVariavel.IsEmpty) then
  begin
    iIdHorario := CdsPontoPessoa.FieldByName('IDHORARIO').asInteger;
    if iIdHorario = 0 then
      iIdHorario := CtrlHoraTrab.ListHoraFunc(CdsPontoPessoa.FieldByName('IDPESSOA').asFloat);
  end
  else
    iIdHorario := CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;

  // VERIFICAR FERIADOS E FERIAS
  CdsFerias.Data := CtrlFerias.ListFeriasNoDia(CdsPontoPessoa.FieldByName('IDPESSOA').asString,
    CdsPontoPessoa.FieldByName('DATAREF').asDateTime);
  if (not CdsFerias.IsEmpty) then
    iIdHorario := -1;

  CdsFunc.Data := CtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(CdsPontoPessoa.FieldByName('IDPESSOA').asFloat, sCampos);

  CdsFeriados.Data := CtrlListTerceirosRH.ListFeriados(
    CdsFunc.FieldByName('IDCIDADES').asInteger,
    CdsFunc.FieldByName('IDPAIS').asInteger,
    CdsFunc.FieldByName('UF').asString,
    CdsPontoPessoa.FieldByName('DATAREF').asDateTime, CdsPontoPessoa.FieldByName('DATAREF').asDateTime);
  if (not CdsFeriados.IsEmpty) then
    iIdHorario := -1;

  CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(iIdHorario);
  if (CdsPontoPessoa.FieldByName('DATAREF').asString = '') or not
     (CdsHorario.Locate('IDDIASEMANA',
      DayOfWeek(StrToDate(CdsPontoPessoa.FieldByName('DATAREF').asString)), [])) then
  begin
    ppLblEntrada.Caption := '';
    ppLblIntervalo.Caption := '';
    ppLblSaida.Caption := '';
  end
  else
  begin
    ppLblEntrada.Caption := CdsHorario.FieldByName('INICIOEXPEDIENTE').asString;
    ppLblIntervalo.Caption := CdsHorario.FieldByName('INICIOALMOCO').asString + ' - ' +
      CdsHorario.FieldByName('FINALALMOCO').asString;
    ppLblSaida.Caption := CdsHorario.FieldByName('FINALEXPEDIENTE').asString;
    dtSaidaIntervalo := StrToDateTime(CdsPontoPessoa.FieldByName('DATAREF').asString + ' ' +
      CdsHorario.FieldByName('INICIOALMOCO').asString);
    dtRetornoIntervalo := StrToDateTime(CdsPontoPessoa.FieldByName('DATAREF').asString + ' ' +
      CdsHorario.FieldByName('FINALALMOCO').asString);
    if CdsHorario.FieldByName('INICIOALMOCO').asString < CdsHorario.FieldByName('INICIOEXPEDIENTE').asString then
      dtSaidaIntervalo := dtSaidaIntervalo + 1;
    if CdsHorario.FieldByName('FINALALMOCO').asString < CdsHorario.FieldByName('INICIOEXPEDIENTE').asString then
      dtRetornoIntervalo := dtRetornoIntervalo + 1;
  end;


  // ECF 27/08/07 Preencher horário de intervalo com o horário normal
  if (not CdsPontoPessoa.FieldByName('SAIDAINTERVALO').isNull) then
    dtSaidaIntervalo := CdsPontoPessoa.FieldByName('SAIDAINTERVALO').asDateTime;
  if (not CdsPontoPessoa.FieldByName('RETORNOINTERVALO').isNull) then
    dtRetornoIntervalo := CdsPontoPessoa.FieldByName('RETORNOINTERVALO').asDateTime;

  if (CdsPontoPessoa.FieldByName('SAIDAINTERVALO').isNull) and
     (CdsPontoPessoa.FieldByName('RETORNOINTERVALO').isNull) and
     (not CdsPontoPessoa.FieldByName('ENTRADA').isNull) and
     (not CdsPontoPessoa.FieldByName('SAIDA').isNull) and
     (not CdsHorario.FieldByName('INICIOALMOCO').isNull) and
     (not CdsHorario.FieldByName('FINALALMOCO').isNull) and
     (CdsPontoPessoa.FieldByName('ENTRADA').asDateTime < dtSaidaIntervalo) and
     (CdsPontoPessoa.FieldByName('SAIDA').asDateTime > dtRetornoIntervalo) then
  begin
    CdsPontoPessoa.Edit;
    CdsPontoPessoa.FieldByName('HORAINT1').asString := CdsHorario.FieldByName('INICIOALMOCO').asString;
    CdsPontoPessoa.FieldByName('HORAINT2').asString := CdsHorario.FieldByName('FINALALMOCO').asString;
    CdsPontoPessoa.Post;
  end;
  // ECF Final 27/08/07

  // Horas Extras e Atrasos
  ppLblHoraExtra.Caption := '';
  ppLblAtraso.Caption := '';
  ppLblAdNot.Caption := '';
  iHoraExtra := 0;
  iAtraso := 0;
  // ECF 28/08/07 Alteração para totalizar Horas Trabalhadas
  iHorasTrab := 0;
  //

  iLin := Round(trunc(CdsPontoPessoa.FieldByName('ENTRADA').asDateTime) -
    CmpRptCM.ParamByName('DataInicial').asDateTime) + 1;
  if (iLin > 0) and (trim(CdsPontoPessoa.FieldByName('ABONO').asString) = '') then
    ArrayPassadas[iLin] := ArrayPassadas[iLin] + 1; // Soma batidas passadas no mesmo dia

  if (CdsPontoPessoa.FieldByName('ABONO').asString <> 'Sim') then
  begin
///
    bMultBatida := false;
    if (iLin > 0) then
    if (ArrayEntradas[iLin]) > 1 then // Tratar multiplas batidas
    begin
      bMultBatida := true;
      iTotAdicNot := 0;
      sData := DateToStr(trunc(CdsPontoPessoa.FieldByName('ENTRADA').asDateTime));
      iTotBatidas := ArrayEntradas[iLin];
      iNumBatida := ArrayPassadas[iLin];
      sHoraEnt := ppLblEntrada.Caption;
      sHoraSai := ppLblSaida.Caption;
      dHoraEnt := StrToDateTime(sData+' '+sHoraEnt);
      dHoraSai := StrToDateTime(sData+' '+sHoraSai);
      if dHoraSai < dHoraEnt then
        dHoraSai := dHoraSai + 1;

      sMultHoraEnt := FormatDateTime('HH:NN',CdsPontoPessoa.FieldByName('ENTRADA').asDateTime);

      sMultHoraSai := FormatDateTime('HH:NN',CdsPontoPessoa.FieldByName('SAIDA').asDateTime);

      // VERIF. ADIC. NOTURNO
      if (sMultHoraEnt < sAdNotFim) then
        if (sMultHoraSai > sAdNotFim) then
          iTotAdicNot := iTotAdicNot +
            (FU.StrInt(Copy(sAdNotFim,1,2)) - FU.StrInt(Copy(sMultHoraEnt,1,2))) * 60 +
            (FU.StrInt(Copy(sAdNotFim,4,2)) - FU.StrInt(Copy(sMultHoraEnt,4,2)))
        else
          iTotAdicNot := iTotAdicNot +
            (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
            (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)));

      if (sMultHoraSai < sMultHoraEnt) then
        sMultHoraSai := IntToStr(FU.StrInt(Copy(sMultHoraSai,1,2)) + 24) + Copy(sMultHoraSai,3,3);

      if (sMultHoraEnt > sAdNotIni) then
        sAdNotIni := sMultHoraEnt;

      if (sMultHoraSai > sAdNotIni) then
        if (sMultHoraSai < sAdNotF24) then
          iTotAdicNot := iTotAdicNot +
            (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
            (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)))
        else
          iTotAdicNot := iTotAdicNot +
            (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
            (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));

      // FIM ADIC. NOTURNO

      // Se for a primeira batida, verificar a tolerancia de entrada e extra antecip.
      if (iNumBatida = 1) then
      begin
        iMultAtraso := 0; iMultExtra := 0; iMultHoras := 0;
        if (Abs(round(24*60*(dHoraEnt -
          CdsPontoPessoa.FieldByName('ENTRADA').asDateTime))) > CmpRptCM.ParamByName('TolEntrada').asInteger) then
        begin
          if (dHoraEnt > CdsPontoPessoa.FieldByName('ENTRADA').asDateTime) then
          begin
            iMultExtra := iMultExtra + round(24*60*(dHoraEnt -
              CdsPontoPessoa.FieldByName('ENTRADA').asDateTime));
            //iMultExtraAntes := iMultExtraAntes + round(24*60*(dHoraEnt -
            //  CdsPontoPessoa.FieldByName('ENTRADA').asDateTime));
          end;
          dHoraEnt := CdsPontoPessoa.FieldByName('ENTRADA').asDateTime;
        end;
      end
      else
        dHoraEnt := CdsPontoPessoa.FieldByName('ENTRADA').asDateTime;

      //  Se for a última batida, verificar a tolerancia de saida e extra após exped.
      if (iNumBatida = iTotBatidas) then
      begin
        if (Abs(round(24*60*(dHoraSai -
          CdsPontoPessoa.FieldByName('SAIDA').asDateTime))) > CmpRptCM.ParamByName('TolSaida').asInteger) then
        begin
          if (dHoraSai < CdsPontoPessoa.FieldByName('SAIDA').asDateTime) then
          begin
            iMultExtra := iMultExtra + round(24*60*(- dHoraSai +
              CdsPontoPessoa.FieldByName('SAIDA').asDateTime));
            //iMultExtraApos := iMultExtraApos + round(24*60*(- dHoraSai +
            //  CdsPontoPessoa.FieldByName('SAIDA').asDateTime));
          end;
          dHoraSai := CdsPontoPessoa.FieldByName('SAIDA').asDateTime;
        end;
      end
      else
        dHoraSai := CdsPontoPessoa.FieldByName('SAIDA').asDateTime;

      iMultHoras := iMultHoras + round(24*60*(dHoraSai - dHoraEnt));

      // Abater o horário de intervalo
      if (copy(trim(ppLblIntervalo.Caption),1,5) <> '') and
         (sMultHoraSai >= copy(trim(ppLblIntervalo.Caption),9,5)) and
         (sMultHoraEnt <= copy(trim(ppLblIntervalo.Caption),1,5)) then
        iMultHoras := iMultHoras -
          StrToInt(copy(trim(ppLblIntervalo.Caption),9,2)) * 60 -
          StrToInt(copy(trim(ppLblIntervalo.Caption),12,2)) +
          StrToInt(copy(trim(ppLblIntervalo.Caption),1,2)) * 60 +
          StrToInt(copy(trim(ppLblIntervalo.Caption),4,2));
      //

      // finalizar
      // ESTE RELATÓRIO NÃO VAI ENTRAR NO MÉRITO DO BANCO DE HORAS
      // VAI APENAS EXIBIR O SALDO NO INÍCIO DO PERÍODO E,
      // SE FOR DIFERENTE, O SALDO NO FINAL DO PERÍODO,
      // SEM FAZER NENHUM CÁLCULO DE UM PARA OUTRO, POIS NÃO HÁ
      // COMO SABER O QUE SERÁ FEITO NO FECHAMENTO DO PONTO
      if (iNumBatida = iTotBatidas) then
      begin
        // ECF 28/08/07 Alteração para totalizar Horas Trabalhadas
        iHorasTrab := iMultHoras;
        //
        if (ppLblEntrada.Caption = '') then
          iMultExtra := iMultHoras
        else
        begin
          iMultNormal :=
            StrToInt(copy(trim(ppLblSaida.Caption),1,2)) * 60 +
            StrToInt(copy(trim(ppLblSaida.Caption),4,2)) -
            StrToInt(copy(trim(ppLblEntrada.Caption),1,2)) * 60 -
            StrToInt(copy(trim(ppLblEntrada.Caption),4,2)) -
            FU.IFF(copy(trim(ppLblIntervalo.Caption),1,2) = '', 0,
              StrToInt(copy(trim(ppLblIntervalo.Caption),9,2)) * 60 +
              StrToInt(copy(trim(ppLblIntervalo.Caption),12,2)) -
              StrToInt(copy(trim(ppLblIntervalo.Caption),1,2)) * 60 -
              StrToInt(copy(trim(ppLblIntervalo.Caption),4,2)));

          iMultAtraso := iMultAtraso + iMultNormal - iMultHoras + iMultExtra;

          iAtraso := iAtraso + iMultAtraso;
        end;
        iHoraExtra := iHoraExtra + iMultExtra;
      end;  // Final do "finalizar"
    end; // // Final do Tratamento de multiplas batidas


///
    if (not bMultBatida) then
    begin
      iTotAdicNot:= 0;
      // ECF 23/08/07 PARA EVITAR ERRO NOS DIAS COM BATIDAS INCOMPLETAS
      if (not CdsPontoPessoa.FieldByName('ENTRADA').isNull) and
         (not CdsPontoPessoa.FieldByName('SAIDA').isNull) then
      begin
        sMultHoraEnt := FormatDateTime('HH:NN',CdsPontoPessoa.FieldByName('ENTRADA').asDateTime);
        sMultHoraSai := FormatDateTime('HH:NN',CdsPontoPessoa.FieldByName('SAIDA').asDateTime);
      end
      else
        sMultHoraEnt := '';
      // VERIF. ADIC. NOTURNO
      if (sMultHoraEnt <> '') then
      begin
        if (sMultHoraEnt < sAdNotFim) then
          if (sMultHoraSai > sAdNotFim) then
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sAdNotFim,1,2)) - FU.StrInt(Copy(sMultHoraEnt,1,2))) * 60 +
              (FU.StrInt(Copy(sAdNotFim,4,2)) - FU.StrInt(Copy(sMultHoraEnt,4,2)))
          else
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
              (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)));

        if (sMultHoraSai < sMultHoraEnt) then
          sMultHoraSai := IntToStr(FU.StrInt(Copy(sMultHoraSai,1,2)) + 24) + Copy(sMultHoraSai,3,3);

        if (sMultHoraEnt > sAdNotIni) then
          sAdNotIni := sMultHoraEnt;

        if (sMultHoraSai > sAdNotIni) then
          if (sMultHoraSai < sAdNotF24) then
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
              (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)))
          else
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
              (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
      end;
      // FIM ADIC. NOTURNO


      if (ppLblEntrada.Caption = '') and
         (CdsPontoPessoa.FieldByName('HORAENTRA').asString <> '') and
         (CdsPontoPessoa.FieldByName('HORASAIDA').asString <> '') then
         iHoraExtra := round(
           StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,1,2)) * 60 +
           StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,4,2)) -
           StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,1,2)) * 60 -
           StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,4,2)));

      if (ppLblEntrada.Caption <> '') and
         (CdsPontoPessoa.FieldByName('HORAENTRA').asString <> '') and
         (CdsPontoPessoa.FieldByName('HORASAIDA').asString <> '') then
      begin
        // Hora Extra antes exped.
        if (CdsPontoPessoa.FieldByName('HORAENTRA').asString < CdsHorario.FieldByName('INICIOEXPEDIENTE').asString) and
           (StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,4,2)) >
            CmpRptCM.ParamByName('TolEntrada').asInteger) then
          iHoraExtra := round(
            StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,4,2)));

        // Hora Extra após exped.
        if (CdsPontoPessoa.FieldByName('HORASAIDA').asString > CdsHorario.FieldByName('FINALEXPEDIENTE').asString) and
           (StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,4,2)) >
            CmpRptCM.ParamByName('TolSaida').asInteger) then
          iHoraExtra := iHoraExtra + round(
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,4,2)));

        // Hora Extra após saída interv.
        if (CdsPontoPessoa.FieldByName('HORAINT1').asString > CdsHorario.FieldByName('INICIOALMOCO').asString) and
           (StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,4,2)) >
            CmpRptCM.ParamByName('TolSaida').asInteger) then
          iHoraExtra := iHoraExtra + round(
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,4,2)));

        // Hora Extra antes retorno interv.
        if (CdsPontoPessoa.FieldByName('HORAINT2').asString <> '') and
           (CdsPontoPessoa.FieldByName('HORAINT2').asString < CdsHorario.FieldByName('FINALALMOCO').asString) and
           (StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,4,2)) >
            CmpRptCM.ParamByName('TolEntrada').asInteger) then
          iHoraExtra := round(
            StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,4,2)));

        // Atraso início exped.
        if (CdsPontoPessoa.FieldByName('HORAENTRA').asString > CdsHorario.FieldByName('INICIOEXPEDIENTE').asString) and
           (StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,4,2)) >
            CmpRptCM.ParamByName('TolEntrada').asInteger) then
        begin
          iAtraso := round(
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,4,2)));

          if (CdsHorario.FieldByName('INICIOALMOCO').asString <> '') and
             (CdsPontoPessoa.FieldByName('HORAENTRA').asString > CdsHorario.FieldByName('INICIOALMOCO').asString) then
            iAtraso := iAtraso + round(
              StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,1,2)) * 60 +
              StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,4,2)) -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,1,2)) * 60 -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,4,2)));

          if (CdsHorario.FieldByName('FINALALMOCO').asString <> '') and
             (CdsPontoPessoa.FieldByName('HORAENTRA').asString > CdsHorario.FieldByName('FINALALMOCO').asString) then
            iAtraso := iAtraso - round(
              StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,1,2)) * 60 +
              StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,4,2)) -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,1,2)) * 60 -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORAENTRA').asString,4,2)));
        end;

        // Atraso final exped. (saída antecipada)
        if (CdsPontoPessoa.FieldByName('HORASAIDA').asString < CdsHorario.FieldByName('FINALEXPEDIENTE').asString) and
           (StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,4,2)) >
            CmpRptCM.ParamByName('TolSaida').asInteger) then
        begin
          iAtraso := iAtraso + round(
            StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('FINALEXPEDIENTE').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,4,2)));

          if (CdsHorario.FieldByName('FINALALMOCO').asString <> '') and
             (CdsPontoPessoa.FieldByName('HORASAIDA').asString < CdsHorario.FieldByName('FINALALMOCO').asString) then
            iAtraso := iAtraso - round(
              StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,1,2)) * 60 +
              StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,4,2)) -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,1,2)) * 60 -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,4,2)));

          if (CdsHorario.FieldByName('INICIOALMOCO').asString <> '') and
             (CdsPontoPessoa.FieldByName('HORASAIDA').asString < CdsHorario.FieldByName('INICIOALMOCO').asString) then
            iAtraso := iAtraso + round(
              StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,1,2)) * 60 +
              StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,4,2)) -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,1,2)) * 60 -
              StrToInt(copy(CdsPontoPessoa.FieldByName('HORASAIDA').asString,4,2)));
        end;

        // Atraso retorno interv. (sai antes da hora de início)
        if (CdsPontoPessoa.FieldByName('HORAINT1').asString <> '') and
           (CdsPontoPessoa.FieldByName('HORAINT1').asString < CdsHorario.FieldByName('INICIOALMOCO').asString) and
           (StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,4,2)) >
            CmpRptCM.ParamByName('TolSaida').asInteger) then
          iHoraExtra := round(
            StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,1,2)) * 60 +
            StrToInt(copy(CdsHorario.FieldByName('INICIOALMOCO').asString,4,2)) -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,1,2)) * 60 -
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT1').asString,4,2)));

        // Atraso retorno interv.
        if (CdsPontoPessoa.FieldByName('HORAINT2').asString <> '') and
           (CdsPontoPessoa.FieldByName('HORAINT2').asString > CdsHorario.FieldByName('FINALALMOCO').asString) and
           (StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,4,2)) >
            CmpRptCM.ParamByName('TolEntrada').asInteger) then
          iAtraso := iAtraso + round(
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,1,2)) * 60 +
            StrToInt(copy(CdsPontoPessoa.FieldByName('HORAINT2').asString,4,2)) -
            StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,1,2)) * 60 -
            StrToInt(copy(CdsHorario.FieldByName('FINALALMOCO').asString,4,2)));
      end;

      // ECF 28/08/07 Alteração para totalizar Horas Trabalhadas
      if (not CdsPontoPessoa.FieldByName('ENTRADA').isNull) and
         (not CdsPontoPessoa.FieldByName('SAIDA').isNull) then
      begin
        iHorasTrab := round(24*60*(CdsPontoPessoa.FieldByName('SAIDA').asDateTime -
          CdsPontoPessoa.FieldByName('ENTRADA').asDateTime));
        // Abater o horário de intervalo
        if (dtSaidaIntervalo > 0) and
           (dtRetornoIntervalo > 0) and
           (CdsPontoPessoa.FieldByName('SAIDA').asDateTime >= dtRetornoIntervalo) and
           (CdsPontoPessoa.FieldByName('ENTRADA').asDateTime <= dtSaidaIntervalo) then
          iHorasTrab := iHorasTrab - round(24*60*(dtRetornoIntervalo - dtSaidaIntervalo));
      end;
      //

      if (iHoraExtra = 0) and (iAtraso = 0) and (iIdHorario <> -1) and
         (CdsPontoPessoa.FieldByName('FALTAS').asInteger = 0) and
         (not CmpRptCM.ParamByName('Normal').asBoolean) then
        rpOcorrPessDtlBnd.Visible := false;

      if (not CdsFerias.IsEmpty) and (iHoraExtra = 0) and (iAtraso = 0) and
         (CdsPontoPessoa.FieldByName('FALTAS').asInteger = 0) and
         (not CmpRptCM.ParamByName('Ferias').asBoolean) then
        rpOcorrPessDtlBnd.Visible := false;

      if (not CdsFeriados.IsEmpty) and (iHoraExtra = 0) and (iAtraso = 0) and
         (CdsPontoPessoa.FieldByName('FALTAS').asInteger = 0) and
         (not CmpRptCM.ParamByName('Feriado').asBoolean) then
        rpOcorrPessDtlBnd.Visible := false;
    end;
  end
  else if (not CmpRptCM.ParamByName('Abono').asBoolean) then
      rpOcorrPessDtlBnd.Visible := false;

  if (iHoraExtra > 0) then
  begin
    if (not CmpRptCM.ParamByName('Extra').asBoolean) then
      rpOcorrPessDtlBnd.Visible := false
    else
    begin
      ppLblHoraExtra.Caption := IntToStr(iHoraExtra);
      iHoraExtraPessoa := iHoraExtraPessoa + iHoraExtra;
      iHoraExtraTotal := iHoraExtraTotal + iHoraExtra;
    end;
  end;

  if (iAtraso > 0) then
  begin
    if (not CmpRptCM.ParamByName('Atraso').asBoolean) then
      rpOcorrPessDtlBnd.Visible := false
    else
    begin
      ppLblAtraso.Caption := IntToStr(iAtraso);
      iAtrasoPessoa := iAtrasoPessoa + iAtraso;
      iAtrasoTotal := iAtrasoTotal + iAtraso;
    end;
    iAtraso := 0;
  end;

  if (iTotAdicNot > 0) then
  begin
    ppLblAdNot.Caption := IntToStr(iTotAdicNot);
    iAdNotPessoa := iAdNotPessoa + iTotAdicNot;
    iAdNotTotal := iAdNotTotal + iTotAdicNot;
    iTotAdicNot := 0;
  end;

  if (rpOcorrPessDtlBnd.Visible) then
  begin
    inc(iAcessosPessoa);
    inc(iAcessosTotal);
    // ECF 28/08/07 Alteração para totalizar Horas Trabalhadas
    iHrTrbPessoa := iHrTrbPessoa + iHorasTrab;
    iHrTrbTotal  := iHrTrbTotal + iHorasTrab;
    if (not CmpRptCM.ParamByName('HorasTrab').asBoolean) then
    begin
      iHrTrbPessoa := iHrTrbPessoa - iHoraExtra;
      iHrTrbTotal  := iHrTrbTotal - iHoraExtra;
    end;
    //
  end;

  iHoraExtra := 0;
end;

procedure TRptPontoPessoa.rpOcorrPessGrpFootBnd2BeforePrint(
  Sender: TObject);
begin
  inherited;
  ppLblHoraExtraPessoa.Caption := '';
  ppLblAtrasoPessoa.Caption := '';
  ppLblAdNotPessoa.Caption := '';

  if (CmpRptCM.ParamByName('SaldoBanco').asBoolean) then
  begin
    iSaldoApos := CtrlBancoHoras.VerificaSaldoBancoHorasPeriodo(
      CdsPontoPessoa.FieldByName('IDPESSOA').asFloat,
      DateToStr(CmpRptCM.ParamByName('DataFinal').asDateTime - 1000),
      DateToStr(CmpRptCM.ParamByName('DataFinal').asDateTime - 1));

    if (iSaldoApos = iSaldoAntes) then
      //iSaldoApos := iSaldoAntes + iHoraExtraPessoa - iAtrasoPessoa; // - Faltas
      lblSaldoBHApos.Visible := false
    else
      lblSaldoBHApos.Visible := true;


    sHoraMin := '';
    if (iSaldoApos <> 0) then
      sHoraMin := '(' + ConverteMinutos(iSaldoApos) + ')';

    lblSaldoBHApos.Caption := 'Saldo no Banco de Horas: ' + IntToStr(iSaldoApos) + ' min. ' + sHoraMin;
  end;

  if (iHoraExtraPessoa > 0) then
  begin
    ppLblHoraExtraPessoa.Caption := IntToStr(iHoraExtraPessoa);
    iHoraExtraPessoa := 0;
  end;

  if (iAtrasoPessoa > 0) then
  begin
    ppLblAtrasoPessoa.Caption := IntToStr(iAtrasoPessoa);
    iAtrasoPessoa := 0;
  end;

  if (iAdNotPessoa > 0) then
  begin
    ppLblAdNotPessoa.Caption := IntToStr(iAdNotPessoa);
    iAdNotPessoa := 0;
  end;

  if (iAcessosPessoa > 0) then
  begin
    ppLblAcessosPessoa.Caption := IntToStr(iAcessosPessoa);
    iAcessosPessoa := 0;
  end;

  // ECF 28/08/07 Alteração para totalizar Horas Trabalhadas
  if (iHrTrbPessoa > 0) then
  begin
    ppLblHrTrbPessoa.Caption := IntToStr(iHrTrbPessoa);
    iHrTrbPessoa := 0;
  end;

end;

procedure TRptPontoPessoa.rpOcorrPessGrpFootBnd1BeforePrint(
  Sender: TObject);
begin
  inherited;
  ppLblHoraExtraTotal.Caption := '';
  ppLblAtrasoTotal.Caption := '';
  ppLblAdNotTotal.Caption := '';

  if (iHoraExtraTotal > 0) then
  begin
    ppLblHoraExtraTotal.Caption := IntToStr(iHoraExtraTotal);
    iHoraExtraTotal := 0;
  end;

  if (iAtrasoTotal > 0) then
  begin
    ppLblAtrasoTotal.Caption := IntToStr(iAtrasoTotal);
    iAtrasoTotal := 0;
  end;

  if (iAdNotTotal > 0) then
  begin
    ppLblAdNotTotal.Caption := IntToStr(iAdNotTotal);
    iAdNotTotal := 0;
  end;

  if (iAcessosTotal > 0) then
  begin
    ppLblAcessosTotal.Caption := IntToStr(iAcessosTotal);
    iAcessosTotal := 0;
  end;

  // ECF 28/08/07 Alteração para totalizar Horas Trabalhadas
  if (iHrTrbTotal > 0) then
  begin
    ppLblHrTrbTotal.Caption := IntToStr(iHrTrbTotal);
    iHrTrbTotal := 0;
  end;
  //
end;

procedure TRptPontoPessoa.rpOcorrPessGrpHdrBnd2BeforePrint(
  Sender: TObject);
var
  sIdPessoa: string;
begin
  inherited;
  ArrayEntradas := VarArrayCreate([1,
    Round(CmpRptCM.ParamByName('DataFinal').asDateTime -
    CmpRptCM.ParamByName('DataInicial').asDateTime) + 1], varInteger);

  ArrayPassadas := VarArrayCreate([1,
    Round(CmpRptCM.ParamByName('DataFinal').asDateTime -
    CmpRptCM.ParamByName('DataInicial').asDateTime) + 1], varInteger);

  // Identificar as múltiplas batidas no mesmo dia
  sIdPessoa := CdsPontoPessoa.FieldByName('IDPESSOA').asString;
  CdsPontoPessoa2.Filter := 'IDPESSOA = ' + sIdPessoa;
  CdsPontoPessoa2.Filtered := true;
  CdsPontoPessoa2.First;
  while not CdsPontoPessoa2.Eof do
  begin
    iLin := Round(trunc(CdsPontoPessoa2.FieldByName('ENTRADA').asDateTime) -
      CmpRptCM.ParamByName('DataInicial').asDateTime) + 1;
    if (iLin > 0) and (trim(CdsPontoPessoa2.FieldByName('ABONO').asString) = '') then
      ArrayEntradas[iLin] := ArrayEntradas[iLin] + 1; // Soma batidas feitas no mesmo dia
    CdsPontoPessoa2.Next;
  end;
  CdsPontoPessoa2.First;
  CdsPontoPessoa2.Filtered := false;
  //

  if (CmpRptCM.ParamByName('SaldoBanco').asBoolean) then
  begin
    iSaldoAntes := CtrlBancoHoras.VerificaSaldoBancoHorasPeriodo(
      CdsPontoPessoa.FieldByName('IDPESSOA').asFloat,
      DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime - 1000),
      DateToStr(CmpRptCM.ParamByName('DataInicial').asDateTime - 1));

    sHoraMin := '';
    if (iSaldoAntes <> 0) then
      sHoraMin := '(' + ConverteMinutos(iSaldoAntes) + ')';

    lblSaldoBHAntes.Caption := 'Saldo Banco de Horas: ' + IntToStr(iSaldoAntes) + ' min. ' + sHoraMin;
  end;
end;

function TRptPontoPessoa.ConverteMinutos(Minutos: integer): string;
begin
  Result := '';
  if Minutos = 0 then
    exit;

  if Minutos < 0 then
    Result := '-';

  Minutos := abs(Minutos);

  Result := Result + FloatToStr(int(Minutos / 60)) + 'h' +
                     FU.PoeZero(Round(Minutos - int(Minutos / 60)*60)) + 'm';

end;

end.
