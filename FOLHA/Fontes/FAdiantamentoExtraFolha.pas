{
--------------------------------------------------------------------------------------------------
Pendência   : WO38935
Responsável : leandro
Data        : 25/05/2026
Descrição   : Ajuste informação combo lote
---------------------------------------------------------------------------------------------------
Rotina      :
Pendência   : WO11050
Responsável : edilaine
Data        : 04/06/2024
Descrição   : Ajuste na Conta Contabil
---------------------------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 19/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 137263 KINTANA 828396
Responsável : BRUNO AZEVEDO
Data        : 14/12/2010
Descrição   : Implementação da funcionalidade "Insere Adiantamento Extra Folha".
---------------------------------------------------------------------------------------------------
}
unit FAdiantamentoExtraFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Spin, DBCtrls, Db, DBTables, DBaseDados,
  uMensErro, wwdblook, Wwquery, uFuncoesFolha, dContabil,
  uCtrlBancoPortForma, uCtrlPadroes, uAdmPrevFB;

type
  TfrmAdiantamentoExtraFolha = class(TfrmOkCancelar)
    Bevel1: TBevel;
    Label1: TLabel;
    btnAbreArqEnt: TSpeedButton;
    Bevel2: TBevel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label4: TLabel;
    Bevel4: TBevel;
    Label2: TLabel;
    Bevel6: TBevel;
    Label7: TLabel;
    Bevel7: TBevel;
    lblStatus: TLabel;
    txArqEnt: TEdit;
    DbcLote: TDBLookupComboBox;
    DbcMes: TDBLookupComboBox;
    SpdAno: TSpinEdit;
    EdtDataPagamento: TEdit;
    DbcMesReferencia: TDBLookupComboBox;
    SpdAnoReferencia: TSpinEdit;
    mmObs: TMemo;
    EdtValor: TEdit;
    ChkUsaValorArquivo: TCheckBox;
    pbBarraProg: TProgressBar;
    dtsMes: TDataSource;
    qryMes: TQuery;
    qryMesReferencia: TQuery;
    dtsMesReferencia: TDataSource;
    dtsLote: TDataSource;
    qryLote: TQuery;
    qryAuxiliar: TQuery;
    qryPrincipal: TQuery;
    dlgAbreArq: TOpenDialog;
    Label5: TLabel;
    Bevel5: TBevel;
    lbl: TLabel;
    dbcboRubrica: TwwDBLookupCombo;
    qryRubrica: TwwQuery;
    Bevel8: TBevel;
    Label6: TLabel;
    cboPortadorForma: TwwDBLookupCombo;
    qryPortadorForma: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DbcMesClick(Sender: TObject);
    procedure SpdAnoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DbcLoteClick(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
    procedure ChkUsaValorArquivoClick(Sender: TObject);
    procedure btnAbreArqEntClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function  NumeroNatural(sNumero: string): boolean;
    function  ConverteParaNumero(sNumero: string): string;
    procedure FiltraLote();
    procedure HabilitaDesabilitaCampos(Status : boolean);
    function  PreencheCarac(Caracter:string;Quantidade:integer): string;
    procedure ProcessaArquivo();
  public
    { Public declarations }
    ctrlBCP: TCtrlBancoPortForma; //wo38935 Leandro
  end;

var
  frmAdiantamentoExtraFolha: TfrmAdiantamentoExtraFolha;
  vNumLinhaAtual, iContGrid: integer;
  arqSaidaLogErro: TextFile;
  sDataInicio, sDataFim, sRefInicio, sRefFim: string;
  dTotalGeral : double;

implementation

{$R *.DFM}

//edilaine WO11050 : inicio
function iif(condicao : boolean; sTrue, sFalse : string) : string;     overload;
begin
  if condicao then result := sTrue
              else result := sFalse;
end;

function iif(condicao : boolean; iTrue, iFalse : integer) : integer;   overload;
begin
  if condicao then result := iTrue
              else result := iFalse;
end;
//edilaine WO11050 : fim

function TfrmAdiantamentoExtraFolha.NumeroNatural(sNumero: string): boolean;
var
  i: integer;
begin
  result := false;

  for i := 1 to length(sNumero) do begin
    if ((Copy(sNumero,i,1) < '0') or (Copy(sNumero,i,1)  > '9')) then begin
      exit;
    end;
  end;
  result := true;
end;

function TfrmAdiantamentoExtraFolha.ConverteParaNumero(sNumero: string):string;
var
  i: integer;
  sAux : string;
begin
  for i:= 1 to Length(sNumero) do begin
    if (sNumero[i] <> '.') and (sNumero[i] <> ',') then begin
      sAux := sAux + sNumero[i];
    end;
  end;

  ConverteParaNumero := sAux;
end;

procedure TfrmAdiantamentoExtraFolha.FiltraLote();
var
  vChave: variant;
  sSql: string;
begin
  vChave := DbcMes.KeyValue;
  vChave := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChave + '''';

  sSql := '';
  //sSql := 'SELECT IDLOTE, (trim(to_char(IDLOTE)) || '' - '' || DESCRICAO) DESCRICAO, DATAPAGAMENTO ' +                         //WO38935 Leandro
  sSql := 'SELECT IDLOTE, CAST((trim(to_char(IDLOTE)) || '' - '' || DESCRICAO) AS VARCHAR2(200)) AS DESCRICAO, DATAPAGAMENTO ' + //WO38935 Leandro
          'FROM CTRLINTERFACE ' +
          'WHERE (MESREFERENCIA = ' + vChave + ') ' +
          'AND (TIPO = ' + '''' + 'B' + '''' + ') ' +
          'AND (IDPESSOA = 1) ' +
          'AND (FLGIDATMP = 1) ' +
          'AND (FLGVOLTATMP = 0) ' +
          'AND (FLGTIPOFOLHA = 2) ';

  QryLote.Close;
  QryLote.SQL.Text := sSql;
  QryLote.Open;

  DbcLote.Enabled := true;

  if QryLote.Eof then begin
    sSql := '';
    sSql := 'SELECT 0 as IDLOTE, ' + '''' + 'Inexistente' + '''' +
            'as DESCRICAO ' +
            'FROM dual ';

    QryLote.Close;
    QryLote.SQL.Text := sSql;
    QryLote.Open;

    DbcLote.KeyValue := 0;
    DbcLote.Font.Color := clRed;
    DbcLote.Enabled := true;
  end else begin
    DbcLote.Font.Color := clWindowText;
  end;
end;

procedure TfrmAdiantamentoExtraFolha.HabilitaDesabilitaCampos(Status : boolean);
begin
  DbcMesReferencia.Enabled := Status;
  SpdAnoReferencia.Enabled := Status;
  EdtValor.Enabled := Status;
  ChkUsaValorArquivo.Enabled := Status;
  btnAbreArqEnt.Enabled := Status;
end;

function TfrmAdiantamentoExtraFolha.PreencheCarac(Caracter:string;Quantidade:integer): string;
var
  i: integer;
  s: string;
begin
  s:= '';
  for i:= 1 to Quantidade do begin
    s:= s + Caracter;
  end;
  Result:= s;
end;

procedure TfrmAdiantamentoExtraFolha.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (txArqEnt.Text <> '') or (trim(EdtValor.Text) <> '') then begin
    if MsgDlg('Confirma tratamento do arquivo?',PChar('Insere Rubrica'), mtConfirmation,[mbYes, mbNo], 0) = mrYes then begin
      if (trim(EdtValor.Text) <> '') or (ChkUsaValorArquivo.Checked = true) then begin
        ProcessaArquivo;
      end else begin
        MsgDlg('O Valor deve ser preenchido, ou deve ser marcada a opção "Usa valor arquivo".',
                                  PChar('Insere Adiantamento'),mtInformation, [mbOk],0);
      end;
    end;
  end else begin
    MsgDlg('O nome do arquivo de entrada deve ser preenchido ou informar valor fixo.',
                           PChar('Insere Adiantamento'),mtInformation, [mbOk],0);
  end;
end;

procedure TfrmAdiantamentoExtraFolha.DbcMesClick(Sender: TObject);
begin
  inherited;
  FiltraLote();
end;

procedure TfrmAdiantamentoExtraFolha.SpdAnoChange(Sender: TObject);
begin
  inherited;
  FiltraLote();
end;

procedure TfrmAdiantamentoExtraFolha.FormCreate(Sender: TObject);
var
  sSql, sHoje, sDataI, sDataF, sDataAux, sMes : string;
  i, iCont, iContAux, iMes : integer;
begin
  inherited;
  DateSeparator := '/';
  ShortDateFormat:= 'dd/mm/yyyy';
  LongDateFormat := 'dd/mm/yyyy hh:nn:ss.zzz';
  LongTimeFormat:= 'hh:nn:ss.zzz';

  DbcMesReferencia.KeyValue := '01';
  DbcMes.KeyValue := '01';

  HabilitaDesabilitaCampos(true);
  bbtnCancelar.enabled := false;

  sSql := '';
  sSql := 'SELECT TO_char(SYSDATE, ''DD/MM/YYYY'') HOJE FROM DUAL ';

  QryAuxiliar.Close;
  QryAuxiliar.SQL.Text := sSql;
  QryAuxiliar.Open;

  if QryAuxiliar.eof then begin
    sHoje := FormatDateTime('dd/mm/yyyy', now)
  end else begin
    sHoje := QryAuxiliar.FieldValues['HOJE'];
  end;

  sDataI := '01/' + copy(sHoje, 4, 7);
  sDataF := datetostr(incmonth(strtodate(sDataI),1));

  iCont := 0;
  iContAux := 0;
  sDataAux := '';

  for i := 1 to 7 do begin
    if iCont < 3 then begin
      sDataAux := datetostr((strtodate(sDataI)+i));

      if (DayOfWeek(strtodate(sDataAux)) <> 1) and
         (DayOfWeek(strtodate(sDataAux)) <> 7) then begin
        iCont := iCont + 1
      end else begin
        iContAux := iContAux + 1;
      end;
    end;
  end;

  iCont := iCont + iContAux;
  sDataI := datetostr((strtodate(sDataI)+iCont));

  iCont := 0;
  iContAux := 0;
  sDataAux := '';

  for i := 1 to 7 do begin
    if iCont < 2 then begin
      sDataAux := datetostr((strtodate(sDataF)+i));

      if (DayOfWeek(strtodate(sDataAux)) <> 1) and
         (DayOfWeek(strtodate(sDataAux)) <> 7) then begin
         iCont := iCont + 1
      end else begin
        iContAux := iContAux + 1;
      end;
    end;
  end;

  iCont := iCont + iContAux;
  sDataF := datetostr((strtodate(sDataF)+iCont));

  if (strtodate(sHoje) >= strtodate(sDataI)) and
     (strtodate(sHoje) <= strtodate(sDataF)) then begin
    iMes := strtoint(copy(sHoje, 4,2)) + 1
  end else begin
    iMes := strtoint(copy(sHoje, 4,2)) + 2;
  end;

  if iMes < 10 then begin
    sMes := '0' + inttostr(iMes)
  end else begin
    sMes := inttostr(iMes);
  end;

  if iMes >= 13 then begin
    SpdAnoReferencia.Value := strtoint(copy(sHoje, 7,4)) + 1;
    sMes := '01';
  end;

  DbcMesReferencia.KeyValue := sMes;

  //wo38935 leandro inicio
  ctrlBCP:=tCtrlBancoPortForma.create;
  ctrlBCP.InitializeAs(Padroes);
  ctrlBCP.Inicializa(iidfundacao);
  //wo38935 leandro fim

end;

procedure TfrmAdiantamentoExtraFolha.DbcLoteClick(Sender: TObject);
begin
  inherited;
  if DbcLote.KeyValue = 0 then begin
    HabilitaDesabilitaCampos(false)
  end else begin
    HabilitaDesabilitaCampos(true);

    QryLote.First;

    while not QryLote.eof do begin
      if QryLote.FieldValues['IDLOTE'] = DbcLote.KeyValue then begin
        EdtDataPagamento.text := QryLote.FieldValues['DATAPAGAMENTO'];
      end;

      QryLote.next;
    end;
  end;
end;

procedure TfrmAdiantamentoExtraFolha.EdtValorChange(Sender: TObject);
begin
  inherited;
  ChkUsaValorArquivo.Checked := false;
  bbtnConfirmar.Enabled := true;
end;

procedure TfrmAdiantamentoExtraFolha.ChkUsaValorArquivoClick(
  Sender: TObject);
begin
  inherited;
  if ChkUsaValorArquivo.Checked = true then EdtValor.text := '';
  bbtnConfirmar.Enabled := true;
end;

procedure TfrmAdiantamentoExtraFolha.ProcessaArquivo();
var
  arqEntrada: TextFile;
  sLinha, sIdPessoa, sSql, sIdTitular, sIdProvento : string;
  iContTotal, iContReg, i: integer;
  dValor : double;
  sValor, sMatricula, sBanco, sAgencia, sConta, sSeqRubrica, sRubrica : string;
  sReferencia, sCobranca, sIdPlanoPrev, sIdPlanoOrigem, sIdPlanoContabil : string;
  sIdPerfilInvest : string; //WO38935 Leandro
  vLote, vMes, vMesCobranca : variant;
  lRefCF: TRegContFinan;                                            //edilaine WO11050
  sPLACONTA, sCODCENTROCUSTO, sTipoRecDes, sCodCRespon : string;    //edilaine WO11050
  iFlgDesconto : integer;                                           //edilaine WO11050

  liidfavorec: integer;
  lsnumbanco, lsnumagencia, lsnomeagencia,
  lsnumconta, lstipoconta, lsidcbancaria: string;
  lbpagtoelet, lbDuplContaPref: boolean;
  lrValorLiquido: real;
  liseqdoc: integer;
  lobjPortador: tObjPortadorForma;


Label
  ProcessaProximo;
begin
  try
    //Abre os arquivos de entrada e de saida conforme caminho especificado em txArqSai e txArqEnt e txArqUpd
    Screen.Cursor:= crHourGlass;

    dtmBaseDados.dbBaseDados.StartTransaction;
    AssignFile(arqEntrada, txArqEnt.Text);
    AssignFile(arqSaidaLogErro, 'SaidaLogErro.txt');

    ReSet(arqEntrada);
    iContTotal:= 0;
    mmObs.Clear;

    //Faz um loop no arquivo para ler a quantidade total de registros
    while not Eof(arqEntrada) do begin
      ReadLn(arqEntrada, sLinha);
      Inc(iContTotal);
    end;

    CloseFile(arqEntrada);
    ReSet(arqEntrada);
    rewrite(arqSaidaLogErro);

    iContReg:= 0;
    pbBarraProg.Min:= 0;
    pbBarraProg.Max:= iContTotal;
    pbBarraProg.Position:= 0;
    dValor := 0;

    mmObs.Lines.Add('Inicio do processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));

    {if RdGrArea.ItemIndex = 0 then begin
        sRubrica := '38476'
    end else begin
       sRubrica := '34371';
    end;}

    sRubrica := dbcboRubrica.LookupValue;

    //Le o arquivo de entrada linha a linha e grava no arquivo de saida
    while not Eof(arqEntrada) do begin
      ReadLn(arqEntrada, sLinha);
      //vLinhaArquivoEntrada recebe o conteudo da linha atual do arquivo de entrada, esse valor pode ser recuperado pela property LinhaArquivoEntrada

      inc(iContReg);

      if iContReg = 19 then begin
        application.ProcessMessages;
      end;

      sMatricula := trim(copy(slinha,1,7));

      if copy(sMatricula,1,1) = 'P' then begin
        sSql := '';
        sSql := sSql + ' select idpessoa, idtitular from cm.depentit ';
        sSql := sSql + ' where matricula like ';
        sSql := sSql + '''' + sMatricula + '%' + '''';
      end else begin
        sSql := '';
        sSql := sSql + ' select idpessoa, idtitular from cm.depentit ';
        sSql := sSql + ' where matricula = ';
        sSql := sSql + '''' + sMatricula +  '''';
      end;

      QryPrincipal.Close;
      QryPrincipal.Sql.text := sSql;
      QryPrincipal.Open;

      if QryPrincipal.eof then begin
        mmObs.Lines.Add('Matrícula não cadastrada: ' + sMatricula);
        QryPrincipal.Close;
        goto ProcessaProximo;
      end else begin
        if QryPrincipal.RecordCount > 1 then begin
          mmObs.Lines.Add('Matrícula com mais de uma ocorrêcia no cadastro: ' + sMatricula);
          goto ProcessaProximo;
        end else begin
          sIdpessoa := QryPrincipal.FieldValues['idpessoa'];
          sIdTitular := QryPrincipal.FieldValues['idtitular'];
        end;
      end;
      //------------------------------------------------------------------------->
      // Rotina que lê os valores e inclui na tabela de apoio
      //------------------------------------------------------------------------->

      sIdPlanoContabil := trim(copy(slinha,10,2));
      if (Trim(sIdPlanoContabil) = '') then begin
        sIdPlanoContabil := 'null';
      end;

      //WO38935 Leandro - Inicio
      //CARREGAR IDPERFILINVEST
      QryPrincipal.Close;
      QryPrincipal.Sql.Clear();
      QryPrincipal.Sql.Add('SELECT * FROM PERFILINVEST ');
      QryPrincipal.Sql.Add(' WHERE idplanprevcontab = ' + sIdPlanoContabil);
      QryPrincipal.Open;
      sIdPerfilInvest := QryPrincipal.FieldByName('IDPERFILINVEST').AsString;

      //CARREGAR IDFAVDOC
      ctrlBCP.DefinePortadorForma(StrToInt(sIdTitular), StrToInt(sIdPessoa), 1,
                                  2, 0, 0, StrToInt(cboPortadorForma.LookupValue), 0,
                                  lsnumbanco, lsnumagencia, lsnomeagencia, lsnumconta,
                                  lstipoconta, lsidcbancaria,
                                  lbpagtoelet, lbDuplContaPref, liidfavorec,
                                  lrValorLiquido,
                                  liseqdoc,
                                  lobjPortador);


      //WO38935 Leandro - Fim



      if ChkUsaValorArquivo.Checked = true then begin
        // Recupera valor da rubrica
        sValor := trim(copy(slinha,12,12));
        sValor := ConverteParaNumero(sValor);

        if NumeroNatural(sValor) then
           dValor := strtofloat(sValor)/100;

        sValor := trim(floattostr(dValor));
      end else begin
        sValor := EdtValor.Text;
        dValor := StrToFloat(sValor);    //edilaine WO11050
      end;

      for i:= 1 to Length(sValor) do begin
        if sValor[i] = ',' then begin
          sValor[i] := '.';
        end;
      end;
      vLote := DbcLote.KeyValue;

      //CARREGAR IDPROVENTO
      QryPrincipal.Close;
      QryPrincipal.Sql.Clear();
      QryPrincipal.Sql.Add('SELECT IDPROVENTO FROM PROVDESC');
      QryPrincipal.Sql.Add(' WHERE CODPROVDESC = ' + QuotedStr(dbcboRubrica.LookupValue));
      QryPrincipal.Open;
      sIdProvento := QryPrincipal.FieldByName('IDPROVENTO').AsString;

      sSql := '';
      sSql := sSql + 'UPDATE CTRLINTERFACE ';
      sSql := sSql + 'SET FLGIDATMP = 1 ';
      sSql := sSql + 'WHERE IDLOTE = ' +  inttostr(vLote);

      QryPrincipal.Close;
      QryPrincipal.Sql.text := sSql;
      QryPrincipal.ExecSQL;

      vMes := DbcMesReferencia.KeyValue;
      vMesCobranca := DbcMes.KeyValue;

      sReferencia :=  trim(inttostr(SpdAnoReferencia.Value)) + '/' + vMes;
      sCobranca :=  trim(inttostr(SpdAno.Value)) + '/' + vMesCobranca;

      // Insere adiantamento na prévia  (Líquido)
      sSql := '';
//      sSql := sSql + 'select distinct NUMBANCO, NUMAGENCIA, CONTACORRENTE, ';                                   //Everson TIBERO
      sSql := sSql + 'select distinct banco.NUMBANCO, agenciabancaria.NUMAGENCIA, contabancaria.CONTACORRENTE, '; //Everson TIBERO
//      sSql := sSql + 'IDPLANOPREV, IDPLANOORIGEM, IDPLANPREVCONTAB ';                                           //Everson TIBERO
      sSql := sSql + 'benefbfciario.IDPLANOPREV, benefbfciario.IDPLANOORIGEM, benefbfciario.IDPLANPREVCONTAB ';   //Everson TIBERO
      sSql := sSql + 'from   cm.benefbfciario, contabancaria, agenciabancaria, banco ';
      sSql := sSql + 'where  contabancaria.idpessoa  = benefbfciario.idpessoa ';
      sSql := sSql + 'and    contabancaria.IDAGENCIA = agenciabancaria.IDPESSOA ';
      sSql := sSql + 'and    agenciabancaria.IDBANCO = banco.idpessoa ';
      sSql := sSql + 'and    benefbfciario.IDTPPAGTOBENEFIC = 1 ';
      //sSql := sSql + 'and    contabancaria.FLGCONTAPREF = 1 ';
      sSql := sSql + 'and    contabancaria.tipoconta = 2 ';
      sSql := sSql + 'and    benefbfciario.idsitbeneficio = 1 ';
      sSql := sSql + 'and    benefbfciario.idpessoa = ' + sIdPessoa + ' ';
      sSql := sSql + 'and    benefbfciario.idtitular = ' + sIdTitular;
      sSql := sSql + 'and    benefbfciario.IDPLANPREVCONTAB = (select max(b.idplanprevcontab) ';
      sSql := sSql + '                                         from   benefbfciario b ';
      sSql := sSql + '                                         where  benefbfciario.idtitular = b.idtitular ';
      sSql := sSql + '                                         and    benefbfciario.idpessoa = b.idpessoa ';
      sSql := sSql + '                                         and    b.idsitbeneficio = 1) ';

      QryPrincipal.Close;
      QryPrincipal.Sql.text := sSql;
      QryPrincipal.Open;

      if QryPrincipal.Eof then begin
        sSql := '';
//        sSql := sSql + 'select distinct NUMBANCO, NUMAGENCIA, CONTACORRENTE, ';                                   //Everson TIBERO
        sSql := sSql + 'select distinct banco.NUMBANCO, agenciabancaria.NUMAGENCIA, contabancaria.CONTACORRENTE, '; //Everson TIBERO
        sSql := sSql + '74 IDPLANOPREV, 74 IDPLANOORIGEM, 75 IDPLANPREVCONTAB ';
        sSql := sSql + 'from   contabancaria, agenciabancaria, banco ';
        sSql := sSql + 'where  contabancaria.IDAGENCIA = agenciabancaria.IDPESSOA ';
        sSql := sSql + 'and    agenciabancaria.IDBANCO = banco.idpessoa ';
        //sSql := sSql + 'and    contabancaria.FLGCONTAPREF = 1 ';
        sSql := sSql + 'and    contabancaria.tipoconta = 2 ';
        sSql := sSql + 'and    contabancaria.idpessoa in (select idpessoa ';
        sSql := sSql + '                                  from pessoaparam  ';
        sSql := sSql + '                                  where idparam = 77 ';
        sSql := sSql + '                                  and pessoaparam.valor = ''S'') ';
        sSql := sSql + 'and    contabancaria.idpessoa = ' + sIdPessoa + ' ';

        QryPrincipal.Close;
        QryPrincipal.Sql.text := sSql;
        QryPrincipal.Open;
      end;

      if not QryPrincipal.Eof then begin
        sIdPlanoPrev := trim(QryPrincipal.FieldValues['IDPLANOPREV']);
        sIdPlanoOrigem := trim(QryPrincipal.FieldValues['IDPLANOORIGEM']);
        //sIdPlanoContabil := trim(QryPrincipal.FieldValues['IDPLANPREVCONTAB']);
        sBanco := trim(QryPrincipal.FieldValues['NUMBANCO']);
        sAgencia := trim(QryPrincipal.FieldValues['NUMAGENCIA']);
        sConta := trim(QryPrincipal.FieldValues['CONTACORRENTE']);
      end else begin
        // Insere log de erro
        sLinha := '';
        sLinha := 'Matricula: ' + sMatricula;
        sLinha := sLinha + chr(9) + ' - Não foi encontrado dados bancários';

        WriteLn(arqSaidaLogErro, sLinha);
        goto ProcessaProximo;
      end;

      sSeqRubrica := '1';

      sSql := '';
      sSql := sSql + 'SELECT NVL(MAX(SEQRUBRICA),0) SEQRUBRICA FROM cm.PREVIA ';
      sSql := sSql + 'WHERE IDPESSOA = ' + sIdPessoa + ' ';
      sSql := sSql + 'AND   IDPESSJUR = 1 ';
      sSql := sSql + 'AND   IDRUBRICA = ' + sIdProvento + ' ';
      sSql := sSql + 'AND   IDMOTIVO = ''3007'' ';
      sSql := sSql + 'AND   REFERENCIA = ' + '''' + inttostr(vLote) + '''';
      sSql := sSql + 'AND   MES = ' + '''' + sCobranca + '''';
      sSql := sSql + 'AND   MESCOBRANCA = ' + '''' + sCobranca + '''';

      QryPrincipal.Close;
      QryPrincipal.Sql.text := sSql;
      QryPrincipal.Open;

      if QryPrincipal.FieldValues['SEQRUBRICA'] <> 0 then begin
        sSeqRubrica := inttostr((strtoint(QryPrincipal.FieldValues['SEQRUBRICA']) + 1));
      end;


      //edilaine WO11050 : inicio
      If dtmContabil.PegaParamCF(91008,
                                 StrToInt(sIdPlanoPrev),
                                 StrToInt(sIdProvento),
                                 StrToInt(sIdPessoa),
                                 StrToInt(sIdPessoa),
                                 sCobranca, lRefCF) then
      begin
        iFlgDesconto := iif(dValor > 0, 0, 1);

        If iFlgDesconto = 0 then
        begin
          sPLACONTA       := lRefCF.PlaContaD;
          sCODCENTROCUSTO := lRefCF.CentroCustoD;
        end
        else
        begin
          sPLACONTA       := lRefCF.PlaContaC;
          sCODCENTROCUSTO := lRefCF.CentroCustoC;
        end;
        sTipoRecDes := iif(lRefCF.CodTipRecDes = '', '0110002', lRefCF.CodTipRecDes);
        sCodCRespon := iif(lRefCF.CentroRespon = '', '0403', lRefCF.CentroRespon);
      end;
      //edilaine WO11050 : fim

      sSql := '';
      sSql := sSql + 'INSERT INTO PREVIA ';
      sSql := sSql + '(NUMEROPROCESSO, IDPESSJUR, IDPATRO, IDPLANOPREV, ';
      sSql := sSql + 'IDRECEBEPGTO, IDTITULAR, IDPESSOA, IDRESPONSAVEL, IDFAVORECIDO, ';
      sSql := sSql + 'MES, MESCOBRANCA, IDBENEFICIO, CODPROVDESC, IDRUBRICA, ';
      sSql := sSql + 'IDLOTE, FLGTIPODESC, FLGDESCONTO, ';
      sSql := sSql + 'IDMOTIVO, SEQPROPOSTA, SEQRUBRICA, REFERENCIA, ';
      sSql := sSql + 'VALORPROVENTO, VALORCOTAS, VALORINFO, VALORRECEBIDO, ';
      sSql := sSql + 'CODMOEDA, IDREGRACALCULO, CODIRRFDARF, CODALTERADOR, ';
      sSql := sSql + 'DATAPAGAMENTO, FONTEPAGADORA, FLGIRRF, IDMODULO, ';
      sSql := sSql + 'FLGSRB, FLGOK, FLGCONCESSAO, FLGINDIVIDUAL, ';
      sSql := sSql + 'FLGCOMPOESALPART, FLGCOMPOESALBENEF, ORDEM, FLGPAGA, ';
      sSql := sSql + 'IDEMPRESA, RECPAG, CODTIPRECDES, CODCENTROCUSTO, ';
      sSql := sSql + 'CODCENTRORESPON, UNIDNEGOC, PLANO, PLACONTA, ';
      sSql := sSql + 'IDPLANOCONTABIL, PLACONTAC, PLACONTAD, ';
      sSql := sSql + 'CODCENTROCUSTOC, CODCENTROCUSTOD, ';
      sSql := sSql + 'CODPORTFORMA, DFLOATPAGTO, NUMPROCINSS, FLGSALFAM, ';
      sSql := sSql + 'FLGPROVISORIO, IDVERSAOESTORNO, NUMBANCO, NUMAGENCIA, ';
      sSql := sSql + 'CONTACORRENTE, IDPLANOORIGEM, FLGPENSAOALIM, PARCELAS, ';
      sSql := sSql + 'IDPERFILINVEST, IDFAVDOC , ';                                   //wo38935 Leandro
      sSql := sSql + 'TRGDTINCLUSAO, TRGUSERINCLUSAO) ';
      sSql := sSql + 'VALUES ';
      sSql := sSql + '(Null, 1, 91008, ' + sIdPlanoPrev + ', ';
      sSql := sSql + sIdPessoa + ', ' + sIdTitular + ', ' + sIdPessoa + ', ' + sIdPessoa + ', ' + sIdPessoa + ', ';
      sSql := sSql + '''' + sCobranca + '''' + ', ' + '''' + sCobranca + '''';

      {if RdGrArea.ItemIndex = 0 then begin
        sSql := sSql +  ', Null, 38476, '
      end else begin
        sSql := sSql +  ', Null, 34371, ';
      end;}

      sSql := sSql +  ', Null, '+dbcboRubrica.LookupValue+', '+sIdProvento+', ';

      //edilaine WO11050 : inicio
      //sSql := sSql + inttostr(vLote) + ', ''T'', 0, ';
      sSql := sSql + inttostr(vLote) + ', ''T'', '+IntToStr(iFlgDesconto)+', ';
      //edilaine WO11050 : fim

      sSql := sSql + '3007, 1, ' + sSeqRubrica + ', ' + inttostr(vLote) + ', ';
      sSql := sSql + sValor + ', 0, ' + sValor + ', ' + sValor + ', ';
      sSql := sSql + 'Null, Null, Null, 0, ';
      sSql := sSql + 'to_date(' + '''' + EdtDataPagamento.text + '''';
      sSql := sSql + ', ''dd/mm/yyyy'')' + ', 1, 0, 18, ';
      sSql := sSql + '0, 1, 0, 0, ';
      sSql := sSql + '0, 0, 0, 1, ';
      //edilaine WO11050 : inicio
      //sSql := sSql + '1, ''P'', ''0110002'', Null, ';
      //sSql := sSql + '''0403'', -1, Null, ''21110101'', ';
      sSql := sSql + '1, ''P'', '+QuotedStr(sTipoRecDes)+', '+QuotedStr(sCODCENTROCUSTO)+', ';
      sSql := sSql + QuotedStr(sCodCRespon)+', '+IntToStr(lRefCF.UnidNegoc)+', Null, '+QuotedStr(sPLACONTA)+', ';
      //edilaine WO11050 : fim
      sSql := sSql + sIdPlanoContabil + ', Null, Null, ';
      sSql := sSql + 'Null, Null, ';
      sSql := sSql + QuotedStr(cboPortadorForma.LookupValue)+', 0, Null, Null, ';
      sSql := sSql + 'Null, Null, ' + sBanco + ', ' + sAgencia  + ', ';
      sSql := sSql + sConta + ', ' + sIdPlanoOrigem + ', 0, Null, ';
      sSql := sSql + sIdPerfilInvest +', ';                            //wo38935 leandro
      sSql := sSql + IntToStr(liidfavorec) + ', ';                     //wo38935 leandro
      sSql := sSql + 'sysdate, ';
      sSql := sSql + 'user )';

      QryPrincipal.Close;
      QryPrincipal.Sql.text := sSql;
      QryPrincipal.ExecSQL;

    ProcessaProximo:
      //vNumLinhaAtual recebe o valor do contador de registor, essa informação pode ser lida pela property NumLinhaAtual
      vNumLinhaAtual:= iContReg;

      pbBarraProg.Position:= iContReg;
      lblStatus.Caption:= 'Lendo registro ' + IntToStr(iContReg) + ' de ' + IntToStr(iContTotal);
      pbBarraProg.Refresh;
      lblStatus.Refresh;
      Application.ProcessMessages;
    end;

    if MsgDlg('Confirma Processamento?','Insere Adiantamento Extra Folha', mtConfirmation,[mbYes, mbNo], 0) = mrYes then begin
      dtmBaseDados.dbBaseDados.Commit;
    end else begin
      dtmBaseDados.dbBaseDados.Rollback;
    end;

    //Fecha os arquivos
    mmObs.Lines.Add('Término do processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));

    CloseFile(arqEntrada);
    CloseFile(arqSaidaLogErro);

    MsgDlg('Operação concluída com sucesso.',PChar(Application.Title),mtInformation,[mbOk], 0);

    //Seta o ambiente para o estado original
    vNumLinhaAtual:= 0;
    //vLinhaArquivoEntrada:= '';
    pbBarraProg.Position:= pbBarraProg.Min;
    lblStatus.Caption:= '';
    Screen.Cursor:= crDefault;
  except
    //Se houver erro e mostrado uma mensagem e tenta fechar os arquivos.
    on E: Exception do begin
      MsgDlg(PChar('Não foi possível concluir a operação.' + #10#13 + E.Message),
                             PChar(Application.Title), mtError,[mbOk], 0);
      try
        CloseFile(arqEntrada);
        CloseFile(arqSaidaLogErro);
      finally
        vNumLinhaAtual:= 0;
        pbBarraProg.Position:= pbBarraProg.Min;
        lblStatus.Caption:= '';
        Screen.Cursor:= crDefault;
      end;
    end;
  end;
end;

procedure TfrmAdiantamentoExtraFolha.btnAbreArqEntClick(Sender: TObject);
begin
  inherited;
  if dlgAbreArq.Execute then begin
    txArqEnt.Text:= dlgAbreArq.FileName;
  end;
end;

procedure TfrmAdiantamentoExtraFolha.FormShow(Sender: TObject);
begin
  inherited;
  qryMes.Open;
  qryMesReferencia.Open;
  qryRubrica.Open;
  qryPortadorForma.Open;
end;

procedure TfrmAdiantamentoExtraFolha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (dtmBaseDados.dbBaseDados.InTransaction) then begin
    dtmBaseDados.dbBaseDados.Rollback;
  end;

  ctrlBCP.free; //wo38935 leandro

end;

end.
