// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFolhaFreqEscala;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl, ppClass, ppBands, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCtrlPadroes, uCtrlListTerceirosRH, uCtrlDiaExtra,
  uCtrlFerias, uCtrlCargo, TXRB;

type
  TRptFolhaFreqEscala = class(TFrmCmReport)
    rpFolhaFreqEscala: TppReport;
    rpFolhaFreqEscalaHdrBnd: TppHeaderBand;
    rpFolhaFreqEscalaDtlBnd: TppDetailBand;
    rpFolhaFreqEscalaShapeDIA31_1: TppShape;
    rpFolhaFreqEscalaShapeDIA30_1: TppShape;
    rpFolhaFreqEscalaShapeDIA29_1: TppShape;
    rpFolhaFreqEscalaShapeDIA29_2: TppShape;
    rpFolhaFreqEscalaShapeDIA30_2: TppShape;
    rpFolhaFreqEscalaShapeDIA31_2: TppShape;
    rpFolhaFreqEscalaShape5: TppShape;
    rpFolhaFreqEscalaShape9: TppShape;
    rpFolhaFreqEscalaShape6: TppShape;
    rpFolhaFreqEscalaShape28: TppShape;
    rpFolhaFreqEscalaShape27: TppShape;
    rpFolhaFreqEscalaShape26: TppShape;
    rpFolhaFreqEscalaShape25: TppShape;
    rpFolhaFreqEscalaShape24: TppShape;
    rpFolhaFreqEscalaShape22: TppShape;
    rpFolhaFreqEscalaShape21: TppShape;
    rpFolhaFreqEscalaShape20: TppShape;
    rpFolhaFreqEscalaShape19: TppShape;
    rpFolhaFreqEscalaShape18: TppShape;
    rpFolhaFreqEscalaShape17: TppShape;
    rpFolhaFreqEscalaShape16: TppShape;
    rpFolhaFreqEscalaShape15: TppShape;
    rpFolhaFreqEscalaShape14: TppShape;
    rpFolhaFreqEscalaShape8: TppShape;
    rpFolhaFreqEscalaShape10: TppShape;
    rpFolhaFreqEscalaShape7: TppShape;
    rpFolhaFreqEscalaShape12: TppShape;
    rpFolhaFreqEscalaLblDia01: TppLabel;
    rpFolhaFreqEscalaLblDia02: TppLabel;
    rpFolhaFreqEscalaLblDia03: TppLabel;
    rpFolhaFreqEscalaLblDia04: TppLabel;
    rpFolhaFreqEscalaLblDia05: TppLabel;
    rpFolhaFreqEscalaLblDia06: TppLabel;
    rpFolhaFreqEscalaLblDia07: TppLabel;
    rpFolhaFreqEscalaLblDia08: TppLabel;
    rpFolhaFreqEscalaLblDia09: TppLabel;
    rpFolhaFreqEscalaLblDia10: TppLabel;
    rpFolhaFreqEscalaLblDia11: TppLabel;
    rpFolhaFreqEscalaLblDia12: TppLabel;
    rpFolhaFreqEscalaLblDia13: TppLabel;
    rpFolhaFreqEscalaLblDia14: TppLabel;
    rpFolhaFreqEscalaLblDia15: TppLabel;
    rpFolhaFreqEscalaLblDia16: TppLabel;
    rpFolhaFreqEscalaLblDia17: TppLabel;
    rpFolhaFreqEscalaLblDia18: TppLabel;
    rpFolhaFreqEscalaLblDia19: TppLabel;
    rpFolhaFreqEscalaLblDia20: TppLabel;
    rpFolhaFreqEscalaLblDia21: TppLabel;
    rpFolhaFreqEscalaLblDia22: TppLabel;
    rpFolhaFreqEscalaLblDia23: TppLabel;
    rpFolhaFreqEscalaLblDia24: TppLabel;
    rpFolhaFreqEscalaLblDia25: TppLabel;
    rpFolhaFreqEscalaLblDia26: TppLabel;
    rpFolhaFreqEscalaLblDia27: TppLabel;
    rpFolhaFreqEscalaLblDia28: TppLabel;
    rpFolhaFreqEscalaLblDia29: TppLabel;
    rpFolhaFreqEscalaLblDia30: TppLabel;
    rpFolhaFreqEscalaLblDia31: TppLabel;
    rpFolhaFreqEscalaLbl5: TppLabel;
    rpFolhaFreqEscalaLbl6: TppLabel;
    rpFolhaFreqEscalaLbl13: TppLabel;
    rpFolhaFreqEscalaLbl14: TppLabel;
    rpFolhaFreqEscalaLbl9: TppLabel;
    rpFolhaFreqEscalaShape11: TppShape;
    rpFolhaFreqEscalaShape13: TppShape;
    rpFolhaFreqEscalaLbl10: TppLabel;
    rpFolhaFreqEscalaLbl11: TppLabel;
    rpFolhaFreqEscalaLbl12: TppLabel;
    rpFolhaFreqEscalaLbl7: TppLabel;
    rpFolhaFreqEscalaLbl8: TppLabel;
    rpFolhaFreqEscalaLbl15: TppLabel;
    rpFolhaFreqEscalaLbl16: TppLabel;
    rpFolhaFreqEscalaDBTxt8: TppDBText;
    rpFolhaFreqEscalaDBTxt10: TppDBText;
    rpFolhaFreqEscalaDBTxt12: TppDBText;
    rpFolhaFreqEscalaDBTxt14: TppDBText;
    rpFolhaFreqEscalaDBTxt16: TppDBText;
    rpFolhaFreqEscalaDBTxt18: TppDBText;
    rpFolhaFreqEscalaDBTxt20: TppDBText;
    rpFolhaFreqEscalaDBTxt22: TppDBText;
    rpFolhaFreqEscalaDBTxt24: TppDBText;
    rpFolhaFreqEscalaDBTxt26: TppDBText;
    rpFolhaFreqEscalaDBTxt28: TppDBText;
    rpFolhaFreqEscalaDBTxt30: TppDBText;
    rpFolhaFreqEscalaDBTxt32: TppDBText;
    rpFolhaFreqEscalaDBTxt34: TppDBText;
    rpFolhaFreqEscalaDBTxt36: TppDBText;
    rpFolhaFreqEscalaDBTxt38: TppDBText;
    rpFolhaFreqEscalaDBTxt40: TppDBText;
    rpFolhaFreqEscalaDBTxt42: TppDBText;
    rpFolhaFreqEscalaDBTxt44: TppDBText;
    rpFolhaFreqEscalaDBTxt46: TppDBText;
    rpFolhaFreqEscalaDBTxt48: TppDBText;
    rpFolhaFreqEscalaDBTxt50: TppDBText;
    rpFolhaFreqEscalaDBTxt52: TppDBText;
    rpFolhaFreqEscalaDBTxt54: TppDBText;
    rpFolhaFreqEscalaDBTxt56: TppDBText;
    rpFolhaFreqEscalaDBTxt58: TppDBText;
    rpFolhaFreqEscalaDBTxt60: TppDBText;
    rpFolhaFreqEscalaDBTxt62: TppDBText;
    rpFolhaFreqEscalaDBTxt64: TppDBText;
    rpFolhaFreqEscalaDBTxt66: TppDBText;
    rpFolhaFreqEscalaDBTxt68: TppDBText;
    rpFolhaFreqEscalaDBTxt7: TppDBText;
    rpFolhaFreqEscalaDBTxt9: TppDBText;
    rpFolhaFreqEscalaDBTxt11: TppDBText;
    rpFolhaFreqEscalaDBTxt13: TppDBText;
    rpFolhaFreqEscalaDBTxt15: TppDBText;
    rpFolhaFreqEscalaDBTxt17: TppDBText;
    rpFolhaFreqEscalaDBTxt19: TppDBText;
    rpFolhaFreqEscalaDBTxt21: TppDBText;
    rpFolhaFreqEscalaDBTxt23: TppDBText;
    rpFolhaFreqEscalaDBTxt25: TppDBText;
    rpFolhaFreqEscalaDBTxt27: TppDBText;
    rpFolhaFreqEscalaDBTxt29: TppDBText;
    rpFolhaFreqEscalaDBTxt31: TppDBText;
    rpFolhaFreqEscalaDBTxt33: TppDBText;
    rpFolhaFreqEscalaDBTxt35: TppDBText;
    rpFolhaFreqEscalaDBTxt37: TppDBText;
    rpFolhaFreqEscalaDBTxt39: TppDBText;
    rpFolhaFreqEscalaDBTxt41: TppDBText;
    rpFolhaFreqEscalaDBTxt43: TppDBText;
    rpFolhaFreqEscalaDBTxt45: TppDBText;
    rpFolhaFreqEscalaDBTxt47: TppDBText;
    rpFolhaFreqEscalaDBTxt49: TppDBText;
    rpFolhaFreqEscalaDBTxt51: TppDBText;
    rpFolhaFreqEscalaDBTxt53: TppDBText;
    rpFolhaFreqEscalaDBTxt55: TppDBText;
    rpFolhaFreqEscalaDBTxt57: TppDBText;
    rpFolhaFreqEscalaDBTxt59: TppDBText;
    rpFolhaFreqEscalaDBTxt61: TppDBText;
    rpFolhaFreqEscalaDBTxt63: TppDBText;
    rpFolhaFreqEscalaDBTxt67: TppDBText;
    rpFolhaFreqEscalaDBTxt65: TppDBText;
    rpFolhaFreqEscalaShape1: TppShape;
    rpFolhaFreqEscalaShape4: TppShape;
    rpFolhaFreqEscalaShape3: TppShape;
    rpFolhaFreqEscalaShape2: TppShape;
    rpFolhaFreqEscalaLbl2: TppLabel;
    rpFolhaFreqEscalaLbl3: TppLabel;
    rpFolhaFreqEscalaDBTxt1: TppDBText;
    rpFolhaFreqEscalaDBTxt5: TppDBText;
    rpFolhaFreqEscalaDBTxt3: TppDBText;
    rpFolhaFreqEscalaDBTxt4: TppDBText;
    rpFolhaFreqEscalaDBTxt6: TppDBText;
    rpFolhaFreqEscalaDBTxt2: TppDBText;
    rpFolhaFreqEscalaCalc1: TppCalc;
    rpFolhaFreqEscalaLbl1: TppLabel;
    rpFolhaFreqEscalaLbl4: TppLabel;
    rpFolhaFreqEscalaShapeDIA29_3: TppShape;
    rpFolhaFreqEscalaShapeDIA30_3: TppShape;
    rpFolhaFreqEscalaShapeDIA31_3: TppShape;
    rpFolhaFreqEscalaShapeDIA29_4: TppShape;
    rpFolhaFreqEscalaShapeDIA30_4: TppShape;
    rpFolhaFreqEscalaShapeDIA31_4: TppShape;
    rpFolhaFreqEscalaShapeDIA29_5: TppShape;
    rpFolhaFreqEscalaShapeDIA30_5: TppShape;
    rpFolhaFreqEscalaShapeDIA31_5: TppShape;
    rpFolhaFreqEscalaShape29: TppShape;
    rpFolhaFreqEscalaLine1: TppLine;
    rpFolhaFreqEscalaLbl18: TppLabel;
    rpFolhaFreqEscalaLbl17: TppLabel;
    ppFolhaFreqEscala: TppBDEPipeline;
    dsFolhaFreqEscala: TwwDataSource;
    sqlFolhaFreqEscala: TCMSqlParams;
    CdsFolhaFreqEscala: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsFolhaFreqEscalaAfterScroll(DataSet: TDataSet);
    procedure rpFolhaFreqEscalaBeforePrint(Sender: TObject);
    procedure rpFolhaFreqEscalaHdrBndAfterPrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlDiaExtra: TCtrlDiaExtra;
    CtrlFerias: TCtrlFerias;
    CtrlCargo: TCtrlCargo;

    sListaIdFuncSel: string;

    procedure GerarDadosRelat;
  end;

var
  RptFolhaFreqEscala: TRptFolhaFreqEscala;

implementation

uses dCds, fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH, Usistema;

{$R *.DFM}

procedure TRptFolhaFreqEscala.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlDiaExtra := TCtrlDiaExtra.Create;
  CtrlDiaExtra.InitializeAs(Padroes);

  CtrlFerias := TCtrlFerias.Create;
  CtrlFerias.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);
end;

procedure TRptFolhaFreqEscala.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlDiaExtra);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlCargo);
  inherited;
end;

procedure TRptFolhaFreqEscala.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Monta Query Auxiliar
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  E.IDCIDADES, ES.IDPAIS,');
    Add('  RTRIM(ES.CODESTADO) AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(E.COMPLEMENTO,'' '','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    '' - ''|| RTRIM(E.BAIRRO) AS ENDERECO,');
    Add('  RTRIM(ES.NOMEESTADO) AS ESTADO,');
    // Dados do Funcionário
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  '+QuotedStr(FU.MesExtensoAno(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger)))+' AS REFERENCIA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  F.IDCARGO,');
    Add('  F.IDFUNCAO,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATAREFHORARIO,');
    // Horário
    Add('  HT.FLGTIPOHORARIO,');
    Add('  HT.NOMEHORARIO,');
    Add('  HT.HORASFOLGA1,');
    Add('  HT.HORASSERVICO,');
    Add('  HT.HORASFOLGA2');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, ESTADO ES,');
    Add('  CIDADES, CENTCUST CC, HORATRAB HT, SITFUNC ST');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    Add('  (HT.FLGTIPOHORARIO  = 1) AND');
    Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    Add('  (HT.IDHORARIO       = F.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO) AND');
    Add('  (F.CODCENTROCUSTO   = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA)');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(EMPREGADO), UPPER(C_CUSTO)');
      1 : Add('  MATRICULA, UPPER(C_CUSTO)');
      2 : Add('  UPPER(C_CUSTO), UPPER(EMPREGADO)');
      3 : Add('  UPPER(C_CUSTO), MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;

  // Monta Query Principal
  GerarDadosRelat;

  frmAguarde.Max := CdsFolhaFreqEscala.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptFolhaFreqEscala.CdsFolhaFreqEscalaAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFolhaFreqEscala.rpFolhaFreqEscalaBeforePrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFolhaFreqEscala.rpFolhaFreqEscalaHdrBndAfterPrint(Sender: TObject);
var
  iNumDias: byte;
begin
  iNumDias := CdsFolhaFreqEscala.FieldByName('NUM_DIAS_MES').asInteger;

  rpFolhaFreqEscalaLblDia29.Visible := (iNumDias >= 29);
  rpFolhaFreqEscalaLblDia30.Visible := (iNumDias >= 30);
  rpFolhaFreqEscalaLblDia31.Visible := (iNumDias  = 31);

  rpFolhaFreqEscalaShapeDIA29_1.Visible := (iNumDias >= 29);
  rpFolhaFreqEscalaShapeDIA29_2.Visible := (iNumDias >= 29);
  rpFolhaFreqEscalaShapeDIA29_3.Visible := (iNumDias >= 29);
  rpFolhaFreqEscalaShapeDIA29_4.Visible := (iNumDias >= 29);
  rpFolhaFreqEscalaShapeDIA29_5.Visible := (iNumDias >= 29);

  rpFolhaFreqEscalaShapeDIA30_1.Visible := (iNumDias >= 30);
  rpFolhaFreqEscalaShapeDIA30_2.Visible := (iNumDias >= 30);
  rpFolhaFreqEscalaShapeDIA30_3.Visible := (iNumDias >= 30);
  rpFolhaFreqEscalaShapeDIA30_4.Visible := (iNumDias >= 30);
  rpFolhaFreqEscalaShapeDIA30_5.Visible := (iNumDias >= 30);

  rpFolhaFreqEscalaShapeDIA31_1.Visible := (iNumDias = 31);
  rpFolhaFreqEscalaShapeDIA31_2.Visible := (iNumDias = 31);
  rpFolhaFreqEscalaShapeDIA31_3.Visible := (iNumDias = 31);
  rpFolhaFreqEscalaShapeDIA31_4.Visible := (iNumDias = 31);
  rpFolhaFreqEscalaShapeDIA31_5.Visible := (iNumDias = 31);
end;

procedure TRptFolhaFreqEscala.GerarDadosRelat;
var
  dtDataRef: TDateTime;
  IdPessoa, dTotHoras, dHora1, dHora2, dResto: double;
  c: integer;
begin
  CdsFolhaFreqEscala.IndexName := '';
  if (CdsFolhaFreqEscala.IndexDefs.Count > 0) then
    CdsFolhaFreqEscala.DeleteIndex('Index1');

  sqlFolhaFreqEscala.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    dtDataRef := StrToDate('01/'+ FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
      CmpRptCM.ParamByName('AnoRef').asString);

    // Pego o ID de cada funcionário Listado na Query Auxiliar para ver se têm Férias para o
    // período especificado
    sListaIdFuncSel := '';
    repeat
      if (sListaIdFuncSel = '') then
        sListaIdFuncSel := dmCds.Cds.FieldByName('IDPESSOA').asString
      else
        sListaIdFuncSel := sListaIdFuncSel +','+ dmCds.Cds.FieldByName('IDPESSOA').asString;

      IdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asFloat;
      repeat
        dmCds.Cds.Next;
      until (IdPessoa <> dmCds.Cds.FieldByName('IDPESSOA').asFloat) or
            (dmCds.Cds.EOF);
    until (dmCds.Cds.EOF);

    // Cargos dos Empregados
    CdsCargo.Data := CtrlCargo.ListCargo;

    // ---------------------------------------------------------------------------
    // Gravo registros
    // ---------------------------------------------------------------------------
    dmCds.Cds.First;
    repeat
      // Se for horário por escala e não tiver a data de referência não exibe
      if (dmCds.Cds.FieldByName('DATAREFHORARIO').IsNull) and
         (dmCds.Cds.FieldByName('FLGTIPOHORARIO').asInteger <> 0) then
      begin
        repeat
          dmCds.Cds.Next;
        until (dmCds.Cds.FieldByName('IDPESSOA').asFloat <> IdPessoa) or (dmCds.Cds.EOF);
        continue;
      end;

      CdsFolhaFreqEscala.Insert;
      CdsFolhaFreqEscala.FieldByName('ESTAB').asString := dmCds.Cds.FieldByName('ESTAB').asString;
      CdsFolhaFreqEscala.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsFolhaFreqEscala.FieldByName('UF').asString := dmCds.Cds.FieldByName('ESTADO').asString;
      CdsFolhaFreqEscala.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsFolhaFreqEscala.FieldByName('REFERENCIA').asString := dmCds.Cds.FieldByName('REFERENCIA').asString;
      CdsFolhaFreqEscala.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsFolhaFreqEscala.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('C_CUSTO').asString;
      CdsFolhaFreqEscala.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
      CdsFolhaFreqEscala.FieldByName('NOMEHORARIO').asString := dmCds.Cds.FieldByName('NOMEHORARIO').asString;
      CdsFolhaFreqEscala.FieldByName('NUM_DIAS_MES').asInteger := FU.TrazUltDiaMes(
        CmpRptCM.ParamByName('MesRef').asInteger, CmpRptCM.ParamByName('AnoRef').asInteger);

      if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) and
         not(dmCds.Cds.FieldByName('IDFUNCAO').IsNull) and
         (CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDFUNCAO').asFloat, [])) then
        CdsFolhaFreqEscala.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString
      else
      begin
        CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDCARGO').asFloat, []);
        CdsFolhaFreqEscala.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString;
      end;

      IdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asFloat;

      if (dmCds.Cds.FieldByName('FLGTIPOHORARIO').asInteger = 1) then
      begin
        dHora2 := 0;
        dTotHoras := dmCds.Cds.FieldByName('HORASFOLGA1').asFloat +
          dmCds.Cds.FieldByName('HORASSERVICO').asFloat +
          dmCds.Cds.FieldByName('HORASFOLGA2').asFloat;

        for c:=1 to FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
                                     CmpRptCM.ParamByName('AnoRef').asInteger) do
        begin
          dHora1 := ((dtDataRef + c - 1 -
            dmCds.Cds.FieldByName('DATAREFHORARIO').Value) * 24 mod dTotHoras) +
            dmCds.Cds.FieldByName('HORASFOLGA1').asInteger;

          if (dHora1 >= 24) and
             (dTotHoras - dHora1 < dmCds.Cds.FieldByName('HORASSERVICO').asFloat) then
            dResto := dmCds.Cds.FieldByName('HORASSERVICO').asFloat + dHora1 - dTotHoras
          else
            dResto := 0;

          if (dResto > 0) then
          begin
            dHora2 := dResto;
            dHora1 := 0;
          end
          else
          if (dResto = 0) and (c > 1) then
          begin
            dHora1 := dHora2 + dmCds.Cds.FieldByName('HORASFOLGA2').asFloat +
                     dmCds.Cds.FieldByName('HORASFOLGA1').asFloat;
            if (dHora1 > 24) then
              dHora1 := dHora1 - 24;
          end;

          if (dHora1 < 24) then
          begin
            if (dResto <= 0) then
              dHora2 := dHora1 + dmCds.Cds.FieldByName('HORASSERVICO').asFloat;
                        
            if (dHora2 > 24) then
              dHora2 := 24;

            if (dHora1 <> 0) and (dHora1 <> 24) then
              CdsFolhaFreqEscala.FieldByName('ENTRADA'+FU.PoeZero(c)).asString :=
                FU.PoeZero(Trunc(dHora1)) +':'+ FormatFloat('00',(Frac(dHora1) * 100));

            if (dHora2 <> 0) and (dHora2 <> 24) then
              CdsFolhaFreqEscala.FieldByName('SAIDA'+FU.PoeZero(c)).asString :=
                FU.PoeZero(Trunc(dHora2)) +':'+ FormatFloat('00',(Frac(dHora2) * 100));
          end
          else
          begin
            CdsFolhaFreqEscala.FieldByName('ENTRADA'+FU.PoeZero(c)).asString := '';
            CdsFolhaFreqEscala.FieldByName('SAIDA'+FU.PoeZero(c)).asString := '';
          end;
        end;
      end;

      // Movo para o último registro do funcionário
      repeat
        dmCds.Cds.Next;
      until (dmCds.Cds.FieldByName('IDPESSOA').asFloat <> IdPessoa) or
            (dmCds.Cds.EOF);

      CdsFolhaFreqEscala.Post;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsFolhaFreqEscala.Insert;
    CdsFolhaFreqEscala.Post;
  end;

  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : CdsFolhaFreqEscala.AddIndex('Index1', 'EMPREGADO;C_CUSTO', []);
    1 : CdsFolhaFreqEscala.AddIndex('Index1', 'MATRICULA;C_CUSTO', []);
    2 : CdsFolhaFreqEscala.AddIndex('Index1', 'C_CUSTO;EMPREGADO', []);
    3 : CdsFolhaFreqEscala.AddIndex('Index1', 'C_CUSTO;MATRICULA', []);
  end;
  CdsFolhaFreqEscala.IndexName := 'Index1';
  CdsFolhaFreqEscala.First;
end;

end.
