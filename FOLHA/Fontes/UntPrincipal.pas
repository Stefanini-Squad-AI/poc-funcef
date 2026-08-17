unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, Db, DBTables, ADODB, {Funcoes,}
  DBCtrls, Mask, Wwquery;

type
  TfrmPrincipalRubricaIndiv = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    txArqEnt: TEdit;
    btnAbreArqEnt: TSpeedButton;
    pbBarraProg: TProgressBar;
    mmObs: TMemo;
    Panel1: TPanel;
    btnExecuta: TSpeedButton;
    btnFecha: TSpeedButton;
    lblStatus: TLabel;
    dlgAbreArq: TOpenDialog;
    dlgSalvaArq: TSaveDialog;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    DtsRubrica: TDataSource;
    DbcRubrica: TDBLookupComboBox;
    ChkUsaValorArquivo: TCheckBox;
    Bevel4: TBevel;
    DbcFavorecido: TDBLookupComboBox;
    Label4: TLabel;
    DtsFavorecido: TDataSource;
    Label5: TLabel;
    Bevel5: TBevel;
    SbrMsg: TStatusBar;
    Timer: TTimer;
    DtpDataInicio: TDateTimePicker;
    Label6: TLabel;
    Bevel6: TBevel;
    EdtValor: TEdit;
    MskReferencia: TMaskEdit;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    EdtSOL: TEdit;
    QryFavorecido: TwwQuery;
    QryRubrica: TwwQuery;
    QryPrincipal: TwwQuery;
    procedure btnAbreArqEntClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnFechaClick(Sender: TObject);
    procedure ProcessaArquivo();
    function NumeroNatural(sNumero: string): boolean;
    function ConverteParaNumero(sNumero: string):string;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function PegaUsuario(): String;
    procedure ChkUsaValorArquivoClick(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalRubricaIndiv: TfrmPrincipalRubricaIndiv;
  vNumLinhaAtual: integer;
  //vLinhaArquivoEntrada: string;
  
implementation
{$R *.DFM}

uses DBaseDados;

procedure TfrmPrincipalRubricaIndiv.btnAbreArqEntClick(Sender: TObject);
begin
if dlgAbreArq.Execute then
    txArqEnt.Text:= dlgAbreArq.FileName;
end;

procedure TfrmPrincipalRubricaIndiv.btnExecutaClick(Sender: TObject);
begin
  if (txArqEnt.Text <> '') then
  begin
    if Application.MessageBox('Confirma tratamento do arquivo?',PChar('Insere Rubrica'), MB_YESNO + MB_ICONQUESTION) = mrYes then
      if DbcRubrica.KeyValue <> null then
      begin
         if (trim(EdtValor.Text) <> '') or (ChkUsaValorArquivo.Checked = true) then
         begin
             if not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

                ProcessaArquivo;

             if dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.Commit;

         end
         else
           Application.MessageBox('O Valor deve ser preenchida, ou deve ser marcada' +
                                  'a opção "Usa valor arquivo".',
                           PChar('Insere Rubrica'),MB_OK + MB_ICONINFORMATION);
      end
      else
         Application.MessageBox('A rubrica deve ser preenchida.',
                           PChar('Insere Rubrica'),MB_OK + MB_ICONINFORMATION);
  end
  else
    Application.MessageBox('O nome do arquivo de entrada deve ser preenchido.',
                           PChar('Insere Rubrica'),MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmPrincipalRubricaIndiv.btnFechaClick(Sender: TObject);
begin
Self.Close;
end;

//==============================================================================
{Essa procedure le o arquivo de entrada linha a linha, chama o metodo LeValorArqEnt
passando como parametro a linha corrente do arquivo, e grava no arquivo de saida o
valor da funcao LinhaSaida e no arquivo de Update o valor da variavel LinhaUpdateSaida}
procedure TfrmPrincipalRubricaIndiv.ProcessaArquivo;
var
  arqEntrada: TextFile;
  sLinha, sIdPessoa, sSql, sIdTitular, sRubrica, sFavorecido, sIdPlanoContabil: string;
  iContTotal, iContReg, i: integer;
  dValor : double;
  sValor, sMatricula, sDataFim, sRefInicio, sRefFim : string;
  sSeqRubrica : string;
  vRubrica, vFavorecido : variant;
Label ProcessaProximo;
begin
  try
    //Abre os arquivos de entrada e de saida conforme caminho especificado em txArqSai e txArqEnt e txArqUpd
    //<---------------------------------------------------------------------------
    Screen.Cursor:= crHourGlass;

    vRubrica := DbcRubrica.KeyValue;
    sRubrica := vRubrica;
    vFavorecido := DbcFavorecido.KeyValue;

    if vFavorecido = null then
        sFavorecido := 'Null'
    else
       sFavorecido := vFavorecido;

    sDataFim := datetostr(incmonth(DtpDataInicio.Date,1)-1);
    sRefInicio := FormatDateTime('yyyy/mm',incmonth(DtpDataInicio.Date,-1));

    if trim(MskReferencia.Text) = '' then
       sRefFim :=  FormatDateTime('yyyy/mm', DtpDataInicio.Date)
    else
       sRefFim := copy(MskReferencia.Text,3,4) + '/' + copy(MskReferencia.Text,1,2);

    AssignFile(arqEntrada, txArqEnt.Text);
    ReSet(arqEntrada);
    iContTotal:= 0;
    mmObs.Clear;

    //Faz um loop no arquivo para ler a quantidade total de registros
    while not Eof(arqEntrada) do
    begin
      ReadLn(arqEntrada, sLinha);
      Inc(iContTotal);
    end;

    CloseFile(arqEntrada);
    ReSet(arqEntrada);

    iContReg:= 0;
    pbBarraProg.Min:= 0;
    pbBarraProg.Max:= iContTotal;
    pbBarraProg.Position:= 0;

    mmObs.Lines.Add('Inicio do processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));

    //------------------------------------------------------------------------->
    //Le o arquivo de entrada linha a linha e grava no arquivo de saida
    //<-------------------------------------------------------------------------
    while not Eof(arqEntrada) do
    begin
      ReadLn(arqEntrada, sLinha);
      //vLinhaArquivoEntrada recebe o conteudo da linha atual do arquivo de entrada, esse valor pode ser recuperado pela property LinhaArquivoEntrada

      inc(iContReg);

         sMatricula := trim(copy(slinha,1,7));

         sSql := '';
         sSql := sSql + ' select idpessoa, idtitular from cm.depentit ';
         sSql := sSql + ' where substr(matricula,1,7) = ';
         sSql := sSql + '''' + sMatricula + '''';

         QryPrincipal.Close;
         QryPrincipal.Sql.text := sSql;
         QryPrincipal.Open;

        if QryPrincipal.eof then
        begin
           mmObs.Lines.Add('Matrícula não cadastrada: ' + sMatricula);
           goto ProcessaProximo;
        end
        else
        begin
          if QryPrincipal.RecordCount > 1 then
          begin
            mmObs.Lines.Add('Matrícula com mais de uma ocorrêcia no cadastro: ' + sMatricula);
            goto ProcessaProximo;
          end
          else
          begin
            sIdpessoa := QryPrincipal.FieldValues['idpessoa'];
            sIdTitular := QryPrincipal.FieldValues['idtitular'];
          end;
        end;

        sSql := '';
        //sSql := sSql + 'select idplanprevcontab from benefbfciario ';
        //sSql := sSql + 'where idsitbeneficio in (1,2) ';
        //sSql := sSql + 'and fontepagadora = 2 ';
        //sSql := sSql + 'and benefbfciario.idtppagtobenefic = 1 ';
        //sSql := sSql + ' and idpessoa = ' + sIdpessoa ;
        //sSql := sSql + ' and idtitular = ' + sIdTitular;
        sSql := sSql + 'SELECT B.IDPLANPREVCONTAB ';
        sSql := sSql + '  FROM BENEFBFCIARIO B ';
        sSql := sSql + ' WHERE B.FONTEPAGADORA = 2 ';
        sSql := sSql + '   AND B.IDTPPAGTOBENEFIC = 1 ';
        sSql := sSql + '   AND B.IDPESSOA = ' + sIdpessoa;
        sSql := sSql + '   AND B.IDTITULAR = ' + sIdTitular;
        sSql := sSql + '   AND (B.IDSITBENEFICIO = 1 OR ';
        sSql := sSql + '        (B.IDSITBENEFICIO = 2 AND NOT EXISTS (SELECT 1 ';
        sSql := sSql + '                                              FROM BENEFBFCIARIO B1 ';
        sSql := sSql + '                                              WHERE B1.FONTEPAGADORA = 2 ';
        sSql := sSql + '                                                AND B1.IDTPPAGTOBENEFIC = 1 ';
        sSql := sSql + '                                                AND B1.IDSITBENEFICIO = 1 ';
        sSql := sSql + '                                                AND B1.IDPESSOA = B.IDPESSOA ';
        sSql := sSql + '                                                AND B1.IDTITULAR = B.IDTITULAR)) OR ';
        sSql := sSql + '        (B.IDSITBENEFICIO = 3 AND NOT EXISTS (SELECT 1 ';
        sSql := sSql + '                                              FROM BENEFBFCIARIO B1 ';
        sSql := sSql + '                                              WHERE B1.FONTEPAGADORA = 2 ';
        sSql := sSql + '                                                AND B1.IDTPPAGTOBENEFIC = 1 ';
        sSql := sSql + '                                                AND B1.IDSITBENEFICIO IN (1,2) ';
        sSql := sSql + '                                                AND B1.IDPESSOA = B.IDPESSOA ';
        sSql := sSql + '                                                AND B1.IDTITULAR = B.IDTITULAR) ';
        sSql := sSql + '                              AND (b.datafinal = (select max(bf.datafinal) ';
        sSql := sSql + '                                                  from benefbfciario bf ';
        sSql := sSql + '                                                  where bf.idpessoa = b.idpessoa ';
        sSql := sSql + '                                                   and   bf.idtitular = b.idtitular ';
        sSql := sSql + '                                                   and   bf.fontepagadora = b.fontepagadora ';
        sSql := sSql + '                                                   and   bf.idplanoprev = b.idplanoprev) OR ';
        sSql := sSql + '                                   b.ULTMESPREPARO = (select max(bf.ULTMESPREPARO) ';
        sSql := sSql + '                                                      from benefbfciario bf ';
        sSql := sSql + '                                                      where bf.idpessoa = b.idpessoa ';
        sSql := sSql + '                                                      and   bf.idtitular = b.idtitular ';
        sSql := sSql + '                                                      and   bf.fontepagadora = b.fontepagadora ';
        sSql := sSql + '                                                      and   bf.idplanoprev = b.idplanoprev)))) ';
        sSql := sSql + ' UNION ';
        sSql := sSql + ' select null from dual ';

        QryPrincipal.Close;
        QryPrincipal.Sql.text := sSql;
        QryPrincipal.Open;

        sIdPlanoContabil := QryPrincipal.Fields[0].AsString;

        if  sIdPlanoContabil <> '' then
        begin

        //------------------------------------------------------------------------->
        // Rotina que lê os valores e inclui na tabela de apoio
        //------------------------------------------------------------------------->

        if ChkUsaValorArquivo.Checked = true then
        begin
          // Recupera valor da rubrica
          sValor := trim(copy(slinha,9,12));
          {sValor := ConverteParaNumero(sValor);

          if NumeroNatural(sValor) then
             dValor := strtofloat(sValor)/100;

          sValor := trim(floattostr(dValor));}
        end
        else
          sValor := EdtValor.Text;

        for i:= 1 to Length(sValor) do
              if sValor[i] = ',' then sValor[i] := '.';

        sSeqRubrica := '1';

        sSql := '';
        sSql := sSql + 'SELECT max(SEQRUBRICAINDIV) AS MAXIMA FROM cm.RUBRICAINDIV ';
        sSql := sSql + 'WHERE IDPESSOA = ' + sIdPessoa + ' ';
        sSql := sSql + 'AND   IDEMPRESA = 1 ';
        sSql := sSql + 'AND   IDRUBRICA = ' +  sRubrica + ' ';
        //sSql := sSql + 'AND   SEQRUBRICAINDIV = 1';

        QryPrincipal.Close;
        QryPrincipal.Sql.text := sSql;
        QryPrincipal.Open;

        if not QryPrincipal.Eof then
        begin
           if QryPrincipal.FieldValues['MAXIMA'] = null then
              sSeqRubrica := '1'
           else
              sSeqRubrica := inttostr((strtoint(QryPrincipal.FieldValues['MAXIMA']) + 1));
        end;

        sSql := '';
        sSql := sSql + 'insert into cm.rubricaindiv ';
        sSql := sSql + '(IDPESSOA ,IDEMPRESA,IDRUBRICA,NUMOCORRENCIAS, ';
        sSql := sSql + 'SEQRUBRICAINDIV,IDFAVORECIDO,IDREGRACALCULO, ';
        sSql := sSql + 'VALORRUBRICA,ANOMESINICIO,FLGPERMANENTE,PARCELAS, ';
        sSql := sSql + 'FLGPERCENT,FLGTPRUBMANUT,FLGPENSAOALIM, ';
        sSql := sSql + 'RUBRICAPROVENTOPA,DATAFINAL,ANOMESREF,CODPORTFORMA, ';
        sSql := sSql + 'IDTITULAR,DATAINICIO,FLGBASEPA,FLGUSAABONO, ';
        sSql := sSql + 'IDALIMENTADO,IDLOTE,FLGDESATIVADO,FLGUSADO, ';
        sSql := sSql + 'FLGCALCULACPMF,ULTMESPREPARO,VALORANTERIOR, ';
        sSql := sSql + 'IDPROCESSO,IDRUBRICA13,IDRUBRICAPROVENTO13, ';
        sSql := sSql + 'IDMOTIVO,IDLOTEREVISAO,FLGANTECIPABONO, IDPLANOCONTABIL,';
        sSql := sSql + 'TRGDTINCLUSAO, TRGUSERINCLUSAO) ';
        sSql := sSql + ' values (';
        sSql := sSql + sIdPessoa+', 1, '+sRubrica+', ';
        sSql := sSql + '0, '+sSeqRubrica+', '+sFavorecido;
        if (sRubrica = '38478') or  (sRubrica = '36013') then
            sSql := sSql +  ', 25089, ' + sValor + ', '
        else
            sSql := sSql +  ', Null, ' + sValor + ', ';
        sSql := sSql + 'Null, 0, 1, 0, 1, 0, Null, ';
        sSql := sSql + 'to_date('+ QuotedStr(sDataFim) + ', ';
        sSql := sSql + QuotedStr('dd/mm/yyyy')+'), ';
        sSql := sSql + QuotedStr(sRefFim)+', Null, ';
        sSql := sSql + sIdTitular + ', ';
        sSql := sSql + 'to_date('+ QuotedStr(datetostr(DtpDataInicio.Date))+ ' , ';
        sSql := sSql + QuotedStr('dd/mm/yyyy') + ') , ';
        sSql := sSql + '0, 0, Null, Null, 0, 0, 0, ';
        sSql := sSql + 'Null, ';
        sSql := sSql + 'Null, Null, Null, Null, Null, Null, 0, ' + sIdPlanoContabil + ', ';
        sSql := sSql + 'sysdate, ';
        sSql := sSql + '(select '+QuotedStr('CM')+'||IDUSUARIO ';
        sSql := sSql + 'from   usuariosistema ';
        sSql := sSql + 'where  NOMEUSUARIO = ';
        sSql := sSql + QuotedStr(trim(frmPrincipalRubricaIndiv.SbrMsg.Panels[1].Text))+'))';



        QryPrincipal.Close;
        QryPrincipal.Sql.text := sSql;
        try
           QryPrincipal.ExecSQL;
        except
           if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;
        end;

      END;

      //------------------------------------------------------------------------->
      //vNumLinhaAtual recebe o valor do contador de registor, essa informação pode ser lida pela property NumLinhaAtual
      vNumLinhaAtual:= iContReg;
      if  sIdPlanoContabil = '' then
        mmObs.Lines.Add('Matrícula '+sMatricula+' Sem Benefício');
      pbBarraProg.Position:= iContReg;
      lblStatus.Caption:= 'Lendo registro ' + IntToStr(iContReg) + ' de ' + IntToStr(iContTotal);
      pbBarraProg.Refresh;
      lblStatus.Refresh;
      Application.ProcessMessages;
      //LeValorArqEnt(sLinha);
      ProcessaProximo:
    end;

    //------------------------------------------------------------------------->
    //Fecha os arquivos
    //<-------------------------------------------------------------------------
    mmObs.Lines.Add('Término do processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));

    CloseFile(arqEntrada);
    Application.MessageBox('Operação concluída com sucesso.',PChar(Application.Title),MB_OK + MB_ICONINFORMATION);

    //Seta o ambiente para o estado original
    vNumLinhaAtual:= 0;
    //vLinhaArquivoEntrada:= '';
    pbBarraProg.Position:= pbBarraProg.Min;
    lblStatus.Caption:= '';
    Screen.Cursor:= crDefault;
    //------------------------------------------------------------------------->
  except
    //Se houver erro e mostrado uma mensagem e tenta fechar os arquivos.
    //<-------------------------------------------------------------------------
    on E: Exception do
    begin
      Application.MessageBox(PChar('Não foi possível concluir a operação.' + #10#13 + E.Message),
                             PChar(Application.Title), MB_OK + MB_ICONERROR);
      try
        CloseFile(arqEntrada);
      finally
        vNumLinhaAtual:= 0;
        pbBarraProg.Position:= pbBarraProg.Min;
        lblStatus.Caption:= '';
        Screen.Cursor:= crDefault;
      end;
    end;
    //------------------------------------------------------------------------->
  end;

end;

function TfrmPrincipalRubricaIndiv.NumeroNatural(sNumero: string): boolean;
var i: integer;
begin
   result := false;

   for i := 1 to length(sNumero) do
      begin
         if ((Copy(sNumero,i,1) < '0') or
            (Copy(sNumero,i,1)  > '9'))then exit;
      end;
   result := true;
end;

function TfrmPrincipalRubricaIndiv.ConverteParaNumero(sNumero: string):string;
var i: integer;
    sAux : string;
begin

   for i:= 1 to Length(sNumero) do
      if (sNumero[i] <> '.') and (sNumero[i] <> ',') then
         sAux := sAux + sNumero[i];

      ConverteParaNumero := sAux;
end;


procedure TfrmPrincipalRubricaIndiv.TimerTimer(Sender: TObject);
begin
   frmPrincipalRubricaIndiv.SbrMsg.Panels[2].Text := ' ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', now);
end;

procedure TfrmPrincipalRubricaIndiv.FormCreate(Sender: TObject);
begin
//CurrencyString: string;
//CurrencyFormat: Byte;
//NegCurrFormat: Byte;
//ThousandSeparator: Char;
//DecimalSeparator: Char;
//CurrencyDecimals: Byte;
//DateSeparator := '/';
//ShortDateFormat:= 'dd/mm/yyyy';
//LongDateFormat := 'dd/mm/yyyy hh:nn:ss.zzz';
//TimeSeparator: Char;
//TimeAMString: string;
//TimePMString: string;
//ShortTimeFormat: string;
//LongTimeFormat:= 'hh:nn:ss.zzz';
//ShortMonthNames: array[1..12] of string;
//LongMonthNames: array[1..12] of string;
//ShortDayNames: array[1..7] of string;
//LongDayNames: array[1..7] of string;
//SysLocale: TSysLocale;
//EraNames: array[1..7] of string;
//EraYearOffsets: array[1..7] of Integer;
//TwoDigitYearCenturyWindow: Word = 50;
//TListSeparator: Char;

 frmPrincipalRubricaIndiv.SbrMsg.Panels[0].Text := ' FUNCEF - Fundação dos Economiários Federais';
 frmPrincipalRubricaIndiv.SbrMsg.Panels[1].Text := ' ' + uppercase(PegaUsuario());
 DtpDataInicio.Date := strtodate('01/' + FormatDateTime('mm/yyyy', now()));
// AdoConexao.ConnectionString := 'Provider=MSDAORA.1;Data Source=hom;Password=suportehomsun;User ID=usersuporte';
// AdoConexao.connected := true;
 QryFavorecido.open;
 QryRubrica.open;
end;

function TfrmPrincipalRubricaIndiv.PegaUsuario(): String;
var
buftemp : array[0..256] of char;
lnwtam : longword;
begin
  lnwtam := 256;
  GetUserName(buftemp,lnwtam);
  Result := strpas(buftemp);
end;

procedure TfrmPrincipalRubricaIndiv.ChkUsaValorArquivoClick(Sender: TObject);
begin
   if ChkUsaValorArquivo.Checked = true then EdtValor.text := '';
end;

procedure TfrmPrincipalRubricaIndiv.EdtValorChange(Sender: TObject);
begin
   ChkUsaValorArquivo.Checked := false;
end;

end.
