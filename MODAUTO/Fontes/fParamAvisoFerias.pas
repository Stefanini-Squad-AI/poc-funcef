// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamAvisoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, fSairAjuda,
  CMDateTimePicker;

type
  TfrmParamAvisoFerias = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    procedure HabilitaBtOk;
    procedure GravaDadosQuery;
    procedure MontaListaFuncionarios;
    function  SelecionaTipoContrato: string;
  end;

var
  frmParamAvisoFerias: TfrmParamAvisoFerias;
  sParamFerRegPessoa, sParamFerAno13, sParamFerIniGozo : String;

implementation

uses uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
  uFuncoesUteisRH, UsoGeralRH, uComumRelats, dRelatoriosModAuto;

{$R *.DFM}

procedure TfrmParamAvisoFerias.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  sCodFuncSel := sParamFerRegPessoa;
  bbtnConfirmarClick(Sender);

end;

procedure TfrmParamAvisoFerias.bbtnConfirmarClick(Sender: TObject);
begin

  // Monta Query Auxiliar
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO   AS UF,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  F.MATRICULA,F.CODCENTROCUSTO,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  C.TITULO       AS CARGO,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,'''','''',''/''||CTPS.UF) AS CTPS_UF,');
    Add('  CTPS.MASCARA    AS MASCARA_CTPS,');
    Add('  ANT13.MES, ANT13.ANO, ANT13.FLGOCORRIDA,');
    Add('  FERIAS.FLGABONO,');
    Add('  FERIAS.QTDPARCDEVOL,');
    Add('  FERIAS.INIPERIODOFERIAS,');
    Add('  FERIAS.INIGOZOFERIAS,');
    Add('  FERIAS.FIMGOZOFERIAS');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CENTCUST CC, CARGO C,');
    Add('  CIDADES, ESTADO ES, FERIAS,');
//    Add('  CIDADES, ESTADO ES, FERIAS, HORATRAB HT,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
//    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, PAIS PA');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'')       AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)  AND');
    Add('         (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = ES.IDPAIS)       AND');
//    Add('         (DP.IDPAIS          = PA.IDPAIS)       AND');
//    Add('         (PA.IDPAIS          = ES.IDPAIS)       AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // Antecipação 13
    Add('  (SELECT IDPESSOA, MES, ANO, FLGOCORRIDA ');
    Add('   FROM   ANTECIP13 ');
    Add('   WHERE (ANO =  '+sParamFerAno13+')) ANT13,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (F.IDESTAB            = PJ.IDPESSOA) AND');
    Add('  (FERIAS.FLGOCORRIDA    = 0) AND');
    Add('  (FERIAS.INIGOZOFERIAS BETWEEN TO_DATE('+QuotedStr(sParamFerIniGozo)+',''DD/MM/YYYY'') AND '+
      'TO_DATE('+QuotedStr(sParamFerIniGozo)+',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (sCodFuncSel <> '') then
    begin
      if (Pos(',',sCodFuncSel) > 0) then
        Add('  (F.IDPESSOA IN (' +sCodFuncSel+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +sCodFuncSel+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (sUsuXccusto <> '') then
      begin
        if (Pos(',',sUsuXccusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
      end;

      sAux := SelecionaTipoContrato;
      if (Pos(',',sAux) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +sAux+ ') AND');
    end;

    Add('  (FERIAS.IDPESSOA   = F.IDPESSOA)         AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA)      AND');
    Add('  (F.IDCARGO         = C.IDCARGO)          AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA)       AND');
//    Add('  (F.IDHORARIO       = HT.IDHORARIO)       AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA)        AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA)        AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA)         AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO)       AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES)     AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO)           AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+))  AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = ANT13.IDPESSOA(+))  AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))');
    //SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  with (dtmRelatoriosModAuto) do
  begin
    frmAguarde.Mostra('Aviso de Férias');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query Principal
    qryAvisoFerias.UpdateObject := updSQL;

    if not(qryAvisoFerias.IsEmpty) then
      qryAvisoFerias.CancelUpdates;
    qryAvisoFerias.Close;
    qryAvisoFerias.Open;

    // Processa dados para a geração da query
    dtmBaseDados.qry.Open;
    GravaDadosQuery;
    qryAvisoFerias.First;
  end;

end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamAvisoFerias.GravaDadosQuery;
var
  dtPerAquiFinal: TDateTime;
begin
  with (dtmRelatoriosModAuto.qryAvisoFerias) do
  begin
    if not(dtmBaseDados.qry.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := dtmBaseDados.qry.RecordCount;

      if (Trim(dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString) <> '') then
        dtmRelatoriosModAuto.AvisoFeriasDbTxt7.DisplayFormat :=
          dtmBaseDados.qry.FieldByName('MASCARA_CTPS').asString+';0;_';

      repeat
        Insert;
        FieldByName('EMPREGADO').asString        := dtmBaseDados.qry.FieldByName('EMPREGADO').asString;
        FieldByName('MATRICULA').asString        := dtmBaseDados.qry.FieldByName('MATRICULA').asString;
        FieldByName('C_CUSTO').asString          := dtmBaseDados.qry.FieldByName('C_CUSTO').asString;
        FieldByName('CARGO').asString            := dtmBaseDados.qry.FieldByName('CARGO').asString;
        FieldByName('EMPRESA').asString          := dtmBaseDados.qry.FieldByName('EMPRESA').asString;
        FieldByName('CGC').asString              := dtmBaseDados.qry.FieldByName('CGC').asString;
        FieldByName('INSCRICAO').asString        := dtmBaseDados.qry.FieldByName('ESTADUALMUNICIPAL').asString;
        FieldByName('ENDERECO').asString         := dtmBaseDados.qry.FieldByName('ENDERECO').asString;
        FieldByName('UF').asString               := dtmBaseDados.qry.FieldByName('UF').asString;
        FieldByName('INIPERIODOFERIAS').asString := dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString;
        FieldByName('QTDPARCDEVOL').asInteger    := dtmBaseDados.qry.FieldByName('QTDPARCDEVOL').asInteger;

        if dtmBaseDados.qry.FieldByName('ANO').asInteger > 0 then
           FieldByName('ANTECIPACAO13').asString :=
              LongMonthNames[dtmBaseDados.qry.FieldByName('MES').asInteger] + ' de ' +
              dtmBaseDados.qry.FieldByName('ANO').asString +
              iff(dtmBaseDados.qry.FieldByName('FLGOCORRIDA').asInteger=1,' (Já Concedida)',' ')
        else
          FieldByName('ANTECIPACAO13').asString := 'Não Programada';

        dtPerAquiFinal := StrToDate(IncData(dtmBaseDados.qry.FieldByName('INIPERIODOFERIAS').asString,0,0,1))-1;
        if (dtPerAquiFinal >= dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime) then
          FieldByName('FIMPERIODOFERIAS').asString :=
            DateToStr(dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asDateTime-1)
        else
          FieldByName('FIMPERIODOFERIAS').asString := DateToStr(dtPerAquiFinal);

        FieldByName('INIGOZOFERIAS').asString := dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').asString;
        FieldByName('FIMGOZOFERIAS').asString := dtmBaseDados.qry.FieldByName('FIMGOZOFERIAS').asString;
        FieldByName('DIASDEFERIAS').asInteger :=
          (dtmBaseDados.qry.FieldByName('FIMGOZOFERIAS').Value -
           dtmBaseDados.qry.FieldByName('INIGOZOFERIAS').Value + 1);
        FieldByName('FLGABONO').asInteger     := dtmBaseDados.qry.FieldByName('FLGABONO').asInteger;
        FieldByName('CTPS_NUM').asString      := dtmBaseDados.qry.FieldByName('CTPS_NUM').asString;
        FieldByName('CTPS_UF').asString       := dtmBaseDados.qry.FieldByName('CTPS_UF').asString;
        Post;

        frmAguarde.Pos := frmAguarde.Pos+1;

        dtmBaseDados.qry.Next;
      until (dtmBaseDados.qry.EOF);
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamAvisoFerias.HabilitaBtOk;
begin

end;

procedure TfrmParamAvisoFerias.MontaListaFuncionarios;
begin

end;

function TfrmParamAvisoFerias.SelecionaTipoContrato: string;
begin

end;

end.
