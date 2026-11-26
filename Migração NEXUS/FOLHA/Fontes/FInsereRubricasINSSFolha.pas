// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
// Autor(a)    : LEANDRO pOCEBON
// Data        : 31/10/2025
// No. SIG     : migracao-oracle
// Alteração   : inclusão cast na consulta
//--------------------------------------------------------------------------------
// Autor(a)    : LEANDRO
// Data        : 05/08/2025
// No. WO      : 13132
// Alteração   : INCLUSÃO DO SEQUENCIA DA DETCONCINSS NA RUBRICAINDIV PARA PERMITIR RUBRICAS COM VALORES IGUAIS
//--------------------------------------------------------------------------------
// Rotina      : (dfm) qryLista, consultar
// Autor(a)    : Edilaine
// Data        : 07/03/2018
// No. SIG     : 64063
// Alteração   : está trazendo informação do perfil de investimento em vez do plano contábil
//--------------------------------------------------------------------------------
//Pendência   : SOL 146663 KINTANA 1002356
//Responsável : MARCIO DENILSON
//Data        : 25/08/2011
//Descrição   : Alterações em função da revisão da espeficicação do SOL
//--------------------------------------------------------------------------------
//Pendência   : SOL 146663 KINTANA 1002356
//Responsável : MARCIO DENILSON
//Data        : 01/06/2011
//Descrição   : Alterações em função da revisão da espeficicação do SOL
//--------------------------------------------------------------------------------
//Pendência   : SOL 146663 KINTANA 1002356
//Responsável : MARCIO DENILSON
//Data        : 04/05/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------

unit FInsereRubricasINSSFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBTables, Wwquery, wwdblook;

type
  TfrmInsereRubricasINSSFolha = class(TfrmOkCancelar)
    bbtnProcessar: TBitBtn;
    pnOpcoesPesquisa: TPanel;
    GroupBox2: TGroupBox;
    cmb_mesCompretencia: TComboBox;
    spn_anoCompetencia: TSpinEdit;
    GroupBox1: TGroupBox;
    btnProcurar: TBitBtn;
    Toolbar971: TToolbar97;
    bbtnDesfazer: TBitBtn;
    dbgrdLista: TwwDBGrid;
    qryLista: TwwQuery;
    dsLista: TwwDataSource;
    dsRubricas: TwwDataSource;
    qryRubricas: TwwQuery;
    dblcRubrica: TwwDBLookupCombo;
    updLista: TUpdateSQL;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure cmb_mesCobrancaChange(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure dbgrdListaTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgrdListaFieldChanged(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure consultarRubricas();

    function PegaAnoMesRef(acbMes : tcombobox; aspAno : tspinedit) : string;
    function retornaMesAutal(): Integer;
    function retornaAnoAutal(): Integer;
    function retornaNomeArquivoLog(): String;

    function  retornaIdentificadorPlanoContabil(): String;
    function  retornaIdTitular(): String;

    //function verificaRubricaIndividualJaFoiProgramada(sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sMesReferencia: String; fValorAcerto:Real): Boolean; //WO13132 leandro
    function verificaRubricaIndividualJaFoiProgramada(sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sMesReferencia, sIDSeqDetConcINSS: String; fValorAcerto:Real): Boolean;   //wo13132 leandro
    //procedure programarRubricaIndividual(sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sPlanocontabil,sMesReferencia,sMesCompReembolso: String; fValorAcerto:Real); //WO13132 LEANDRO
    procedure programarRubricaIndividual(sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sPlanocontabil,sMesReferencia,sMesCompReembolso, sIDSeqDetConcINSS: String; fValorAcerto:Real);   //WO13132 LEANDRO
    //procedure desfazerRubricaIndividual(sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sMesReferencia: String; fValorAcerto:Real); //wo13132 leandro
    procedure desfazerRubricaIndividual(sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sMesReferencia, sIDSeqDetConcINSS: String; fValorAcerto:Real);   //wo13132 leazndro

    procedure iniciarTela();

    procedure consultar();
    procedure processar();
    procedure desfazer();

  public
    { Public declarations }
  end;

var
  frmInsereRubricasINSSFolha: TfrmInsereRubricasINSSFolha;

implementation

uses UDatabase, UMensErro, uCMMath, DBaseDados, FileCtrl;

{$R *.DFM}

procedure TfrmInsereRubricasINSSFolha.FormCreate(Sender: TObject);
begin
  inherited;
  iniciarTela();
end;

procedure TfrmInsereRubricasINSSFolha.consultar;
var ssql : String;
begin

    //ssQl :=  ' SELECT DISTINCT 1 as PROCESSAR,                                     ' // WO13132 LEANDRO
    ssQl :=  ' SELECT 1 as PROCESSAR,                                              '   // WO13132 LEANDRO
           + '        D.MATRICULA,                                                 '
           + '        P.NOME,                                                      '
           + '        NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS RUBRICA,               '
           + '        D.VALORINSS,                                                 '
           + '        cast(TO_CHAR(D.VALORINSS,''9G999G999D00'')   AS VARCHAR2(15)) AS VALORINSSFORMAT,    '  //MIGRACAO-ORACLE LEANDRO
           + '        D.IDPESSOA,                                                  '
           + '        D.IDBENEFICIO,                                               '
           + '        D.IDRUBRICA,                                                 '
           //edilaine - SIG64063 - inicio
           //+ '        D.IDPLANOPREV,                                               '
           + '        DECODE(D.IDPLANOPREV, 97, 66, 107, 74, D.IDPLANOPREV) AS IDPLANOPREV, '
           //edilaine - SIG64063 - fim
           + '        D.NUMPROCINSS,                                               '
           + '        D.MESREFERENCIA,                                             '
           + '        D.MESCOBRANCA,                                               '
           + '        RI.RUBRICAINSS,                                              '
           + '        PDINSS.IDPROVENTO AS IDPROVENTOINSS,                          '
           + '        D.SEQUENCIAL AS SEQUENCIAL                                   ' //WO13132 LEANDRO
           + ' FROM DETCONCINSS D                                                  '
           + '      ,PROVDESC PD                                                   '
           + '      ,PESSOA P                                                      '
           + '      ,RUBRICAXINSS RI                                               '
           + '      ,PROVDESC PDINSS                                               '
           + '  WHERE D.IDRUBRICA  = PD.IDPROVENTO                                 '
           + '  AND D.IDPESSOA = P.IDPESSOA                                        '
           + '  AND RI.IDRUBRICA = PD.IDPROVENTO                                   '
           + '  AND TO_CHAR(RI.RUBRICAINSSDESEMB) = PDINSS.CODPROVDESC(+)          '
           + '  AND D.MESCOBRANCA = ' + QuotedStr( PegaAnoMesRef(cmb_mesCompretencia,spn_anoCompetencia) )
           + '  AND SUBSTR(D.RUBRICAINSS, 2, 1) NOT IN (''9'', ''3'')              ';

           if (Trim(dblcRubrica.Text) <> '' ) then
            begin
              ssQl :=  ssQl +
                   ' AND PD.IDPROVENTO = ' + QuotedStr( qryRubricas.FieldByName('IDPROVENTO').AsString );
            end;

           ssQl :=  ssQl + '  UNION ALL                                            '
           + '  SELECT DISTINCT 1 as PROCESSAR,                                    '
           + '         T.MATRICULA,                                                '
           + '         P.NOME,                                                     '
           + '         NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS RUBRICA,              '
           + '         T.VLRRUBRICA1 AS VALORINSS,                                 '
           + '         cast(TO_CHAR(T.VLRRUBRICA1,''9G999G999D00'') AS VARCHAR2(15)) AS VALORINSSFORMAT, '    //MIGRACAO-ORACLE LEANDRO
           + '         T.IDPESSOA,                                                 '
           + '         0 AS IDBENEFICIO,                                           '
           + '         T.CODRUBRICA1 AS IDRUBRICA,                                 '
           + '         0 AS IDPLANOPREV,                                           '
           + '         T.NUMPROCINSS,                                              '
           + '         T.MESREFERENCIA,                                            '
           + '         T.MESPROCESSAMENTO AS MESCOBRANCA,                          '
           + '         RI.RUBRICAINSS,                                             '
           + '         PDINSS.IDPROVENTO AS IDPROVENTOINSS,                         '
           + '         0 AS SEQUENCIAL                                             ' //WO13132 LEANDRO
           + '  FROM TEMPCONCINSS T                                                '
           + '      ,PROVDESC PD                                                   '
           + '      ,PESSOA P                                                      '
           + '      ,RUBRICAXINSS RI                                               '
           + '      ,PROVDESC PDINSS                                               '
           + '  WHERE TO_CHAR(T.CODRUBRICA1)  = PD.CODPROVDESC                     '
           + '  AND T.IDPESSOA = P.IDPESSOA(+)                                     '
           + '  AND RI.IDRUBRICA = PD.IDPROVENTO                                   '
           + '  AND TO_CHAR(RI.RUBRICAINSSDESEMB) = PDINSS.CODPROVDESC(+)          '
           + '  AND T.MESPROCESSAMENTO = ' + QuotedStr( PegaAnoMesRef(cmb_mesCompretencia,spn_anoCompetencia) )
           + '  AND SUBSTR(T.CODRUBRICA1, 2, 1) NOT IN (''9'', ''3'')              ';

    if (Trim(dblcRubrica.Text) <> '' ) then
      begin
        ssQl :=  ssQl + ' AND PD.IDPROVENTO = ' + QuotedStr( qryRubricas.FieldByName('IDPROVENTO').AsString );
      end;


    ssQl :=  ssQl +
             ' ORDER BY MATRICULA,                                                 '
           + '          NOME,                                                      '
           + '          RUBRICA                                                    ';

   FazQuery(qryLista, ssql);

end;

function TfrmInsereRubricasINSSFolha.PegaAnoMesRef(acbMes: tcombobox;
  aspAno: tspinedit): string;
begin
  result:='';
  if (aspAno.value > 0) and (acbMes.ItemIndex >= 0) then
  begin
    result:=Trim(aspAno.Text) + '/';
    if acbMes.ItemIndex >= 0 then
    begin
      if acbMes.ItemIndex <= 8 then
        result:=result+'0'+IntToStr(acbMes.ItemIndex+1)
      else
        result:=result+IntToStr(acbMes.ItemIndex+1);
    end;
  end;
end;

procedure TfrmInsereRubricasINSSFolha.btnProcurarClick(Sender: TObject);
begin
  inherited;

  if (cmb_mesCompretencia.ItemIndex = -1) or (spn_anoCompetencia.Value = 0) then
   begin
      MsgDlg('É necessário selecionar o Ano e Mês de Competência.','aviso', mtInformation, [mbOk, mbHelp], 0);
      cmb_mesCompretencia.SetFocus;
      Exit;
   end;


  bbtnProcessar.Enabled := False;
  bbtnDesfazer.Enabled  := False;

  dbgrdLista.Visible    := True;
  dbgrdLista.Color      := clWhite;


  consultar();

  if qryLista.RecordCount > 0 then
   begin
    bbtnProcessar.Enabled := True;
    bbtnDesfazer.Enabled  := True;
    bbtnSair.Enabled      := False;
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Inverter~Seleção';
    dbgrdLista.Refresh;
   end;

  bbtnCancelar.Enabled    := True;
   
end;

procedure TfrmInsereRubricasINSSFolha.cmb_mesCobrancaChange(Sender: TObject);
begin
  inherited;
  btnProcurar.Enabled := (cmb_mesCompretencia.ItemIndex <> -1) and
                         (spn_anoCompetencia.Value>0);

  consultarRubricas();
end;

procedure TfrmInsereRubricasINSSFolha.bbtnProcessarClick(Sender: TObject);
begin
  inherited;

  if (cmb_mesCompretencia.ItemIndex = -1) or (spn_anoCompetencia.Value = 0) then
   begin
      MsgDlg('É necessário selecionar o Ano e Mês de Competência.','aviso', mtInformation, [mbOk, mbHelp], 0);
      cmb_mesCompretencia.SetFocus;
      Exit;
   end;

  bbtnProcessar.Enabled := False;
  bbtnDesfazer.Enabled  := False;

  processar();

  bbtnSair.Enabled      := True;
end;

procedure TfrmInsereRubricasINSSFolha.dbgrdListaTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  if AFieldName = 'PROCESSAR' then
   begin
     qryLista.disableControls;
     qryLista.First;
     While not qryLista.Eof do
      begin
         qryLista.Edit;
         if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Selecionar~Todos') then
          qryLista.FieldByName('PROCESSAR').AsInteger := 1
         Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') and (qryLista.FieldByName('PROCESSAR').AsInteger= 1) then
          qryLista.FieldByName('PROCESSAR').AsInteger := 0
         Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') and (qryLista.FieldByName('PROCESSAR').AsInteger= 0) then
          qryLista.FieldByName('PROCESSAR').AsInteger := 1;
         qryLista.Post;
         qryLista.Next;
      end;
     qryLista.enableControls;
     qryLista.First;
   end;

  if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') then
   begin
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Selecionar~Todos';
    dbgrdLista.Refresh;
   end
  Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Selecionar~Todos') then
   begin
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Inverter~Seleção';
    dbgrdLista.Refresh;
   end;

end;

function TfrmInsereRubricasINSSFolha.retornaMesAutal: Integer;
var sSql : String;
begin
  sSql :=  ' SELECT TO_NUMBER(TO_CHAR(SYSDATE,''MM'')) AS MES FROM DUAL   ';

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('MES').AsInteger
  Else
    Result := 0;
end;

function TfrmInsereRubricasINSSFolha.retornaAnoAutal: Integer;
var sSql : String;
begin
  sSql :=  ' SELECT TO_NUMBER(TO_CHAR(SYSDATE,''YYYY'')) AS ANO FROM DUAL   ';

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('ANO').AsInteger
  Else
    Result := 0;
end;

procedure TfrmInsereRubricasINSSFolha.programarRubricaIndividual(sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sPlanocontabil,sMesReferencia,sMesCompReembolso, sIDSeqDetConcINSS: String; fValorAcerto: Real);
var sSql,sIdEmpresa,sDtInicio, sDtFinal : String;
    iSeqRubricaIndiv: Integer;
begin

  sIdEmpresa := '1';

  sSql :=  ' SELECT NVL(MAX(SEQRUBRICAINDIV),0) + 1 AS SEQRUBRICAINDIV  '
        +  ' FROM RUBRICAINDIV                                          '
        +  ' WHERE IDPESSOA =   ' + sIdPessoa
        +  '   AND IDEMPRESA =  ' + sIdEmpresa
        +  '   AND IDRUBRICA =  ' + sIdRubrica;

  if FazQuery(qryAux, ssql) then
    iSeqRubricaIndiv  := qryAux.FieldByName('SEQRUBRICAINDIV').AsInteger
  Else
    iSeqRubricaIndiv  := 0;

  qryAux.Close;

  sSql :=  ' SELECT                                                                       '
        +  '       CASE WHEN TO_CHAR(SYSDATE,''DD'') <= 15                                '
        +  '           THEN TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,-1)) + 1,''DD/MM/YYYY'')  '
        +  '           ELSE TO_CHAR(LAST_DAY(SYSDATE) + 1 ,''DD/MM/YYYY'')                '
        +  '        END AS DATA_INICIO                                                    '
        +  '       ,CASE WHEN TO_CHAR(SYSDATE,''DD'') <= 15                               '
        +  '           THEN TO_CHAR(LAST_DAY(SYSDATE),''DD/MM/YYYY'')                     '
        +  '           ELSE TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,1)),''DD/MM/YYYY'')       '
        +  '        END AS DATA_FINAL                                                     '
        +  ' FROM DUAL                                                                    ';

  if FazQuery(qryAux, ssql) then
   begin
     sDtInicio := qryAux.FieldByName('DATA_INICIO').AsString;
     sDtFinal  := qryAux.FieldByName('DATA_FINAL').AsString;
   end;

  qryAux.Close;

  fValorAcerto := RoundCM(fValorAcerto,2);

  sSql :=  ' INSERT INTO RUBRICAINDIV '
         + ' ( IDPESSOA               '
         + '  ,IDEMPRESA              '
         + '  ,IDRUBRICA              '
         + '  ,NUMOCORRENCIAS         '
         + '  ,SEQRUBRICAINDIV        '
         + '  ,IDFAVORECIDO           '
         + '  ,IDREGRACALCULO         '
         + '  ,VALORRUBRICA           '
         + '  ,ANOMESINICIO           '
         + '  ,FLGPERMANENTE          '
         + '  ,PARCELAS               '
         + '  ,FLGPERCENT             '
         + '  ,FLGTPRUBMANUT          '
         + '  ,FLGPENSAOALIM          '
         + '  ,RUBRICAPROVENTOPA      '
         + '  ,DATAFINAL              '
         + '  ,ANOMESREF              '
         + '  ,MESCOMPREEM            '
         + '  ,CODPORTFORMA           '
         + '  ,IDTITULAR              '
         + '  ,DATAINICIO             '
         + '  ,FLGBASEPA              '
         + '  ,FLGUSAABONO            '
         + '  ,IDALIMENTADO           '
         + '  ,IDLOTE                 '
         + '  ,FLGDESATIVADO          '
         + '  ,FLGUSADO               '
         + '  ,FLGCALCULACPMF         '
         + '  ,ULTMESPREPARO          '
         + '  ,VALORANTERIOR          '
         + '  ,IDPROCESSO             '
         + '  ,IDRUBRICA13            '
         + '  ,IDRUBRICAPROVENTO13    '
         + '  ,IDMOTIVO               '
         + '  ,IDLOTEREVISAO          '
         + '  ,FLGANTECIPABONO        '
         + '  ,IDSEQINTERNOFB         '
         + '  ,NUMPROCINSS            '
         + '  ,IDMOVBENEF             '
         + '  ,FLGCONTROLASALDO       '
         + '  ,VLRSALDOINICIAL        '
         + '  ,VLRTOTALPROC           '
         + '  ,IDPLANOCONTABIL        '
         + '  ,FLGRETROACAO           '
         + '  ,FLGANTECIPAABONOINSS   '
         + '  ,SITUACAOAJ             '
         + '  ,IDSEQDETCONCINSS       ' //wo13132 leandro
         + '  ,OBSERVACAO )           '
         + ' VALUES                   '
         + ' ( :IDPESSOA                                   '      //  IDPESSOA
         + '  ,:IDEMPRESA                                  '      //  IDEMPRESA
         + '  ,:IDRUBRICA                                  '      //  IDRUBRICA
         + '  ,0                                           '      //  NUMOCORRENCIAS
         + '  ,:SEQRUBRICAINDIV                            '      //  SEQRUBRICAINDIV
         + '  ,null                                        '      //  IDFAVORECIDO
         + '  ,null                                        '      //  IDREGRACALCULO
         + '  ,:VALORRUBRICA                               '      //  VALORRUBRICA
         + '  ,null                                        '      //  ANOMESINICIO
         + '  ,0                                           '      //  FLGPERMANENTE
         + '  ,1                                           '      //  PARCELAS
         + '  ,0                                           '      //  FLGPERCENT
         + '  ,1                                           '      //  FLGTPRUBMANUT
         + '  ,0                                           '      //  FLGPENSAOALIM
         + '  ,null                                        '      //  RUBRICAPROVENTOPA
         + '  ,:DATAFINAL                                  '      //  DATAFINAL
         + '  ,:ANOMESREF                                  '      //  ANOMESREF
         + '  ,:MESCOMPREEM                                '      //  MESCOMPREEM
         + '  ,null                                        '      //  CODPORTFORMA
         + '  ,:IDTITULAR                                  '      //  IDTITULAR
         + '  ,:DATAINICIO                                 '      //  DATAINICIO
         + '  ,0                                           '      //  FLGBASEPA
         + '  ,0                                           '      //  FLGUSAABONO
         + '  ,null                                        '      //  IDALIMENTADO
         + '  ,null                                        '      //  IDLOTE
         + '  ,0                                           '      //  FLGDESATIVADO
         + '  ,0                                           '      //  FLGUSADO
         + '  ,0                                           '      //  FLGCALCULACPMF
         + '  ,TO_CHAR(ADD_MONTHS(SYSDATE,-1),''YYYY/MM'') '      //  ULTMESPREPARO
         + '  ,null                                        '      //  VALORANTERIOR
         + '  ,null                                        '      //  IDPROCESSO
         + '  ,null                                        '      //  IDRUBRICA13
         + '  ,null                                        '      //  IDRUBRICAPROVENTO13
         + '  ,null                                        '      //  IDMOTIVO
         + '  ,null                                        '      //  IDLOTEREVISAO
         + '  ,0                                           '      //  FLGANTECIPABONO
         + '  ,null                                        '      //  IDSEQINTERNOFB
         + '  ,null                                        '      //  NUMPROCINSS
         + '  ,null                                        '      //  IDMOVBENEF
         + '  ,0                                           '      //  FLGCONTROLASALDO
         + '  ,null                                        '      //  VLRSALDOINICIAL
         + '  ,null                                        '      //  VLRTOTALPROC
         + '  ,:IDPLANOCONTABIL                            '      //  IDPLANOCONTABIL
         + '  ,1                                           '      //  FLGRETROACAO
         + '  ,null                                        '      //  FLGANTECIPAABONOINSS
         + '  ,null                                        '      //  SITUACAOAJ
         + '  ,:IDSEQDETCONCINSS                           '      //  IDSEQDETCONCINSS //wo13132 leandro
         + '  ,null )                                      ';     //  OBSERVACAO

  qryAux.Sql.Text := sSql;

  qryAux.ParamByName('IDPESSOA').AsString         := sIdPessoa;
  qryAux.ParamByName('DATAINICIO').AsString       := sDtInicio;
  qryAux.ParamByName('DATAFINAL').AsString        := sDtFinal;
  qryAux.ParamByName('IDEMPRESA').AsString        := sIdEmpresa;
  qryAux.ParamByName('IDRUBRICA').AsString        := sIdRubrica;
  qryAux.ParamByName('SEQRUBRICAINDIV').AsInteger := iSeqRubricaIndiv;
  qryAux.ParamByName('VALORRUBRICA').AsFloat      := fValorAcerto;
  qryAux.ParamByName('ANOMESREF').AsString        := sMesReferencia;
  qryAux.ParamByName('MESCOMPREEM').AsString      := sMesCompReembolso;
  qryAux.ParamByName('IDTITULAR').AsString        := sIdTitular;
  qryAux.ParamByName('IDPLANOCONTABIL').AsString  := sPlanocontabil;
  qryAux.ParamByName('IDSEQDETCONCINSS').AsString := sIDSeqDetConcINSS; //wo13132 leandro

  qryAux.ExecSQL;
end;

procedure TfrmInsereRubricasINSSFolha.processar;
var sPlanoContabil,sMesReferencia,sNomeArquivoLog, sMatriculaSel, sIdTitular: String;
    iTotal, iTotalSel, i: Integer;
    vListaMatRejeitadas,vArqLog: TStringList;
    fValorTotal:Real;
    bRubJaProgramada: Boolean;
begin
  Try
  vListaMatRejeitadas := TStringList.Create;
  vArqLog             := TStringList.Create;

  qryLista.disableControls;

  With qryLista do
    begin
      While not EOF do
       begin
          if qryLista.FieldByName('IDPROVENTOINSS').IsNull or ( qryLista.FieldByName('IDPROVENTOINSS').AsString = '' ) then
           begin
             MsgDlg('Existem rubricas não parametrizadas. Favor verificar.','Informação', mtInformation, [mbOk, mbHelp], 0);
             qryLista.enableControls;
             Exit;
           end;
          Next;
       end;
    end;


  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  iTotal      := 0;
  iTotalSel   := 0;
  fValorTotal := 0;


  With qryLista do
    begin
      First;
      While not EOF do
       begin
         if qryLista.FieldByName('PROCESSAR').AsInteger = 1 then
          begin
            Inc( iTotalSel );
            sPlanoContabil := qryLista.FieldByName('IDPLANOPREV').AsString;
            sMesReferencia := qryLista.FieldByName('MESREFERENCIA').AsString;
            sIdTitular     := retornaIdTitular();

            if qryLista.FieldByName('IDPROVENTOINSS').IsNull or ( qryLista.FieldByName('IDPROVENTOINSS').AsString = '' ) then
              raise Exception.Create('Rubrica não parametrizada: ' + qryLista.FieldByName('RUBRICA').AsString);

            bRubJaProgramada := False;
            if (sIdTitular <> '') then
              bRubJaProgramada := verificaRubricaIndividualJaFoiProgramada ( qryLista.FieldByName('IDPESSOA').AsString
                                                                            ,qryLista.FieldByName('IDPESSOA').AsString
                                                                            ,qryLista.FieldByName('IDPROVENTOINSS').AsString
                                                                            ,sIdTitular
                                                                            ,sMesReferencia
                                                                            ,qryLista.FieldByName('SEQUENCIAL').AsString //wo13132 leandro
                                                                            ,qryLista.FieldByName('VALORINSS').AsFloat);

            if (not bRubJaProgramada) and
               (sIdTitular <> '')     and
               (not qryLista.FieldByName('IDPESSOA').IsNull ) and
               (not qryLista.FieldByName('MATRICULA').IsNull ) then
              begin
                Inc( iTotal );

                fValorTotal := fValorTotal + qryLista.FieldByName('VALORINSS').AsFloat;

                programarRubricaIndividual( qryLista.FieldByName('IDPESSOA').AsString
                                           ,qryLista.FieldByName('IDPESSOA').AsString
                                           ,qryLista.FieldByName('IDPROVENTOINSS').AsString
                                           ,sIdTitular
                                           ,sPlanoContabil
                                           ,sMesReferencia
                                           ,qryLista.FieldByName('MESCOBRANCA').AsString
                                           ,qryLista.FieldByName('SEQUENCIAL').AsString //wo13132 leandro
                                           ,qryLista.FieldByName('VALORINSS').AsFloat);


              end
             Else
              begin
                if (not qryLista.FieldByName('MATRICULA').IsNull ) then
                  vListaMatRejeitadas.Add(qryLista.FieldByName('MATRICULA').AsString)
                Else
                  vListaMatRejeitadas.Add('MATRICULA NÃO VINCULADA (' + qryLista.FieldByName('NUMPROCINSS').AsString + ')');
              end;


          end;

         sMatriculaSel := qryLista.FieldByName('MATRICULA').AsString;
         Next;
       end;
      qryLista.enableControls;
      First;
    end;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;

  vArqLog.Add('INSERÇÃO DAS RUBRICAS DO INSS NA FOLHA DE BENEFÍCIOS');
  vArqLog.Add('');
  vArqLog.Add('- Quantidade de registros lançados: ' + IntToStr(iTotal) ) ;
  vArqLog.Add('- Valor total dos registros lançados: R$ ' + FormatFloat('###,###,##0.00',fValorTotal) ) ;
  vArqLog.Add('- Matrículas rejeitadas: ') ;
  for i:=0 to vListaMatRejeitadas.Count-1 do
    vArqLog.Add( vListaMatRejeitadas.Strings[i] ) ;
  vArqLog.Add('');
  vArqLog.Add('');
  vArqLog.Add('FIM');

  sNomeArquivoLog := retornaNomeArquivoLog();

  if DirectoryExists('C:\PLANUS\TEMP\') then
    vArqLog.SaveToFile('C:\PLANUS\TEMP\' + sNomeArquivoLog);

  if iTotalSel = 0 then
    MsgDlg('Nenhuma rubrica selecionada.','Informação', mtInformation, [mbOk, mbHelp], 0)

  Else if (iTotalSel = 1) and (iTotal = 0) then
    MsgDlg('Não é possível efetuar o lançamento para a matricula ' + sMatriculaSel +' , pois os lançamentos já foram efetuados.','Informação', mtInformation, [mbOk, mbHelp], 0)

  Else if (iTotalSel > 0) and (iTotal = 0) then
    MsgDlg('Não é possível efetuar o lançamento para as matriculas selecionadas, pois os lançamentos já foram efetuados.','Informação', mtInformation, [mbOk, mbHelp], 0)

  Else if (iTotalSel > 0) and (iTotal > 0) then
    MsgDlg('Lançamentos efetuados com sucesso.','Informação', mtInformation, [mbOk, mbHelp], 0);

  Except
    on e: Exception do
     begin
        qryLista.enableControls;
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao efetuar lancamentos.' + #13 + 'Erro: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);
     end;
  end;


end;

function TfrmInsereRubricasINSSFolha.retornaIdentificadorPlanoContabil: String;
var sSql : String;
begin
  sSql :=  ' SELECT IDPLANPREVCONTAB   '
        +  ' FROM BENEFBFCIARIO        '
        +  ' WHERE IDPESSOA   = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  '  AND IDTITULAR   = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  '  AND IDBENEFICIO = ' + qryLista.FieldByName('IDBENEFICIO').AsString
        +  '  AND IDPLANPREVCONTAB = ' + qryLista.FieldByName('IDPLANOPREV').AsString
        +  '  AND FONTEPAGADORA = 2';

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('IDPLANPREVCONTAB').AsString
  Else
    Result := '';

end;

procedure TfrmInsereRubricasINSSFolha.desfazer;
var sMesReferencia,sIdTitular: String;
begin
  Try

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  With qryLista do
    begin
      qryLista.disableControls;
      First;
      While not EOF do
       begin
         if qryLista.FieldByName('PROCESSAR').AsInteger = 1 then
          begin
            sMesReferencia := qryLista.FieldByName('MESREFERENCIA').AsString;
            sIdTitular     := retornaIdTitular();

            desfazerRubricaIndividual(  qryLista.FieldByName('IDPESSOA').AsString
                                       ,qryLista.FieldByName('IDPESSOA').AsString
                                       ,qryLista.FieldByName('IDPROVENTOINSS').AsString
                                       ,sIdTitular
                                       ,sMesReferencia
                                       ,qryLista.FieldByName('SEQUENCIAL').AsString //wo13132 leandro
                                       ,qryLista.FieldByName('VALORINSS').AsFloat);
          end;
         Next;
       end;
      qryLista.enableControls;
      First;
    end;


  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;

  MsgDlg('Lançamentos excluídos com sucesso.','Informação', mtInformation, [mbOk, mbHelp], 0);

  Except
    on e: Exception do
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao excluir lancamentos.' + #13 + 'Erro: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);
     end;
  end;

end;

procedure TfrmInsereRubricasINSSFolha.bbtnDesfazerClick(Sender: TObject);
begin
  inherited;

  if (cmb_mesCompretencia.ItemIndex = -1) or (spn_anoCompetencia.Value = 0) then
   begin
      MsgDlg('É necessário selecionar o Ano e Mês de Competência.','aviso', mtInformation, [mbOk, mbHelp], 0);
      cmb_mesCompretencia.SetFocus;
      Exit;
   end;

  bbtnProcessar.Enabled := False;
  bbtnDesfazer.Enabled  := False;

  desfazer();

  bbtnSair.Enabled      := True;
end;

procedure TfrmInsereRubricasINSSFolha.desfazerRubricaIndividual(sIdPessoa,
  sIdFavorecido, sIdRubrica, sIdTitular, sMesReferencia, sIDSeqDetConcINSS: String;
  fValorAcerto: Real);
var sSql,sIdEmpresa : String;
begin

  sIdEmpresa := '1';

  fValorAcerto := RoundCM(fValorAcerto,2);

  sSql :=  ' DELETE FROM RUBRICAINDIV         '
         + ' WHERE IDPESSOA  = :IDPESSOA      '  //  IDPESSOA
         + ' AND IDTITULAR = :IDTITULAR       '  //  IDTITULAR
         + ' AND IDEMPRESA = :IDEMPRESA       '  //  IDEMPRESA
         + ' AND IDRUBRICA = :IDRUBRICA       '  //  IDRUBRICA
         + ' AND IDSEQDETCONCINSS = :IDSEQDETCONCINSS '  //  IDSEQDETCONCINSS  WO13132 LEANDRO
         + ' AND VALORRUBRICA = :VALORRUBRICA '  //  VALORRUBRICA
         + ' AND ANOMESREF = :ANOMESREF       '; //  ANOMESREF

  qryAux.Sql.Text := sSql;

  qryAux.ParamByName('IDPESSOA').AsString         := sIdPessoa;
  qryAux.ParamByName('IDTITULAR').AsString        := sIdTitular;
  qryAux.ParamByName('IDEMPRESA').AsString        := sIdEmpresa;
  qryAux.ParamByName('IDRUBRICA').AsString        := sIdRubrica;
  qryAux.ParamByName('IDSEQDETCONCINSS').AsString := sIDSeqDetConcINSS; //WO13132 LEANDRO
  qryAux.ParamByName('VALORRUBRICA').AsFloat      := fValorAcerto;
  qryAux.ParamByName('ANOMESREF').AsString        := sMesReferencia;

  qryAux.ExecSQL;
end;

function TfrmInsereRubricasINSSFolha.verificaRubricaIndividualJaFoiProgramada(
  sIdPessoa, sIdFavorecido, sIdRubrica, sIdTitular, sMesReferencia, sIDSeqDetConcINSS: String; fValorAcerto: Real): Boolean;
var sSql,sIdEmpresa : String;
begin
  result := false;

  sIdEmpresa := '1';

  fValorAcerto := RoundCM(fValorAcerto,2);

  sSql :=  ' SELECT COUNT(*) AS TOTAL         '
         + ' FROM RUBRICAINDIV                '
         + ' WHERE IDPESSOA  = :IDPESSOA      '  //  IDPESSOA
         + ' AND IDTITULAR = :IDTITULAR       '  //  IDTITULAR
         + ' AND IDEMPRESA = :IDEMPRESA       '  //  IDEMPRESA
         + ' AND IDRUBRICA = :IDRUBRICA       '  //  IDRUBRICA
         + ' AND IDSEQDETCONCINSS = :IDSEQDETCONCINSS '  //  IDRUBRICA  // WO13132 leandro
         + ' AND VALORRUBRICA = :VALORRUBRICA '  //  VALORRUBRICA
         + ' AND ANOMESREF = :ANOMESREF       '; //  ANOMESREF

  qryAux.Sql.Text := sSql;

  qryAux.ParamByName('IDPESSOA').AsString         := sIdPessoa;
  qryAux.ParamByName('IDTITULAR').AsString        := sIdTitular;
  qryAux.ParamByName('IDEMPRESA').AsString        := sIdEmpresa;
  qryAux.ParamByName('IDRUBRICA').AsString        := sIdRubrica;
  qryAux.ParamByName('IDSEQDETCONCINSS').AsString := sIDSeqDetConcINSS; //wo13132 leandro
  qryAux.ParamByName('VALORRUBRICA').AsFloat      := fValorAcerto;
  qryAux.ParamByName('ANOMESREF').AsString        := sMesReferencia;

  qryAux.Open;

  if not qryAux.IsEmpty then
   result := (qryAux.FieldbyName('TOTAL').AsInteger > 0);

  qryAux.Close;

end;

procedure TfrmInsereRubricasINSSFolha.iniciarTela;
var iMesAtual, iAnoAtual: Integer;
begin
  iMesAtual                     := retornaMesAutal();
  iAnoAtual                     := retornaAnoAutal;

  cmb_mesCompretencia.ItemIndex := iMesAtual-1;
  spn_anoCompetencia.Value      := iAnoAtual;

  consultarRubricas();

  dbgrdLista.Visible  := False;
  dbgrdLista.Color    := clBtnFace;
  qryLista.Close;

  dblcRubrica.Clear;

  bbtnDesfazer.Enabled  := False;
  bbtnProcessar.Enabled := False;
  bbtnSair.Enabled      := True;
  bbtnCancelar.Enabled  := False;

end;

procedure TfrmInsereRubricasINSSFolha.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  iniciarTela();
end;

function TfrmInsereRubricasINSSFolha.retornaNomeArquivoLog: String;
var sSql : String;
begin
  sSql :=  ' SELECT ''INSERERUBRICAS_'' || TO_CHAR(SYSDATE,''DD_MM_YYYY_HH24_MI'') || ''.TXT'' AS NOME FROM DUAL';

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('NOME').AsString
  Else
    Result := 'INSERERUBRICAS_DD_MM_AAAA_HH_MM.TXT';
    
end;

procedure TfrmInsereRubricasINSSFolha.dbgrdListaFieldChanged(
  Sender: TObject; Field: TField);
begin
  inherited;
  if (Field.FieldName = 'PROCESSAR') and ( Field.Value = '0' ) and (Field.DisplayLabel = 'Inverter~Seleção') then
   begin
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Selecionar~Todos';
    dbgrdLista.Refresh;
   end;
end;

procedure TfrmInsereRubricasINSSFolha.consultarRubricas;
var sAnoMes, sSql: String;
begin
  qryRubricas.Close;

  sAnoMes := pegaAnoMesRef(cmb_mesCompretencia,spn_anoCompetencia);

  if sAnoMes = '' then
   Exit;

  sSql :=  ' SELECT DISTINCT RUBRICAINSS, DESCRICAO, IDPROVENTO               '
        +  '   FROM (                                                         '
        +  '          SELECT D.RUBRICAINSS, P.DESCRICAO, P.IDPROVENTO         '
        +  '           FROM DETCONCINSS D, RUBRICAXINSS R, PROVDESC P         '
        +  '          WHERE D.MESCOBRANCA = :MESCOBRANCA                      '
        +  '            AND D.RUBRICAINSS = R.RUBRICAINSS                     '
        +  '            AND R.IDRUBRICA = P.IDPROVENTO                        '
        +  '            AND SUBSTR(D.RUBRICAINSS, 2, 1) NOT IN (''9'', ''3'') '
        +  '         UNION ALL                                                '
        +  '         SELECT T.CODRUBRICA1, P.DESCRICAO, P.IDPROVENTO          '
        +  '           FROM TEMPCONCINSS T, RUBRICAXINSS R, PROVDESC P        '
        +  '          WHERE T.MESPROCESSAMENTO = :MESCOBRANCA                 '
        +  '            AND T.CODRUBRICA1 = R.RUBRICAINSS                     '
        +  '            AND R.IDRUBRICA = P.IDPROVENTO                        '
        +  '            AND SUBSTR(T.CODRUBRICA1, 2, 1) NOT IN (''9'', ''3'') '
        +  '       )                                                          '
        +  ' ORDER BY 2                                                       ';

   qryRubricas.sql.Text := sSql;
   qryRubricas.ParamByName('MESCOBRANCA').AsString := sAnoMes;
   qryRubricas.Open;

end;

function TfrmInsereRubricasINSSFolha.retornaIdTitular: String;
var sSql : String;
begin

  sSql :=  ' SELECT DISTINCT IDTITULAR  '
        +  ' FROM BENEFBFCIARIO         '
        +  ' WHERE IDPESSOA   = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  ' AND NUMPROCINSS  = ' + qryLista.FieldByName('NUMPROCINSS').AsString;

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('IDTITULAR').AsString
  Else
    Result := '';

  qryAux.Close;  
    
end;

end.
