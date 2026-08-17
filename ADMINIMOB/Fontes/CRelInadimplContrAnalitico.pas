{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
SIG................: 127414
Data...............: 07/10/2022
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Retirando a informação do segmento das consultas de
                     atualização.
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
SIG................: 125186
Data...............: 06/05/2022
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Retirando o filtro de movimentações de recálculo.
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 159983
N. Kintana.........: 1330985
Data...............: 17/05/2012
Responsável........: Helen V Bianchi
Descrição..........: Adicionado o Tipo do Imovel.
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 147289
N. Kintana.........: 1017104
Data...............: 14/04/2011
Responsável........: Felipe de Oliveira
Descrição..........: Quando relatórios de inadimplencia não possuirem
                     inadinplencia, imprimir mensagem no relatório
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 57966
N. Kintana.........: 523392
Data...............: 20/07/2009
Responsável........: Ricardo Alves
Descrição..........: Otimizada consulta.
--------------------------------------------------------------------------------

Pendências  : 26622
Responsável : Daniel Simões
Data        : 24/10/2007
Descrição   : Ajustes no filtro de Quebra de página por Segmento...
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
Pendências  : 24412
Responsável : Daniel Simões
Data        : 22/05/2007
Descrição   : Implementação de Quebra por Segmento no relatório de Inadimplência
              de Contratos Analíticos...
--------------------------------------------------------------------------------
Pendência   : 22531
Responsável : Daniel Simões
Data        : 06/06/2006
Descrição   : Passa a utilizar a data de limite de inadimplência na busca dos
              valores de movimentação do documento e validação da data limite
              para pagamento...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelInadimplContrAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, wwdblook, StdCtrls, Mask, wwdbedit,
  Db, DBTables, Wwquery, MontaSelect, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcCombo, fcColorCombo, Wwdbspin,           
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario, mResponsavel,
  uCmfileUtils;

type
  TcfgRelInadimplContrAnalitico = class(TcfgRel)
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
    Label8: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label3: TLabel;
    dbCboTipoReceita: TwwDBLookupCombo;
    chkSemReceita: TCheckBox;
    chkVlrPositivo: TCheckBox;
    molResponsavel1: TmolResponsavel;
    Label2: TLabel;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    GroupBox1: TGroupBox;
    edDataAtualiza: TCMDateTimePicker;
    qryParamOper: TQuery;
    dsParamOper: TDataSource;
    chkAgrupaSegmento: TCheckBox;
    qryParamOperDTULTFECH: TDateTimeField;
    Label5: TLabel;
    dbCboSituacaoContratual: TwwDBLookupCombo;
    qrySitContratual: TQuery;
    dsSitContratual: TDataSource;
    qrySitContratualDESCRICAO: TStringField;
    qrySitContratualIDSITCONTIMOB: TFloatField;
    gbTipoContrato: TGroupBox;
    cbLocacao: TCheckBox;
    cbConfissao: TCheckBox;


    // prodecimentos definidos
    function VerificaPreenchimento: boolean;

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



  private { Private declarations }
   sContrato      : string;
   iAdminImovel   : integer;

  public { Public declarations }
   dDtAtualiza    : TDateTime;

  end;



var
  cfgRelInadimplContrAnalitico: TcfgRelInadimplContrAnalitico;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, DMS, uFuncoesImob, CMwwQuery;



function TcfgRelInadimplContrAnalitico.VerificaPreenchimento: boolean;
begin
  Result := False;

  try
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



procedure TcfgRelInadimplContrAnalitico.FiltraContrato;
var sTextoSql, sParamOper, sParamOper2, sParamOper3 : string;
    edDataOper : TDateTime;
    edDataLanc : TDateTime;
    iAnoComp, iMesComp : Integer;

    // Ricardo A. SOL 57966 KTN 523392
    qryParametros: TCMwwQuery;
    sParamMulta, sParamAcum, sParamJuros: string;
begin
// Daniel Simões - 27/06/2006 - ------------------------------------------------
   iAnoComp := trunc(DBspnAnoCompetencia.Value);
   iMesComp := cboMesCompetencia.ItemIndex+1;

   sParamOper  := '';
   sParamOper2 := '';
   sParamOper3 := '';

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
       sParamOper3 := '     AND ( LD.DATALANCTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) ' + #13;
     end
   else
     edDataLanc := DiasUteis.UltDiaMes(iAnoComp,iMesComp);
//Ádler Teodoro de Souza - 113596 - FIM

// Daniel Simões - 27/06/2006 - ------------------------------------------------

  edDataOper  := edDataAtualiza.Date;


  sParamOper  := ' AND ( LO2.DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13;
  if sContrato <> '' then sParamOper2 := '  AND LO.IDCONTRATOIMOVEL = ' + sContrato;

   with dtmRelAdminImobCC.qryInadimplContrAnalitico do begin

     Close;

     SQL.Text :=
     'SELECT ' + #13 +
     '   C.IDCONTRATOIMOVEL,             ' + #13 +
     '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', C.CONNUMERO) AS NUMERO_CONTRATO, ' + #13 +
     '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', C.CONNOME)   AS NOME_CONTRATO,   ' + #13 +
     //Helen - SOL: 159983 KTN: 1330985 - Inicio
     //'   T.DESCTIPOIMOVEL,               ' + #13 + // Daniel - 24412
     '   '' '' as DESCTIPOIMOVEL,              ' + #13 +
     //Helen - SOL: 159983 KTN: 1330985 - Fim
     '   DD.CODDOCUMENTO,                ' + #13 +
     '   DD.TOT_RECEBER,                 ' + #13 +
     '   DD.RECEBIDO,                    ' + #13 +
     '   CM.VLRACUM AS CORRECAO,         ' + #13 +
     '   JR.VLRACUM AS JUROS,            ' + #13 +
     '   MT.VLRACUM AS MULTA,            ' + #13 +
     '   ROUND((DD.TOT_RECEBER - DD.RECEBIDO) + DECODE(CM.VLRACUM, NULL, 0, CM.VLRACUM) + DECODE(JR.VLRACUM, NULL, 0, JR.VLRACUM) + DECODE(MT.VLRACUM, NULL, 0, MT.VLRACUM),2 ) AS TOTAL, ' + #13 +
     '   (DD.MESCOMPETENCIA || ''/'' || DD.ANOCOMPETENCIA) AS COMPETENCIA,  ' + #13 +
     // Daniel Simões - 22531
     '   ROUND(TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') - DD.DATAVENCIMENTO, 0) AS DIAS, '+#13+
     '   DD.DATAVENCIMENTO,              ' + #13 +
     '   C.CONDATAINICIO,                ' + #13 +
     '   C.CONDATAFIM,                   ' + #13 +
     '   C.IDLOCATARIO,                  ' + #13 +
     '   PL.NOME AS NF_LOCATARIO,        ' + #13 +
     '   PL.RAZAOSOCIAL AS RS_LOCATARIO, ' + #13 +
     '   C.IDADMINIMOVEL,                ' + #13 +
     // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
     // Foi adicionado o Campo Descr_SitContr
     '   SC.DESCRICAO AS DESCR_SITCONTR  ' + #13 +
     'FROM ' + #13 +
     '   PESSOA PL,                      ' + #13 +
     '   PESSOA PA,                      ' + #13 +
     '   CONTRATOIMOVEL C,               ' + #13 +
     // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
     // Foi adicionado a Tabela SitContImob
     '   SITCONTIMOB SC,                 ' + #13 +
     '   TIPOIMOVEL T,                   ' + #13 + // Daniel - 24412

     '   (SELECT                         ' + #13 +
     '      LI.CODDOCUMENTO,             ' + #13 +
     '      LI.IDCONTRATOIMOVEL,         ' + #13 +
     '      LI.MESCOMPETENCIA,           ' + #13 +
     '      LI.ANOCOMPETENCIA,           ' + #13 +
     '      LI.DATAVENCIMENTO,           ' + #13 +
     '      LI.DATALIMITE,               ' + #13 +
     {'      LI.CODTIPIMOVEL,             ' + #13 + -  Helen - SOL: 159983 KTN: 1330985 }
     '      LI.IDTIPOCUSTORECIMO,        ' + #13 +

     '      SUM( ' + #13 +
     '          DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
     '          DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
     '          DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
     '          DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
     '      ) AS TOT_RECEBER, ' + #13 +
     '      SUM( ' + #13 +
     '        DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', LD.VALOR, 0), 0) * LI.VLRLANCRECEB / TRD.VALOR ' + #13 +
     '        ) AS RECEBIDO ' + #13 +

     '    FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T, CONTRATOIMOVEL C, ' + #13 +
     '         (SELECT CODDOCUMENTO, VALOR ' + #13 +
     '            FROM LANCTODOCUM ' + #13 +
     '           WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD ' + #13 +

     '   WHERE ( C.FLGTIPOCONTRATO IN (''L'',''D'') OR LI.IDCONTRATOIMOVEL IS NULL ) ' + #13 +
     '     AND ( LD.ESTORNO IS NULL ) ' + #13 + // Daniel Simões - 10/09/2006

     // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006
     '     AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +
     '     AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO              ' + #13 +
     '                                      FROM CONCILIADOC              ' + #13 +
     '                                     WHERE FLGTIPO = ''A''          ' + #13 +
     '                                       AND IDPARCFINANCIMOV IS NULL ' + #13 +
     '                                       AND DATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) )' + #13 +
     // Fim - Vinicius 01/11/2006

// Vinicius - 29/08/05 - Retirado para poder ver inadimplencias passadas
     // Daniel Simões - 22531

//Ádler Teodoro de Souza - 113596 - INÍCIO
sParamOper3 +
//Ádler Teodoro de Souza - 113596 - FIM

     '     AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )            ' + #13 +
     '     AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )           ' + #13 +
     '     AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )          ' + #13 +
     '     AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )            ' + #13 +
     '     AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) ' + #13 +
     '     AND ( (LD.CODALTERADOR IS NULL) OR                  ' + #13 +

     '           (LD.CODALTERADOR IN(T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON) AND'+#13+
     '            LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') AND           '+#13+
     '            NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB                           '+#13+
     '                                 WHERE CODDOCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ) OR     '+#13+

     '           (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) AND  ' + #13 +
     '            LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) AND  ' + #13 +
     '            LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) ) ' + #13 +
     '   GROUP BY LI.CODDOCUMENTO,                      ' + #13 +
     '            LI.IDCONTRATOIMOVEL,                  ' + #13 +
     '            LI.MESCOMPETENCIA,                    ' + #13 +
     '            LI.ANOCOMPETENCIA,                    ' + #13 +
     '            LI.DATAVENCIMENTO,                    ' + #13 +
     '            LI.DATALIMITE,                        ' + #13 +
     {'            LI.CODTIPIMOVEL,                      ' + #13 + -  Helen - SOL: 159983 KTN: 1330985}
     '            LI.IDTIPOCUSTORECIMO                  ' + #13 +
     '   ) DD, ' + #13 +

     // TABELA CM
     '   (SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,    ' + #13 +
     //SIG nº 127414
     //'   LO.CODTIPIMOVEL,  '+ #13 + //Helen - SOL: 159983 KTN: 1330985
     '           SUM(LO.VLRACUM) AS VLRACUM                              ' + #13 +

     // Ricardo A. SOL 57966 KTN 523392 - retirando a tabela paramimovel
//     '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,                      ' + #13 +
     '     FROM LANCOPERDIAIMOB LO,                                      ' + #13 +

     '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA   ' + #13 +

     // Ricardo A. SOL 57966 KTN 523392
//     '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2            ' + #13 +
     '              FROM LANCOPERDIAIMOB LO2                             ' + #13 +
//     '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALCM AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')             ' + #13 +
     '             WHERE LO2.IDOPERACAO = ' + sParamAcum + #13 ;
   if ( sContrato <> '' ) then
       SQL.Text := SQL.Text + ' AND LO2.IDCONTRATOIMOVEL = ' + sContrato + #13;

     SQL.Text := SQL.Text +

     sParamOper +
     '             GROUP BY LO2.CODDOCUMENTO                             ' + #13 +
     '           ) UD                                                    ' + #13 +


     // Ricardo A. SOL 57966 KTN 523392
//     '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALCM                       ' + #13 +
     '    WHERE LO.IDOPERACAO   = ' + sParamAcum + '                     ' + #13 +
     '      AND LO.DATAOPER     = UD.ULTDIA                              ' + #13 +
     '      AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)                    ' + #13 + sParamOper2 +

     '    GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO   ' + #13 +
     //SIG nº 127414
     //'    ,LO.CODTIPIMOVEL  ' + #13 + //Helen - SOL: 159983 KTN: 1330985
     '   ) CM,                                                           ' + #13 +

     // TABELA JR
     '   (SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,    ' + #13 +
     //SIG nº 127414
     //'   LO.CODTIPIMOVEL,  '+ #13 + //Helen - SOL: 159983 KTN: 1330985
     '           SUM(LO.VLRACUM) AS VLRACUM                              ' + #13 +

     // Ricardo A. SOL 57966 KTN 523392
//     '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,                      ' + #13 +
     '     FROM LANCOPERDIAIMOB LO,                                      ' + #13 +
     '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA   ' + #13 +

     // Ricardo A. SOL 57966 KTN 523392
//     '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2            ' + #13 +
     '              FROM LANCOPERDIAIMOB LO2                             ' + #13 +
//     '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALJUROS AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')          ' + #13 + sParamOper +
     '             WHERE LO2.IDOPERACAO = ' + sParamJuros + #13 +
     sParamOper;

     if ( sContrato <> '' ) then
       SQL.Text := SQL.Text + ' AND LO2.IDCONTRATOIMOVEL = ' + sContrato + #13;

     SQL.Text := SQL.Text +

     '             GROUP BY LO2.CODDOCUMENTO                             ' + #13 +
     '           ) UD                                                    ' + #13 +

     // Ricardo A. SOL 57966 KTN 523392
//     '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALJUROS                    ' + #13 +
     '    WHERE LO.IDOPERACAO   = ' + sParamJuros + '                    ' + #13 +


     '      AND LO.DATAOPER     = UD.ULTDIA                              ' + #13 +
     '      AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)                    ' + #13 + sParamOper2 +
     '    GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO   ' + #13 +
     //SIG nº 127414
     //'    , LO.CODTIPIMOVEL  '+ #13 + //Helen - SOL: 159983 KTN: 1330985
     '   ) JR,                                                           ' + #13 +

     // TABELA MT
     '   (SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,    ' + #13 +
     //SIG nº 127414
     //'    LO.CODTIPIMOVEL,  '+ #13 + //Helen - SOL: 159983 KTN: 1330985
     '           SUM(LO.VLRACUM) AS VLRACUM                              ' + #13 +

     // Ricardo A. SOL 57966 KTN 523392
//     '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,                      ' + #13 +
     '     FROM LANCOPERDIAIMOB LO,                                      ' + #13 +

     '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA   ' + #13 +


     // Ricardo A. SOL 57966 KTN 523392
//     '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2            ' + #13 +
     '              FROM LANCOPERDIAIMOB LO2                             ' + #13 +
//     '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALMULTA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')          ' + #13 + sParamOper +
     '             WHERE LO2.IDOPERACAO = ' + sParamMulta + #13 +
     sParamOper;

     if ( sContrato <> '' ) then
       SQL.Text := SQL.Text + ' AND LO2.IDCONTRATOIMOVEL = ' + sContrato + #13;


     SQL.Text := SQL.Text +

     '             GROUP BY LO2.CODDOCUMENTO                             ' + #13 +
     '           ) UD                                                    ' + #13 +

     // Ricardo A. SOL 57966 KTN 523392
//     '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALMULTA                    ' + #13 +
     '    WHERE LO.IDOPERACAO   = ' + sParamMulta + '                    ' + #13 +

     '      AND LO.DATAOPER     = UD.ULTDIA                              ' + #13 +
     '      AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)                    ' + #13 + sParamOper2 +
     '    GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO   ' + #13 +
     //SIG nº 127414
     //'    ,LO.CODTIPIMOVEL  '+ #13 + //Helen - SOL: 159983 KTN: 1330985
     '   ) MT                                                            ' + #13 +

     ' WHERE ( C.IDLOCATARIO        = PL.IDPESSOA(+) )          ' + #13 +
     '   AND ( C.IDADMINIMOVEL      = PA.IDPESSOA(+) )          ' + #13 +
         // Daniel - 24412
    { '   AND ( DD.CODTIPIMOVEL      = T.CODTIPIMOVEL(+) )       ' + #13 + Helen - SOL: 159983 KTN: 1330985 }
     '   AND ( DD.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+) )   ' + #13 +
     '   AND ( DD.CODDOCUMENTO      = CM.CODDOCUMENTO (+) )     ' + #13 +
     '   AND ( DD.IDCONTRATOIMOVEL  = CM.IDCONTRATOIMOVEL (+) ) ' + #13 +
     '   AND ( DD.CODDOCUMENTO      = JR.CODDOCUMENTO (+) )     ' + #13 +
     '   AND ( DD.IDCONTRATOIMOVEL  = JR.IDCONTRATOIMOVEL (+) ) ' + #13 +
     '   AND ( DD.CODDOCUMENTO      = MT.CODDOCUMENTO (+) )     ' + #13 +
     '   AND ( DD.IDCONTRATOIMOVEL  = MT.IDCONTRATOIMOVEL (+) ) ' + #13 +

     // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
     // Foi adicionado o Join entre as tabelas
     '   AND ( C.IDSITCONTIMOB      = SC.IDSITCONTIMOB (+) )    ' + #13;

     if ChkVlrPositivo.Checked then begin
       SQL.Text := SQL.Text +
        '   AND ( ROUND((DD.TOT_RECEBER + NVL(CM.VLRACUM,0) + NVL(JR.VLRACUM,0) + NVL(MT.VLRACUM,0) - DD.RECEBIDO),2) > 0 )  ' + #13;
     end else begin
       SQL.Text := SQL.Text +
        '   AND ( ROUND((DD.TOT_RECEBER + NVL(CM.VLRACUM,0) + NVL(JR.VLRACUM,0) + NVL(MT.VLRACUM,0) - DD.RECEBIDO),2) <> 0 )  ' + #13;
     end;

     if ( length(trim(edtDataFim.Text)) > 0 ) then begin
       SQL.Text := SQL.Text +
       '    AND ( (DD.DATALIMITE IS NOT NULL AND DD.DATALIMITE <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) OR '+#13+
       '          (DD.DATALIMITE IS NULL AND DD.DATAVENCIMENTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) )  '+#13;

     end else begin
       SQL.Text := SQL.Text +
         '      AND ( (DD.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ') AND (DD.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ') ) ' + #13;
     end;

     if sContrato <> '' then
     SQL.Text := SQL.Text +
     '      AND ( C.IDCONTRATOIMOVEL = ' + sContrato + ' ) ';

     if chkSemReceita.Checked then
     SQL.Text := SQL.Text +
     '      AND ( C.IDCONTRATOIMOVEL IS NULL ) ';

     if edtAdminImovel.Text <> '' then
     SQL.Text := SQL.Text +
     '      AND ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) ' + #13;

     if molResponsavel1.iResponsavel > 0 then
     SQL.Text := SQL.Text +
     '      AND ( C.IDRESPONSAVEL = ' + IntToStr(molResponsavel1.iResponsavel ) + ' ) ' + #13;

     if DBcboTipoImovel.LookupValue <> '' then
     SQL.Text := SQL.Text +
     '      AND ( DD.CODTIPIMOVEL = ' + QuotedStr(DBcboTipoImovel.LookupValue) + ' ) ';

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

     if dbCboTipoReceita.LookupValue <> '' then
     SQL.Text := SQL.Text +
     '      AND ( DD.IDTIPOCUSTORECIMO = ' + QuotedStr(dbCboTipoReceita.LookupValue) + ' ) ';

     if chkVigente.Checked then
     SQL.Text := SQL.Text +
     '      AND ( ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
     '            ( C.FLGINDETERMINADO = ''S'' ) ) ' + #13;

     //Helen - SOL: 159983 KTN: 1330985 - Inicio
     SQL.Text := SQL.Text +
     ' GROUP BY ' + #13 +
     ' C.IDCONTRATOIMOVEL,  ' + #13 +
     ' C.CONNUMERO, ' + #13 +
     ' C.IDCONTRATOIMOVEL, C.CONNOME,  ' + #13 +
     ' DD.CODDOCUMENTO,  ' + #13 +
     ' DD.TOT_RECEBER,  ' + #13 +
     ' DD.RECEBIDO,     ' + #13 +
     ' CM.VLRACUM ,     ' + #13 +
     ' JR.VLRACUM,      ' + #13 +
     ' MT.VLRACUM,      ' + #13 +
     ' DD.TOT_RECEBER , DD.RECEBIDO,  ' + #13 +
     ' DD.MESCOMPETENCIA,DD.ANOCOMPETENCIA, ' + #13 +
     ' DD.DATAVENCIMENTO,   ' + #13 +
     ' DD.DATAVENCIMENTO,   ' + #13 +
     ' C.CONDATAINICIO,     ' + #13 +
     ' C.CONDATAFIM,        ' + #13 +
     ' C.IDLOCATARIO,       ' + #13 +
     ' PL.NOME ,            ' + #13 +
     ' PL.RAZAOSOCIAL ,     ' + #13 +
     ' C.IDADMINIMOVEL,     ' + #13 +
     ' SC.DESCRICAO         ' ;
    //Helen - SOL: 159983 KTN: 1330985 - Fim
     SQL.Text := SQL.Text +
     'ORDER BY ' + #13;

// Daniel - 24412 - Início -----------------------------------------------------
     if (chkAgrupaSegmento.Checked) then begin
        case rdgOrdenacao.ItemIndex of
           0: SQL.Text := SQL.Text + '   T.DESCTIPOIMOVEL, C.CONNUMERO, PL.NOME, DD.DATAVENCIMENTO, COMPETENCIA, DD.CODDOCUMENTO ';
           1: SQL.Text := SQL.Text + '   T.DESCTIPOIMOVEL, PL.NOME, C.CONNUMERO, DD.DATAVENCIMENTO, COMPETENCIA, DD.CODDOCUMENTO ';
        end;
     end else begin
// Daniel - 24412 - Fim --------------------------------------------------------
        case rdgOrdenacao.ItemIndex of
           0: SQL.Text := SQL.Text + '   C.CONNUMERO, PL.NOME, DD.DATAVENCIMENTO, COMPETENCIA, DD.CODDOCUMENTO ';
           1: SQL.Text := SQL.Text + '   PL.NOME, C.CONNUMERO, DD.DATAVENCIMENTO, COMPETENCIA, DD.CODDOCUMENTO ';
        end;
     end; // Fim - 24412
   //Helen - SOL: 159983 KTN: 1330985 - cmDebugToFile
   //cmDebugToFile(dtmRelAdminImobCC.qryInadimplContrAnalitico.SQL.Text,'C:\Planus\Temp\InadimplContrAnalitico.txt') ;
   Open;

   if IsEmpty then
   begin
      if sContrato <> '' then
      begin
        Close;
        SQL.Clear;
        SQL.Text := ' SELECT C.IDCONTRATOIMOVEL,                                                       ' + #13 +
       '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', C.CONNUMERO) AS NUMERO_CONTRATO, ' + #13 +
       '   DECODE(C.IDCONTRATOIMOVEL, NULL, ''RECEITA SEM CONTRATO'', C.CONNOME)   AS NOME_CONTRATO,   ' + #13 +
       '   '' '' AS DESCTIPOIMOVEL,                                                                    ' + #13 +
       '   0 AS CODDOCUMENTO,                                                                          ' + #13 +
       '   0 AS TOT_RECEBER,                                                                           ' + #13 +
       '   0 AS RECEBIDO,                                                                              ' + #13 +
       '   0 AS CORRECAO,                                                                              ' + #13 +
       '   0 AS JUROS,                                                                                 ' + #13 +
       '   0 AS MULTA,                                                                                 ' + #13 +
       '   0 AS TOTAL,                                                                                 ' + #13 +
       '   '' ''  AS COMPETENCIA,                                                                      ' + #13 +
       '   0 AS DIAS,                                                                                  ' + #13 +
       '   C.CONDATAFIM AS DATAVENCIMENTO,                                                             ' + #13 +
       '   C.CONDATAINICIO,                                                                            ' + #13 +
       '   C.CONDATAFIM,                                                                               ' + #13 +
       '   C.IDLOCATARIO,                                                                              ' + #13 +
       '   PL.NOME AS NF_LOCATARIO,                                                                    ' + #13 +
       '   PL.RAZAOSOCIAL AS RS_LOCATARIO,                                                             ' + #13 +
       '   C.IDADMINIMOVEL,                                                                            ' + #13 +
       '   '' '' AS DESCR_SITCONTR                                                                     ' + #13 +
       ' FROM   PESSOA PL, CONTRATOIMOVEL C                                                            ' + #13 +
       ' WHERE C.IDLOCATARIO = PL.IDPESSOA                                                             ' + #13 +
       ' AND C.IDCONTRATOIMOVEL = ' + sContrato;
        Open;

        dtmRelAdminImobCC.ppLabel234.Caption := '"Não há débitos para este Contrato"';

      end
      else
        dtmRelAdminImobCC.ppLabel234.Caption := '"Não há débitos para este Período"';


      dtmRelAdminImobCC.ppLabel234.Visible := True;
      dtmRelAdminImobCC.ppRegion5.Visible := False;
      dtmRelAdminImobCC.ppRegion8.Visible := False;
      dtmRelAdminImobCC.ppRegion10.Visible := False;
      dtmRelAdminImobCC.ppRegion6.Visible := False;
      dtmRelAdminImobCC.ppDBText58.Visible := False;
      dtmRelAdminImobCC.ppDBText50.Visible := False;
      dtmRelAdminImobCC.ppDBText59.Visible := False;
      dtmRelAdminImobCC.ppDBText47.Visible := False;
      dtmRelAdminImobCC.ppDBText72.Visible := False;
      dtmRelAdminImobCC.ppDBText60.Visible := False;
      dtmRelAdminImobCC.ppDBText61.Visible := False;
      dtmRelAdminImobCC.ppDBText62.Visible := False;
      dtmRelAdminImobCC.ppDBText63.Visible := False;

   end
   else
   begin
      dtmRelAdminImobCC.ppLabel234.Visible := False;
      dtmRelAdminImobCC.ppRegion5.Visible := True;
      dtmRelAdminImobCC.ppRegion8.Visible := True;
      dtmRelAdminImobCC.ppRegion10.Visible := True;
      dtmRelAdminImobCC.ppRegion6.Visible := True;
      dtmRelAdminImobCC.ppDBText58.Visible := True;
      dtmRelAdminImobCC.ppDBText50.Visible := True;
      dtmRelAdminImobCC.ppDBText59.Visible := True;
      dtmRelAdminImobCC.ppDBText47.Visible := True;
      dtmRelAdminImobCC.ppDBText72.Visible := True;
      dtmRelAdminImobCC.ppDBText60.Visible := True;
      dtmRelAdminImobCC.ppDBText61.Visible := True;
      dtmRelAdminImobCC.ppDBText62.Visible := True;
      dtmRelAdminImobCC.ppDBText63.Visible := True;
   end;


   end;

//   sTextoSql := dtmRelAdminImobCC.qryInadimplContrAnalitico.SQL.Text;


end;



procedure TcfgRelInadimplContrAnalitico.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 28/06/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoInadimplContrAnalitico.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoInadimplContrAnalitico.Picture := nil;

      // preenche as labels do relatório
      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
         rptInadimplContrAnaliticolblMesCompetencia.Caption  := '';
         rptInadimplContrAnaliticolblDataLimite.Caption      := edtDataFim.Text;
      end else begin
         rptInadimplContrAnaliticolblMesCompetencia.Caption  := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
         rptInadimplContrAnaliticolblDataLimite.Caption      := '';
      end;
      if DBcboTipoImovel.Text <> ''  then
           rptInadimplContrAnaliticolblSegmento.Caption := DBcboTipoImovel.Text
      else rptInadimplContrAnaliticolblSegmento.Caption := '<Todos>';
      if dbCboTipoReceita.Text <> '' then
           rptInadimplContrAnaliticolblReceita.Caption  := dbCboTipoReceita.Text
      else rptInadimplContrAnaliticolblReceita.Caption  := '<Todas>';

// Pendência: 21494, 21495 e 21502
// Daniel Simões - -------------------------------------------------------------

      if ( molResponsavel1.edtResponsavel.Text <> '' ) then
           rptInadimplContrAnaliticolblResponsabilidade.Caption := molResponsavel1.edtResponsavel.Text
      else rptInadimplContrAnaliticolblResponsabilidade.Caption := '<Todos>';

      if ( edDataAtualiza.Text <> '' ) then
           rptInadimplContrAnaliticolblDataAtualiza1.Caption := DateToStr(dDtAtualiza)
      else rptInadimplContrAnaliticolblDataAtualiza1.Caption := '';

// Daniel Simões - -------------------------------------------------------------

      rptInadimplContrAnaliticolblMesCompetencia.Visible := (rptInadimplContrAnaliticolblMesCompetencia.Caption <> '');
      rptInadimplContrAnaliticolblDataLimite.Visible     := (rptInadimplContrAnaliticolblDataLimite.Caption <> '');

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

// Daniel - 26622 - Início -----------------------------------------------------
      if Assigned(ppGrpInadimpContrAnaliticoSeg) then begin
         if chkAgrupaSegmento.Checked then
              ppGrpInadimpContrAnaliticoSeg.BreakName := 'DESCTIPOIMOVEL'
         else ppGrpInadimpContrAnaliticoSeg.BreakName := 'NUMERO_CONTRATO';
      end;

      if Assigned(ppGrpInadimpContrAnaliticoSeg) then
         ppGrpInadimpContrAnaliticoSeg.NewPage := chkAgrupaSegmento.Checked;
// Daniel - 26622 - Fim --------------------------------------------------------

// Daniel - 24412 - Início -----------------------------------------------------
      if Assigned(ppGrpInadimpContrAnaliticoSegHeader) then
        ppGrpInadimpContrAnaliticoSegHeader.Visible := chkAgrupaSegmento.Checked;

      if Assigned(ppGrpInadimpContrAnaliticoSegFooter) then
        ppGrpInadimpContrAnaliticoSegFooter.Visible := chkAgrupaSegmento.Checked;
// Daniel - 24412 - Fim --------------------------------------------------------
   end;

   FiltraContrato;
end;




procedure TcfgRelInadimplContrAnalitico.bbtnConfirmarClick(Sender: TObject);
begin
  if VerificaPreenchimento then inherited;
end;



procedure TcfgRelInadimplContrAnalitico.btnBuscaContratoClick(Sender: TObject);
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



procedure TcfgRelInadimplContrAnalitico.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   sContrato := '';

   edtConNumero.Clear;
   edtConNome.Clear;
end;



procedure TcfgRelInadimplContrAnalitico.FormShow(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PRECCUSTO').AsString  := 'R';
   dtmLookImobiliario.qryLookTipoRecDes.Open;
end;



procedure TcfgRelInadimplContrAnalitico.btnBuscaAdminImovelClick(Sender: TObject);
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



procedure TcfgRelInadimplContrAnalitico.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;
   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelInadimplContrAnalitico.FormCreate(Sender: TObject);
begin
  inherited;
  // Daniel - 24878
  qryParamOper.Close;
  qryParamOper.Open;
  // Fim.

  qrySitContratual.Close;
  qrySitContratual.Open;

  edDataAtualiza.Date := qryParamOper.FieldByName('DTULTFECH').AsDateTime;
  dDtAtualiza         := edDataAtualiza.Date;
end;

procedure TcfgRelInadimplContrAnalitico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryParamOper.Close;
end;

end.
