unit FfinancHabitacional;

interface
// Alterações:

{
--------------------------------------------------------------------------------------------------
Alteração  : InsereTmpDesc
Nº SIG.....: 114231
Data.......: 08/03/2021
Responsável: Andre Imakawa
Descrição..: Buscar o PLANO CONTABIL das tabelas de parametrização.
-------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 21/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 137264/7261 KINTANA 1515263
Responsável : Otacilio Aquino
Data        : 20/12/2011
Descrição   : Adequação do layout do arquivo de financiamento habitacional
--------------------------------------------------------------------------------------------------
Pendência   : SOL 137264 KINTANA 828405
Responsável : Fernando Xavier
Data        : 13/05/2011
Descrição   : Implementação da funcionalidade "Insere Financiamento Habitacional".
---------------------------------------------------------------------------------------------------
}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Spin, DBCtrls, ExtCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBTables, UDataBase,
  DBClient, usistema;

type
  TFrmFinancHabitacional = class(TfrmOkCancelar)
    Bevel2: TBevel;
    DbcMes: TDBLookupComboBox;
    SpdAno: TSpinEdit;
    Bevel6: TBevel;
    DbcMesReferencia: TDBLookupComboBox;
    SpdAnoReferencia: TSpinEdit;
    lblmesreferencia: TLabel;
    lblmescobranca: TLabel;
    Bevel3: TBevel;
    DbcLote: TDBLookupComboBox;
    qryLote: TQuery;
    dtsLote: TDataSource;
    qryAuxiliar: TQuery;
    qryMes: TQuery;
    dtsMes: TDataSource;
    dtsMesReferencia: TDataSource;
    qryMesReferencia: TQuery;
    dlgAbreArq: TOpenDialog;
    btnAbreArqEnt: TSpeedButton;
    txArqEnt: TEdit;
    Bevel1: TBevel;
    lblarqentrada: TLabel;
    mmObs: TMemo;
    BitBtn1: TBitBtn;
    bbtnDesfazer: TBitBtn;
    bbtnGeraArqSaida: TBitBtn;
    qryAux: TQuery;
    lbllote: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAbreArqEntClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnGeraArqSaidaClick(Sender: TObject);
    procedure DbcMesReferenciaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure FiltraLote();
    function  VerificaImportArquivo(sIdlote : string ): boolean;
    function  Lpad(sField : string; iLength : integer; sChar: string ):string;
    procedure GeraArqSaida;
    procedure InsereTmpDesc;
    procedure processodesfazer;
    procedure HabilitaDesabilitaCampos(Status : boolean);

  public
    { Public declarations }
    vChaveMes, vChaveMesRefer : variant;
  end;

var
  FrmFinancHabitacional: TFrmFinancHabitacional;

implementation
uses  fAguarde, DBaseDados;
{$R *.DFM}

// Funcao Lpad
function TFrmFinancHabitacional.Lpad ( sField : string; iLength : integer; sChar: string ) : string;
begin
        while Length(sField) < iLength do
        begin
                sField := sChar + sField  ;
        end;
        Result := Copy(sField, 1, iLength);
end;

procedure TFrmFinancHabitacional.FiltraLote();
var
  vChave: variant;
  sSql: string;
begin
  vChave := DbcMesReferencia.KeyValue;
  vChave := '''' + trim(inttostr(SpdAnoReferencia.Value)) + '/' + vChave + '''';

  sSql := '';
  sSql := 'SELECT FLGTIPOFOLHA,IDLOTE, (trim(to_char(IDLOTE)) || '' - '' || DESCRICAO) DESCRICAO, DATAPAGAMENTO ' +
          'FROM   CTRLINTERFACE CI ' +
          'WHERE (FLGPREPARADO = 1) ' +
          'AND   (IDPESSOA = 1) ' +
          'AND   (FLGVOLTATMP = 0) ' +
          'AND   (TIPO = ''B'') ' +
          'AND   (MESREFERENCIA = ' + vChave + ') ' +
          'AND UPPER(DESCRICAO) LIKE ''%MANUTEN%'' '+
          'AND   (NVL(FLGRESGATE,0) = 0) '+
          'ORDER BY IDLOTE ';

  QryLote.Close;
  QryLote.SQL.Text := sSql;
  QryLote.Open;

  DbcLote.Enabled := true;

  if QryLote.Eof then
  begin
    sSql := '';
    sSql := 'SELECT 0 as IDLOTE, ' + '''' + 'Inexistente' + '''' +
            'as DESCRICAO ' +
            'FROM dual ';

    QryLote.Close;
    QryLote.SQL.Text := sSql;
    QryLote.Open;

    DbcLote.KeyValue   := 0;
    DbcLote.Font.Color := clRed;
    DbcLote.Enabled    := true;
  end else
  begin
    DbcLote.Font.Color := clWindowText;
  end;
end;

function TFrmFinancHabitacional.VerificaImportArquivo(sIdlote : string ): boolean;
var sSql, sIdRubImp: string;
begin
   result    := false;
   vChaveMes := DbcMes.KeyValue;
   vChaveMes := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMes + '''';

   vChaveMesRefer := DbcMes.KeyValue;
   vChaveMesRefer := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMesRefer + '''';

   sSql := ' SELECT * FROM  TMPDESC '+
           ' WHERE  IDPROVENTO in (38967,38968,39123) '+
           ' AND    MESCOBRANCA = '+vChaveMes+
           ' AND    MESREFERENCIA = '+vChaveMesRefer;

   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.Add(sSql);
   qryAux.open;
   // caso a folha mensal do mes tenha sido efetivada
   if not(qryAux.isempty) then
   begin
      // se a efetivação da folha ja tenha sido executada
      result := true;
   end;
end;

procedure TFrmFinancHabitacional.GeraArqSaida;
var lidseq, iImportada, iRejeitada
    : integer;
    f, t :TextFile;
    linha,
    ssql, ssqlTmpdesc, sidpessjur, sidplanoprev, sidtitular,sRegistro,
    sFlgDescFolha,
    nomearquivoTexto, LinhaArqTextoSaida, sidpessoa, sCodAverbacao, sIdRubImp,
    // variaveis usadas no tipo de registro 2 funcionario
    sMatricula, sSitPart, sMotivoRejeicao, sMensage, sIdModulo, sSistOrigem
    : string;

begin
  frmAguarde.Mostra('Aguarde... Gerando Arquivo.');
  AssignFile(f,txArqEnt.Text);
  Reset(f); //abre o arquivo para leitura;
  nomearquivoTexto   := 'c:\Planus\Temp\FINANCHAB_' + FormatDateTime('DDMMYYYY',DATE) + '_' + FormatDateTime('HHMMSS',NOW) + '.txt';
  LinhaArqTextoSaida := '';
  AssignFile(t, pchar(nomearquivoTexto));
  Rewrite(t);

  vChaveMes := DbcMes.KeyValue;
  vChaveMes := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMes + '''';

  While not eof(f) do
  begin
    Readln(f, linha); //le do arquivo e desce uma linha. O conteúdo lido é transferido para a variável linha
    sRegistro := Trim(Copy(linha, 1, 1));
    // sRegistroH : H header do arquivo, 1 header do convenio, 2 funcionarios, 3 trailer do convenio, 9 trailer

    if sRegistro = 'H' then
    begin
       if not(QuotedStr(trim(copy(linha,34,4 ))+'/'+trim(copy(linha,32,2 )))  =   vChaveMes) then
       begin
          MessageDlg('O arquivo de entrada não é do mês selecionado.', mtInformation, [mbOK], 0);
          txArqEnt.Text:= '';
          frmAguarde.Apaga;
          Abort;
       end;
    end;


    if (sRegistro = '2') then
    Begin
       {  conforme passado por e-mail:
          " O código da averbação deve ser iniciado com 39 (Outros) e:
          o Deve ser alterado para  99 (Averbado em folha / Averbação Ok) se HistRubSal.ValorProvento  = HistRubSal.ValorRecebido
          o Deve ser alterado para  12 (Não averbado - Excesso de Débito) se HistRubSal.ValorProvento  <> HistRubSal.ValorRecebido
          o Deve ser alterado para  29 (Outros) se o valor do arquivo for <> HistRubSal.ValorRecebido
          o Acredito que os outros códigos devem continuar como já foi implementado    }

       sCodAverbacao := '39'; // Outros

       // pego a matricula
       // Kintana 1515263 SOL 137264/7261 - Otacilio
       //sMatricula := trim(copy(linha, 92, 7 ));
       //sMatricula := Trim(Copy(linha, 106, 12));

       // pego a matricula
       // Kintana 1515263 SOL 137264/7261 - Otacilio
       //sMatricula := trim(copy(linha,92,7 ));
      // sMatricula := trim(copy(linha,106, 12 ));

       sidplanoprev  := '0';
       sMatricula    := '';
       sFlgDescFolha := '';
       sIdModulo     := '';
       sSistOrigem   := '';
       sIdRubImp     := '';
       sidpessjur    := '';
       sidpessoa     := '';
       sidtitular    := '';
       // pego a matricula
       if copy(linha,2,10 ) = '0000000101' then  // Se o código do convênio da linha do tipo "2" for "0000000101" - posições 2 a 11 (Ativo - Empregado FUNCEF)
       begin
          if copy(linha,111,3) = '000' then   // Se conteúdo da linha tipo "2" das posições 111 a 113 for igual a "000"
          begin
             sMatricula    := copy(linha,114,4 );// Buscar matrícula das posições 114 a 117 (matrícula com 4 posições)
             LPAD(sMatricula,4,'0');
             sFlgDescFolha := 'P'  ;
             sIdModulo     := '21' ;
             sSistOrigem   := '21' ;
             sIdRubImp     := '39123';
          end;
       end
       else
       if (copy(linha,2,10 )) = '0000000102' then   // Se o código do convênio da linha do tipo "2" for "0000000102" - posições 2 a 11 (Assistido - Empregado FUNCEF)
       begin
          sMatricula    := (copy(linha,111,7 ));// Buscar matrícula das posições 114 a 117 (matrícula com 4 posições)
          LPAD(sMatricula,7,'0');
          sFlgDescFolha := 'B';
          sIdModulo     := '18';
          sSistOrigem   := '18';
          if vChaveMesRefer = QuotedStr(((copy(linha,83,4 )))+'/'+trim((copy(linha,81,2 )))) then
             sIdRubImp := '38967'
          else
             sIdRubImp := '38968';
       end;


       // verifico na elegpatro e depentit se existe a pessoa cadastrada
       ssql := ' SELECT TMP.IDPESSOA, TMP.IDPESSJUR, TMP.DATADEMISSAO, TMP.ORDENA '+
               ' FROM (SELECT IDPESSOA, IDPESSJUR, DATADEMISSAO, 1 ORDENA         '+
               ' FROM ELEGPATRO                                                   '+
               ' WHERE MATRICULA = '+QuotedStr(sMatricula) + '                    '+
               ' UNION ALL                                                        '+
               ' SELECT DISTINCT IDPESSOA,                                        '+
               '         NULL     AS IDPESSJUR,                                   '+
               '         NULL     AS DATADEMISSAO,                                '+
               '         2        ORDENA                                          '+
               ' FROM DEPENTIT                                                    '+
               ' WHERE MATRICULA = '+QuotedStr(sMatricula)+' ) TMP                '+
               ' ORDER BY ORDENA                                                  ';

       qryAuxiliar.close;
       qryAuxiliar.sql.Clear;
       qryAuxiliar.sql.Add(ssql);
       qryAuxiliar.open;
       // caso exista a matricula na elegpatro verifica se existe a mesma na depentit
       IF not(qryAuxiliar.isempty) then
       begin

          // busca o valor informado da histrubsal
//          ssql := 'SELECT /*RULE*/ NVL(SUM(NVL(VALORINFO,0)),0) AS VALORINFO, '+  //Everson TIBERO
          ssql := 'SELECT NVL(SUM(NVL(VALORINFO,0)),0) AS VALORINFO, '+             //Everson TIBERO
                  '       NVL(SUM(NVL(ValorProvento,0)),0) AS ValorProvento, '+
                  '       NVL(SUM(NVL(ValorRecebido,0)),0) AS ValorRecebido  '+
                  '       FROM   HISTRUBSAL '+
                  'WHERE  IDPESSOA      = '  + qryAuxiliar.FieldByName('Idpessoa').AsString+
                  'AND    MES           = '  + vChaveMes+
                  'AND    MESCOBRANCA   = '  + vChaveMesRefer+
                  'AND    ((CODPROVDESC  IN (''135804'',''235804'',''335804'',''435804'')) OR'+
                  '       (IDRUBRICA    IN (''38967'',''38968'',''39123'')))';
          qryAux.close;
          qryAux.sql.Clear;
          qryAux.sql.Add(ssql);
          qryAux.open;

          if copy(linha,2,10 ) = '0000000101' then
          begin
              if qryAux.FieldByName('ValorProvento').asfloat > 0 then
              begin
                 // Kintana 1515263 SOL 137264/7261 - Otacilio
                 //if StrToFloat(trim(copy(linha,80,12 ))) > qryAux.FieldByName('ValorRecebido').asfloat then
                 if StrToFloat(((Copy(linha, 87, 10)))+','+((Copy(linha, 97, 2)))) <> StrToFloat(qryAux.FieldByName('ValorProvento').Asstring) then
                 begin
                    sCodAverbacao := '12';
                    //abre o arquivo para escrita
                    // Kintana 1515263 SOL 137264/7261 - Otacilio
                    //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                    LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                    writeln(t, LinhaArqTextoSaida);
                    continue;
                 end;

                 sCodAverbacao := '99';
                 //abre o arquivo para escrita
                 // Kintana 1515263 SOL 137264/7261 - Otacilio
                 //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                 LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                 writeln(t, LinhaArqTextoSaida);
                 continue;
              end
              else
              begin
                 if StrToFloat(((Copy(linha, 87, 10)))+','+((Copy(linha, 97, 2)))) <> StrToFloat(qryAux.FieldByName('ValorProvento').Asstring) then
                 begin
                    sCodAverbacao := '12';
                    //abre o arquivo para escrita
                    // Kintana 1515263 SOL 137264/7261 - Otacilio
                    //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                    LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                    writeln(t, LinhaArqTextoSaida);
                    continue;
                 end;
              end;

          end
          else
          begin
             if (qryAux.FieldByName('ValorProvento').asfloat = qryAux.FieldByName('ValorRecebido').asfloat) and
                ((qryAux.FieldByName('ValorProvento').asfloat > 0) or (qryAux.FieldByName('ValorRecebido').asfloat > 0)) then
             begin
                sCodAverbacao := '99';
                //abre o arquivo para escrita
                // Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                writeln(t, LinhaArqTextoSaida);
                continue;
             end;


             // Kintana 1515263 SOL 137264/7261 - Otacilio
             //if StrToFloat(trim(copy(linha,80,12 ))) > qryAux.FieldByName('ValorRecebido').asfloat then
             if StrToFloat(((Copy(linha, 87, 10)))+','+((Copy(linha, 97, 2)))) <> StrToFloat(qryAux.FieldByName('ValorRecebido').Asstring) then
             begin
                sCodAverbacao := '29';
                //abre o arquivo para escrita
                // Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                writeln(t, LinhaArqTextoSaida);
                continue;
             end;

             if qryAux.FieldByName('ValorProvento').asfloat <> qryAux.FieldByName('ValorRecebido').asfloat then
             begin
                sCodAverbacao := '12';
                //abre o arquivo para escrita
                // Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                writeln(t, LinhaArqTextoSaida);
                continue;
             end;


             IF qryAuxiliar.FieldByName('DATADEMISSAO').AsString <> '' THEN
             begin
                sCodAverbacao := '31';
                //abre o arquivo para escrita
                // Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha) - 1 ));
                writeln(t,LinhaArqTextoSaida);
                continue;
             end;
             //sidpessjur  := qryAux.FieldByName('IDPESSJUR').AsString;
             //sidpessoa   := qryAux.FieldByName('IDPESSOA').AsString;
             // trazer o titular e a matricula da depentit
             ssql := 'SELECT IDTITULAR, NVL(MATRICULA,0) AS MATRICULA '+
                     'FROM   DEPENTIT '+
                     'WHERE  IDPESSOA = '+ qryAuxiliar.FieldByName('IDPESSOA').AsString;
                           qryAux.close;
             qryAux.sql.Clear;
             qryAux.sql.Add(ssql);
             qryAux.open;
             // apos trazer os registros fazer as verificações de averbado ou não averbado referentes
             // a depentit
             IF not(qryAux.isempty) then
             begin
                sidtitular  := qryAux.FieldByName('IDTITULAR').AsString;
                //sCodAverbacao de acordo com as verificações especificadas no documento
                if qryAux.FieldByName('MATRICULA').AsString <>  sMatricula then
                begin
                   sCodAverbacao := '15';
                   //abre o arquivo para escrita
                   // Kintana 1515263 SOL 137264/7261 - Otacilio
                   //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                   LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                   writeln(t, LinhaArqTextoSaida);
                   continue;
                end;
                if qryAux.FieldByName('MATRICULA').Asfloat =  0  then
                begin
                   sCodAverbacao := '22';
                   //abre o arquivo para escrita
                   // Kintana 1515263 SOL 137264/7261 - Otacilio
                   //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                   LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                   writeln(t, LinhaArqTextoSaida);
                   continue;
                 end;
             end;

             // busca a situação do participante e o plano ativo
             ssql := 'SELECT PPP.IDSITPART, '   +
                     '       PPP.IDPLANOPREV, ' +
                     '       SP.FLGINTERNO '    +
                     'FROM   PARTPREVPLAN PPP, '+
                     '       SITPART SP '       +
                     'WHERE  SP.IDSITPART      =  PPP.IDSITPART '+
                     'AND    PPP.IDPESSOA      = '+ QuotedStr(sidtitular);
             qryAux.close;
             qryAux.sql.Clear;
             qryAux.sql.Add(ssql);
             qryAux.open;
             if not(qryAux.isempty) then
             begin
                sidplanoprev := qryAux.FieldByName('IDPLANOPREV').AsString;
             end
             else
             begin
                sCodAverbacao := '29';
                //abre o arquivo para escrita
                //Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                writeln(t, LinhaArqTextoSaida);
                continue;
             end;
             // verificar a situação do participante se ele vier como aposentado e estiver como ativo criticar
             sSitPart := IntToStr(strtoint((Copy(linha, 2, 10))));
             // verificar se o retorno do arquivo é aposentado = 101 e se o retorno do sistema flginterno =  'AS'  aposentado
             // participante com situação cancelada
             if (qryAux.FieldByName('FLGINTERNO').AsString = 'CA') then
             begin
                sCodAverbacao := '29';
                //abre o arquivo para escrita
                //Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (Copy(linha, 1, 125)) + sCodAverbacao + (Copy(linha, 128, length(linha)-1));
                writeln(t,LinhaArqTextoSaida);
                continue;
             end
             else // participante aposentado no arquivo e ativo no sistema
             if (sSitPart  = '102') and (qryAux.FieldByName('FLGINTERNO').AsString <> 'AS') then
             begin
                sCodAverbacao := '24';
                //abre o arquivo para escrita
                // Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (copy(linha,1,125))+sCodAverbacao+(copy(linha,128,length(linha)-1));
                writeln(t,LinhaArqTextoSaida);
                continue;
             end
             else // participante ativo no arquivo e aposentado no sistema
             if (sSitPart  = '101') and (qryAux.FieldByName('FLGINTERNO').AsString = 'AS') then
             begin
                sCodAverbacao := '24';
                //abre o arquivo para escrita
                // Kintana 1515263 SOL 137264/7261 - Otacilio
                //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
                LinhaArqTextoSaida := (copy(linha,1,125))+sCodAverbacao+(copy(linha,128,length(linha)-1));
                writeln(t,LinhaArqTextoSaida);
                continue;
             end;
          end;
       end
       else
       begin

          sCodAverbacao := '23';
          //abre o arquivo para escrita
          // Kintana 1515263 SOL 137264/7261 - Otacilio
          //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
          LinhaArqTextoSaida := (copy(linha,1,125))+sCodAverbacao+(copy(linha,128,length(linha)-1));
          writeln(t,LinhaArqTextoSaida);
          continue;
       end;

       // rubrica para lançamento tanto para ativo quanto para assistido

       ssql := 'SELECT IDPROVENTO '+
               'FROM   PROVDESC PD  '+
               'WHERE  PD.CODPROVDESC IN (''135804'', ''235804'', ''335804'', ''435804'') '+
               'AND    PD.FLGATRASODEVOL     =   ''N''';
       qryAux.close;
       qryAux.sql.Clear;
       qryAux.sql.Add(ssql);
       qryAux.open;

       if not(qryAux.isempty) then
          sIdRubImp := qryAux.FieldByName('IDPROVENTO').AsString;

       //abre o arquivo para escrita
       // Kintana 1515263 SOL 137264/7261 - Otacilio
       //LinhaArqTextoSaida := trim(copy(linha,1,111))+sCodAverbacao+trim(copy(linha,114,length(linha)-1));
       LinhaArqTextoSaida := (copy(linha,1,125))+sCodAverbacao+(copy(linha,128,length(linha)-1));
       writeln(t,LinhaArqTextoSaida);
    end
    else
    begin
       //abre o arquivo para escrita
       writeln(t,linha);

    end;

  end;
  Closefile(f); //fecha o handle de arquivo
  Closefile(t); //fecha o handle de arquivo
  frmAguarde.Apaga;
  MessageDlg('Arquivo Gerado com Sucesso '+nomearquivoTexto, mtInformation, [mbOK], 0); 
end;

procedure TFrmFinancHabitacional.InsereTmpDesc;
var lidseq, iImportada, iRejeitada, iContTotal
    : integer;
    f, t :TextFile;
    linha,
    ssql, ssqlTmpdesc, sidpessjur, sidplanoprev, sidtitular,sRegistro,
    sidpessoa, sIdRubImp, sFlgDescFolha,
    // variaveis usadas no tipo de registro 2 funcionario
    sMatricula, sSitPart, sMotivoRejeicao, sMensage, sIdModulo, sSistOrigem,
    sCodCentroRespon, sPlaContaC, sCodTipRecDes, sValDeb, dtVenc, sdtMovimento,
    sIdentf, sCodProvDesc, sDescricaoProv, sCPF, sIdFavorecido, sNumParcelas, sParcelas,
    sReferencia, sDataHora, sidLote
    : string;
    bVerificaControle, bentrou : boolean;
    sPlanoContab: String; // Andre Imakawa - SIG 114231
begin
  bVerificaControle := true;  // variavel criada para que a verificação do arquivo seja feita apenas na primeira vez que passar no while
  vChaveMes := DbcMes.KeyValue;
  vChaveMes := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMes + '''';

  vChaveMesRefer := DbcMes.KeyValue;
  vChaveMesRefer := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMesRefer + '''';
  AssignFile(f,txArqEnt.Text);
  Reset(f); //abre o arquivo para leitura;
  //rewrite(t); //abre o arquivo para escrita
  mmObs.Lines.Add('');
  mmObs.Lines.Add('');
  ssql := 'SELECT SYSDATE '+
          'FROM   DUAL ';
  qryAux.close;
  qryAux.sql.Clear;
  qryAux.sql.Add(ssql);
  qryAux.open;

  sDataHora := formatdatetime('dd/mm/yyyy hh:mm:ss',qryAux.FieldByName('SYSDATE').asdatetime);


  mmObs.Lines.Clear;
  sMotivoRejeicao := '';
  iRejeitada      := 0;
  iImportada      := 0;
  bentrou         := false;
  //Faz um loop no arquivo para contar a quantidade
  //total de registros do TIPO 2 do Arquivo de Entrada.
  while not Eof(f) do
  begin
     //Leitura de Linha
     ReadLn(f, Linha);
     //Conta Registro do TIPO 2
     if Trim(Copy(Linha,1,1)) = '2' then
        Inc(iContTotal);
  end;

  //Reinicializa cursor no Arquivo de Entrada
  CloseFile(f);
  ReSet(f);

  While not eof(f) do
  begin
    Readln(f,linha); //le do arquivo e desce uma linha. O conteúdo lido é transferido para a variável linha
    sRegistro                := trim(copy(linha,1,1));
    if sRegistro = 'H' then
    begin
       if not(QuotedStr(trim(copy(linha,34,4 ))+'/'+trim(copy(linha,32,2 )))  =   vChaveMes) then
       begin
          MessageDlg('O arquivo de entrada não é do mês selecionado.', mtInformation, [mbOK], 0);
          txArqEnt.Text:= '';
          frmAguarde.Apaga;
          Abort;
       end;
    end;

    if (Copy(Linha,1,1) = 'H') and not(bentrou) then
    begin
       sdtMovimento := Trim(Copy(Linha,24,2)) + '/' + Trim(Copy(Linha,26,2))+'/' + Trim(Copy(Linha,28,4));
       //sDataHora := '';
       {ssql := 'select last_day(to_date('+quotedstr(sdtMovimento)+','+quotedstr('mm/yyyy')+')) DTMOV from dual ';
       qryAux.close;
       qryAux.sql.Clear;
       qryAux.sql.Add(ssql);
       qryAux.open;
       sdtMovimento :=    QryAux.FieldByName('DTMOV').asstring;}

       mmObs.Lines.Add('                    Data do Arquivo (DATAMOV): ' + sdtMovimento + '                                  +');
       mmObs.Lines.Add('                  Total de Registros a Serem Averbados: ' + IntToStr(iContTotal));
       mmObs.Lines.Add('+=========================================================================+');

       mmObs.Lines.Add(' ');
       mmObs.Lines.Add('   Início do Processo: '+sDataHora);
       bentrou := true;
    end;

    // sRegistro : H header do arquivo, 1 header do convenio, 2 funcionarios, 3 trailer do convenio, 9 trailer
    if (sRegistro = '2') then
    Begin
       // pego a matricula
       // Kintana 1515263 SOL 137264/7261 - Otacilio
       //sMatricula := trim(copy(linha,92,7 ));
      // sMatricula := trim(copy(linha,106, 12 ));

       sidplanoprev  := '0';
       sMatricula    := '';
       sFlgDescFolha := '';
       sIdModulo     := '';
       sSistOrigem   := '';
       sIdRubImp     := '';
       sidpessjur    := '';
       sidpessoa     := '';
       sidtitular    := '';

       sValDeb        := Trim(Copy(Linha,87,10)) + ',' + Trim(Copy(Linha,97,2));
       dtVenc         := QuotedStr(Trim(Copy(Linha,79,2)) + '/' + Trim(Copy(Linha,81,2)) + '/20' + Trim(Copy(Linha,85,2)));
       sIdentf        := (Copy(Linha,63,12));
       sCPF           := (Copy(Linha,16,11));
       sIdFavorecido  := '1049774';   // Fornecido pela GEPAB - Anderson Vieira
       // pego a matricula
       if (copy(linha,2,10 )) = '0000000101' then  // Se o código do convênio da linha do tipo "2" for "0000000101" - posições 2 a 11 (Ativo - Empregado FUNCEF)
       begin
          if (copy(linha,111,3)) = '000' then   // Se conteúdo da linha tipo "2" das posições 111 a 113 for igual a "000"
          begin
             sMatricula    := (copy(linha,114,4 ));// Buscar matrícula das posições 114 a 117 (matrícula com 4 posições)
             LPAD(sMatricula,4,'0');
             sFlgDescFolha := 'P'  ;
             sIdModulo     := '21' ;
             sSistOrigem   := '21' ;
             sIdRubImp     := '39123';
             sIdPessJur    := '1';

             //CONTABFOLHA.CODCENTRORESPON / .CONTACREDITO
             sSql := '';
             sSql := sSql + ' SELECT codcentrorespon, contacredito';
             sSql := sSql + ' , IDPLANO2'; // Andre Imakawa - SIG 114231
             sSql := sSql + ' FROM   contabfolha';
             sSql := sSql + ' WHERE  idprovento = 340' ;

             QryAuxiliar.Close;
             QryAuxiliar.Sql.Text := sSql;
             QryAuxiliar.Open;

             if (not QryAuxiliar.Eof) then
             begin
                sCodCentroRespon := QryAuxiliar.FieldValues['codcentrorespon'];
                sPlaContaC       := QuotedStr(QryAuxiliar.FieldValues['contacredito']);
                sPlanoContab     := QuotedStr(QryAuxiliar.FieldByName('IDPLANO2').AsString); // Andre Imakawa - SIG 114231
             end;

             // Andre Imakawa - SIG 114231 - Inicio
             if sPlanoContab = '' then
             begin
               sSql := '';
               sSql := sSql + ' SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = 1';

               QryAuxiliar.Close;
               QryAuxiliar.Sql.Text := sSql;
               QryAuxiliar.Open;

               if (not QryAuxiliar.Eof) then
               begin
                  sPlanoContab     := QuotedStr(QryAuxiliar.FieldByName('PLANO').AsString); // Andre Imakawa - SIG 114231
               end;
             end;
             // Andre Imakawa - SIG 114231 - Fim
             
             sSql := '';
             sSql := sSql + ' SELECT d.idtitular, d.idpessoa, d.matricula, p.nome, ppp.* ';
             sSql := sSql + ' FROM partprevplan ppp, depentit d, pessoa p ';
             sSql := sSql + ' WHERE ppp.idpessoa = d.idpessoa AND ppp.idpessoa = p.idpessoa';
//             sSql := sSql + ' AND IDSITPLANOPREV IN (1,2) AND d.matricula = ''' + sMatricula + ''' AND IDPESSJUR = ' + sIdPessJur;       //Everson TIBERO
             sSql := sSql + ' AND ppp.IDSITPLANOPREV IN (1,2) AND d.matricula = ''' + sMatricula + ''' AND ppp.IDPESSJUR = ' + sIdPessJur; //Everson TIBERO

             QryAuxiliar.Close;
             QryAuxiliar.Sql.text := sSql;
             QryAuxiliar.Open;
          end
          else
          begin
                sMatricula    := (copy(linha,111,7 ));
                sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' não é valida para o convenio 0000000101.|';
                inc(iRejeitada);
                continue;
          end;
       end
       else
       if (copy(linha,2,10 )) = '0000000102' then   // Se o código do convênio da linha do tipo "2" for "0000000102" - posições 2 a 11 (Assistido - Empregado FUNCEF)
       begin
          sMatricula    := (copy(linha,111,7 ));// Buscar matrícula das posições 114 a 117 (matrícula com 4 posições)
          LPAD(sMatricula,7,'0');
          sFlgDescFolha := 'B';
          sIdModulo     := '18';
          sSistOrigem   := '18';
          if vChaveMesRefer = QuotedStr(trim(trim(copy(linha,83,4 )))+'/'+trim(trim(copy(linha,81,2 )))) then
             sIdRubImp := '38967'
          else
             sIdRubImp := '38968';

          //VERIFICAR - CODIGO INCOMPLETO!!!
          //RUBRICAXPLANO.CODCENTRORESPON / .PLACONTAC / .CODTIPRECDES
          sSql := '';
          sSql := sSql + 'SELECT DISTINCT codcentrorespon,placontac,codtiprecdes';
          sSql := sSql + ', PLANO '; // Andre Imakawa - SIG 114231
          sSql := sSql + ' FROM   rubricaxplano';

          if vChaveMesRefer = QuotedStr(trim(trim(copy(linha,83,4 )))+'/'+trim(trim(copy(linha,81,2 )))) then
             sSql := sSql + ' WHERE  idrubrica = 38967'
          else
             sSql := sSql + ' WHERE  idrubrica = 38968';

          QryAuxiliar.Close;
          QryAuxiliar.Sql.Text := sSql;
          QryAuxiliar.Open;

          sCodCentroRespon := QryAuxiliar.FieldValues['codcentrorespon'];
          sPlaContaC       := QuotedStr(QryAuxiliar.FieldValues['placontac']);
          sCodTipRecDes    := QryAuxiliar.FieldValues['codtiprecdes'];
          sPlanoContab     := QuotedStr(QryAuxiliar.FieldByName('PLANO').AsString); // Andre Imakawa - SIG 114231

          // Andre Imakawa - SIG 114231 - Inicio
          if sPlanoContab = '' then
          begin
            sSql := '';
            sSql := sSql + ' SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = 1';

            QryAuxiliar.Close;
            QryAuxiliar.Sql.Text := sSql;
            QryAuxiliar.Open;

            if (not QryAuxiliar.Eof) then
            begin
              sPlanoContab     := QuotedStr(QryAuxiliar.FieldByName('PLANO').AsString); // Andre Imakawa - SIG 114231
            end;
          end;
          // Andre Imakawa - SIG 114231 - Fim

          //Identificar IDPLANOPREV de Assistidos
          sSql := '';
          sSql := sSql + ' SELECT * FROM BENEFBFCIARIO BF';
          sSql := sSql + ' WHERE IDPESSOA = (SELECT DISTINCT idpessoa FROM depentit D WHERE matricula = '''+ sMatricula+''')';
          sSql := sSql + ' AND IDSITBENEFICIO  = 1 AND BF.IDTPPAGTOBENEFIC = 1';
          sSql := sSql + ' AND BF.FONTEPAGADORA = (SELECT MIN(FONTEPAGADORA) FROM BENEFBFCIARIO B2';
          sSql := sSql + ' WHERE B2.IDPLANOPREV = BF.IDPLANOPREV AND B2.IDTITULAR = BF.IDTITULAR';
          sSql := sSql + ' AND B2.IDPESSOA = BF.IDPESSOA)';

          QryAuxiliar.Close;
          QryAuxiliar.Sql.Text := sSql;
          QryAuxiliar.Open;

          if not QryAuxiliar.Eof then
             sIdPessJur   := QryAuxiliar.FieldValues['IDPESSJUR'];


       end;

       // verifico na elegpatro e depentit se existe a pessoa cadastrada
       ssql := ' SELECT TMP.IDPESSOA, TMP.IDPESSJUR, TMP.DATADEMISSAO, TMP.ORDENA '+
               ' FROM (SELECT IDPESSOA, IDPESSJUR, DATADEMISSAO, 1 ORDENA         '+
               ' FROM ELEGPATRO                                                   '+
               ' WHERE MATRICULA = '+QuotedStr(sMatricula) + '                    '+
               ' UNION ALL                                                        '+
               ' SELECT DISTINCT IDPESSOA,                                        '+
               '         NULL     AS IDPESSJUR,                                   '+
               '         NULL     AS DATADEMISSAO,                                '+
               '         2        ORDENA                                          '+
               ' FROM DEPENTIT                                                    '+
               ' WHERE MATRICULA = '+QuotedStr(sMatricula)+' ) TMP                '+
               ' ORDER BY ORDENA                                                  ';

       qryAux.close;
       qryAux.sql.Clear;
       qryAux.sql.Add(ssql);
       qryAux.open;

       IF (qryAux.isempty) then
       begin
             sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' não existe no Sistema.|';
             inc(iRejeitada);
             continue;
       end;


       sNumParcelas  := copy(linha,118,120); // Deve ser Prazo (layout - posições de 118 a 120)
       sNumParcelas  := Lpad(sNumParcelas,3,'0');
       sParcelas     := copy(linha,76,78); // Deve ser Prestação (layout - posições de 76 a 78)
       sParcelas     := Lpad(sParcelas,3,'0');
       sReferencia   := QuotedStr(trim(sParcelas)+'/'+trim(sNumParcelas));// Deve ser a concatenação de Prestação + '/' + Prazo Tipo texto mantendo zeros à esquerda (ex.: 005/060)


       //MATRICULA NAO ENCONTRADA
       if QryAuxiliar.eof then
       begin
          sIdPessoa    := '1';
          sIdTitular   := '1';
          sIdPlanoPrev := '0';
       end
       else
       //MATRICULA ENCONTRADA
       begin
               //MAIS DE UM REGISTRO PARA A MESMA MATRICULA ENCONTRADO
               if QryAuxiliar.RecordCount > 1 then
               begin
                       sSql := '';
                       sSql := sSql + ' SELECT BF.IDPESSOA, BF.IDTITULAR, MIN(BF.IDPLANOPREV) IDPLANOPREV';
                       sSql := sSql + ' FROM BENEFBFCIARIO BF';
                       sSql := sSql + ' WHERE IDPESSOA = (SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA = '''+sMatricula+''')';
                       sSql := sSql + ' AND BF.IDSITBENEFICIO = 1';
                       sSql := sSql + ' AND BF.IDTPPAGTOBENEFIC = 1 AND';
                       sSql := sSql + ' BF.FONTEPAGADORA =';
                       sSql := sSql + ' (SELECT MIN(B2.FONTEPAGADORA)';
                       sSql := sSql + ' FROM BENEFBFCIARIO B2';
                       sSql := sSql + ' WHERE B2.IDPLANOPREV = BF.IDPLANOPREV AND';
                       sSql := sSql + ' B2.IDTITULAR = BF.IDTITULAR AND B2.IDPESSOA = BF.IDPESSOA)';
                       sSql := sSql + ' GROUP BY BF.IDPESSOA, BF.IDTITULAR';

                       QryAuxiliar.Close;
                       QryAuxiliar.Sql.Text := sSql;
                       QryAuxiliar.Open;

                       sIdPessoa    := QryAuxiliar.FieldValues['IDPESSOA'];
                       sIdTitular   := QryAuxiliar.FieldValues['IDTITULAR'];
                       sIdPlanoPrev := QryAuxiliar.FieldValues['IDPLANOPREV'];
               end
               else
               begin
                       //MATRICULA ENCONTRADA PARA AVERBACAO
                       sIdPessoa    := QryAuxiliar.FieldValues['IDPESSOA'];
                       sIdTitular   := QryAuxiliar.FieldValues['IDTITULAR'];
                       sIdPlanoPrev := QryAuxiliar.FieldValues['IDPLANOPREV'];
               end;
       end;

       //PROVDESC.CODPROVDESC
       // FAZER AJUSTE PARA A TABELA RUBRICAXPESS !!!!!!!!!!!!!!!!!!!
       sSql := '';
       sSql := sSql + ' SELECT NVL(codprovdesc,''08180'') codprovdesc,descricao';
       sSql := sSql + ' FROM   provdesc';
       sSql := sSql + ' WHERE  idprovento = ' +QuotedStr(sIdRubImp) ;

       QryAuxiliar.Close;
       QryAuxiliar.Sql.Text := sSql;
       QryAuxiliar.Open;

       if (not QryAuxiliar.Eof) then
       begin
               sDescricaoProv   := QryAuxiliar.FieldValues['descricao'];
               sCodProvDesc     := QryAuxiliar.FieldValues['codprovdesc'];
       end
       else
       begin
              // mmObs.Lines.Add('Rubrica (Cód. Interno: '+sIdRubImp+') não parametrizada!');
            //   inc(iRejeitada);
            //   continue;
       end;



       // verifico na elegpatro e depentit se existe a pessoa cadastrada
       ssql := ' SELECT TMP.IDPESSOA, TMP.IDPESSJUR, TMP.DATADEMISSAO, TMP.ORDENA '+
               ' FROM (SELECT IDPESSOA, IDPESSJUR, DATADEMISSAO, 1 ORDENA         '+
               ' FROM ELEGPATRO                                                   '+
               ' WHERE MATRICULA = '+QuotedStr(sMatricula) + '                    '+
               ' UNION ALL                                                        '+
               ' SELECT DISTINCT IDPESSOA,                                        '+
               '         NULL     AS IDPESSJUR,                                   '+
               '         NULL     AS DATADEMISSAO,                                '+
               '         2        ORDENA                                          '+
               ' FROM DEPENTIT                                                    '+
               ' WHERE MATRICULA = '+QuotedStr(sMatricula)+' ) TMP                '+
               ' ORDER BY ORDENA                                                  ';

       qryAux.close;
       qryAux.sql.Clear;
       qryAux.sql.Add(ssql);
       qryAux.open;
       // caso exista a matricula na elegpatro verifica se existe a mesma na depentit
       IF not(qryAux.isempty) then
       begin
          if trim(sIdPessJur) = '' then
             sidpessjur  := qryAux.FieldByName('IDPESSJUR').AsString;

          sidpessoa   := qryAux.FieldByName('IDPESSOA').AsString;

          //verifica se o arquivo já foi importado
          if (VerificaImportArquivo(qryLote.FieldByName('IDLOTE').asstring)) and (bVerificaControle)  then
          begin
             MessageDlg('O arquivo já foi importado.', mtInformation, [mbOK], 0);
             mmObs.Lines.Add('ERRO: O arquivo já foi importado');
             bbtnDesfazer.Enabled := true;
             frmAguarde.Apaga;
             ABORT;
          end;
          bVerificaControle := false; // variavel criada para que a verificação do arquivo seja feita apenas na primeira vez que passar no while
          // trazer o titular e a matricula da depentit
          {ssql := 'SELECT IDTITULAR, NVL(MATRICULA,0) AS MATRICULA '+
                  'FROM   DEPENTIT '+
                  'WHERE  IDPESSOA = '+ sidpessoa;

          qryAux.close;
          qryAux.sql.Clear;
          qryAux.sql.Add(ssql);
          qryAux.open;
          // apos trazer os registros fazer as verificações de averbado ou não averbado referentes
          // a depentit
          IF not(qryAux.isempty) then
          begin
             sidtitular  := qryAux.FieldByName('IDTITULAR').AsString;
             //sCodAverbacao de acordo com as verificações especificadas no documento
             if qryAux.FieldByName('MATRICULA').AsString <>  sMatricula then
             begin
                sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' esta diferente da matricula cadastrada no sistema.|';
                inc(iRejeitada);
                continue;
             end;
             if qryAux.FieldByName('MATRICULA').Asfloat =  0  then
             begin
                sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' esta zerada no sistema.|';
                inc(iRejeitada);
                continue;
             end;
          end;}
       end;
      // busca a situação do participante e o plano ativo
      ssql := 'SELECT PPP.IDSITPART, '+
              '       PPP.IDPLANOPREV, '+
              '       SP.FLGINTERNO '+
              'FROM   PARTPREVPLAN PPP, '+
              '       SITPART SP '+
              'WHERE  SP.IDSITPART      =  PPP.IDSITPART '+
              'AND    PPP.FLGDESATIVADO =  0 '+
              'AND    PPP.IDPESSOA      = '+ sIdTitular;
      qryAux.close;
      qryAux.sql.Clear;
      qryAux.sql.Add(ssql);
      qryAux.open;


       // verifico na elegpatro e depentit se existe a pessoa cadastrada
       ssql := ' SELECT DISTINCT IDPESSOA                                        '+
               ' FROM DEPENTIT                                                   '+
               ' WHERE IDPESSOA = IDTITULAR  AND                                 '+
               ' MATRICULA = '+QuotedStr(sMatricula);
       qryAuxiliar.close;
       qryAuxiliar.sql.Clear;
       qryAuxiliar.sql.Add(ssql);
       qryAuxiliar.open;

       if not(qryAuxiliar.isempty) then
       begin

          if not(qryAux.isempty) then
          begin
             //sidplanoprev := qryAux.FieldByName('IDPLANOPREV').AsString
          end
          else
          begin
             // procurar o danado na partprevplan
             sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' esta como cancelada no sistema.|';
             inc(iRejeitada);
             continue;
          end;
          // verificar a situação do participante se ele vier como aposentado e estiver como ativo criticar
          sSitPart :=  inttostr(strtoint((copy(linha,2,10))));

          // verificar se o retorno do arquivo é aposentado = 101 e se o retorno do sistema flginterno =  'AS'  aposentado
          // participante com situação cancelada
          if (qryAux.FieldByName('FLGINTERNO').AsString = 'CA') then
          begin
             sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' esta como cancelada no sistema.|';
             inc(iRejeitada);
             continue;
          end
          else // participante aposentado no arquivo e ativo no sistema
          if (sSitPart  = '102') and (qryAux.FieldByName('FLGINTERNO').AsString <> 'AS') then
          begin
             sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' esta como aposentado no arquivo e ativo no sistema.|';
             inc(iRejeitada);
             continue;
          end
          else // participante ativo no arquivo e aposentado no sistema
          if (sSitPart  = '101') and (qryAux.FieldByName('FLGINTERNO').AsString = 'AS') then
          begin
             sMotivoRejeicao := sMotivoRejeicao +'   Motivo da Rejeição: A Matricula '+sMatricula+' esta como ativo no arquivo e aposentado no sistema.|';
             inc(iRejeitada);
             continue;
          end;

       end;

       //PROVDESC.CODPROVDESC
       // FAZER AJUSTE PARA A TABELA RUBRICAXPESS !!!!!!!!!!!!!!!!!!!
       sSql := '';
       sSql := sSql + ' SELECT NVL(codprovdesc,''08180'') codprovdesc,descricao';
       sSql := sSql + ' FROM   provdesc';
       sSql := sSql + ' WHERE  idprovento = ' + sIdRubImp;

       QryAuxiliar.Close;
       QryAuxiliar.Sql.Text := sSql;
       if sIdRubImp <> '' then
          QryAuxiliar.Open;

       if (not QryAuxiliar.Eof) then
       begin
          sDescricaoProv   := QryAuxiliar.FieldValues['descricao'];
          sCodProvDesc     := QryAuxiliar.FieldValues['codprovdesc'];
       end
       else
       begin
          //mmObs.Lines.Add('Rubrica (Cód. Interno: '+sIdRubImp+') não parametrizada!');
          //inc(iRejeitada);
          ///continue;
       end;


       // trata as variaveis
//       if trim(sCodTipRecDes) = '' then
//          sCodTipRecDes := 'NULL';
       if trim(sCodCentroRespon) = '' then
          sCodCentroRespon := 'NULL';
       if trim(sPlaContaC) = '' then
          sPlaContaC := 'NULL';
       if trim(sValDeb) = '' then
          sValDeb := '0';
       if trim(dtVenc) = '' then
          dtVenc := 'NULL';
       if trim(sCodProvDesc) = '' then
          sCodProvDesc := '';


       {// rubrica para lançamento tanto para ativo quanto para assistido
       ssql := 'SELECT IDPROVENTO '+
               'FROM   PROVDESC PD  '+
               'WHERE  PD.CODPROVDESC IN (''135804'', ''235804'', ''335804'', ''435804'') '+
               'AND    PD.FLGATRASODEVOL     =   ''N''';
       qryAux.close;
       qryAux.sql.Clear;
       qryAux.sql.Add(ssql);
       qryAux.open;

       if not(qryAux.isempty) then
          sIdRubImp := qryAux.FieldByName('IDPROVENTO').AsString; }

       sSql := ' SELECT IDPESSOA  FROM PREVIA '+
               ' WHERE IDPESSOA    = '+sidpessoa+
               ' AND IDRUBRICA   = '+sIdRubImp+
               ' AND MESCOBRANCA = '+vChaveMes+
               ' AND MES         = '+vChaveMesRefer;
       qryAux.close;
       qryAux.sql.Clear;
       qryAux.sql.Add(ssql);
       qryAux.open;

       if not(qryAux.isempty) then
       begin
          MessageDlg('O arquivo selecionado já foi importado.', mtInformation, [mbOK], 0);
          txArqEnt.Text:= '';
          Abort;
       end;

       if qryLote.FieldByName('IDLOTE').asstring <> '0' then
          sidLote := qryLote.FieldByName('IDLOTE').asstring
       else
          sidLote := 'NULL';

       // inserir na estrutura tmpdesc
       inc(iImportada);
       ssqlTmpdesc:='INSERT INTO TMPDESC (IDTMPDESC, '+
                                         'IDPESSJUR, '+
                                         'IDPLANOPREV, '+
                                         'IDTITULAR, '+
                                         'IDPESSOA, '+
                                         'NODOCUMENTO, '+
                                         'IDFAVORECIDO, '+
                                         'IDPROVENTO, '+
                                         'MATRICULA, '+
                                         'INSCRICAONUMERO, '+
                                         'MESCOBRANCA, '+
                                         'MESREFERENCIA, '+
                                         'DESCRICAO, '+
                                         'FLGTIPODESC, '+
                                         'VALOR, '+
                                         'VALORINFO, '+
                                         'IDFUNDACAO, '+
                                         'IDEMPRESA, '+
                                         'ORDEM, '+
                                         'FLGDESCONTO, '+
                                         'FLGDESCFOLHA, '+
                                         'SISTORIGEM, '+
                                         'FLGATRASODEVOL, '+
                                         'IDMODULO, '+
                                         'SITENVIO, '+
                                         'IDLOTE, '+
                                         'DATACOBRANCA, '+
                                         'DATAREFERENCIA, '+
                                         'CODTIPRECDES, '+
                                         'PLACONTAC, '+
                                         'PLACONTAD, '+
                                         'PLANO, '+
                                         'RECPAG, '+
                                         'UNIDNEGOC, '+
                                         'CODCENTRORESPON, '+
                                         'REFERENCIA, '+
                                         'PARCELA, '+
                                         'NUMPARCELAS, '+
                                         'CODPROVDESC, '+
                                         'IDSEQINTERNOFB '+
                              ') VALUES (';
                                         //IDTMPDESC
                                         lidseq:=LeUltRegistro(nil,'TMPDESC');
                                         sSqlTmpDesc := sSqlTmpDesc + IntToStr(lidseq) + ', ';
                                         //IDPESSJUR
                                         ssqlTmpdesc:=ssqlTmpdesc+sidpessjur+', ';
                                         //IDPLANOPREV
                                         ssqlTmpdesc:=ssqlTmpdesc+sidplanoprev+', ';
                                         //IDTITULAR
                                         ssqlTmpdesc:=ssqlTmpdesc+sidtitular+', ';
                                         //IDPESSOA, NODOCUMENTO, IDFAVORECIDO,
                                         ssqlTmpdesc:=ssqlTmpdesc+sidpessoa+', ''' + sCPF + ''', '+sIdFavorecido+', ';
                                         //IDPROVENTO, MATRICULA, INSCRICAONUMERO,
                                         ssqlTmpdesc:=ssqlTmpdesc+sIdRubImp+', '+QuotedStr(sMatricula)+', '+sMatricula+', ';
                                         //MESCOBRANCA, MESREFERENCIA, DESCRICAO
                                         ssqlTmpdesc:=ssqlTmpdesc+vChaveMes+', '+vChaveMesRefer+', '+QuotedStr(sDescricaoProv)+', ';

                                         //FLGTIPODESC
                                         ssqlTmpdesc:=ssqlTmpdesc+QuotedStr('C')+', ';
                                         //VALOR
                                         ssqlTmpdesc:=ssqlTmpdesc+ QuotedStr(sValDeb) +', ';
                                         //VALORINFO
                                         ssqlTmpdesc:=ssqlTmpdesc+'0, ';
                                         //IDFUNDACAO, IDEMPRESA, ORDEM, FLGDESCONTO,
                                         ssqlTmpdesc:=ssqlTmpdesc+'1, 1, '+sIdentf+', 1, ';
                                         //FLGDESCFOLHA
                                         ssqlTmpdesc:=ssqlTmpdesc+QuotedStr(sFlgDescFolha)+', ';
                                         //SISTORIGEM, FLGATRASODEVOL,
                                         ssqlTmpdesc:=ssqlTmpdesc+sSistOrigem+', '+QuotedStr('N')+', ';
                                         //IDMODULO, SITENVIO
                                         ssqlTmpdesc:=ssqlTmpdesc+sIdModulo+', ''0'', ';
                                         //IDLOTE
                                         ssqlTmpdesc:=ssqlTmpdesc+sidLote+', ';
                                         // DATACOBRANCA,DATAREFERENCIA
                                         ssqlTmpdesc:=ssqlTmpdesc+dtVenc+', '+QuotedStr(sdtMovimento)+', ';
                                         // CODTIPRECDES, PLACONTAC, PLACONTAD, PLANO, RECPAG,  UNIDNEGOC
                                         ssqlTmpdesc:=ssqlTmpdesc+ QuotedStr(LPAD(sCodTipRecDes,7,'0'))+', '+ sPlaContaC +', NULL, '+sPlanoContab+', '+QuotedStr('P')+', -1, '; // Andre Imakawa - SIG 114231
                                         // CODCENTRORESPON        LPAD(STRING,TAM,CARACTER_A_COMPLETAR)
                                         ssqlTmpdesc:=ssqlTmpdesc+sCodCentroRespon+', ';
                                         // REFERENCIA, PARCELA, NUMPARCELA,
                                         ssqlTmpdesc:=ssqlTmpdesc+sReferencia+', '+QuotedStr(sParcelas)+', '+QuotedStr(sNumParcelas)+', '+QuotedStr(sCodProvDesc)+', ';
                                         // SEQINTERNOFB
                                         //lidseq:=LeUltRegistro(nil,'SEQINTERNOFB');
                                         ssqlTmpdesc:=ssqlTmpdesc+('NULL')+') ';

       qryAux.close;
       qryAux.sql.Clear;
       qryAux.sql.Add(ssqlTmpdesc);
       try
          qryAux.execsql;
          sMotivoRejeicao := sMotivoRejeicao +'   Matricula '+sMatricula+' Averbado no Lote '+qryLote.FieldByName('DESCRICAO').asstring+' com sucesso!|';
       except
          sMotivoRejeicao := sMotivoRejeicao +'   ERRO ao inserir na TMPDESC.|';
       end;


    end;
  end;
  Closefile(f); //fecha o handle de arquivo

  mmObs.Lines.Add('');
  mmObs.Lines.Add('   Quantidade de Matriculas Importadas: '+inttostr(iImportada));

  mmObs.Lines.Add('');
  mmObs.Lines.Add('   Quantidade de Matriculas Rejeitadas: '+ inttostr(iRejeitada));

  mmObs.Lines.Add('');
  while length(sMotivoRejeicao) > 0 do
  begin

     sMensage        := copy(sMotivoRejeicao,1,(pos('|',sMotivoRejeicao)-1));

     mmObs.Lines.Add(sMensage);

     sMotivoRejeicao := copy(sMotivoRejeicao,(pos('|',sMotivoRejeicao)+1),length(sMotivoRejeicao));

  end;
  ssql := 'SELECT SYSDATE '+
          'FROM   DUAL ';
  qryAux.close;
  qryAux.sql.Clear;
  qryAux.sql.Add(ssql);
  qryAux.open;
  mmObs.Lines.Add('');
  mmObs.Lines.Add('   Término do Processo: '+formatdatetime('dd/mm/yyyy hh:mm:ss',qryAux.FieldByName('SYSDATE').asdatetime));


end;

procedure TFrmFinancHabitacional.processodesfazer;
var lidseq, iImportada, iRejeitada
    : integer;
    f, t :TextFile;
    linha,
    ssql, ssqlTmpdesc, sidpessjur, sidplanoprev, sidtitular,sRegistro,
    sidpessoa, sIdRubImp,
    // variaveis usadas no tipo de registro 2 funcionario
    sMatricula, sSitPart, sMotivoRejeicao, sMensage
    : string;
begin
   mmObs.Lines.Clear;
   ssql := 'SELECT SYSDATE '+
           'FROM   DUAL ';
   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.Add(ssql);
   qryAux.open;
   mmObs.Lines.Add('');
   mmObs.Lines.Add('   Início do Processo: '+formatdatetime('dd/mm/yyyy hh:mm:ss',qryAux.FieldByName('SYSDATE').asdatetime));

   // rubrica para lançamento tanto para ativo quanto para assistido
   {ssql := 'SELECT IDPROVENTO '+
           'FROM   PROVDESC PD  '+
           'WHERE  PD.CODPROVDESC IN (''135804'', ''235804'', ''335804'', ''435804'') '+
           'AND    PD.FLGATRASODEVOL     =   ''N''';
   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.Add(ssql);
   qryAux.open;

   if not(qryAux.isempty) then
      sIdRubImp := qryAux.FieldByName('IDPROVENTO').AsString; }





   // pessoa rubrica etc..
   ssqlTmpdesc:=' DELETE FROM  TMPDESC '+
                ' WHERE  IDPROVENTO in (38967,38968,39123,8180)'+
                ' AND    MESCOBRANCA = '+vChaveMes+
                ' AND    MESREFERENCIA = '+vChaveMesRefer;

   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.Add(ssqlTmpdesc);
   qryAux.execsql;

   mmObs.Lines.Add('');
   mmObs.Lines.Add('   Quantidade de Matriculas Desfeitas: '+inttostr(qryAux.RowsAffected));


   ssql := 'SELECT SYSDATE '+
           'FROM   DUAL ';
   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.Add(ssql);
   qryAux.open;
   mmObs.Lines.Add('');
   mmObs.Lines.Add('   Fim do Processo: '+formatdatetime('dd/mm/yyyy hh:mm:ss',qryAux.FieldByName('SYSDATE').asdatetime));


end;


procedure TFrmFinancHabitacional.HabilitaDesabilitaCampos(Status : boolean);
begin
  DbcMesReferencia.Enabled    := Status;
  SpdAnoReferencia.Enabled    := Status;
//  EdtValor.Enabled            := Status;
  txArqEnt.Enabled            := Status;
  btnAbreArqEnt.Enabled       := Status;
end;

procedure TFrmFinancHabitacional.FormCreate(Sender: TObject);
var
  sSql, sHoje, sDataI, sDataF, sDataAux, sMes : string;
  i, iCont, iContAux, iMes, iAno : integer;
begin
  inherited;
  DateSeparator := '/';
  ShortDateFormat:= 'dd/mm/yyyy';
  LongDateFormat := 'dd/mm/yyyy hh:nn:ss.zzz';
  LongTimeFormat:= 'hh:nn:ss.zzz';

  HabilitaDesabilitaCampos(true);
  bbtnCancelar.enabled       := false;
  bbtnConfirmar.Enabled      := false;
  bbtnGeraArqSaida.Enabled   := false;
  bbtnDesfazer.Enabled       := false;
  bbtnAjuda.enabled          := false;

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

  iAno := strtoint(copy(sHoje, 7,4));
  iMes := strtoint(copy(sHoje, 4,2));

  if iMes < 10 then begin
    sMes := '0' + inttostr(iMes)
  end else begin
    sMes := inttostr(iMes);
  end;

  if iMes >= 13 then begin
    SpdAnoReferencia.Value := strtoint(copy(sHoje, 7,4)) + 1;
    sMes := '01';
  end;
  SpdAnoReferencia.Value    := iAno;
  SpdAno.Value              := iAno;
  DbcMes.KeyValue           := sMes;
  DbcMesReferencia.KeyValue := sMes;
  DbcMesReferenciaClick(self);
end;

procedure TFrmFinancHabitacional.FormShow(Sender: TObject);
var   vChaveMes, vChaveMesRefer : variant;
      sSql, sIdRubImp: string;
begin
  inherited;
  qryMes.Open;
  qryMesReferencia.Open;
  //qryRubrica.Open;
  //qryPortadorForma.Open;
end;

procedure TFrmFinancHabitacional.btnAbreArqEntClick(Sender: TObject);
begin
   inherited;
   {if DbcLote.Text = 'Inexistente' then
   begin
     MessageDlg('É necessário escolher o Lote.', mtInformation, [mbOK], 0);
     Exit;
   end;}

   if dlgAbreArq.Execute then begin
      txArqEnt.Text:= dlgAbreArq.FileName;
   end;
   // apos selecionar o arquivo de entrada habilitar o botão processar
   if txArqEnt.Text <> '' then
   begin
      bbtnConfirmar.Enabled := true;
      bbtnGeraArqSaida.Enabled := true;
      bbtnCancelar.Enabled := true;
   end;

   //verifica se o arquivo já foi importado
   bbtnDesfazer.Enabled := (VerificaImportArquivo(qryLote.FieldByName('IDLOTE').asstring));

end;

procedure TFrmFinancHabitacional.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmFinancHabitacional.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   frmAguarde.Mostra('Aguarde... Processando Arquivo.');
   {if DbcLote.Text = 'Inexistente' then
   begin
     MessageDlg('É necessário escolher o Lote.', mtInformation, [mbOK], 0);
     frmAguarde.Apaga;
     Exit;
   end; }

   if txArqEnt.Text = '' then
   begin
     MessageDlg('É necessário selecionar o arquivo de entrada.', mtInformation, [mbOK], 0);
     frmAguarde.Apaga;
     Exit;
   end;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   bbtnCancelar.Enabled := true;
   InsereTmpDesc();

   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

   bbtnDesfazer.Enabled     := true;
   bbtnGeraArqSaida.Enabled := true;
   frmAguarde.Apaga;
   bbtnCancelar.Enabled := false;
end;

procedure TFrmFinancHabitacional.bbtnDesfazerClick(Sender: TObject);
var
  //vChaveMes, vChaveMesRefer : variant;
  sRegistro, linha, sSql, sIdRubImp: string;
  f, t :TextFile;

begin
   inherited;
   if MessageDlg('Deseja desfazer a importação?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
   begin
      frmAguarde.Mostra('Aguarde... Desfazendo Importação de Arquivo.');
      // desfazer a importação

      vChaveMes := DbcMes.KeyValue;
      vChaveMes := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMes + '''';

      vChaveMesRefer := DbcMes.KeyValue;
      vChaveMesRefer := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMesRefer + '''';

      AssignFile(f,txArqEnt.Text);
      Reset(f); //abre o arquivo para leitura;
      //rewrite(t); //abre o arquivo para escrita

      While not eof(f) do
      begin
         Readln(f,linha); //le do arquivo e desce uma linha. O conteúdo lido é transferido para a variável linha
         sRegistro                := trim(copy(linha,1,1));
         if sRegistro = 'H' then
         begin
            if not(QuotedStr(trim(copy(linha,34,4 ))+'/'+trim(copy(linha,32,2 )))  =   vChaveMes) then
            begin
               MessageDlg('O arquivo de entrada não é do mês selecionado.', mtInformation, [mbOK], 0);
               txArqEnt.Text:= '';
               frmAguarde.Apaga;
               Abort;
            end;
         end;
         continue;
      end;
      Closefile(f); //fecha o handle de arquivo
      // rubrica para lançamento tanto para ativo quanto para assistido
      ssql := 'SELECT IDPROVENTO '+
              'FROM   PROVDESC PD  '+
              'WHERE  PD.CODPROVDESC IN (''135804'', ''235804'', ''335804'', ''435804'') '+
              'AND    PD.FLGATRASODEVOL     =   ''N''';
      qryAux.close;
      qryAux.sql.Clear;
      qryAux.sql.Add(ssql);
      qryAux.open;

      if not(qryAux.isempty) then
         sIdRubImp := qryAux.FieldByName('IDPROVENTO').AsString;



      sSql := ' SELECT IDPESSOA  FROM PREVIA '+
              ' WHERE IDRUBRICA = '+sIdRubImp+
              ' AND MESCOBRANCA = '+vChaveMes+
              ' AND MES         = '+vChaveMesRefer+
              ' UNION ALL '+
              ' SELECT IDPESSOA FROM   PREVIAFOLPAG '+
              ' WHERE  IDRUBRICA   = '+sIdRubImp+
              //' AND    IDPESSOA    = '+qryAux.FieldByName('IDPESSOA').AsString+
              ' AND    MESCOBRANCA = '+vChaveMes+
              ' AND    MES         = '+vChaveMesRefer;

      qryAux.close;
      qryAux.sql.Clear;
      qryAux.sql.Add(sSql);
      qryAux.open;
      // caso a folha mensal do mes tenha sido efetivada
      if not(qryAux.isempty) then
      begin
         // se a efetivação da folha ja tenha sido executada
         MessageDlg('Não é possível desfazer o recebimento, pois a folha mensal já foi executada.', mtInformation, [mbOK], 0);
         frmAguarde.Apaga;
         exit;
      end;


      try
         // desfazer
         if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
         bbtnCancelar.Enabled := true;
         processodesfazer();

         if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      except
         // if processodesfazer then -> se tudo der certo sera dada a mensagem
         MessageDlg('Processo concluido com erros.', mtInformation, [mbOK], 0);
         bbtnCancelar.Enabled := false;
         frmAguarde.Apaga;
         exit;
      end;

      // if processodesfazer then -> se tudo der certo sera dada a mensagem
      MessageDlg('Processo concluido com sucesso.', mtInformation, [mbOK], 0);
      frmAguarde.Apaga;
      bbtnCancelar.Enabled := false;
   end;
end;

procedure TFrmFinancHabitacional.bbtnGeraArqSaidaClick(Sender: TObject);
var
  sSql: string;
begin
   inherited;
   vChaveMes := DbcMes.KeyValue;
   vChaveMes := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMes + '''';

   vChaveMesRefer := DbcMes.KeyValue;
   vChaveMesRefer := '''' + trim(inttostr(SpdAno.Value)) + '/' + vChaveMesRefer + '''';

   sSql := 'SELECT * FROM HSTBENEFBFCIARIO '+
           'WHERE DTEFETPGTO    IS NOT NULL '+
           'AND   MESREFERENCIA = '+vChaveMesRefer+
           'AND   MES           = '+vChaveMes;
   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.Add(sSql);
   qryAux.open;
   // caso a folha mensal do mes não tenha sido efetivada
   if (qryAux.isempty) then
   begin
      MessageDlg('Não é possível gerar o arquivo de saida porque a folha mensal '+#13+#10+
                 'ainda não foi efetivada.', mtWarning, [mbOK], 0);
      ABORT;
   end;
   if not(VerificaImportArquivo(qryLote.FieldByName('IDLOTE').asstring)) then
   begin
      MessageDlg('O arquivo não foi importado.', mtInformation, [mbOK], 0);
      frmAguarde.Apaga;
      ABORT;
   end;
   GeraArqSaida();

end;

procedure TFrmFinancHabitacional.DbcMesReferenciaClick(Sender: TObject);
begin
  inherited;
  FiltraLote();
end;

procedure TFrmFinancHabitacional.bbtnCancelarClick(Sender: TObject);
var
  sSql, sHoje, sDataI, sDataF, sDataAux, sMes : string;
  i, iCont, iContAux, iMes, iAno : integer;

begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback;

  txArqEnt.text := '';
  qrylote.Close;

  DateSeparator := '/';
  ShortDateFormat:= 'dd/mm/yyyy';
  LongDateFormat := 'dd/mm/yyyy hh:nn:ss.zzz';
  LongTimeFormat:= 'hh:nn:ss.zzz';

  HabilitaDesabilitaCampos(true);
  bbtnCancelar.enabled       := false;
  bbtnConfirmar.Enabled      := false;
  bbtnGeraArqSaida.Enabled   := false;
  bbtnDesfazer.Enabled       := false;
  bbtnAjuda.enabled          := false;

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

  iAno := strtoint(copy(sHoje, 7,4));
  iMes := strtoint(copy(sHoje, 4,2));

  if iMes < 10 then begin
    sMes := '0' + inttostr(iMes)
  end else begin
    sMes := inttostr(iMes);
  end;

  if iMes >= 13 then begin
    SpdAnoReferencia.Value := strtoint(copy(sHoje, 7,4)) + 1;
    sMes := '01';
  end;
  SpdAnoReferencia.Value    := iAno;
  SpdAno.Value              := iAno;
  DbcMes.KeyValue           := '';
  DbcMesReferencia.KeyValue := '';
  DbcMesReferenciaClick(self);
end;

end.
