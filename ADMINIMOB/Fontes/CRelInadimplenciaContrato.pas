{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
-------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 147289
N. Kintana.........: 1017104
Data...............: 14/04/2011
Responsável........: Felipe de Oliveira
Descrição..........: Quando relatórios de inadimplencia não possuirem
                     inadinplencia, imprimir mensagem no relatório
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 131923
N. Kintana.........: 758691
Data...............: 27/04/2010
Responsável........: Felipe de Oliveira
Descrição..........: Alteração da Query para pegar a porcentagem de acordo com a
                      data de vigência mais próxima da data selecionada.
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato, FormDestroy, FormCreate
N. Sol.............: 126316
N. Kintana.........: 660057
Data...............: 20/07/2009
Responsável........: Ricardo Alves
Descrição..........: Alterado relatório de Inadimplência por Contrato.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 57966
N. Kintana.........: 523392
Data...............: 20/07/2009
Responsável........: Ricardo Alves
Descrição..........: Otimizada consulta.
--------------------------------------------------------------------------------

Pendências  : 24878
Responsável : Daniel Simões
Data        : 01/06/2007
Descrição   : Implementação de filtro e quebra de grupo por tipo de contrato
             ( Locação ou Confissão de Dívida) e situação contratual.
--------------------------------------------------------------------------------
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : Mudança na 'qryParamOper'. Passa a buscar a Data do último
              fechamento na tabela PARAMIMOVEL...
--------------------------------------------------------------------------------
Pendência   : 22531
Responsável : Daniel Simões
Data        : 06/06/2006
Descrição   : Passa a utilizar a data de limite de inadimplência na busca dos
              valores de movimentação do documento e validação da data limite
              para pagamento...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelInadimplenciaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, wwdblook, StdCtrls, Mask, wwdbedit,
  Db, DBTables, Wwquery, MontaSelect, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcCombo, fcColorCombo, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario, mResponsavel,         
  uCmSqlParams, DBClient, uCMClientDataSet, DBCtrls, uCtrlPatrocinadora,
  uCtrlPlanPrevContabil, uCtrlPlanPrevContabPatro;

type
  TcfgRelInadimplenciaContrato = class(TcfgRel)
    Label1: TLabel;
    Label4: TLabel;
    btnBuscaContrato: TBitBtn;
    edtConNome: TEdit;
    edtConNumero: TEdit;
    btnLimpaContrato: TBitBtn;
    grpDatas: TGroupBox;
    edtDataFim: TCMDateTimePicker;
    chkVigente: TCheckBox;
    rdgOrdenacao: TRadioGroup;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    btnLimpaAdminImovel: TBitBtn;
    molResponsavel1: TmolResponsavel;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    edDataAtualiza: TCMDateTimePicker;
    qryParamOper: TQuery;
    dsParamOper: TDataSource;
    chkVlrPositivo: TCheckBox;
    qryParamOperDTULTFECH: TDateTimeField;
    Label5: TLabel;
    dbCboSituacaoContratual: TwwDBLookupCombo;
    gbTipoContrato: TGroupBox;
    cbLocacao: TCheckBox;
    cbConfissao: TCheckBox;
    qrySitContratual: TQuery;
    qrySitContratualDESCRICAO: TStringField;
    qrySitContratualIDSITCONTIMOB: TFloatField;
    dsSitContratual: TDataSource;
    cbbPlano: TDBLookupComboBox;
    cbbPatro: TDBLookupComboBox;
    cdsPlano: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    dsPatro: TDataSource;
    dsPlano: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    cdsTemp: TClientDataSet;


    // prodecimentos definidos
    function VerificaPreenchimento: boolean;
// Felipe de Oliveira SOL 131923 - KTN 758691 27/04/2010
    procedure FiltraContrato;
    procedure MontaQuery; override;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    // SOL 126316 KTN 660057 Ricardo A.
    procedure FormDestroy(Sender: TObject);
    // FIM SOL 126316 KTN 660057 Ricardo A.

  private { Private declarations }
    sContrato      : string;
    iAdminImovel   : integer;

    // SOL 126316 KTN 660057 Ricardo A.
    CtrlPatrocinadora: TCtrlPatrocinadora;
    CtrlPlanoPrev: TCtrlPlanPrevContabil;
    CtrlPlanoPatro: TCtrlPlanPrevContabPatro;
    // FIM SOL 126316 KTN 660057 Ricardo A.

  public { Public declarations }
   dDtAtualiza    : TDateTime;

  end;



var
  cfgRelInadimplenciaContrato: TcfgRelInadimplenciaContrato;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, DMS, uFuncoesImob, CMwwQuery;



function TcfgRelInadimplenciaContrato.VerificaPreenchimento: boolean;
begin
  Result := False;

  try

    // SOL 126316 KTN 660057 Ricardo A.
    if ( Trim(cbbPlano.Text) <> '' ) and ( Trim(cbbPatro.Text) = '' ) then
      raise EValidacao.CreateVal( 'Se o Plano Previdenciário estiver preenchido o Patrocinador' +
        ' também deve ser preenchido.', cbbPatro );
    if ( Trim( cbbPlano.Text ) = '' ) and ( Trim( cbbPatro.Text ) <> '' ) then
      raise EValidacao.CreateVal( 'Se o Patrocinador estiver preenchido o Plano Previdenciário' +
        ' também deve ser preenchido.', cbbPlano );

    if ( Trim(cbbPlano.Text) <> '' ) and
      not CtrlPlanoPatro.ValidaPlanoPatro( cbbPatro.KeyValue, cbbPlano.KeyValue ) then
      raise EValidacao.createVal( CtrlPlanoPatro.MessageInfo, cbbPatro );
    // FIM SOL 126316 KTN 660057 Ricardo A.

    if (length(trim(edDataAtualiza.Text)) = 0) then
      raise EValidacao.CreateVal('Preencha a data de atualização.',edDataAtualiza);

    if ( (length(trim(edtDataFim.Text)) = 0) and
       ( (cboMesCompetencia.ItemIndex = -1) or (DBspnAnoCompetencia.Value = 0) ) ) then
      raise EValidacao.CreateVal('É necessário indicar a Data ou o Mês de Competência!', edtDataFim);
  except
    on ev : EValidacao do begin
      Screen.Cursor := crDefault;

      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;

      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;



procedure TcfgRelInadimplenciaContrato.FiltraContrato;
var
  sParamOper, sParamOper2, sParamOper3 : string;
  edDataOper, edDataFim   : TDateTime;
  edDataLanc : TDateTime;
  iAnoComp, iMesComp : Integer;

  // Ricardo A. SOL 57966 KTN 523392
  qryParametros: TCMwwQuery;
  sParamMulta, sParamAcum, sParamJuros: string;

  // SOL 126316 KTN 660057 Ricardo A.
  sParamPlanoPatro: string;                                                                            
  curTotal, curTemp, iPercentual: Currency;
  // FIM SOL 126316 KTN 660057 Ricardo A.
  dValor : Double;
// Felipe de Oliveira SOL147289  KTN1017104
// variável criada para evitar que os calculos de segregação sejam feitos quando o relatório vier zerado  
  bSemValor : Boolean;
begin
// Daniel Simões - 27/06/2006 -------------------------------------------------
   iAnoComp := trunc(DBspnAnoCompetencia.Value);
   iMesComp := cboMesCompetencia.ItemIndex+1;

   sParamOper  := '';
   sParamOper2 := '';
   sParamOper3 := '';

  // SOL 126316 KTN 660057 Ricardo A.
  if ( Trim( cbbPatro.Text ) <> '' ) then
  begin
    sParamPlanoPatro := ' AND EXISTS(' +
        '       SELECT 1' +
        '       FROM PLANOPATROXIMOVEL PPI, CONTRATOXIMOVEL CXI' +
        '       WHERE CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL' +
        '       AND CXI.IDIMOVEL = PPI.IDIMOVEL';
    sParamPlanoPatro := sParamPlanoPatro + '       AND PPI.IDPATRO = ' + IntToStr( cbbPatro.KeyValue );
    sParamPlanoPatro := sParamPlanoPatro + '       AND PPI.IDPLANOPREV = ' + IntToStr( cbbPlano.KeyValue );
    sParamPlanoPatro := sParamPlanoPatro + '       )';
  end
  else
    sParamPlanoPatro := '';
  // FIM SOL 126316 KTN 660057 Ricardo A.


   // Ricardo A. SOL 57966 KTN 523392
   // Armazena parâmetros imobiliários
   qryParametros := TCMwwQuery.Create( nil );
   try
     qryParametros.DatabaseName := 'BASEDADOS';
     qryParametros.SQL.Add( 'SELECT IDOPERATUALCM, IDOPERATUALJUROS, IDOPERATUALMULTA FROM PARAMIMOVEL' );
     qryParametros.Open;
     sParamAcum := qryParametros.FieldByName( 'IDOPERATUALCM' ).AsString;
     sParamJuros := qryParametros.FieldByName( 'IDOPERATUALJUROS' ).AsString;
     sParamMulta := qryParametros.FieldByName( 'IDOPERATUALMULTA' ).AsString;
   finally
     FreeAndNil( qryParametros );
   end;

//Ádler Teodoro de Souza - 113596 - INÍCIO
   if ( edtDataFim.Date > 0 ) then
     begin
      edDataLanc := edtDataFim.Date;
      sParamoper3 := '      AND ( LD.DATALANCTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) ' +#13;
     end
   else
      edDataLanc := DiasUteis.UltDiaMes(iAnoComp,iMesComp);
//Ádler Teodoro de Souza - 113596 - FIM

// Daniel Simões - 27/06/2006 - ------------------------------------------------

   edDataOper := edDataAtualiza.Date;

   sParamOper  := ' AND ( LO2.DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13;
   if sContrato <> '' then sParamOper2 := '  AND LO.IDCONTRATOIMOVEL = ' + sContrato;

   with dtmRelAdminImobCC.qryInadimplenciaContrato do begin

      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   C.IDCONTRATOIMOVEL, ' + #13 +
      '   C.CONNUMERO AS NUMERO_CONTRATO, ' + #13 +
      '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', C.CONNOME) AS NOME_CONTRATO, ' + #13 +
      '   C.CONDATAINICIO, C.CONDATAFIM, ' + #13 +
      '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', PL.NOME)   AS NF_LOCATARIO, ' + #13 +
      '   C.IDLOCATARIO, PL.RAZAOSOCIAL AS RS_LOCATARIO, ' + #13 +
      '   C.IDADMINIMOVEL, PA.NOME AS NF_ADMINISTRADORA, PL.RAZAOSOCIAL AS RS_ADMINISTRADORA, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Campo Descr_SitContr
      '   SC.DESCRICAO AS DESCR_SITCONTR,  ' + #13 +
      // Alterado em 11/05/2006 - Daniel Simões...
      '   SUM(ROUND( (REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2 )) AS TOT_RECEBER ' + #13 +

      'FROM ' + #13 +
      '   PESSOA PL, PESSOA PA, CONTRATOIMOVEL C, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado a Tabela SitContImob
      '   SITCONTIMOB SC,                 ' + #13 +

      '   ( ' + #13 +
      '   SELECT ' + #13 +
      '      LI.IDCONTRATOIMOVEL, ' + #13 +

      '      LI.CODDOCUMENTO , ' + #13 +

      '      SUM( ' + #13 +
      '      DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '      DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '      DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '      DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '      ) AS TOT_RECEBER, ' + #13 +

      '      SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS RECEBIDO ' + #13 +

      '   FROM ' + #13 +
      '      DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T, CONTRATOIMOVEL C, ' + #13 +

      '      ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '        FROM LANCTODOCUM ' + #13 +
      '        WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD ' + #13 +

      '   WHERE  ' + #13 +
      '          ( LI.CODDOCUMENTO   = D.CODDOCUMENTO )        ' + #13 +
// Daniel Simões - 22531

//Ádler Teodoro de Souza - 113596 - INÍCIO
       sParamOper3 +
//Ádler Teodoro de Souza - 113596 - FIM

      '      AND ( C.FLGTIPOCONTRATO IN (''L'',''D'') OR LI.IDCONTRATOIMOVEL IS NULL )' + #13 +
      '      AND ( LD.ESTORNO IS NULL ) ' + #13 + // Daniel Simões - 10/09/2006
      '      AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) ' + #13 + // Daniel Simões - 10/09/2006

      // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006
      '      AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +
      '      AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO              ' + #13 +
      '                                       FROM CONCILIADOC              ' + #13 +
      '                                      WHERE FLGTIPO = ''A''          ' + #13 +
      '                                        AND IDPARCFINANCIMOV IS NULL ' + #13 +
      '                                        AND DATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) )' + #13 +
      // Fim - Vinicius 01/11/2006

      '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '      AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )' + #13 +
      '      AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )     ' + #13 +
      '      AND ( (LD.CODALTERADOR IS NULL) OR           ' + #13 +

      '            (LD.CODALTERADOR IN(T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON) AND'+#13+
      '             LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') AND           '+#13+
      '             NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB                           '+#13+
      '                                  WHERE CODDOCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ) OR     '+#13+

      '            (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) AND  ' + #13 +
      '             LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) AND  ' + #13 +
      '             LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) ) ' + #13;


      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
        SQL.Text := SQL.Text +
        '    AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) OR '+#13+
        '          (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) )  '+#13;

      end else begin
        SQL.Text := SQL.Text +
        '      AND ( (LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ') AND (LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ') ) ' + #13;
      end;

      // Ricardo A. SOL 57966 KTN 523392
      if ( sContrato <> '' ) then
        SQL.Text := SQL.Text + ' AND C.IDCONTRATOIMOVEL = ' + sContrato + #13;

      SQL.Text := SQL.Text +
      '   GROUP BY ' + #13 +
      '      LI.IDCONTRATOIMOVEL ' + #13 +
      '      , LI.CODDOCUMENTO ' + #13 +
      '   ) REC_DES, ' + #13 +


      '   (SELECT LO.IDCONTRATOIMOVEL, LO.CODDOCUMENTO, SUM(LO.VLRACUM) AS VLRCORRECAO     ' + #13 +

      // Ricardo A. SOL 57966 KTN 523392
      //'     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, ' + #13 +
      '     FROM LANCOPERDIAIMOB LO, ' + #13 +

      '          ( SELECT LO2.CODDOCUMENTO, LO2.IDOPERACAO, MAX(LO2.DATAOPER) AS ULTDIA ' + #13 +

      // Ricardo A. SOL 57966 KTN 523392
      //'              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 ' + #13 +
      '              FROM LANCOPERDIAIMOB LO2 ' + #13 +

      // Ricardo A. SOL 57966 KTN 523392
//      '             WHERE ( LO2.IDOPERACAO = PI2.IDOPERATUALCM    OR ' + #13 +
//      '                     LO2.IDOPERACAO = PI2.IDOPERATUALJUROS OR ' + #13 +
//      '                     LO2.IDOPERACAO = PI2.IDOPERATUALMULTA ) AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')' + #13 + sParamOper +
      '             WHERE ( LO2.IDOPERACAO IN ( ' + sParamAcum + ', ' + sParamJuros + ', ' + sParamMulta + ' ) )';

      // Ricardo A. SOL 57966 KTN 523392
      if ( sContrato <> '' ) then
        SQL.Text := SQL.Text + ' AND LO2.IDCONTRATOIMOVEL = ' + sContrato + #13;

      SQL.Text := SQL.Text +

      '             GROUP BY LO2.CODDOCUMENTO, LO2.IDOPERACAO ' + #13 +
      '           ) UD ' + #13 +

      // Ricardo A. SOL 57966 KTN 523392
//      '    WHERE ( LO.IDOPERACAO = PI.IDOPERATUALCM    OR ' + #13 +
//      '            LO.IDOPERACAO = PI.IDOPERATUALJUROS OR ' + #13 +
//      '            LO.IDOPERACAO = PI.IDOPERATUALMULTA ) ' + #13 +
      '             WHERE ( LO.IDOPERACAO IN ( ' + sParamAcum + ', ' + sParamJuros + ', ' + sParamMulta + ' ) )' +

      '      AND LO.DATAOPER     = UD.ULTDIA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')' + #13 +
      '      AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+) ' + #13 +
      '      AND LO.IDOPERACAO   = UD.IDOPERACAO (+)   ' + #13 + sParamOper2 +
      '    GROUP BY LO.IDCONTRATOIMOVEL , LO.CODDOCUMENTO' + #13 +
      '   ) COR ' + #13 +
      'WHERE ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Join entre as tabelas
      '      ( C.IDSITCONTIMOB      = SC.IDSITCONTIMOB (+) )  AND  ' + #13;

      if sContrato <> '' then
      SQL.Text := SQL.Text +
      '   ( C.IDCONTRATOIMOVEL = ' + sContrato + ' ) AND ';

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

      if molResponsavel1.iResponsavel > 0 then
      SQL.Text := SQL.Text +
      '   ( C.IDRESPONSAVEL = ' + IntToStr(molResponsavel1.iResponsavel ) + ' ) AND ' + #13;

      if chkVigente.Checked then
      SQL.Text := SQL.Text +
      '   ( ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
      '   ( C.FLGINDETERMINADO = ''S'' ) ) AND ' + #13;

      SQL.Text := SQL.Text +
      '       ( C.IDLOCATARIO = PL.IDPESSOA(+) ) ' + #13 ;

// Daniel - 24878 - Início -----------------------------------------------------
     if (dbCboSituacaoContratual.LookupValue<>'') then
       SQL.Text := SQL.Text+'   AND ( C.IDSITCONTIMOB = '+QuotedStr(dbCboSituacaoContratual.LookupValue)+' ) ';

     if (cbLocacao.Checked) and not (cbConfissao.Checked) then
       SQL.Text := SQL.Text+'   AND ( C.FLGTIPOCONTRATO = ''L'' ) ';

     if (cbConfissao.Checked) and not (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( C.FLGTIPOCONTRATO = ''D'' ) ';

     if (cbConfissao.Checked) and (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( C.FLGTIPOCONTRATO IN(''L'',''D'') ) ';
// Daniel - 24878 - Fim --------------------------------------------------------

      SQL.Text := SQL.Text +
      '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) ) ' + #13 +
      '   AND ( REC_DES.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) ' + #13 +
      '   AND ( REC_DES.IDCONTRATOIMOVEL = COR.IDCONTRATOIMOVEL(+) )  ' + #13 +
      '   AND ( REC_DES.CODDOCUMENTO = COR.CODDOCUMENTO(+) ) ' + #13 ;


// Daniel Simões - 04/05/2006 - ------------------------------------------------
      if ChkVlrPositivo.Checked then begin
        SQL.Text := SQL.Text +
         '   AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) > 0 )  ' + #13;
      end else begin
        SQL.Text := SQL.Text +
         '   AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) <> 0 )  ' + #13;
      end;

      // SOL 126316 KTN 660057 Ricardo A.
      if sParamPlanoPatro <> '' then
        SQL.Text := SQL.Text + sParamPlanoPatro + #13;
      // FIM SOL 126316 KTN 660057 Ricardo A.

        SQL.Text := SQL.Text +
         ' GROUP BY C.IDCONTRATOIMOVEL, ' + #13 +
         '          C.CONNUMERO, DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', C.CONNOME), ' + #13 +
         '          C.CONDATAINICIO, C.CONDATAFIM, ' + #13 +
         '          C.IDLOCATARIO, DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', PL.NOME), PL.RAZAOSOCIAL, ' + #13 +
         '          C.IDADMINIMOVEL, PA.NOME, PL.RAZAOSOCIAL ' + #13 +
         // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
         // Foi adicionado o campo no Group by
         '          ,SC.DESCRICAO';
        SQL.Text := SQL.Text +
// Daniel Simões - 04/05/2006 - ------------------------------------------------

      'ORDER BY ' + #13;

      case rdgOrdenacao.ItemIndex of
         0: SQL.Text := SQL.Text + '   C.CONNUMERO, NF_LOCATARIO ';
         1: SQL.Text := SQL.Text + '   NF_LOCATARIO, C.CONNUMERO ';
      end;

      // SOL 126316 KTN 660057 Ricardo A.
      Open;
      // FIM SOL 126316 KTN 660057 Ricardo A.

// Felipe de Oliveira SOL147289  KTN1017104 - Início
   if IsEmpty then
   begin
      if sContrato <> '' then
      begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT  C.IDCONTRATOIMOVEL,                                                          ' + #13 +
          '   C.CONNUMERO AS NUMERO_CONTRATO,                                                               ' + #13 +
          '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', C.CONNOME) AS NOME_CONTRATO,       ' + #13 +
          '   C.CONDATAINICIO, C.CONDATAFIM,                                                                ' + #13 +
          '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', PL.NOME)   AS NF_LOCATARIO,        ' + #13 +
          '   C.IDLOCATARIO, PL.RAZAOSOCIAL AS RS_LOCATARIO,                                                ' + #13 +
          '   C.IDADMINIMOVEL, PA.NOME AS NF_ADMINISTRADORA, PL.RAZAOSOCIAL AS RS_ADMINISTRADORA,           ' + #13 +
          '   '' '' AS DESCR_SITCONTR,                                                                      ' + #13 +
          '   0 AS TOT_RECEBER                                                                              ' + #13 +
          ' FROM   PESSOA PL, PESSOA PA, CONTRATOIMOVEL C                                                   ' + #13 +
          ' WHERE C.IDLOCATARIO = PL.IDPESSOA                                                               ' + #13 +
          ' AND  C.IDADMINIMOVEL = PA.IDPESSOA(+)                                                           ' + #13 +
          ' AND C.IDCONTRATOIMOVEL = ' + sContrato;
          Open;
          dtmRelAdminImobCC.ppLabel233.Caption := '"Não há débitos para este Contrato"';

      end
      else
         dtmRelAdminImobCC.ppLabel233.Caption := '"Não há débitos para este Período"';

      bSemValor := True;
      dtmRelAdminImobCC.ppLabel233.Visible := True;
      dtmRelAdminImobCC.ppSubReport1.Visible := False;
      dtmRelAdminImobCC.rptInadimplenciaContratoShape1.Visible := False;
      dtmRelAdminImobCC.rptInadimplenciaContratoLabel2.Visible := False;
      dtmRelAdminImobCC.rptInadimplenciaContratoDBCalc1.Visible := False;

   end
   else
   begin
      bSemValor := False;
      dtmRelAdminImobCC.ppLabel233.Visible := False;
      dtmRelAdminImobCC.ppSubReport1.Visible := True;
      dtmRelAdminImobCC.rptInadimplenciaContratoShape1.Visible := True;
      dtmRelAdminImobCC.rptInadimplenciaContratoLabel2.Visible := True;
      dtmRelAdminImobCC.rptInadimplenciaContratoDBCalc1.Visible := True;
   end;


// Felipe de Oliveira SOL147289  KTN1017104 - Fim

   end;

  // SOL 126316 KTN 660057 Ricardo A.

  if not bSemValor then
  begin
    curTotal := 0;

    dtmRelAdminImobCC.cdsGrupoSeg.Data := CtrlPatrocinadora.getDataPacket(
                         'SELECT'+
                         '        0 AS IDPATRO,'+
                         '        0 AS IDPLANOPREV,'+
                         '        0.00000 AS VALOR,'+
                         '        0.00000 AS PERCENT,'+
                         '        ''                                      ''      AS PATROCINADORA,'+
                         '        ''                                                              ''      AS PLANOPREV '+
                         'FROM DUAL ' +
                         'WHERE 1 = 2 ');

    dtmRelAdminImobCC.qryInadimplenciaContrato.First;
    while not dtmRelAdminImobCC.qryInadimplenciaContrato.Eof do
    begin

      // MONTA O VALOR PROPORCIONAL EM RELAÇÃO AS VENDAS DOS IMÓVEIS E O VALOR TOTAL DO CONTRATO
      // EM RELAÇÃO AO VALOR PROVIDO APÓS PERDAS
      // SERVE PARA DESCOBRIR O PERCENTUAL DE CADA IMÓVEL EM RELAÇÃO AO VALOR COM PERDAS
  //    cdsTemp.Data := CtrlPatrocinadora.getDataPacket(
  //      ' SELECT' +
  //      '         PPI.IDPATRO, PPI.IDPLANOPREV, ' +
  //      '         PPI.PPIPERCENTRATEIO, PATRO.NOME AS PATROCINADORA, PLANO.NOME AS PLANOPREV,' +
  //      '         DECODE(V.VALOR, 0, 0, PPI.PPIPERCENTRATEIO / 100 * (DECODE(CTI.FLGTIPOCONTRATO, ''C'', VLRVENDA, ''L'', CIMVLRALUGUEL) / V.VALOR * ' +
  //                StringReplace( dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'TOT_RECEBER' ).AsString, ',', '.', [] ) + ')) AS VALORP' +
  //      ' FROM' +
  //      '         PLANOPATROXIMOVEL PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL CTI,' +
  //      '         (SELECT CTI.IDCONTRATOIMOVEL, SUM(DECODE(CTI.FLGTIPOCONTRATO, ''C'', VLRVENDA, ''L'', CIMVLRALUGUEL)) AS VALOR' +
  //      '                 FROM CONTRATOXIMOVEL CXI, CONTRATOIMOVEL CTI' +
  //      '                 WHERE ' +
  //      '                 CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL' +
  //      '                 GROUP BY CTI.IDCONTRATOIMOVEL) V' +
  //      ' WHERE ' +
  //      '         PLANO.IDPLANOPREV         = PPI.IDPLANOPREV' +
  //      '         AND PATRO.IDPESSOA        = PPI.IDPATRO' +
  //      '         AND PPI.IDIMOVEL          = CXI.IDIMOVEL' +
  //      '         AND CTI.IDCONTRATOIMOVEL  = ' + dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'IDCONTRATOIMOVEL' ).AsString  +
  //      '         AND CXI.IDCONTRATOIMOVEL  = CTI.IDCONTRATOIMOVEL' +
  //      '         AND V.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL' +
  //      ' ORDER BY CXI.IDIMOVEL');


  //Sol 131923 KTN 758691 Data 27/04/2010 Felipe de Oliveira
      cdsTemp.Data := CtrlPatrocinadora.getDataPacket(
       'SELECT DISTINCT PPI.IDPATRO,                                 '+
       '            PPI.IDPLANOPREV,                                 '+
       '            PATRO.NOME AS PATROCINADORA,                     '+
       '            PLANO.NOME AS PLANOPREV,                         '+
       '            CONT.PERCENTRATEIO                               '+
       'FROM PLANOPATROXVIGENCIAIMOB PPI,                            '+
       '   PESSOA PATRO,                                             '+
       '    PLANPREVCONTABIL PLANO,                                  '+
       '    CONTRATOXIMOVEL CXI,                                     '+
       '    (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA            '+
       '       FROM PLANOPATROXVIGENCIAIMOB PPB, CONTRATOXIMOVEL CXI '+
       '      WHERE PPB.DATAVIGENCIA <= '+ QuotedStr(DateToStr(edDataAtualiza.Date))+
       '        AND PPB.IDIMOVEL = CXI.IDIMOVEL                      '+
       '        AND CXI.IDCONTRATOIMOVEL = '+ dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'IDCONTRATOIMOVEL' ).AsString  +') VIG,'+
       '    (SELECT PPI.IDPLANOPREV,                                 '+
       '            SUM((PPI.PPIPERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO '+
       '       FROM PLANOPATROXIMOVEL PPI,                           '+
       '            CONTRATOXIMOVEL CXI,                             '+
       '            CONTRATOIMOVEL CTI,                              '+
       '            (SELECT SUM(PPV.PERCENTRATEIO) AS PPIPERCENTRATEIO '+
       '               FROM PLANOPATROXVIGENCIAIMOB PPV,             '+
       '                    CONTRATOXIMOVEL         CXI,             '+
       '                    CONTRATOIMOVEL          CTI              '+
       '              WHERE CTI.IDCONTRATOIMOVEL = '+ dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'IDCONTRATOIMOVEL' ).AsString  +
       '                AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL '+
       '                AND PPV.IDIMOVEL = CXI.IDIMOVEL              '+
       '                AND PPV.DATAVIGENCIA = (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA '+
       '                                          FROM PLANOPATROXVIGENCIAIMOB PPB,     '+
       '                                               CONTRATOXIMOVEL         CXI      '+
       '                                         WHERE PPB.DATAVIGENCIA <= ' + QuotedStr(DateToStr(edDataAtualiza.Date))+
       '                                           AND PPB.IDIMOVEL = CXI.IDIMOVEL      '+
       '                                           AND CXI.IDCONTRATOIMOVEL = '+ dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'IDCONTRATOIMOVEL' ).AsString  +')) PT'+
       '      WHERE CTI.IDCONTRATOIMOVEL = '+ dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'IDCONTRATOIMOVEL' ).AsString+
       '        AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL   '+
       '        AND PPI.IDIMOVEL = CXI.IDIMOVEL                      '+
       '      GROUP BY PPI.IDPLANOPREV, PT.PPIPERCENTRATEIO) CONT    '+
       'WHERE PLANO.IDPLANOPREV = PPI.IDPLANOPREV                    '+
       'AND PPI.DATAVIGENCIA = VIG.DATAVIGENCIA                      '+
       'AND PATRO.IDPESSOA = PPI.IDPATRO                             '+
       'AND PPI.IDIMOVEL = CXI.IDIMOVEL                              '+
       'AND CXI.IDCONTRATOIMOVEL = '+ dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'IDCONTRATOIMOVEL' ).AsString  +
       'AND PPI.IDPLANOPREV = CONT.IDPLANOPREV ' +
       'ORDER BY PPI.IDPLANOPREV '
      );

      cdsTemp.First;
      dValor := 0;
      while not cdsTemp.Eof do
      begin

        // verifica se já não existe a combinação Total
        if not dtmRelAdminImobCC.cdsGrupoSeg.Locate( 'IDPATRO;IDPLANOPREV', VarArrayOf( [
                  cdsTemp.FieldByName( 'IDPATRO' ).Value,
                  cdsTemp.FieldByName( 'IDPLANOPREV' ).Value
                  ] ), [] ) then
        begin
          //Sol 131923 KTN 758691 Data 27/04/2010 Felipe de Oliveira início
          // se não existe cria a nova combinação
          dtmRelAdminImobCC.cdsGrupoSeg.Append;
          //verifica se é o ultimo registro, se for ele atribui a diferença ao campo valor
          if cdsTemp.RecNo = cdsTemp.RecordCount then
             dtmRelAdminImobCC.cdsGrupoSeg.FieldByName('VALOR').AsFloat := ComunsImobiliario.Arredonda(dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'TOT_RECEBER' ).AsFloat - dValor, 2)
          else
             dtmRelAdminImobCC.cdsGrupoSeg.FieldByName('VALOR').AsFloat:=
                      ComunsImobiliario.Arredonda( dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'TOT_RECEBER' ).AsFloat *
                                                    cdsTemp.FieldByName('PERCENTRATEIO').AsFloat  / 100 , 2 );
             dValor := dValor + dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR').AsFloat;

          dtmRelAdminImobCC.cdsGrupoSeg.FieldByName('IDPATRO').Value      := cdsTemp.FieldByName('IDPATRO').Value;
          dtmRelAdminImobCC.cdsGrupoSeg.FieldByName('IDPLANOPREV').Value  := cdsTemp.FieldByName('IDPLANOPREV').Value;
          dtmRelAdminImobCC.cdsGrupoSeg.FieldByName('PATROCINADORA').Value:= cdsTemp.FieldByName('PATROCINADORA').Value;
          dtmRelAdminImobCC.cdsGrupoSeg.FieldByName('PLANOPREV').Value    := cdsTemp.FieldByName('PLANOPREV').Value;
          dtmRelAdminImobCC.cdsGrupoSeg.Post;

        end
        else
        begin
          // se existe apenas adiciona o valor de agrupamento
          dtmRelAdminImobCC.cdsGrupoSeg.Edit;
  {        dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).Value := ComunsImobiliario.Arredonda(
            dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).Value +cdsTemp.FieldByName('PERCENTRATEIO').Value, 5 );}
          if cdsTemp.RecNo = cdsTemp.RecordCount then
             dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR').AsFloat := dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR').AsFloat +
                ComunsImobiliario.Arredonda(dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'TOT_RECEBER' ).AsFloat - dValor , 2)
          else
             dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR').AsFloat :=
                  dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR').AsFloat +
                          ComunsImobiliario.Arredonda((dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'TOT_RECEBER' ).AsFloat *
                          cdsTemp.FieldByName('PERCENTRATEIO').AsFloat)/100 ,2);

             dValor := dValor + ComunsImobiliario.Arredonda((dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'TOT_RECEBER' ).AsFloat *
                                                             cdsTemp.FieldByName('PERCENTRATEIO').AsFloat)/100 ,2);
          dtmRelAdminImobCC.cdsGrupoSeg.Post;
        end;

        cdsTemp.Next;
      end;

      curTotal := curTotal + dtmRelAdminImobCC.qryInadimplenciaContrato.FieldByName( 'TOT_RECEBER' ).AsFloat;
      //Sol 131923 KTN 758691 Data 27/04/2010 Felipe de Oliveira Fim
      dtmRelAdminImobCC.qryInadimplenciaContrato.Next;
    end;

    // arrendonda os últimos registros de cada grupo
    iPercentual := 0;
    dtmRelAdminImobCC.cdsGrupoSeg.First;
    while not dtmRelAdminImobCC.cdsGrupoSeg.Eof do
    begin
       dtmRelAdminImobCC.cdsGrupoSeg.Edit;
       //Sol 131923 KTN 758691 Data 27/04/2010 Felipe de Oliveira início
       if dtmRelAdminImobCC.cdsGrupoSeg.RecNo = dtmRelAdminImobCC.cdsGrupoSeg.RecordCount then
          dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).AsFloat := 100 - iPercentual
       else
       begin
          dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).AsFloat := ComunsImobiliario.Arredonda(
                  dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR').AsFloat * 100 /curTotal,2);
       end;
       dtmRelAdminImobCC.cdsGrupoSeg.Post;

       iPercentual := iPercentual + dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).AsFloat;
       //Sol 131923 KTN 758691 Data 27/04/2010 Felipe de Oliveira Fim
       dtmRelAdminImobCC.cdsGrupoSeg.Next;

    end;
    {curTemp := 0;
    iPercentual := 0;
    dtmRelAdminImobCC.cdsGrupoSeg.First;
    while not dtmRelAdminImobCC.cdsGrupoSeg.Eof do
    begin
      if ( dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PATROCINADORA' ).AsString = '' ) and
        ( dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PLANOPREV' ).AsString = '' ) then
        dtmRelAdminImobCC.cdsGrupoSeg.Delete
      else
      begin

        dtmRelAdminImobCC.cdsGrupoSeg.Edit;
        dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).AsFloat :=
          ComunsImobiliario.Arredonda(
            dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).Value  /
            dtmRelAdminImobCC.qryInadimplenciaContrato.RecordCount, 2 );
        dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR' ).AsFloat :=
          ComunsImobiliario.Arredonda(
            dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).Value / 100 * curTotal, 2 );

        dtmRelAdminImobCC.cdsGrupoSeg.Post;

        iPercentual := iPercentual + dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).AsFloat;
        curTemp := ComunsImobiliario.Arredonda( curTemp +
          dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR' ).AsFloat, 2 );
        dtmRelAdminImobCC.cdsGrupoSeg.Next;
      end;
    end;
    dtmRelAdminImobCC.cdsGrupoSeg.Edit;
    dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR' ).AsFloat :=
      dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'VALOR' ).AsFloat + ( curTotal  - curTemp );
    dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).AsFloat :=
      dtmRelAdminImobCC.cdsGrupoSeg.FieldByName( 'PERCENT' ).AsFloat + ( 100 - iPercentual );
    dtmRelAdminImobCC.cdsGrupoSeg.Post; }
    // FIM SOL 126316 KTN 660057 Ricardo A.
  end;


end;



procedure TcfgRelInadimplenciaContrato.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoInadimplContrato.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoInadimplContrato.Picture := nil;

      // preenche as labels do relatório
      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
         rptInadimplenciaContratolblMesCompetencia.Caption  := '';
         rptInadimplenciaContratolblDataLimite.Caption      := edtDataFim.Text;
      end else begin
         rptInadimplenciaContratolblMesCompetencia.Caption  := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
         rptInadimplenciaContratolblDataLimite.Caption      := '';
      end;

// Pendência: 21494, 21495 e 21502
// Daniel Simões - -------------------------------------------------------------

      if ( molResponsavel1.edtResponsavel.Text <> '' ) then
           rptInadimplenciaContratolblResponsavel1.Caption := molResponsavel1.edtResponsavel.Text
      else rptInadimplenciaContratolblResponsavel1.Caption := '<Todos>';

      if ( edDataAtualiza.Text <> '' ) then
           rptInadimplContratolblDataAtualiza1.Caption := DateToStr(dDtAtualiza)
      else rptInadimplContratolblDataAtualiza1.Caption := '';

// Daniel Simões - -------------------------------------------------------------


      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraContrato;
end;



procedure TcfgRelInadimplenciaContrato.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelInadimplenciaContrato.btnBuscaContratoClick(Sender: TObject);
begin
	inherited;

   dtmMS.MS_Contrato.Executar;
   // dtmMS.MS_Contrato.CamposChave
   //    [0] C.IDCONTRATOIMOVEL
   //    [1] C.CONNUMERO
   //    [2] C.CONNOME

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor     := crHourGlass;

      sContrato         := dtmMS.MS_Contrato.ValoresChave[0];
      edtConNumero.Text := dtmMS.MS_Contrato.ValoresChave[1];
      edtConNome.Text   := dtmMS.MS_Contrato.ValoresChave[2];

      Screen.Cursor     := crDefault;
   end;
end;



procedure TcfgRelInadimplenciaContrato.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   sContrato := '';

   edtConNumero.Clear;
   edtConNome.Clear;
end;



procedure TcfgRelInadimplenciaContrato.FormShow(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;



procedure TcfgRelInadimplenciaContrato.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;
   dtmMS.MS_AdminImovel.Executar;
   // dtmMS.MS_AdminImovel.CamposChave
   //    [0] A.IDADMINIMOVEL
   //    [1] P.NOME
   //    [2] P.RAZAOSOCIAL

   // redesenha o form na volta do MontaSelect
   Repaint;

   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdminImovel.SetFocus;
end;



procedure TcfgRelInadimplenciaContrato.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelInadimplenciaContrato.FormCreate(Sender: TObject);
begin
  inherited;

  // Daniel - 24878
  qrySitContratual.Close;
  qrySitContratual.Open;
  // Fim.

  qryParamOper.Close;
  qryParamOper.Open;

  edDataAtualiza.Date := qryParamOper.FieldByName('DTULTFECH').AsDateTime;
  dDtAtualiza         := edDataAtualiza.Date;

  // SOL 126316 KTN 660057 Ricardo A.
  CtrlPatrocinadora := TCtrlPatrocinadora.Create;
  CtrlPatrocinadora.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPrev := TCtrlPlanPrevContabil.Create;
  CtrlPlanoPrev.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanoPatro.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);


  cdsPatro.Data := CtrlPatrocinadora.ListaPatrocinadora();
  cdsPlano.Data := CtrlPlanoPrev.ListaPlanPrevContabil();
  // FIM SOL 126316 KTN 660057 Ricardo A.

end;

procedure TcfgRelInadimplenciaContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryParamOper.Close;
end;

procedure TcfgRelInadimplenciaContrato.FormDestroy(Sender: TObject);
begin
  // SOL 126316 KTN 660057 Ricardo A.
  FreeAndNil( CtrlPatrocinadora );
  FreeAndNil( CtrlPlanoPrev );
  FreeAndNil( CtrlPlanoPatro );
  // FIM SOL 126316 KTN 660057 Ricardo A.


  inherited;

end;

end.
