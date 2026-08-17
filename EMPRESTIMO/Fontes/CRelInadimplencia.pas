// *********************************************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ****************************************************************************
// *********************************************************************************************************************************
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SIG92304
//Responsável : Taffarel Sevaybriker
//Data        : 09/10/2019
//Descrição   : Relatrio exportando linhas divergentes. Criada nova procedure e tabela para geraço dos dados.
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SIG90624
//Responsável : Taffarel Sevaybriker
//Data        : 02/09/2019
//Descrição   : Erro ao executar relatório devido a quantidade de linhas. Alterada conexão para ADO.
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SIG87277
//Responsável : Taffarel Sevaybriker
//Data        : 14/06/2019
//Descrição   : Tratamento para quantidade de linhas inferior ao valor da quebra da query.
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SIG 84985
//Responsável : Darivaldo Alencar
//Data        : 25/04/2019
//Descrição   : ADO trazendo valores errados na linha, trocado para BDE dividindo a consulta.
//             OBS: Removido rotinas desnecessária(Pas + DFM) e excesso de comentários
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SIG Tibero
//Responsável : Everson Cunha
//Data        : 03/11/2018
//Descrição   : Ajuste no order by da query qryConsulta
//              Estava trazendo invertido no relatório
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SIG 64041
//Responsável : Darivaldo Alencar
//Data        : 18/07/2018
//Descrição   : Query que monta o relatório com problema de conversão de data.
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SOL 262857 PPM 1105289
//Responsável : William Moreira da Silva
//Data        : 19/10/2015
//Descrição   : Alterar queries para busca e montagem do relatório.
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SOL 251168 PPM 756592
//Responsável : William Moreira da Silva
//Data        : 14/05/2015
//Descrição   : Ajustes na exportação do relatorio para Excel.
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SOL 217803/16282 PPM 422190
//Responsável : William Moreira da Silva
//Data        : 18/07/2014
//Descrição   : Ajustes na exportação do relatorio para Excel.
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SOL 217803/16162 PPM 422190
//Responsável : William Moreira da Silva
//Data        : 25/06/2014
//Descrição   : Ajustes no relatório, (.DFM)
//----------------------------------------------------------------------------------------------------------------------------------
//Pendência   : SOL 226184 KINTANA 2063621
//Responsável : Marcio Sanches Spinosa SOL 226184 PPM 2063621
//Data        : 04/04/2014
//Descrição   : Ajuste no retorno da regra.
//----------------------------------------------------------------------------------------------------------------------------------

unit CRelInadimplencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, UMensErro, wwdbdatetimepicker, Db,
  DBTables, Wwquery, Wwdatsrc, CmParamReport, ShellAPI, DBCtrls, ppModule,
  daDataModule, raCodMod, DBClient, uCMClientDataSet, uSistema,UAutorizacao,
  ADODB, uCMFileUtils;

type
  TfrmCRelInadimplencia = class(TfrmOkCancelar)
    Label2: TLabel;
    Label1: TLabel;
    edtDcoumento: TEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    edtIdContrato: TEdit;
    edtMatricula: TEdit;
    GroupBox1: TGroupBox;
    dtDataLimite: TwwDBDateTimePicker;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ckbFlgConsiderarContratoad: TCheckBox;
    MontaSelect: TMontaSelect;
    qryConsulta: TADOQuery; //TAES - SIG90624
    ckbGerarRelExcel: TCheckBox;
    qryAUX1: TADOQuery; //TAES - SIG90624
    ADOConnection1: TADOConnection;
    qryAux: TwwQuery; //SIG92304
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
     procedure AbrirExcel(pUrl: String);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure edtIdContratoKeyPress(Sender: TObject; var Key: Char);
    procedure ADOConnection1AfterConnect(Sender: TObject);

  private
    iTotalLinha: Integer;
    sIdBenef : String;
    function ChecaForm(): Integer;

    procedure geraRelatorio(iIdForm:integer);
    function  getPathRelatorio: String;
    function  GeraConsulta(iIdForm, iIdConsulta: Integer): String;   //MIGRACAO-ORACLE
    { Private declarations }
  public
    { Public declarations }
    function QueryConsulta(pQry: TADOQuery; bOpen: boolean; iIdForm, iIdConsulta: Integer): String; overload; //TAES - SIG90624
    function QueryConsulta(pQry: TwwQuery; bOpen: boolean; iIdForm, iIdConsulta: Integer): String;  overload; //MIGRACAO-ORACLE
    function QtdeLinhasRelatorio(iIdForm: Integer): Integer;
  published
    property PathRelatorio: String read getPathRelatorio;
  end;

var
  frmCRelInadimplencia: TfrmCRelInadimplencia;

implementation

uses  UFuncoesEmptmo, fAguarde, FProgresso;

{$R *.DFM}

procedure TfrmCRelInadimplencia.btnBuscaContratoClick(Sender: TObject);
begin
  //inherited;
  MontaSelect.Executar();

  if MontaSelect.RetornouValor then
    begin
      edtIdContrato.Text := MontaSelect.ValoresChave[0];
      edtMatricula.Text  := MontaSelect.ValoresChave[1];
      edtDcoumento.Text  := MontaSelect.ValoresChave[2];
      sIdBenef           := MontaSelect.ValoresChave[3];
    end;
end;

procedure TfrmCRelInadimplencia.bbtnConfirmarClick(Sender: TObject);
var
   sContratoad :string ;
   iIdForm :Integer;
   xSPPrenncheRelatorio: TStoredProc;
   bNovo: Boolean;
begin
  inherited;
  if(dtDataLimite.Text = EmptyStr)then
  begin
      MsgDlg('É necessário informar a Data Limite.', 'Empréstimo', mtWarning, [mbOk], 0);
      dtDataLimite.SetFocus;
      Exit;
  end;

  if(dtDataLimite.Date > Date)then
  begin
      MsgDlg('A Data limite não pode ser superior que a data atual.', 'Empréstimo', mtWarning, [mbOk], 0);
      dtDataLimite.SetFocus;
      Exit;
  end;

  if(ckbFlgConsiderarContratoad.Checked)then
    sContratoad := 'S'
  else
    sContratoad := '-1';

  iIdForm :=  ChecaForm();

  iTotalLinha:=  QtdeLinhasRelatorio(iIdForm);

  bNovo := True;
  if  (iTotalLinha > 0) then begin
    bNovo := (MsgDlg('Existe um relatório gerado com as datas informadas.'+#13+
                     'Deseja gerar um novo relatório? ', 'Informação',
                      mtInformation, [mbYes, mbNo], 0) = mrYes);
  end;

  if (bNovo) then begin
    frmAguarde.Mostra('Configurando Relatório ...');
    try
      xSPPrenncheRelatorio := TStoredProc.Create(Application);
      xSPPrenncheRelatorio.DatabaseName   := 'BaseDados';
      xSPPrenncheRelatorio.StoredProcName := 'CM.PR_RELINADIMPLENTESNOVO'; //TAES - SIG92304

      xSPPrenncheRelatorio.Params.CreateParam(ftDate,    'pDATALIMITE',       ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString,  'PIDBENEF',          ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString,  'PIDCONTRATOEMPTMO', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString,  'PCODDOCUMENTO',     ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString,  'PCONTRATOAD',       ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString,  'PNOMERELATORIO',    ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'PIDFORM',           ptinput);

      xSPPrenncheRelatorio.parambyName('pDATALIMITE').AsDateTime     := dtDataLimite.DateTime;

      if Trim(sIdBenef) = '' then
        xSPPrenncheRelatorio.parambyName('PIDBENEF').AsString := '-1'
      else
        xSPPrenncheRelatorio.parambyName('PIDBENEF').AsString := sIdBenef;

      if Trim(edtIdContrato.Text) = '' then
        xSPPrenncheRelatorio.parambyName('PIDCONTRATOEMPTMO').AsString := '-1'
      else
        xSPPrenncheRelatorio.parambyName('PIDCONTRATOEMPTMO').AsString := edtIdContrato.Text;

      if Trim(edtDcoumento.Text) = '' then
        xSPPrenncheRelatorio.parambyName('PCODDOCUMENTO').AsString := '-1'
      else
        xSPPrenncheRelatorio.parambyName('PCODDOCUMENTO').AsString := edtDcoumento.Text;

      xSPPrenncheRelatorio.parambyName('PCONTRATOAD').AsString       := sContratoad;
      xSPPrenncheRelatorio.parambyName('PNOMERELATORIO').AsString    := 'Relatório Busca Inadimplentes';
      xSPPrenncheRelatorio.parambyName('PIDFORM').AsInteger          := iIdForm;
      xSPPrenncheRelatorio.Prepare;
      xSPPrenncheRelatorio.ExecProc;

    finally
      xSPPrenncheRelatorio.Close;
      FreeAndNil(xSPPrenncheRelatorio);
    end;
  end;

  frmAguarde.Apaga;

  iTotalLinha:=  QtdeLinhasRelatorio(iIdForm); //Taffarel - SIG87277

  if (iTotalLinha <= 0) then begin
    MsgDlg('Não existem relatórios referentes ao período selecionado! ','Erro',mtError,[mbOk],0);
    Self.ModalResult := mrNone;
    Exit;
  end else begin
    geraRelatorio(iIdForm);

    if (ckbGerarRelExcel.Checked) then begin
        AbrirExcel(PathRelatorio);
    end;
  end
end;
function TfrmCRelInadimplencia.ChecaForm: Integer;
begin
  try
    //QueryConsulta(qryAUX, true, -1, -1, -1, 3);   //MIGRACAO-ORACLE
    QueryConsulta(qryAUX, true, -1, 3);             //MIGRACAO-ORACLE
    Result := qryAUX.FieldByName('IDFORM').AsInteger;
  except on e: exception do
     raise exception.create('Erro ao buscar IDFORM ' + e.message);
  end;
end;

procedure TfrmCRelInadimplencia.AbrirExcel(pUrl: String);
var
  vBuffer: String;
begin
  vBuffer := pUrl;
  if (Trim(vBuffer) <> EmptyStr) then begin
    ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
  end;

end;

procedure TfrmCRelInadimplencia.btnLimpaContratoClick(Sender: TObject);
begin
  inherited;
  edtDcoumento.Clear;
  edtIdContrato.Clear;
  edtMatricula.Clear;
  sIdBenef := EmptyStr;
end;

procedure TfrmCRelInadimplencia.FormCreate(Sender: TObject);
var
  Autorizacao: TAutorizacao; //TAES - SIG90624
begin
  inherited;
  Autorizacao:= TAutorizacao.create; //TAES - SIG90624
  ADOConnection1.ConnectionString:= Autorizacao.getStringConexaoADO; //TAES - SIG90624
  ckbGerarRelExcel.Checked := True;
  Autorizacao.Free; //TAES - SIG90624
end;

procedure TfrmCRelInadimplencia.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
//Gambiarra para nao trazer documentos quando pesquisado por contrato ou matricula
 sqlText := StringReplace(sqlText,'H.CODDOCUMENTO','max(H.CODDOCUMENTO)',[rfReplaceAll]);
 sqlText := StringReplace(sqlText,'max(H.CODDOCUMENTO) IS NOT NULL','H.CODDOCUMENTO IS NOT NULL',[rfReplaceAll]);
 sqlText := StringReplace(sqlText,'ORDER BY','group by C.IDCONTRATOEMPTMO, D.MATRICULA ,C.IDBENEF ORDER BY ',[rfReplaceAll]);

end;

procedure TfrmCRelInadimplencia.edtIdContratoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCRelInadimplencia.geraRelatorio(iIdForm: integer);
const iQuebraQry = 150000;
var
  arq: textFile;
  iPos, i, iQtdeQry, iQtdeIni: integer;
begin
    try
     AssignFile(arq, PathRelatorio);
     ReWrite(arq);

     iPos := 0;
     frmProgresso.MostraFormProgresso('Gerando arquivo...',
                                      True,
                                      True,
                                      True,
                                      iPos,
                                      iTotalLinha,
                                     );
      iQtdeIni:= 1;

      //TAES - SIG90624 - início
      //SIG87277 - início
      //if (iTotalLinha > iQuebraQry) then
      //   iQtdeQry:= iTotalLinha div iQuebraQry
      //else
      //   iQtdeQry:= 1;
      //SIG87277 - fim

      //for i:= 1 to iQtdeQry do
      //  begin
      //    if (i <> iQtdeQry) then
      //       QueryConsulta(qryConsulta, True, iIdForm, iQtdeIni , (i * iQuebraQry), 1)
      //    else
      //       QueryConsulta(qryConsulta, True, iIdForm, iQtdeIni , iTotalLinha, 1);

      //TAES - SIG92304 - inicio
      Writeln(arq, 'TIPO' + ';' +
                   'CONTRATO' + ';' +
                   'MATRICULA' + ';' +
                   'NOME' + ';' +
                   'CPF' + ';' +
                   'MODALIDADE' + ';' +
                   'SITUACAO' + ';' +
                   'PLANOCONTABIL' + ';' +
                   'PATROCINADORA' + ';' +
                   'PRAZO' + ';' +
                   'TXJUROS' + ';' +
                   'DATA_CONTRATACAO' + ';' +
                   'SUSPENSAO' + ';' +
                   'NUM_PARCELA' + ';' +
                   'PRAZO_REMANESCENTE' + ';' +
                   'QUANT_DIAS_ATRASO' + ';' +
                   'DATA_PREVISTA' + ';' +
                   'ITEM' + ';' +
                   'VALOR_VENCIDO' + ';' +
                   'CORR_MONET' + ';' +
                   'MULTA' + ';' +
                   'JUROS_MORA' + ';' +
                   'JUROS_REM' + ';' +
                   'IOF_COMPLEMENTAR' + ';' +
                   'TOTAL_INAD' + ';' +
                   'SALDO_DEVEDOR' + ';' +
                   'DATAFALECIMENTO' + ';' +
                   'FORMA_COBRANCA');
      //TAES - SIG92304 - fim

      //QueryConsulta(qryConsulta, true, iIdForm, -1, -1, 1);   //MIGRACAO-ORACLE
      QueryConsulta(qryConsulta, true, iIdForm, 1);             //MIGRACAO-ORACLE

      qryConsulta.First;
      while not qryConsulta.Eof do
      begin
        //TAES - SIG92304 - inicio
         Writeln(arq, qryConsulta.FieldByName('TIPO').AsString + ';' +
                      qryConsulta.FieldByName('IDCONTRATO').AsString + ';' +
                      qryConsulta.FieldByName('MATRICULA').AsString + ';' +
                      qryConsulta.FieldByName('NOME').AsString + ';' +
                      qryConsulta.FieldByName('CPF').AsString + ';' +
                      qryConsulta.FieldByName('MODALIDADE').AsString + ';' +
                      qryConsulta.FieldByName('SITUACAO').AsString + ';' +
                      qryConsulta.FieldByName('PLANOCONTABIL').AsString + ';' +
                      qryConsulta.FieldByName('PATRO').AsString + ';' +
                      qryConsulta.FieldByName('PRAZO').AsString + ';' +
                      qryConsulta.FieldByName('JUROS').AsString + ';' +
                      qryConsulta.FieldByName('DATAASSINATURA').AsString + ';' +
                      qryConsulta.FieldByName('TIPOSUSPENSAO').AsString + ';' +
                      qryConsulta.FieldByName('PARCELA').AsString + ';' +
                      qryConsulta.FieldByName('NUMPARCELAS').AsString + ';' +
                      qryConsulta.FieldByName('DIASATRASO').AsString + ';' +
                      qryConsulta.FieldByName('DATAPREVISTA').AsString + ';' +
                      qryConsulta.FieldByName('ITEM').AsString + ';' +
                      qryConsulta.FieldByName('VALORPARCELA').AsString + ';' +
                      qryConsulta.FieldByName('CORRECAOMONETARIA').AsString + ';' +
                      qryConsulta.FieldByName('MULTA').AsString + ';' +
                      qryConsulta.FieldByName('JUROSMORA').AsString + ';' +
                      qryConsulta.FieldByName('JUROSREM').AsString + ';' +
                      qryConsulta.FieldByName('IOF').AsString + ';' +
                      qryConsulta.FieldByName('VALORPARCCORRIGIDA').AsString + ';' +
                      qryConsulta.FieldByName('SALDODEV').AsString + ';' +
                      qryConsulta.FieldByName('DATAMORTE').AsString + ';' +
                      qryConsulta.FieldByName('FORMACOBRA').AsString
         );
         //TAES - SIG92304 - fim
         if (iPos mod 100 = 0) then
            frmProgresso.AndaFormProgresso(iPos);

         qryConsulta.next;
         inc(iPos);
      end;

         // iQtdeIni:= iQtdeIni + iQuebraQry;
        //end;
      //TAES - SIG90624 - fim
    finally
      EscondeFormProgresso;
      CloseFile(arq);
    end;
end;


//MIGRACAO-ORACLE : inicio
function TfrmCRelInadimplencia.GeraConsulta(iIdForm, iIdConsulta: Integer): String;
var sSQL: String;
begin
  case iIdConsulta of
    //TAES - SIG92304 - inicio
    1: sSQL:= ' SELECT  TIPO, IDCONTRATO, MATRICULA, NOME, CPF, MODALIDADE, SITUACAO, PLANOCONTABIL, PATRO, PRAZO, JUROS, DATAASSINATURA, ' +
              ' TIPOSUSPENSAO, PARCELA, NUMPARCELAS, DIASATRASO, DATAPREVISTA, ITEM, VALORPARCELA, CORRECAOMONETARIA, MULTA, ' +
              ' JUROSMORA, JUROSREM, IOF, VALORPARCCORRIGIDA, SALDODEV, DATAMORTE, FORMACOBRA ' +
//              '   SUBSTR(TEXTO, INSTR(texto, '';'', 1, 2)+1, INSTR(texto, '';'', 1, 3) - INSTR(texto, '';'', 1, 2) - 1) AS Matricula,'+
//              '   SUBSTR(TEXTO, INSTR(texto, '';'', 1, 1)+1, INSTR(texto, '';'', 1, 2) - INSTR(texto, '';'', 1, 1) - 1) AS NumeroContrato,   '+
//              '   SUBSTR(TEXTO, 0, INSTR(texto, '';'', 1, 1)-1) AS Tipo,   '+
//              '   DECODE(SUBSTR(TEXTO, INSTR(texto, '';'', 1, 14)+1, INSTR(texto, '';'', 1, 15) - INSTR(texto, '';'', 1, 14) - 1), ''PRAZO_REMANESCENTE'', 0,   '+
//              '   TO_NUMBER(SUBSTR(TEXTO, INSTR(texto, '';'', 1, 14)+1, INSTR(texto, '';'', 1, 15) - INSTR(texto, '';'', 1, 14) - 1))) AS NumParcela,   '+
//              '   CODRELATORIO, '+
//              '   NOMERELATORIO, '+
//              '   TEXTO, '+
//              '   REFERENCIA '+
              ' FROM CM.RELESPECIALEMPTMONOVO'+
    //TAES - SIG92304 - fim
              '  WHERE CODRELATORIO = ' + IntToStr(iIdForm) +
              '   AND ((REFERENCIA) = TO_CHAR('+QuotedStr(FormatDateTime('dd/mm/yy', dtDataLimite.Date))+')' +
              '    OR (REFERENCIA) = TO_CHAR('+QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataLimite.Date))+')) '+
              //'   AND ROWNUM BETWEEN ' + IntToStr(iRowsIni) + ' AND ' +  IntToStr(iRowsFim) + //TAES - SIG90624
              ' ORDER BY TIPO desc,  NUMPARCELAS';   //Everson Cunha - SIG Tibero - 03/11/2018

    2: sSQL:= ' SELECT '+
              '    COUNT(1) AS LINHAS '+
              ' FROM cm.RELESPECIALEMPTMONOVO '+
              'WHERE  '+
              '  CODRELATORIO = ' + IntToStr(iIdForm)+
              '  AND ((REFERENCIA) = TO_CHAR('+QuotedStr(FormatDateTime('dd/mm/yy', dtDataLimite.Date))+')'+
              '  OR (REFERENCIA) = TO_CHAR('+QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataLimite.Date))+')) ';

    3: sSQL:= ' SELECT IDFORM FROM FORM WHERE NOMEFORM = ' + QuotedStr('frmCRelInadimplencia');
  end;
  Result := sSQL;
end;


function TfrmCRelInadimplencia.QueryConsulta(pQry: TwwQuery; bOpen: boolean; iIdForm, iIdConsulta: Integer): String;    //MIGRACAO-ORACLE
var sSQL: String;
begin
  sSQL := GeraConsulta(iIdForm, iIdConsulta);      //MIGRACAO-ORACLE

  if (bOpen) then
    begin
      CMDebugToFile(sSQL);
      pQry.Close;
      pQry.SQL.Clear;
      pQry.Sql.Add(sSQL);
      try
         pQry.Open;
      except on e:exception do
         CMDebugToFile('Erro aqui: ' + e.message);
      end;
    end;
end;


function TfrmCRelInadimplencia.QueryConsulta(pQry: TADOQuery; bOpen: boolean; iIdForm, iIdConsulta: Integer): String;    //MIGRACAO-ORACLE
var sSQL: String;
begin
  sSQL := GeraConsulta(iIdForm, iIdConsulta);      //MIGRACAO-ORACLE

  if (bOpen) then
    begin
      CMDebugToFile(sSQL);
      pQry.Close;
      pQry.SQL.Clear;
      pQry.Sql.Add(sSQL);
      try
         pQry.Open;
      except on e:exception do
         CMDebugToFile('Erro aqui: ' + e.message);
      end;
    end;
end;


function TfrmCRelInadimplencia.QtdeLinhasRelatorio(iIdForm: Integer): Integer;
begin
  try
    //QueryConsulta(qryAUX, true, iIdForm, -1, -1, 2);    //MIGRACAO-ORACLE
    QueryConsulta(qryAUX, true, iIdForm, 2);              //MIGRACAO-ORACLE
    result:= qryAUX.FieldByName('LINHAS').AsInteger;
  except on e: exception do
    begin
      raise exception.create(e.message);
      result:= 0;
    end;
  end
end;

function TfrmCRelInadimplencia.getPathRelatorio: String;
begin
   result:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\Relatorio_Inadimplência.csv';
end;

//TAES - SIG92304 - inicio
procedure TfrmCRelInadimplencia.ADOConnection1AfterConnect(
  Sender: TObject);
begin
  inherited;
//qADOSessao.close;
//  qADOSessao.sql.text:= 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ''.,'' ';
//  qADOSessao.ExecSQL;
//
//  qADOSessao.close;
//  //qADOSessao.sql.text:=  'ALTER SESSION SET NLS_LANGUAGE  = ''BRAZILIAN PORTUGUESE'' ';
//  qADOSessao.sql.text:= 'ALTER SESSION SET NLS_DATE_FORMAT   = ''DD/MM/YYYY HH24:MI:SS'' ';
//  qADOSessao.ExecSQL;
end;
//TAES - SIG92304 - fim

end.
