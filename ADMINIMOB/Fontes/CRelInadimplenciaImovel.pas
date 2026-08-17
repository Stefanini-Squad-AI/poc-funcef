{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------

--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 147289
N. Kintana.........: 1017104
Data...............: 14/04/2011
Responsável........: Felipe de Oliveira
Descrição..........: Quando relatórios de inadimplencia não possuirem
                     inadinplencia, imprimir mensagem no relatório
--------------------------------------------------------------------------------
Rotina..........: FormCreate, VerificaPreenchimento, FiltraImovel, FormDestroy
N. Sol..........: 126317
N. Kintana......: 660060
Data............: 11/01/2010
Responsável.....: Marilza Colpani
Descrição.......: Ajuste no Relatório Inadimplência por Imóvel para que no
                  mesmo informe o rateio entre os planos de benefícios.
--------------------------------------------------------------------------------
Pendências  : 24878
Responsável : Daniel Simões
Data        : 04/06/2007
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
Pendência   : 21503
Responsável : Daniel Simões
Data        : 24/03/2006
Descrição   : Alterada a query de modo que pudesse seguir as mesmas regras da
              query do "Inadimplência por Contrato Sintético" ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelInadimplenciaImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, StdCtrls, Mask, wwdbedit, wwdblook,
  Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcCombo, fcColorCombo, Wwdbspin, wwdbdatetimepicker, uCMFileUtils,
  CMDateTimePicker, uModuloImobiliario, mImovel, DBClient, uCMClientDataSet,
  uCtrlPlanPrevContabil, uCtrlImovel, uCtrlPlanPrevContabPatro, uCtrlPatrocinadora;

type
  TcfgRelInadimplenciaImovel = class(TcfgRel)
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataFim: TCMDateTimePicker;
    rdgOrdenacao: TRadioGroup;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    lblImovelouMestre: TLabel;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    edtImovelouMestre: TEdit;
    cbAgrupa: TCheckBox;
    molImovel1: TmolImovel;
    Label4: TLabel;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    GroupBox1: TGroupBox;
    edDataAtualiza: TCMDateTimePicker;
    qryParamOper: TQuery;
    dsParamOper: TDataSource;
    Query1: TQuery;
    chkVlrPositivo: TCheckBox;
    qryParamOperDTULTFECH: TDateTimeField;
    dbCboSituacaoContratual: TwwDBLookupCombo;
    Label1: TLabel;
    gbTipoContrato: TGroupBox;
    cbLocacao: TCheckBox;
    cbConfissao: TCheckBox;
    qrySitContratual: TQuery;
    qrySitContratualDESCRICAO: TStringField;
    qrySitContratualIDSITCONTIMOB: TFloatField;
    dsSitContratual: TDataSource;
    lblPlano: TLabel;
    lblPatro: TLabel;
    dbcboPlanPrev: TwwDBLookupCombo;
    dbcboPatro: TwwDBLookupCombo;
    dsPlano: TDataSource;
    dsPatro: TDataSource;
    cdsPlano: TCMClientDataSet;
    cdsPlanoNOME: TStringField;
    cdsPlanoIDPLANOPREV: TFloatField;
    cdsPatro: TCMClientDataSet;
    cdsPatroNOME: TStringField;
    cdsPatroIDPESSOA: TFloatField;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }
    iImovel       : integer;

    //Marilza Colpani SOL 126317/KTN 660060 - Início
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlPlanPrev : TCtrlPlanPrevContabil;
    CtrlPlanoPrev: TCtrlPlanPrevContabil;
    CtrlImovel : TCtrlImovel;
    CtrlPatrocinadora: TCtrlPatrocinadora;
    CtrlPlanoPatro: TCtrlPlanPrevContabPatro;
    //Marilza Colpani SOL 126317/KTN 660060 - Fim

    function VerificaPreenchimento: boolean;

    procedure FiltraImovel;
    procedure MontaQuery; override;

  public { Public declarations }
    dDtAtualiza : TDateTime;
  end;



var
  cfgRelInadimplenciaImovel: TcfgRelInadimplenciaImovel;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, uFuncoesImob, dLookImobiliario, DMS;



function TcfgRelInadimplenciaImovel.VerificaPreenchimento: boolean;
begin
  Result := False;

  try
    if (length(trim(edDataAtualiza.Text)) = 0) then
      raise EValidacao.CreateVal('Preencha a data de atualização.',edDataAtualiza);

    if ( (length(trim(edtDataFim.Text)) = 0) and
       ( (cboMesCompetencia.ItemIndex = -1) or (DBspnAnoCompetencia.Value = 0) ) ) then
      raise EValidacao.CreateVal('É necessário indicar a Data ou o Mês de Competência!', edtDataFim);

    //Marilza Colpani SOL 126317/KTN 660060 - Início
    if ( ( dbcboPlanPrev.Text <> '' ) and ( dbcboPatro.Text = '' ) ) or
       ( ( dbcboPlanPrev.Text = '' ) and ( dbcboPatro.Text <> '' ) ) then
    begin
      MessageDlg(  'Se o Plano Previdenciário ou a Patrocinadora' +
        ' estiver preenchido obrigatoriamente ambos os campos devem ser preenchidos.', mtWarning, [mbOK], 0);
      Exit;
    end;

    if ( dbcboPlanPrev.Text <> '' ) then
    begin
      // valida plano x patrocinadora
      if not CtrlPlanoPatro.ValidaPlanoPatro( StrToInt(dbcboPatro.LookupValue),
                                              StrToInt(dbcboPlanPrev.LookupValue) ) then
      begin
        MessageDlg( CtrlPlanoPatro.MessageInfo, mtWarning, [mbOK], 0);
        Exit;
      end;
      dtmRelAdminImobCC.sPatro :=  StrToInt(dbcboPatro.LookupValue);
      dtmRelAdminImobCC.sPlano :=  StrToInt(dbcboPlanPrev.LookupValue);
    end
    else
    begin
      dtmRelAdminImobCC.sPatro :=  -1;
      dtmRelAdminImobCC.sPlano :=  -1;
    end;
    //Marilza Colpani SOL 126317/KTN 660060 - Fim
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



procedure TcfgRelInadimplenciaImovel.FiltraImovel;
var edDataOper               : TDateTime; // Daniel Simões - Variável "Tipo Data" que receberá  a data de atualização...
    sParamOper , sParamOper2 : string;    // Daniel Simões - 23/03/2006
    edDataLanc : TDateTime;
    iAnoComp, iMesComp : Integer;
begin
   //Marilza Colpani SOL 126317/KTN 660060 - Início
   dtmRelAdminImobCC.sPlano := -1;
   dtmRelAdminImobCC.sPatro := -1;
   //Marilza Colpani SOL 126317/KTN 660060 - Fim
// Daniel Simões - 27/06/2006 - ------------------------------------------------
   iAnoComp := trunc(DBspnAnoCompetencia.Value);
   iMesComp := cboMesCompetencia.ItemIndex+1;

   if ( edtDataFim.Date > 0 ) then
     edDataLanc := edtDataFim.Date
   else
     edDataLanc := DiasUteis.UltDiaMes(iAnoComp,iMesComp);
// Daniel Simões - 27/06/2006 - ------------------------------------------------

// Daniel Simões - 24/03/2006
   edDataOper := edDataAtualiza.Date;
   sParamOper  := '';
   sParamOper  := ' AND ( LO2.DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13;
// Daniel Simões - 24/03/2006

   with dtmRelAdminImobCC.qryInadimplenciaImovel do begin

      Close;

// Daniel Simões - P: 21503 - 24/03/2006 - Início ------------------------------

      SQL.Text :=
      'SELECT ' + #13 +
      '       I.IDIMOVEL, I.CODTIPIMOVEL, T.DESCTIPOIMOVEL, ' + #13 +  //Marilza Colpani SOL 126317/KTN 660060 - Inclusão do I.CODTIPIMOVEL
      '       I.IMONOME AS NOME_IMOVEL, I.IMOMATRICULA, I.IMOCODIGO, ' + #13 +
      '       IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '       IM.IMONOME||'' - ''||I.IMONOME AS IMOVEL_COMPOSTO, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Campo Descr_SitContr
      '       SC.DESCRICAO AS DESCR_SITCONTR,  ' + #13 +
      '       ROUND (REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0),2 ) AS TOT_RECEBER ' + #13 +
      'FROM ' + #13 +
      '     IMOVEL I, IMOVEL IM, TIPOIMOVEL T, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado a Tabela SitContImob
      '     SITCONTIMOB SC,                 ' + #13 +
      '   ( ' + #13 +
      '     SELECT ' + #13 +
      '            LI.IDIMOVEL, ' + #13 +

      '            C.FLGTIPOCONTRATO, C.IDSITCONTIMOB, ' +#13+ // Daniel - 24878

      '            SUM( ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '                ) AS TOT_RECEBER, ' + #13 +
      '            SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS RECEBIDO ' + #13 +
      '   FROM ' + #13 +
      '        DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T, CONTRATOIMOVEL C, ' + #13 +
      '      ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '        FROM LANCTODOCUM ' + #13 +
      '        WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD ' + #13 +

      '   WHERE  ' + #13 + 
      '          ( LI.CODDOCUMENTO   = D.CODDOCUMENTO ) ' + #13 +
      '      AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) ' + #13 +

      // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006
      '      AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +
      '      AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO              ' + #13 +
      '                                     FROM CONCILIADOC              ' + #13 +
      '                                     WHERE FLGTIPO = ''A''          ' + #13 +
      '                                       AND IDPARCFINANCIMOV IS NULL ' + #13 +
      '                                       AND DATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) )' + #13 +
      // Fim - Vinicius 01/11/2006

      // Daniel Simões - 22531
      '      AND ( LD.DATALANCTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) ' + #13 +
      // Daniel S~imões - Adicionei " OR LI.IDCONTRATOIMOVEL IS NULL e ( LD.ESTORNO IS NULL ) " ...
      '      AND ( C.FLGTIPOCONTRATO IN (''L'',''D'') OR LI.IDCONTRATOIMOVEL IS NULL ) AND ( LD.ESTORNO IS NULL ) ' + #13 +
      '      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '      AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO ) ' + #13 +
      '      AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL ) ' + #13 +
      '      AND ( (LD.CODALTERADOR IS NULL) OR ' + #13 +

      '            (LD.CODALTERADOR IN(T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON) AND ' + #13 +
      '             LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') AND ' + #13 +
      '             NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB ' + #13 +
      '                                  WHERE CODDOCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ) OR ' + #13 +

      '            (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) AND ' + #13 +
      '             LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) AND ' + #13 +
      '             LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) ) ' + #13;

      //Marilza Colpani SOL 126317/KTN 660060 - Início
      if dbcboPlanPrev.Text <> '' then
      begin
        dtmRelAdminImobCC.sPlano :=  StrToInt(dbcboPlanPrev.LookupValue);
      end;

      if dbcboPatro.Text <> '' then
      begin
        dtmRelAdminImobCC.sPatro :=  StrToInt(dbcboPatro.LookupValue);
      end;
      //Marilza Colpani SOL 126317/KTN 660060 - Fim

      if ( length(trim(edtDataFim.Text)) > 0 ) then begin

        SQL.Text := SQL.Text +
        '    AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) OR ' + #13 +
        '          (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) )  ' + #13;

      end else begin
        SQL.Text := SQL.Text +
        '      AND ( (LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ') AND (LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ') ) ' + #13;
      end;

      SQL.Text := SQL.Text +
      '   GROUP BY ' + #13 +
      '      C.FLGTIPOCONTRATO, C.IDSITCONTIMOB, ' +#13+ // Daniel - 24878
      '      LI.IDIMOVEL ' + #13 +

      '   ) REC_DES, ' + #13 +

// Adicionei... Daniel Simões...
      '   ( SELECT LI.IDIMOVEL, ' + #13 +
      '            ROUND( SUM(OP.VLRCORRECAO * LI.VLRLANCRECEB / TOT.VLR_TOTAL), 2) AS VLRCORRECAO ' + #13 +
      '     FROM LANCAMENTOSIMOVEL LI, ' + #13 +
      '        ( SELECT CODDOCUMENTO, SUM(VLRLANCRECEB) AS VLR_TOTAL ' + #13 +
      '          FROM LANCAMENTOSIMOVEL ' + #13 +
      '          WHERE IDMODULO = 64 ' + #13 +
      '            AND RECPAG = ''R'' ' + #13 +
      '          GROUP BY CODDOCUMENTO   ) TOT, ' + #13 +
// Adicionei... Daniel Simões...

      '        ( SELECT LO.CODDOCUMENTO, SUM(LO.VLRACUM) AS VLRCORRECAO ' + #13 +
      '          FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, ' + #13 +
      '             ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA ' + #13 +
      '               FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 ' + #13 +
      '               WHERE ( LO2.IDOPERACAO = PI2.IDOPERATUALCM    OR ' + #13 +
      '                       LO2.IDOPERACAO = PI2.IDOPERATUALJUROS OR ' + #13 +
      '                       LO2.IDOPERACAO = PI2.IDOPERATUALMULTA ) AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') ' + #13 + sParamOper +
      '                GROUP BY LO2.CODDOCUMENTO ' + #13 +
      '             ) UD ' + #13 +

      '          WHERE ( LO.IDOPERACAO = PI.IDOPERATUALCM    OR ' + #13 +
      '                  LO.IDOPERACAO = PI.IDOPERATUALJUROS OR ' + #13 +
      '                  LO.IDOPERACAO = PI.IDOPERATUALMULTA ) ' + #13 +
      '            AND LO.DATAOPER     = UD.ULTDIA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')' + #13 +
      '            AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+) ' + #13 +
      '          GROUP BY LO.CODDOCUMENTO ) OP ' + #13 +
      '     WHERE LI.CODDOCUMENTO = OP.CODDOCUMENTO ' + #13 +
      '       AND LI.CODDOCUMENTO = TOT.CODDOCUMENTO ' + #13 +
      '     GROUP BY LI.IDIMOVEL ) COR ' + #13 +

      'WHERE ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Join entre as tabelas
      '      ( REC_DES.IDSITCONTIMOB      = SC.IDSITCONTIMOB (+) ) AND   ' + #13;

      if iImovel > 0 then
      SQL.Text := SQL.Text +
      '   ( I.IDIMOVEL = ' + IntToStr(iImovel) + ' ) AND ' + #13;

      SQL.Text := SQL.Text +
      '       ( I.IDIMOVEL = REC_DES.IDIMOVEL ) ' + #13 +
      '   AND ( I.IDIMOVEL = COR.IDIMOVEL(+) ) ' + #13 +
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
      '   AND ( I.CODTIPIMOVEL = T.CODTIPIMOVEL ) ' + #13;// +

// Daniel - 24878 - Início -----------------------------------------------------
     if (dbCboSituacaoContratual.LookupValue<>'') then
       SQL.Text := SQL.Text+'   AND ( REC_DES.IDSITCONTIMOB = '+QuotedStr(dbCboSituacaoContratual.LookupValue)+' ) ';

     if (cbLocacao.Checked) and not (cbConfissao.Checked) then
       SQL.Text := SQL.Text+'   AND ( REC_DES.FLGTIPOCONTRATO = ''L'' ) ';

     if (cbConfissao.Checked) and not (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( REC_DES.FLGTIPOCONTRATO = ''D'' ) ';

     if (cbConfissao.Checked) and (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( REC_DES.FLGTIPOCONTRATO IN(''L'',''D'') ) ';
// Daniel - 24878 - Fim --------------------------------------------------------

// Daniel Simões - 04/05/2006 - ------------------------------------------------
      if ChkVlrPositivo.Checked then begin
        SQL.Text := SQL.Text +
         '   AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) > 0  )  ' + #13;
      end else begin
        SQL.Text := SQL.Text +
         '   AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) <> 0 )  ' + #13;
      end;

        SQL.Text := SQL.Text +
// Daniel Simões - 04/05/2006 - ------------------------------------------------

          'ORDER BY ' + #13;

      if cbAgrupa.Checked then begin
         case rdgOrdenacao.ItemIndex of
            0: SQL.Text := SQL.Text + '   T.DESCTIPOIMOVEL, IM.IMONOME, I.IMONOME ';
            1: SQL.Text := SQL.Text + '   T.DESCTIPOIMOVEL, I.IMOCODIGO ';
            2: SQL.Text := SQL.Text + '   T.DESCTIPOIMOVEL, I.IMOMATRICULA ';
         end;
      end else begin
         case rdgOrdenacao.ItemIndex of
            0: SQL.Text := SQL.Text + '   IM.IMONOME, I.IMONOME ';
            1: SQL.Text := SQL.Text + '   I.IMOCODIGO ';
            2: SQL.Text := SQL.Text + '   I.IMOMATRICULA ';
         end;
      end;
// Daniel Simões - P: 21503 - 24/03/2006 - Fim ---------------------------------


// Felipe de Oliveira SOL147289  KTN1017104
// A query do relatório não estava sendo aberta, quando a query não trouxer registros
//mostrar os filtros do relatório  e uma mensagem dizendo que não há inadinplencia para o item em questão

     Open;
// se a query estiver vazia inserir os filtros que estiverem preenchidos em seus respectivos campos
     if isEmpty then
     begin
         if iImovel > 0 then
         begin
           Close;
           SQL.Clear;
           SQL.Text :=
           'SELECT I.IDIMOVEL, I.CODTIPIMOVEL,      ' + #13 +
           '       T.DESCTIPOIMOVEL,                ' + #13 +
           '       I.IMONOME AS NOME_IMOVEL,        ' + #13 +
           '       I.IMOMATRICULA, I.IMOCODIGO,     ' + #13 +
           '       '' '' AS NOME_MESTRE,            ' + #13 +
           '       I.IMONOME AS IMOVEL_COMPOSTO,    ' + #13 +
           '       '' '' AS DESCR_SITCONTR,         ' + #13 +
           '       0 AS TOT_RECEBER                 ' + #13 +
           '       FROM IMOVEL I, TIPOIMOVEL T      ' + #13 +
           '       WHERE I.CODTIPIMOVEL = T.CODTIPIMOVEL  ' + #13 +
           '       AND I.IDIMOVEL = ' + IntToStr(iImovel) ;
            Open;

            dtmRelAdminImobCC.LblInadimplencia.Caption := '"Não há débitos para este Imóvel"';
         end
         else
            dtmRelAdminImobCC.LblInadimplencia.Caption := '"Não há débitos para este Período"';


           dtmRelAdminImobCC.LblInadimplencia.Visible := True;
           dtmRelAdminImobCC.ppRegion9.Visible := False;
           dtmRelAdminImobCC.ppRegion11.Visible := False;
           dtmRelAdminImobCC.ppShape14.Visible := False;
           dtmRelAdminImobCC.ppLine21.Visible := False;
           dtmRelAdminImobCC.ppLabel232.Visible := False;
           dtmRelAdminImobCC.ppDBCalc13.Visible := False;
           dtmRelAdminImobCC.ppLabel258.Visible := False;
           dtmRelAdminImobCC.ppDBCalc49.Visible := False;


     end
     else
     begin

       dtmRelAdminImobCC.LblInadimplencia.Visible := False;
       dtmRelAdminImobCC.ppRegion9.Visible := True;
       dtmRelAdminImobCC.ppRegion11.Visible := True;
       dtmRelAdminImobCC.ppShape14.Visible := True;
       dtmRelAdminImobCC.ppLine21.Visible := True;
       dtmRelAdminImobCC.ppLabel232.Visible := True;
       dtmRelAdminImobCC.ppDBCalc13.Visible := True;
       dtmRelAdminImobCC.ppLabel258.Visible := True;
       dtmRelAdminImobCC.ppDBCalc49.Visible := True;
     end;

   end;
end;



procedure TcfgRelInadimplenciaImovel.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoInadimplImovel.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoInadimplImovel.Picture := nil;

      // preenche as labels do relatório
      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
         rptInadimplenciaImovellblMesCompetencia.Caption := '';
         rptInadimplenciaImovellblDataLimite.Caption     := edtDataFim.Text;
      end else begin
         rptInadimplenciaImovellblMesCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
         rptInadimplenciaImovellblDataLimite.Caption     := '';
      end;

// Pendência: 21503
// Daniel Simões - -------------------------------------------------------------

      if ( edDataAtualiza.Text <> '' ) then
           rptInadimplenciaImovellblDataAtualiza1.Caption := DateToStr(dDtAtualiza)
      else rptInadimplenciaImovellblDataAtualiza1.Caption := '';

// Daniel Simões - -------------------------------------------------------------

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      // Habilita o Grupo de Segmento
      ppGrpSegmentoCab.Visible := cbAgrupa.Checked;
      ppGrpSegmentoRod.Visible := cbAgrupa.Checked;
   end;

   FiltraImovel;
end;



procedure TcfgRelInadimplenciaImovel.bbtnConfirmarClick(Sender: TObject);
begin   
  if VerificaPreenchimento then
  begin
    dtmRelAdminImobCC.iIdImovel := molImovel1.iImovel;
    inherited;
  end;
end;



procedure TcfgRelInadimplenciaImovel.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   iImovel        := -1;
end;



procedure TcfgRelInadimplenciaImovel.molImovel1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovelClick(Sender);

  iImovel   := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]); // Daniel Simões ...
end;

procedure TcfgRelInadimplenciaImovel.FormCreate(Sender: TObject);
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

  //Marilza Colpani SOL 126317/KTN 660060 - Início
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
  //Marilza Colpani SOL 126317/KTN 660060 - Início

end;

procedure TcfgRelInadimplenciaImovel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryParamOper.Close;
end;

procedure TcfgRelInadimplenciaImovel.FormDestroy(Sender: TObject);
begin
  inherited;
  //Marilza Colpani SOL 126317/KTN 660060 - Início
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlPlanPrev);

  FreeAndNil( CtrlPatrocinadora );
  FreeAndNil( CtrlPlanoPrev );
  FreeAndNil( CtrlPlanoPatro );
  //Marilza Colpani SOL 126317/KTN 660060 - Fim
end;

end.
