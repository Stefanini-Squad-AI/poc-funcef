{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 151964 KINTANA 1124438
Responsável : Fanuel Junior
Data        : 03/02/2011
Descrição   : Adicionado o campo IDTIPOCONTREMPTMO na query de entrada do valor
de salário base
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecCalculaValorMaximo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, mParticipante, Db, DBTables,
  Wwquery, wwdblook, Mask, wwdbedit, Wwdbspin, mListaPlano, mListaPatro,
  TREdit, uTypesEmptmo, mMutuario, MontaSelect;

type
  TfrmCalculaValorMaximo = class(TfrmWizardMTEP)
    Label2: TLabel;
    qryRubricas: TwwQuery;
    dsRubricas: TDataSource;
    cboRubrica: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    Label3: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    Label4: TLabel;
    DBcboTipoContrato: TwwDBLookupCombo;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;
    dsTipoContrato: TDataSource;
    Panel3: TPanel;
    memResult: TMemo;
    Panel4: TPanel;
    memErro: TMemo;
    Total: TLabel;
    edtNumResult: TRealEdit;
    edtNumErro: TRealEdit;
    Label8: TLabel;
    qryCalculo: TwwQuery;
    qryTipoContrato: TwwQuery;
    qryTipoContratoTCEDESCRICAO: TStringField;
    qryTipoContratoDESCTIPOEMPTMO: TStringField;
    qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
    qryTipoContratoIDTIPOEMPTMO: TFloatField;
    qryTipoContratoIDREGRAJURCONC: TFloatField;
    qryTipoContratoIDREGRAELEG: TFloatField;
    qryTipoContratoIDREGRALIMITES: TFloatField;
    qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
    qryTipoContratoIDREGRAMARGEM: TFloatField;
    qryTipoContratoIDREGRARESERVA: TFloatField;
    qryTipoContratoTEPMAXCONTRATO: TFloatField;
    qryTipoContratoFLGOBRIGBENEF: TFloatField;
    qryTipoContratoIDREGRASALBAS: TFloatField;
    qryTipoContratoMOECODIGO: TFloatField;
    qryTipoContratoFLGCONCESSAOZERO: TFloatField;
    qryTipoContratoTCEMINRENOVA: TFloatField;
    qryTipoContratoIDREGRADATACRED: TFloatField;
    qryTipoContratoIDREGRAPRAZOMAX: TFloatField;
    qryTipoContratoNUMPARCDESCONTO: TFloatField;
    qryTipoContratoIDREGRAPRIMPARC: TFloatField;
    qryTipoContratoIDREGRAJUREXIBE: TFloatField;
    qryTipoContratoTCELEGENDACALC: TStringField;
    qryTipoContratoTCELEGENDAEXIBE: TStringField;
    qryRubricasIDPROVENTO: TFloatField;
    qryRubricasDESCRICAO: TStringField;
    qryRubricasCODPROVDESC: TStringField;
    qryCalculoIDTITULAR: TFloatField;
    qryCalculoIDBENEF: TFloatField;
    qryCalculoNOME: TStringField;
    qryCalculoIDPATRO: TFloatField;
    qryCalculoIDPLANOPREV: TFloatField;
    qryCalculoIDSITPART: TFloatField;
    qryCalculoFLGINTERNO: TStringField;
    qryCalculoPATRO: TStringField;
    qryCalculoMATRICULA: TStringField;
    MontaSelect: TMontaSelect;
    Label5: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    Label6: TLabel;
    btnBuscaPart: TBitBtn;
    btnLimpaPart: TBitBtn;
    qryTmpDesc: TwwQuery;
    updTmpDesc: TUpdateSQL;
    qryTmpDescIDTMPDESC: TFloatField;
    qryTmpDescMESREFERENCIA: TStringField;
    qryTmpDescRECPAG: TStringField;
    qryTmpDescIDPESSOA: TFloatField;
    qryTmpDescFLGTIPODESC: TStringField;
    qryTmpDescVALOR: TFloatField;
    qryTmpDescIDTITULAR: TFloatField;
    qryTmpDescIDDESCONTO: TFloatField;
    qryTmpDescMESCOBRANCA: TStringField;
    qryTmpDescIDPESSJUR: TFloatField;
    qryTmpDescIDPROVENTO: TFloatField;
    qryTmpDescIDPLANOPREV: TFloatField;
    qryTmpDescFLGDESCONTO: TFloatField;
    qryTmpDescCODPROVDESC: TStringField;
    qryTmpDescFLGDESCFOLHA: TStringField;
    qryTmpDescDATAREFERENCIA: TDateTimeField;
    qryTmpDescDESCRICAO: TStringField;
    qryTmpDescREFERENCIA: TStringField;
    qryTmpDescSITENVIO: TStringField;
    qryTmpDescVALORINFO: TFloatField;
    qryTmpDescDATACOBRANCA: TDateTimeField;
    qryTmpDescIDLOTE: TFloatField;
    //Pendência 23554 - 17/10/2006 - Marchetti
    qryTmpDescINSCRICAONUMERO: TFloatField;
    qryTmpDescMATRICULA: TStringField;
    qryCalculoINSCRICAONUMERO: TFloatField;
    qryTipoContratoMOESIGLA: TStringField;
    //Fim Pendência 23554
    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
    procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
    procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure DBcboTipoContratoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnBuscaPartClick(Sender: TObject);
    procedure btnLimpaPartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    iIDBenef            : Integer;

    fVlrSalBase      : Currency;
    fSalParticipacao : Currency;
    fSalMantido      : Currency;
    fSalAuxDoenca    : Currency;
    fSalBenef        : Currency;
    fVlrMargem       : Currency;
    fVlrReserva      : Currency;
    fVlrMaxPermit    : Currency;

    rNovoContrato    : TDadosContrato;

    sArq             : String;

    vDividasAnteriores : Array of Extended;

    procedure AbreQueries;
    function  VerificaPreenchimento: Boolean;
    procedure SelecionaParticipantes(iParticipante : Integer);
    procedure ProcessaCalculo;
    function  SetNumParcelas : Integer;
  public
    { Public declarations }
  end;

var
  frmCalculaValorMaximo: TfrmCalculaValorMaximo;

implementation

{$R *.DFM}

uses
   USistema, UDataBase, UMensErro, UFuncoesEmptmo, FProgressoDuplo, dBaseDados,
   uModulo, uVerificaPreenchimento, DLookEmptmo, dMS, uIntegraEmptmo, DEmptmo, uDiasUteis,
   UCalcEmptmo;


procedure TfrmCalculaValorMaximo.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   //Pendência 23554 - 17/10/2006 - Marchetti
   //qryRubricas.Open;
   //Fim Pendência 23554
end;



procedure TfrmCalculaValorMaximo.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmCalculaValorMaximo.FormShow(Sender: TObject);
begin
   inherited;
   ParametrosSistema;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);

   iIDBenef := -1;

   //Pendência 23554 - 17/10/2006 - Marchetti
   LimpaParametros(qryRubricas);
   qryRubricas.Open;
   //Fim Pendência 23554
end;



procedure TfrmCalculaValorMaximo.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmCalculaValorMaximo.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmCalculaValorMaximo.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmCalculaValorMaximo.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



function TfrmCalculaValorMaximo.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

      if DBcboTipoContrato.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContrato);

      if cboRubrica.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Rubrica!', cboRubrica);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;


procedure TfrmCalculaValorMaximo.DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if not dtmLookEmptmo.qryLookTipoContrIDPROVENTOVLMAX.IsNUll then
      cboRubrica.LookupValue := dtmLookEmptmo.qryLookTipoContrIDPROVENTOVLMAX.AsString;
end;

procedure TfrmCalculaValorMaximo.btnContinuarClick(Sender: TObject);
var
   i        : Integer;
   sMsgErro : String;
   dDataIni : TDateTime;
begin
   inherited;
   if not(VerificaPreenchimento) then Exit;

   try
      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      memResult.Clear;
      memErro.Clear;

      dDataIni := Now;

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
      memResult.Lines.Add(' ');

      LimpaParametros(qryTipoContrato);
      qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmLookEmptmo.qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;
      qryTipoContrato.Open;

      SelecionaParticipantes(iIDBenef);

      ProcessaCalculo;
   finally
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final do Processo      : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // memErro.Lines.SaveToFile(Sistema.TempDir + 'EP - ErroCalculoValorMaximo ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
      memErro.Lines.SaveToFile(ftempregra + '\' + 'EP - ErroCalculoValorMaximo ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
   // memResult.Lines.SaveToFile(Sistema.TempDir + 'EP - ResultCalculoValorMaximo ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
      memResult.Lines.SaveToFile(ftempregra + '\' + 'EP - ResultCalculoValorMaximo ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');

      HabilitaBotoes;
   end;

end;


procedure TfrmCalculaValorMaximo.SelecionaParticipantes(iParticipante: Integer);
var
   sSQL : String;
   sAno : String;
   sMes : String;
begin

   sAno := IntToStr(Trunc(DBspnAno.Value));
   sMes := IntToStr(cboMes.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;

   sSQL :=
   'SELECT DISTINCT ' + #13 +
   '     DPT.IDTITULAR, ' + #13 +
   '     DPT.IDPESSOA AS IDBENEF, ' + #13 +
   '     P.NOME, ' + #13 +
   '     MATRICS.MATRICULA, ' + #13 +
   '     ELP.IDPESSJUR AS IDPATRO, ' + #13 +
   '     NVL(PPP.IDPLANOPREV, PLBENEF.IDPLANOPREV) AS IDPLANOPREV, ' + #13 +
   '     PPP.IDSITPART, ' + #13 +
   //Pendência 23554 - 17/10/2006 - Marchetti
   '     PPP.INSCRICAONUMERO,' + #13 +
   //Fim Pendência 23554
   '     SP.FLGINTERNO, ' + #13 +
   '     PJ.NOME AS PATRO ' + #13 +
   'FROM ' + #13 +
   '     SITFUNC SFU, PESSOA P, PESSOAFISICA PF, DEPENTIT DPT, ' + #13 +
   '     DEPENDENTE DPD, SITDEPENDENTE SIT, PARTPREVPLAN PPP, ELEGPATRO ELP, ' + #13 +
   '     PESSOA PTIT, PLANPREV PPREV, PESSOA PJ, SITPLANOPREV SITP, SITPART SP, ' + #13 +
   '     ( ' + #13 +
   '      SELECT NVL(D.MATRICULA, E.MATRICULA) AS MATRICULA, D.IDPESSOA, D.IDTITULAR ' + #13 +
   '      FROM DEPENTIT D, ELEGPATRO E, PARTPREVPLAN P ' + #13 +
   '      WHERE E.IDPESSOA = D.IDTITULAR ' + #13 +
   '      AND NVL(D.MATRICULA, E.MATRICULA) IS NOT NULL ' + #13 +
   '      AND P.IDPESSOA(+) = E.IDPESSOA ' + #13 +
   '      AND P.FLGDESATIVADO(+) = 0 ' + #13 +
   '      AND P.IDPESSJUR(+) = E.IDPESSJUR ' + #13 +
   '     ) MATRICS, ' + #13 +
   '    ( ' + #13 +
   '    SELECT ' + #13 +
   '        BF.IDTITULAR, ' + #13 +
   '        BF.IDPESSOA, ' + #13 +
   '        BF.IDPESSJUR, ' + #13 +
   '        BF.IDPLANOPREV, ' + #13 +
   '        PL.NOME AS PLANO ' + #13 +
   '    FROM BENEFBFCIARIO BF, PLANPREV PL, ' + #13 +
   '        (SELECT ' + #13 +
   '             IDPESSOA, ' + #13 +
   '             IDTITULAR, ' + #13 +
   '             MAX(DATAINICIO) AS DATAINICIO ' + #13 +
   '         FROM BENEFBFCIARIO ' + #13 +
   '         GROUP BY IDPESSOA, IDTITULAR) DT ' + #13 +
   '    WHERE BF.IDPLANOPREV = PL.IDPLANOPREV ' + #13 +
   '    AND   BF.DATAINICIO =  DT.DATAINICIO ' + #13 +
   '    AND   BF.IDPESSOA = DT.IDPESSOA ' + #13 +
   '    AND   BF.IDTITULAR = DT.IDTITULAR ' + #13 +
   '    GROUP BY BF.IDTITULAR, BF.IDPESSOA, BF.IDPESSJUR, BF.IDPLANOPREV, PL.NOME ' + #13 +
   '     ) PLBENEF ' + #13 +
   'WHERE ' + #13 +
   '    (ELP.IDPESSJUR = PPP.IDPESSJUR(+)) ' + #13 +
   'AND (ELP.IDPESSOA  = PPP.IDPESSOA(+)) ' + #13 +
   'AND (ELP.IDPESSOA  = PTIT.IDPESSOA) ' + #13 +
   'AND (P.IDPESSOA    = DPT.IDPESSOA) ' + #13 +
   'AND (MATRICS.IDPESSOA = DPT.IDPESSOA) ' + #13 +
   'AND (MATRICS.IDTITULAR = DPT.IDTITULAR) ' + #13 +
   'AND ((PPP.FLGDESATIVADO = 1 AND  PPP.IDPESSOA NOT IN ( ' + #13 +
   '                                                     SELECT PPP1.IDPESSOA ' + #13 +
   '                                                     FROM PARTPREVPLAN PPP1 ' + #13 +
   '                                                     WHERE PPP1.IDPESSOA = PPP.IDPESSOA AND PPP1.IDPESSJUR = PPP.IDPESSJUR AND ' + #13 +
   '                                                     NVL(PPP1.FLGDESATIVADO, 0) = 0 ) OR NVL(PPP.FLGDESATIVADO, 0) = 0) OR ' + #13 +
   '                                                     (PPP.IDPESSOA IS NULL) ' + #13 +
   '                                                   ) ' + #13 +
   'AND (ELP.IDPESSOA     = DPT.IDTITULAR) ' + #13 +
   'AND (SFU.IDSITFUNC(+) = ELP.IDSITFUNC) ' + #13 +
   'AND (PPP.IDPLANOPREV  = PPREV.IDPLANOPREV(+)) ' + #13 +
   'AND (ELP.IDPESSJUR    = PJ.IDPESSOA(+)) ' + #13 +
   'AND (PPP.FLGDESATIVADO = 0) ' + #13 +
   'AND (PPP.IDSITPLANOPREV  = SITP.IDSITPLANOPREV (+)) ' + #13 +
   'AND (SP.IDSITPART(+)  = PPP.IDSITPART) ' + #13 +
   'AND (P.IDPESSOA  = PF.IDPESSOA) ' + #13 +
   'AND (PF.IDPESSOA = DPT.IDPESSOA) ' + #13 +
   'AND (PF.IDPESSOA = DPD.IDPESSOA) ' + #13 +
   'AND (DPD.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)) ' + #13 +
   'AND PLBENEF.IDPESSOA(+) = DPT.IDPESSOA ' + #13 +
   'AND PLBENEF.IDTITULAR(+) = DPT.IDTITULAR ' + #13 +
   'AND ELP.IDPESSJUR IN ( ' + molListaPatro.PegaPatro + ' ) ' + #13 +
   'AND NVL(PPP.IDPLANOPREV, PLBENEF.IDPLANOPREV) IN ( ' + molListaPlano.PegaPlano + ' ) '                + #13 +
   'AND NOT EXISTS (SELECT 1 FROM CONTRATOEMPTMO CON WHERE CON.IDBENEF = DPT.IDPESSOA AND CON.FLGSITUACAO = ''A'') ' + #13 +
   'AND NOT EXISTS (SELECT 1 FROM TMPDESC T WHERE T.IDMODULO = 15 AND T.MESCOBRANCA = ' + QuotedStr(sAno + '/' + sMes) + ' AND T.IDPESSOA = DPT.IDPESSOA AND T.IDPROVENTO = ' + cboRubrica.LookupValue + ')' +  #13;

   if iIDBenef > 0 then
      sSQL := sSQL + 'AND DPT.IDPESSOA = ' + IntToStr(iIDBenef) + #13;

   sSQL := sSQL +
   'ORDER BY ELP.IDPESSJUR, DPT.IDPESSOA ASC ' + #13;

   qryCalculo.Sql.Text := sSQL;
   
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryCalculo.Sql.SaveToFile(Sistema.TempDir + 'EP-CalculaValorMaximo.txt');
   qryCalculo.Sql.SaveToFile(ftempregra + '\' + 'EP-CalculaValorMaximo.txt');
   qryCalculo.Open;
end;



procedure TfrmCalculaValorMaximo.ProcessaCalculo;
var
   iNumParcelas        : Integer;
   sErro               : String;
   dDataFinalBeneficio : TDateTime;
   dDataRef            : TDateTime;
   iErro, iAcerto      : Integer;
   iIDPessoa           : Integer;
   fTxJuros            : Extended;
   rDadosTmpDesc       : TDadosTmpDesc;
   sAno                : String;
   sMes                : String;
   iLote               : Integer;
   iPatro              : Integer;
   iTotalReg           : Integer;
   fTotalPatro         : Extended;
   iContador           : Integer;
   sLinha              : String;
   iTotalRegistro      : Integer;
   iTotalRegTMP        : Integer;
begin

   sAno := IntToStr(Trunc(DBspnAno.Value));
   sMes := IntToStr(cboMes.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;

   iErro   := 0;
   iAcerto := 0;

   qryCalculo.First;

   iTotalRegistro := 0;

   if qryCalculo.IsEmpty then
   begin
      memErro.Lines.Add('Não foram encontrados participantes que atendam ao filtro informado.');
      Inc(iErro);
   end;

   frmProgressoDuplo.MostraFormProgressoDuplo('Calculando Valor Máximo para Empréstimo...',
                                              'Enviando dados para a Folha...',
                                              0,
                                              0,
                                              qryCalculo.RecordCount,
                                              0,
                                              True,
                                              True);


   while not qryCalculo.eof do
   begin

      iPatro        := qryCalculo.FieldByName('IDPATRO').AsInteger;
      iLote         := LeUltRegistro(nil, 'CTRLINTERFACE');
      iTotalReg     := 0;
      iTotalRegTMP  := 0;
      fTotalPatro   := 0;

      qryTmpDesc.Close;
      qryTmpDesc.Open;

      try

         while (iPatro = qryCalculo.FieldByName('IDPATRO').AsInteger) and
               (not qryCalculo.eof) do
         begin

            if frmProgressoDuplo.Cancelou then
            begin
               Repaint;
               Application.ProcessMessages;

               // Verifica se abortou processo
               if MsgDlg('Deseja realmente interromper o processamento?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               begin
                  Repaint;

                  Exit;
               end;
               Repaint;
            end;
            Repaint;

            Inc(iTotalRegistro);
            frmProgressoDuplo.AndaFormProgressoDuplo(iTotalRegistro,iTotalRegTMP);

            sErro := '';

            iIDPessoa := qryCalculo.FieldByName('IDTITULAR').AsInteger;
            iIDBenef  := qryCalculo.FieldByName('IDBENEF').AsInteger;

            LimpaRegistroContrato(rNovoContrato);
            // Verifica Elegibilidade
            if not(CalcEmptmo.VerificaElegibilidade(iIDPessoa, // Titular
                                                    iIDBenef,  // Mutuário
                                                    qryTipoContratoIDREGRAELEG.AsInteger,
                                                    //Pendências 23311 e 23312 - 25/09/2006 - Alberto
                                                    qryCalculoIDPLANOPREV.AsInteger,
                                                    //Fim Pendências 23311 e 23312
                                                    qryTipoContratoTCEMINRENOVA.AsInteger,
                                                    0,
                                                    dDataFinalBeneficio,
                                                    False       // Mostra mensagem de erro
                                                   )) then

            begin
               sErro := sErro + 'Participante: ' + qryCalculoMATRICULA.AsString + ' - ' + qryCalculoNOME.AsString + ' - Participante não passou na regra de elegibilidade.' + #13;
               Raise Exception.Create(sErro);
            end;

            // Verifica o numero máximo de parcelas
            iNumParcelas := SetNumParcelas;

            // Busca o salário base
            if not(qryTipoContratoIDREGRASALBAS.IsNull) then
            begin
               fVlrSalBase := CalcEmptmo.BuscaSalarioBase(qryTipoContratoIDREGRASALBAS.AsInteger,
                                                          iIDPessoa, // Titular
                                                          iIDBenef,  // Mutuário
                                                          fSalParticipacao,
                                                          fSalMantido,
                                                          fSalAuxDoenca,
                                                          fSalBenef,
                                                          //Pendência 24595 - 27/02/2007 - Alberto
                                                          //True,
                                                          False,
                                                          //Fim Pendência 24595
                                                          Date,
                                                          qryTipoContratoIDTIPOCONTREMPTMO.AsInteger
                                                          );
               if fVlrSalBase < 0 then
               begin
                  sErro := sErro + 'Participante: ' + qryCalculoMATRICULA.AsString + ' - ' + qryCalculoNOME.AsString + ' - Participante - Não foi possível recuperar o salário base.' + #13;
                  Raise Exception.Create(sErro);
               end;
            end;

            // função da unit UCalcEmptmo que busca a Margem Consignável do participante
            fVlrMargem := CalcEmptmo.BuscaMargem(iIDPessoa, // Titular
                                                 iIDBenef,  // Mutuário
                                                 qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                 fVlrSalBase,
                                                 0,
                                                 0,
                                                 fSalParticipacao,
                                                 fSalMantido,
                                                 fSalAuxDoenca,
                                                 fSalBenef,
                                                 //Pendência 24595 - 27/02/2007 - Alberto
                                                 False, //True,
                                                 //Fim Pendência 24595
                                                 Date,
                                                 iNumParcelas,

                                                 vDividasAnteriores

                                                );

            if fVlrMargem < 0 then
            begin
               sErro := sErro + 'Participante: ' + qryCalculoMATRICULA.AsString + ' - ' + qryCalculoNOME.AsString + ' - Participante - Não foi possível recuperar a margem consignável.' + #13;
               Raise Exception.Create(sErro);
            end;


            // função da unit UCalcEmptmo que busca a Reserva de Poupança do participante ou
            //   do beneficiário, no caso do pensionista
            fVlrReserva := CalcEmptmo.BuscaReserva(iIDBENEF,
                                                   qryCalculo.FieldByName('IDPATRO').AsInteger,
                                                   qryCalculo.FieldByName('IDPLANOPREV').AsInteger,
                                                   qryTipoContratoIDREGRARESERVA.AsInteger,
                                                   Date,
                                                   //Pendência 24595 - 27/02/2007 - Alberto
                                                   //True
                                                   False
                                                   //Fim Pendência 24595
                                                  );

            if fVlrReserva < 0 then
            begin
               sErro := sErro + 'Participante: ' + qryCalculoMATRICULA.AsString + ' - ' + qryCalculoNOME.AsString + ' - Participante - Não foi possível recuperar a reserva de poupança.' + #13;
               Raise Exception.Create(sErro);
            end;

            // Preenche dados do Contrato
            rNovoContrato.IDTipoContrEmptmo  := StrToInt(DBcboTipoContrato.LookupValue);
            rNovoContrato.IDPatro            := qryCalculo.FieldByName('IDPATRO').AsInteger;
            rNovoContrato.IDPlanoPrev        := qryCalculo.FieldByName('IDPLANOPREV').AsInteger;
            rNovoContrato.IDBenef            := iIDBenef;
            rNovoContrato.IDPessoa           := iIDPessoa;
            rNovoContrato.NumParcelas        := iNumParcelas;
            rNovoContrato.VlrContrato        := 0;
            rNovoContrato.DataCredito        := Date;
            rNovoContrato.DataAssinatura     := Date;
            rNovoContrato.DataInscricao      := Date;
            rNovoContrato.Indexador          := qryTipoContratoMOECODIGO.AsInteger;
            rNovoContrato.SiglaIndexador     := qryTipoContratoMOESIGLA.AsString;

            // Busca a taxa de Juros
            fTxJuros := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                qryTipoContratoIDREGRAJURCONC.AsInteger,
                                                0,                          // É parcela 0 na Concessão
                                                rNovoContrato.DataCredito,
                                                0,                          // Taxa de Juros Anterior é 0 na concessão
                                                rNovoContrato.VlrContrato,  // SaldoDev Anterior = Vlr Solic na concessão
                                                False,                      // Mostra
                                                rNovoContrato.Indexador
                                               );

            if fTxJuros < 0 then
            begin
               sErro := sErro + 'Participante: ' + qryCalculoMATRICULA.AsString + ' - ' + qryCalculoNOME.AsString + ' - Participante - Não foi possível recuperar a taxa de juros.' + #13;
               Raise Exception.Create(sErro);
            end;

            // Calcula o valor maximo permitido
            fVlrMaxPermit := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                                         qryCalculo.FieldByName('IDSITPART').AsInteger,
                                                         fTxJuros,
                                                         fVlrMargem,
                                                         fVlrReserva,
                                                         0,
                                                         0,
                                                         fSalParticipacao,
                                                         fSalMantido,
                                                         fSalAuxDoenca,
                                                         fSalBenef,
                                                         fVlrSalBase,
                                                         //Pendência 24595 - 27/02/2007 - Alberto
                                                         False, //True   // Mostra
                                                         //Fim Pendência 24595
                                                        //Pendência 26951 - 06/11/2007
                                                        vDividasAnteriores,
                                                        //Fim Pendência 26951
                                                        );

            if fVlrMaxPermit <= 0 then
            begin
               sErro := sErro + 'Participante: ' + qryCalculoMATRICULA.AsString + ' - ' + qryCalculoNOME.AsString + ' - Participante - Não foi possível recuperar o valor máximo possível para o empréstimo.' + #13;
               Raise Exception.Create(sErro);
            end;

            Inc(iTotalReg);

            //Pendência 23554 - 17/10/2006 - Marchetti
            LimpaParametros(qryRubricas);
            qryRubricas.ParamByName('PIDPATRO').AsInteger   := qryCalculo.FieldByName('IDPATRO').AsInteger;
            qryRubricas.ParamByName('PIDRUBRICA').AsInteger := dtmLookEmptmo.qryLookTipoContrIDPROVENTOVLMAX.AsInteger;
            qryRubricas.Open;
            //Fim Pendência 23554

            qryTmpDesc.Insert;
            qryTmpDescIDTMPDesc.AsFloat         := LeUltRegistro(nil, 'TMPDESC');
            qryTmpDescMesReferencia.AsString    := sAno + sMes;
            qryTmpDescRecPag.AsString           := 'R';
            qryTmpDescIDPessoa.AsInteger        := iIDBenef;
            qryTmpDescFlgTipoDesc.AsString      := 'E';
            qryTmpDescValor.AsFloat             := 0;
            qryTmpDescIDTitular.AsInteger       := iIDPessoa;
            qryTmpDescIDDesconto.AsInteger      := iIDBenef;
            qryTmpDescMesCobranca.AsString      := sAno + sMes;
            qryTmpDescIDPessjur.AsInteger       := qryCalculo.FieldByName('IDPATRO').AsInteger;
            //Pendência 23554 - 17/10/2006 - Marchetti
            qryTmpDescIDProvento.AsInteger      := qryRubricasIDPROVENTO.AsInteger;
            qryTmpDescIDPlanoprev.AsInteger     := qryCalculo.FieldByName('IDPLANOPREV').AsInteger;
            qryTmpDescFlgDesconto.AsInteger     := 2;
            qryTmpDescCodProvDesc.AsString      := qryRubricasCODPROVDESC.AsString;
            qryTmpDescMATRICULA.AsString        := qryCalculo.FieldByName('MATRICULA').AsString;
            qryTmpDescINSCRICAONUMERO.AsInteger := qryCalculo.FieldByName('INSCRICAONUMERO').AsInteger;
            //Fim Pendência 23554

            if qryCalculo.FieldByName('FLGINTERNO').AsString = 'AT' then
               qryTmpDescFlgDescFolha.AsString  := 'P'
            else
               qryTmpDescFlgDescFolha.AsString := 'B';

            dDataRef                      := StrToDate('01/' + sMes + '/' + sAno);

            qryTmpDescDataReferencia.AsDateTime  := dDataRef;
            qryTmpDescDescricao.AsString         := 'Valor Máximo para Empréstimo';
            qryTmpDescReferencia.AsString        := '***';
            qryTmpDescSitEnvio.AsString          := '0';
            qryTmpDescValorInfo.AsFloat          := fVlrMaxPermit;

            dDataRef := CalcEmptmo.BuscaData('N', // Normal
                                             'F', // Tipo de Cobrança
                                             qryCalculo.FieldByName('FLGINTERNO').AsString,
                                             qryCalculo.FieldByName('IDPATRO').AsInteger,
                                             qryCalculo.FieldByName('IDPLANOPREV').AsInteger,
                                             2, // Parcelas, isto é mais de 1 parcela
                                             dDataRef
                                            );


            qryTmpDescDataCobranca.AsDateTime := dDataRef;
            qryTmpDescIDLote.AsInteger        := iLote;
            qryTmpDesc.Post;

            fTotalPatro := fTotalPatro + fVlrMaxPermit;

            sLinha := 'Participante: ' + qryCalculoMATRICULA.AsString + ' - ' + qryCalculoNOME.AsString + ' - Valor Máximo: ' + FormatFloat('###,##0.00',fVlrMaxPermit);
            memResult.Lines.Add( sLinha );

            Inc(iAcerto);
            qryCalculo.Next;
         end;

         if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

         if not(IntegraEmptmo.InsertCtrlInterface(iLote, iTotalReg, iPatro, sAno + '/' + sMes, fTotalPatro)) then
         begin
            if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
            sErro := sErro + 'ERRO ao inserir na CTRLINTERFACE - ' + IntToStr(iPatro);
            Raise Exception.Create(sErro);
         end;
         if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;

         qryTmpDesc.First;
         frmProgressoDuplo.Max2 := qryTmpDesc.RecordCount;
         frmProgressoDuplo.Update;

         while not qryTmpDesc.eof do
         begin
            Inc(iTotalRegTMP);
            frmProgressoDuplo.AndaFormProgressoDuplo(iTotalRegistro,iTotalRegTMP);

            rDadosTmpDesc.IDTMPDESC          := qryTmpDescIDTMPDesc.AsFloat;
            rDadosTmpDesc.MesReferencia      := qryTmpDescMesReferencia.AsString;
            rDadosTmpDesc.RecPag             := qryTmpDescRecPag.AsString;
            rDadosTmpDesc.IDPessoa           := qryTmpDescIDPessoa.AsInteger;
            rDadosTmpDesc.FlgTipoDesc        := qryTmpDescFlgTipoDesc.AsString;
            rDadosTmpDesc.Valor              := qryTmpDescValor.AsFloat;
            rDadosTmpDesc.IDTitular          := qryTmpDescIDTitular.AsInteger;
            rDadosTmpDesc.IDDesconto         := qryTmpDescIDDesconto.AsInteger;
            rDadosTmpDesc.MesCobranca        := qryTmpDescMesCobranca.AsString;
            rDadosTmpDesc.IDPessjur          := qryTmpDescIDPessjur.AsInteger;
            rDadosTmpDesc.IDProvento         := qryTmpDescIDProvento.AsInteger;
            rDadosTmpDesc.IDPlanoprev        := qryTmpDescIDPlanoprev.AsInteger;
            rDadosTmpDesc.FlgDesconto        := qryTmpDescFlgDesconto.AsInteger;
            rDadosTmpDesc.CodProvDesc        := qryTmpDescCodProvDesc.AsString;
            rDadosTmpDesc.FlgDescFolha       := qryTmpDescFlgDescFolha.AsString;
            rDadosTmpDesc.DataReferencia     := qryTmpDescDataReferencia.AsDateTime;
            rDadosTmpDesc.Descricao          := qryTmpDescDescricao.AsString;
            rDadosTmpDesc.Referencia         := qryTmpDescReferencia.AsString;
            rDadosTmpDesc.SitEnvio           := qryTmpDescSitEnvio.AsString;
            rDadosTmpDesc.ValorInfo          := qryTmpDescValorInfo.AsFloat;
            rDadosTmpDesc.DataCobranca       := qryTmpDescDataCobranca.AsDateTime;
            rDadosTmpDesc.IDLote             := qryTmpDescIDLote.AsInteger;
            //Pendência 23554 - 17/10/2006 - Marchetti
            rDadosTmpDesc.InscricaoNumero    := qryTmpDescINSCRICAONUMERO.AsInteger;
            rDadosTmpDesc.Matricula          := qryTmpDescMATRICULA.AsString;
            //Fim Pendência 23554

            if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

            if not(IntegraEmptmo.InsertTmpDesc(rDadosTmpDesc,
                                               rDadosTmpDesc.IDTMPDesc,
                                               rDadosTmpDesc.Valor)) then
            begin
               if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
               sErro := sErro + 'ERRO ao inserir na TMPDESC - ' + IntToStr(iPatro);
               Raise Exception.Create(sErro);
            end;
            if (dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;

            qryTmpDesc.Next;
         end;
         qryTmpDesc.CancelUpdates;
      except
         On E:Exception Do
         begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
            memErro.Lines.Add(sErro);
            Inc(iErro);
            qryCalculo.Next;
         end;
      end;
   end;

   frmProgressoDuplo.EscondeFormProgressoDuplo;

   //Pendência 24595 - 06/03/2007 - Alberto
   if edtMatricula.Text = '' then
     iIDBenef := -1;
   LimpaParametros(qryRubricas);
   qryRubricas.Open;
   //Fim Pendência 24595

   edtNumResult.Value := iAcerto;
   edtNumErro.Value   := iErro;
   Repaint;
end;



function TfrmCalculaValorMaximo.SetNumParcelas : Integer;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   // Procedure que atualiza no SpinEdit do Número de Parcelas o Mínimo e Máximo
   //   de parcelas permitidas levando em consideração o Tipo de Contrato/Empréstimo

   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   Result := 0;

   try
      sSQL :=
      'SELECT '                                                              + #13 +
      '  TCEMINPARC, TCEMAXPARC '                                            + #13 +
      'FROM '                                                                + #13 +
      '  TIPOCONTREMPTMO '                                                   + #13 +
      'WHERE'                                                                + #13 +
      '  IDTIPOCONTREMPTMO = ' + qryTipoContratoIDTIPOCONTREMPTMO.AsString   + #13 +
      '  AND IDTIPOEMPTMO  = ' + qryTipoContratoIDTIPOEMPTMO.AsString;

      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
      qryAux.Open;

      if not(qryAux.IsEmpty) then
      begin

         if qryTipoContratoIDREGRAPRAZOMAX.IsNull then
            Result := qryAux.FieldByName('TCEMAXPARC').AsInteger
         else
            Result := CalcEmptmo.BuscaPrazoContrato(qryCalculo.FieldByName('IDTITULAR').AsInteger,
                                                    qryCalculo.FieldByName('IDBENEF').AsInteger,
                                                    qryAux.FieldByName('TCEMAXPARC').AsInteger,
                                                    qryTipoContratoIDREGRAPRAZOMAX.AsInteger,
                                                    qryTipoContratoIDTIPOCONTREMPTMO.AsInteger,
                                                    Date,
                                                    False
                                                   );
      end;
   finally
     qryAux.Free;
   end;
end;



procedure TfrmCalculaValorMaximo.btnBuscaPartClick(Sender: TObject);
begin
   inherited;

   edtMatricula.Clear;
   edtNome.Clear;
   iIDBenef := -1;

   MontaSelect.Executar;
   if MontaSelect.RetornouValor then
   begin
      iIDBenef          := StrToInt(MontaSelect.ValoresChave[0]);
      edtMatricula.Text := MontaSelect.ValoresChave[1];
      edtNome.Text      := MontaSelect.ValoresChave[2];
   end;
end;



procedure TfrmCalculaValorMaximo.btnLimpaPartClick(Sender: TObject);
begin
   inherited;
   edtMatricula.Clear;
   edtNome.Clear;
   iIDBenef := -1;
end;



procedure TfrmCalculaValorMaximo.FormCreate(Sender: TObject);
begin
   inherited;
   vDividasAnteriores := nil;
end;



end.
