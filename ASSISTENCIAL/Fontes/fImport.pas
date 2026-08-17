unit Fimport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  Wwquery, OpenArqText, wwdblook, Wwdatsrc, ComCtrls,  TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmImport = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    GroupBox1: TGroupBox;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dspatro: TwwDataSource;
    qryplanoprev: TwwQuery;
    dsplanoprev: TwwDataSource;
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qrypatro: TwwQuery;
    qrybenefass: TwwQuery;
    posicao: TProgressBar;
    qryArq: TwwQuery;
    Panel2: TPanel;
    Label4: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    OpenArq: TOpenArqText;
    Memo1: TMemo;
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure wwDBLookupCombo3Click(Sender: TObject);
    procedure wwDBLookupCombo3MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure wwDBLookupCombo2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure wwDBLookupCombo2Enter(Sender: TObject);
    procedure wwDBLookupCombo3Change(Sender: TObject);
    procedure lematricula(var sMatricula : string )  ;
    procedure wwDBLookupCombo1Change(Sender: TObject);
    procedure qryplanoprevBeforeOpen(DataSet: TDataSet);
    procedure gravatexto( slinha : string ) ;
    procedure FormDeactivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
  smat : string;
  sbenef : string;
  numlinha : integer;
  fname : string;
  f : textfile;

    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation

uses FCadEventAss;

{$R *.DFM}

procedure TfrmImport.bbtnOkClick(Sender: TObject);
var sLinha : string;
    sMatricula,sData,sValPago,sDataEvento,sTipoEvento : string;
    iIdPessoa,iIdPessJur,
    IdContPrev,iIdplanass,iIdplanoprev,iIddependente : integer;
    contador : integer;
begin
  inherited;
  {limpa as linhas do memo1 que vai alimentar o arquivo de inconsistências
   que será gerado ao final da leitura}
  memo1.Lines.clear;

  if wwDBLookupCombo1.text = '' then
  begin
       showmessage('É preciso selecionar uma patrocinadora !');
       exit;
  end;

  if wwDBLookupCombo3.text = '' then
  begin
       showmessage('É preciso selecionar um plano previdenciário !');
       exit;
  end;

  if wwDBLookupCombo2.text = '' then
  begin
       showmessage('É preciso selecionar um plano assistencial !');
       exit;
  end;

  if wwDBLookupCombo4.text = '' then
  begin
       showmessage('É preciso selecionar o layout do arquivo de entrada !');
       exit;
  end;


  openArq.IdArq := qryArq.FieldByName('IdArq').AsInteger;

  OpenArq.execute;
  if openarq.abrearquivo('L') = false  then
  begin
       showmessage('O arquivo escolhido e o layout não são compatíveis !');
       exit;
  end;

  iIdplanass := qryplanass.fieldbyname('idplanass').AsInteger;
  iIdplanoprev := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
  iIdpessjur := qrypatro.fieldbyname('idpessoa').AsInteger;

  {Este objeto herda do TOpenDialog. Além das propriedades do TOpenDialog
  ele possui as seguintes propriedades e métodos :

  Propriedades :
  ------------
  IdArq - identificador do arquivo no cadastro do interface de arquivos.
          Esta propriedade deve ser preenchida antes da utilização de
          qualquer método de leitura.

  Query - query para utilização do componente. Basta ligá-la a uma
          query que esteja ligada ao banco de dados correto. Não precisa
          abrir esta query.

  Eof   - propriedade read-only que indica o fim de arquivo.

  Métodos :
  -------

  function LeLinha : string;
        - Método que lê e retorna a próxima linha do arquivo.

  function LeCampo(nomeCampo : string) : string;
        - Método que recebe o nome do metacampo e retorna o conteúdo
          dele na última linha lida.

  function ArquivoValido : boolean;
        - Método que testa se o arquivo preenchido na propriedade
          FileName está consistente com o arquivo referenciado na
          propriedade IdArq.

  function EscreveLinha(linha : string) : boolean;
        - Método que recebe uma linha e escreve no arquivo indicado
          na propriedade FileName

  Como proceder :
  -------------

  Chamar o método Execute do TOpenArqText. Este método fará com que
  o usuário indique o arquivo texto desejado. Este arquivo terá seu
  nome guardado na propriedade FileName.

  Preencher a propriedade IdArq.

  Chamar o método ArquivoVálido. Se falso,  parar processamento.
  Se verdadeiro, enquanto não for fim de arquivo ,processar arquivo.
  Exemplo :
     }

  { atribuindo ao contador o total de registros em eventass }
  qrybenefass.open;
  contador := qrybenefass.recordcount ;
  qrybenefass.close;

{ percorrendo o arquivo texto selecionado}
  while not openArq.EOF do
  begin

      if posicao.position = 1000 then posicao.position := 0;
      posicao.position := posicao.position + 1;

      // Ler linha
      sLinha := openArq.LeLinha;

      // Ler campos da linha corrente
      sMatricula := openArq.LeCampo('Matricula');
      sData := openArq.LeCampo('DataPagamento');
      sValPago := openArq.LeCampo('ValorPago');
      sDataEvento := openArq.LeCampo('DataEvento');
      sTipoEvento := openArq.lecampo('TipoEvento');




      if (Trim(sMatricula) = '') and (Trim(sData) = '') or
         (Trim(sValPago) = '')
      then
      begin
           gravatexto(slinha);
           continue;
      end
      else begin  {Processar campos}
         // Procurar participante
         with qryAux do
         begin

            lematricula(sMatricula);

           { busca a pessoa pela matricula lida }
            Close;
            SQL.Clear;
            SQL.Add(' SELECT IDPESSOA,IDPESSJUR FROM ELEGPATRO '+
                    ' WHERE (MATRICULA ='''+Trim(sMat)+''')'+
                    ' AND   (IDPESSJUR ='+qrypatro.fieldbyname('idpessoa').AsString+')');
            Open;
            if IsEmpty
            then begin
               //memErro.Lines.Add(sLinha);
               //bInconsist := True;
            end;
            iIdPessoa := FieldByName('IdPessoa').AsInteger;
            //iIdpessjur := Fieldbyname('Idpessjur').AsInteger;

            if sbenef = '' then
            begin
               gravatexto(slinha);
               continue;
            end;

            { verifica se os dados estão concistentes , e busca um dependente }
            qryaux.close;
            qryaux.sql.clear;
            qryaux.sql.add(' SELECT BE.* FROM BENEFASS BE , DEPENTIT WHERE '+
                           ' (BE.IDPESSJUR = '+inttostr(iIdpessjur)+ ') AND '+
                           ' (BE.IDTITULAR = '+inttostr(iIdpessoa)+ ') AND '+
                           ' (BE.IDPLANASS = '+inttostr(iIdplanass)+')  AND '+
                           ' (BE.IDPLANOPREV = '+inttostr(iIdplanoprev)+') AND '+
                           ' (DEPENTIT.IDTITULAR = BE.IDTITULAR) AND '+
                           ' (DEPENTIT.IDPESSOA = BE.IDDEPENDENTE) AND '+
                           ' (DEPENTIT.NUMSEQUENCIA = '+inttostr(strtoint(trim(sbenef)))+')');

            qryaux.open;

            if qryaux.IsEmpty then
            begin
               gravatexto(slinha);
               continue;

            end;

            //iIdPlanass := qryaux.fieldbyname('idplanass').AsInteger;
            //iIdplanoprev := qryaux.fieldbyname('idplanoprev').AsInteger;
            iIddependente := qryaux.fieldbyname('iddependente').AsInteger;

            if (iIdplanass =0) or (iIdplanoprev =0) or (iIddependente =0)  then
            begin
              gravatexto(slinha);
              continue;
            end;

            { testa se o plano assistencial tem o serviço }
            qryaux.close;
            qryaux.sql.clear;
            qryaux.sql.add(' SELECT IDSERVASS FROM SERVPLANASS WHERE '+
                           ' (IDPLANASS = '+inttostr(iIdplanass)+')');


            qryaux.open;

            if qryaux.IsEmpty then
            begin
               gravatexto(slinha);
               continue;
            end;

            { testar a duplicidade do evento }
            qryaux.close;
            qryaux.sql.clear;
             qryaux.sql.add(' SELECT IDSERVASS FROM EVENTASS WHERE '+
                           ' (IDPESSJUR = '+inttostr(iIdpessjur)+ ') AND '+
                           ' (IDTITULAR = '+inttostr(iIdpessoa)+ ') AND '+
                           ' (IDPLANASS = '+inttostr(iIdplanass)+')  AND '+
                           ' (IDPLANOPREV = '+inttostr(iIdplanoprev)+') AND '+
                           ' (IDDEPENDENTE = '+inttostr(iIddependente)+') AND '+
                           ' (DATAEVENT = TO_DATE('''+sDataEvento+''',''DDMMYY'')) AND '+
                           ' (IDSERVASS = '+sTipoEvento+')');
            qryaux.open;

            if not qryaux.IsEmpty then
            begin
               gravatexto(slinha);
               continue;
            end;

            {Inserido o evento lido na tabela de eventos }
            qryaux.close;
            qryaux.sql.clear;
            qryaux.sql.add(' INSERT INTO EVENTASS (IDPLANASS,IDPESSJUR,IDTITULAR,IDDEPENDENTE,IDSERVASS,DATAEVENT,IDPLANOPREV,DATAPAG,VALORPAGO) '+
                           ' VALUES('+inttostr(iIdplanass)+','+inttostr(iIdpessjur)+','+inttostr(iIdpessoa)+','+inttostr(iIddependente)+','+sTipoEvento+',TO_DATE('''+sDataEvento+''',''DDMMYY''),'+inttostr(iIdplanoprev)+', TO_DATE('''+sData+''',''DDMMYY''),'+sValPago+')');
            qryaux.execsql;
            qryaux.close;

         end;
      end;
  end;


 {

  bInconsist := False;
  memErro.Lines.Add('Cadastramento de Eventos - INSCONSISTÊNCIAS');

  while not openArq.EOF do
  begin
      // Ler linha
      sLinha := openArq.LeLinha;

      // Ler campos da linha corrente
      sMatricula := openArq.LeCampo('Matricula');
      sData := openArq.LeCampo('DataReferencia');
      sValRecebido := openArq.LeCampo('ValorContrib');
      sCodContrib := openArq.LeCampo('CodContrib');

      if (Trim(sMatricula) = '') or (Trim(sData) = '') or
         (Trim(sValRecebido) = '')
      then begin
        memErro.Lines.Add(sLinha);
        bInconsist := True;
      end
      else begin { Processar campos
         with qryAux do
         begin
            Verificar se a matricula
            Close;
            SQL.Clear;
            SQL.Add(' SELECT IDPESSOA,IDPESSJUR FROM ELEGPATRO '+
                    ' WHERE MATRICULA = '+Trim(sMatricula) );
            Open;
            if IsEmpty
            then begin
               memErro.Lines.Add(sLinha);
               bInconsist := True;
            end;
            iIdPessoa := FieldByName('IdPessoa').AsInteger;
//          PAREI AQUI  =>

         end;
      end;
  end;
  if (bInconsist) and
     (MsgDlg('Ocorreram algumas insconsistências durante o processo.'+
             'Deseja visualizá-las ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes)
  then begin
    pnlRecebimento.SendToBack;
    memErro.BringToFront;
  end; }

//CLOSE;
posicao.position := 1000;
qrybenefass.open;
showmessage('Foram gerados com êxito  '+inttostr(qrybenefass.recordcount - contador)+'  registros    OBS.: Não foram inseridos '+inttostr(numlinha)+' eventos que apresentavam algum tipo de inconsistência , esses foram gravados em um arquivo texto de nome Inconsis.txt no mesmo diretório de onde foi lido o arquivo de entrada . ');
qrybenefass.close;


with FrmCadEventAssist do
begin { atualiza querys do evento }
     qrydepend.close;
     qrytit.close;
     qryevent.close;
     qryplanass.close;
     qryplanoprev.close;
     qrypatro.close;
     qrycadevent.close;

     qrycadevent.open;
     qrypatro.open;
     qryplanoprev.open;
     qryplanass.open;
     qryevent.open;
     qrytit.Open;
     qrydepend.open;


end;

{ grava o conteúdo do memo1 em um arquivo chamado inconsis.txt onde estão os
  registros onde tinham erros , e não puderam ser incluídos }
     fname := 'Inconsis.txt';
     assignfile(F,fname);
     rewrite(F);
     writeln(F,memo1.text);
     closefile(F);

end;

procedure TfrmImport.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
action := cafree;
end;

procedure TfrmImport.FormCreate(Sender: TObject);
begin
  inherited;
qrypatro.open;
qryarq.open;
end;

procedure TfrmImport.wwDBLookupCombo3Click(Sender: TObject);
begin
  inherited;
if wwDBLookupCombo1.text = '' then
begin
     showmessage('É preciso selecionar uma patrocinadora !');
end
else
begin
     qryplanoprev.close;
     qryplanoprev.open;

end;
end;

procedure TfrmImport.wwDBLookupCombo3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
if wwDBLookupCombo1.text = '' then
begin
     showmessage('É preciso selecionar uma patrocinadora !');
end
else
begin
     qryplanoprev.close;
     qryplanoprev.open;

end;
end;

procedure TfrmImport.wwDBLookupCombo2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
if wwDBLookupCombo3.text = '' then
begin
     showmessage('É preciso selecionar um plano previdenciário !');
end
else
begin
     qryplanass.close;
     qryplanass.open;

end;
end;





procedure TfrmImport.wwDBLookupCombo2Enter(Sender: TObject);
begin
  inherited;
if wwDBLookupCombo3.text = '' then
begin
     showmessage('É preciso selecionar um plano previdenciário !');
end
else
begin
     qryplanass.close;
     qryplanass.open;

end;
end;

procedure TfrmImport.wwDBLookupCombo3Change(Sender: TObject);
begin
  inherited;
wwDBLookupCombo2.TEXT := '';
end;

procedure TfrmImport.wwDBLookupCombo1Change(Sender: TObject);
begin
  inherited;
wwDBLookupCombo3.TEXT := '';
wwDBLookupCombo2.TEXT := '';
end;

procedure TfrmImport.qryplanoprevBeforeOpen(DataSet: TDataSet);
begin
  inherited;
qryplanoprev.parambyname('idpessoa').AsInteger := qrypatro.fieldbyname('idpessoa').AsInteger;
end;


{lê o campo matricula do arquivo , separa a matricula e o numero da sequencia do dependente ,
tomando ele como beneficiário }

procedure TfrmImport.lematricula(var sMatricula : string );
var
i : integer;
begin
          smat := '';
          sbenef := '';
          i := 1;

          while (smatricula[i] <> '/') and (smatricula[i] <> '-') and (smatricula[i] <> '%') and (smatricula <> '') do
          begin
               smat := smat + smatricula[i];
               i := i +1;
          end;

          { pula o separador }
          i := i +1 ;

          { lê a sequencia }
          while (smatricula[i] <> '') do
          begin
               sbenef := sbenef + smatricula[i];
               i := i +1 ;
          end;


end;

{ adiciona os registros que não podem ser incluídos por qualquer tipo de erro
 no memo1}
procedure TfrmImport.gravatexto( slinha : string ) ;
begin
     memo1.lines.add(slinha);
     numlinha := numlinha + 1;
end;


procedure TfrmImport.FormDeactivate(Sender: TObject);
begin
  inherited;
//action := cafree;
end;

procedure TfrmImport.bbtnConfirmarClick(Sender: TObject);
var sLinha : string;
    sMatricula,sData,sValPago,sDataEvento,sTipoEvento : string;
    rValPago : real;
    bInconsist : boolean;
    iIdPessoa,iIdPessJur,
    iIdPlanoPrev,iIdContPrev,iIdplanass,iIddependente,
    iIdMotivo : integer;
    mesRef,mesCob : string;
    contador : integer;
    preco : real;


begin
  inherited;

{limpa as linhas do memo1 que vai alimentar o arquivo de inconsistências
 que será gerado ao final da leitura}
memo1.Lines.clear;

if wwDBLookupCombo1.text = '' then
begin
     showmessage('É preciso selecionar uma patrocinadora !');
     exit;
end;

if wwDBLookupCombo3.text = '' then
begin
     showmessage('É preciso selecionar um plano previdenciário !');
     exit;
end;

if wwDBLookupCombo2.text = '' then
begin
     showmessage('É preciso selecionar um plano assistencial !');
     exit;
end;

if wwDBLookupCombo4.text = '' then
begin
     showmessage('É preciso selecionar o layout do arquivo de entrada !');
     exit;
end;


openArq.IdArq := qryArq.FieldByName('IdArq').AsInteger;

OpenArq.execute;
if openarq.abrearquivo('L') = false  then
begin
     showmessage('O arquivo escolhido e o layout não são compatíveis !');
     exit;
end;

iIdplanass := qryplanass.fieldbyname('idplanass').AsInteger;
iIdplanoprev := qryplanoprev.fieldbyname('idplanoprev').AsInteger;
iIdpessjur := qrypatro.fieldbyname('idpessoa').AsInteger;

{Este objeto herda do TOpenDialog. Além das propriedades do TOpenDialog
ele possui as seguintes propriedades e métodos :

Propriedades :
------------
IdArq - identificador do arquivo no cadastro do interface de arquivos.
        Esta propriedade deve ser preenchida antes da utilização de
        qualquer método de leitura.

Query - query para utilização do componente. Basta ligá-la a uma
        query que esteja ligada ao banco de dados correto. Não precisa
        abrir esta query.

Eof   - propriedade read-only que indica o fim de arquivo.

Métodos :
-------

function LeLinha : string;
      - Método que lê e retorna a próxima linha do arquivo.

function LeCampo(nomeCampo : string) : string;
      - Método que recebe o nome do metacampo e retorna o conteúdo
        dele na última linha lida.

function ArquivoValido : boolean;
      - Método que testa se o arquivo preenchido na propriedade
        FileName está consistente com o arquivo referenciado na
        propriedade IdArq.

function EscreveLinha(linha : string) : boolean;
      - Método que recebe uma linha e escreve no arquivo indicado
        na propriedade FileName

Como proceder :
-------------

Chamar o método Execute do TOpenArqText. Este método fará com que
o usuário indique o arquivo texto desejado. Este arquivo terá seu
nome guardado na propriedade FileName.

Preencher a propriedade IdArq.

Chamar o método ArquivoVálido. Se falso,  parar processamento.
Se verdadeiro, enquanto não for fim de arquivo ,processar arquivo.
Exemplo :
   }




{ atribuindo ao contador o total de registros em eventass }
qrybenefass.open;
contador := qrybenefass.recordcount ;
qrybenefass.close;

{ percorrendo o arquivo texto selecionado}
  while not openArq.EOF do
  begin

      if posicao.position = 1000 then posicao.position := 0;
      posicao.position := posicao.position + 1;

      // Ler linha
      sLinha := openArq.LeLinha;

      // Ler campos da linha corrente
      sMatricula := openArq.LeCampo('Matricula');
      sData := openArq.LeCampo('DataPagamento');
      sValPago := openArq.LeCampo('ValorPago');
      sDataEvento := openArq.LeCampo('DataEvento');
      sTipoEvento := openArq.lecampo('TipoEvento');




      if (Trim(sMatricula) = '') and (Trim(sData) = '') or
         (Trim(sValPago) = '')
      then
      begin
           gravatexto(slinha);
           continue;
      end
      else begin  {Processar campos}
         // Procurar participante
         with qryAux do
         begin

            lematricula(sMatricula);

           { busca a pessoa pela matricula lida }
            Close;
            SQL.Clear;
            SQL.Add(' SELECT IDPESSOA,IDPESSJUR FROM ELEGPATRO '+
                    ' WHERE (MATRICULA ='''+Trim(sMat)+''')'+
                    ' AND   (IDPESSJUR ='+qrypatro.fieldbyname('idpessoa').AsString+')');
            Open;
            if IsEmpty
            then begin
               //memErro.Lines.Add(sLinha);
               //bInconsist := True;
            end;
            iIdPessoa := FieldByName('IdPessoa').AsInteger;
            //iIdpessjur := Fieldbyname('Idpessjur').AsInteger;

            if sbenef = '' then
            begin
               gravatexto(slinha);
               continue;
            end;

            { verifica se os dados estão concistentes , e busca um dependente }
            qryaux.close;
            qryaux.sql.clear;
            qryaux.sql.add(' SELECT BE.* FROM BENEFASS BE , DEPENTIT WHERE '+
                           ' (BE.IDPESSJUR = '+inttostr(iIdpessjur)+ ') AND '+
                           ' (BE.IDTITULAR = '+inttostr(iIdpessoa)+ ') AND '+
                           ' (BE.IDPLANASS = '+inttostr(iIdplanass)+')  AND '+
                           ' (BE.IDPLANOPREV = '+inttostr(iIdplanoprev)+') AND '+
                           ' (DEPENTIT.IDTITULAR = BE.IDTITULAR) AND '+
                           ' (DEPENTIT.IDPESSOA = BE.IDDEPENDENTE) AND '+
                           ' (DEPENTIT.NUMSEQUENCIA = '+inttostr(strtoint(trim(sbenef)))+')');

            qryaux.open;

            if IsEmpty then
            begin
               gravatexto(slinha);
               continue;

            end;

            //iIdPlanass := qryaux.fieldbyname('idplanass').AsInteger;
            //iIdplanoprev := qryaux.fieldbyname('idplanoprev').AsInteger;
            iIddependente := qryaux.fieldbyname('iddependente').AsInteger;

            if (iIdplanass =0) or (iIdplanoprev =0) or (iIddependente =0)  then
            begin
              gravatexto(slinha);
              continue;
            end;

            { testa se o plano assistencial tem o serviço }
            qryaux.close;
            qryaux.sql.clear;
            qryaux.sql.add(' SELECT IDSERVASS,PRECO  FROM SERVPLANASS WHERE '+
                           ' (IDPLANASS = '+inttostr(iIdplanass)+')');


            qryaux.open;

            preco := qryaux.fieldbyname('preco').AsInteger;

            if IsEmpty then
            begin
               gravatexto(slinha);
               continue;
            end;

            { testar a duplicidade do evento }
            qryaux.close;
            qryaux.sql.clear;
            qryaux.sql.add(' SELECT IDSERVASS FROM EVENTASS WHERE '+
                           ' (IDPESSJUR = '+inttostr(iIdpessjur)+ ') AND '+
                           ' (IDTITULAR = '+inttostr(iIdpessoa)+ ') AND '+
                           ' (IDPLANASS = '+inttostr(iIdplanass)+')  AND '+
                           ' (IDPLANOPREV = '+inttostr(iIdplanoprev)+') AND '+
                           ' (IDDEPENDENTE = '+inttostr(iIddependente)+') AND '+
                           ' (DATAEVENT = TO_DATE('''+sDataEvento+''',''DDMMYY'')) AND '+
                           ' (IDSERVASS = '+sTipoEvento+')');
            qryaux.open;

            if not qryaux.IsEmpty then
            begin
               gravatexto(slinha);
               continue;
            end;

            {Inserido o evento lido na tabela de eventos }
            qryaux.close;
            qryaux.sql.clear;
            qryaux.sql.add(' INSERT INTO EVENTASS (IDPLANASS,IDPESSJUR,IDTITULAR,IDDEPENDENTE,IDSERVASS,DATAEVENT,IDPLANOPREV,DATAPAG,VALORPAGO,VALOREVENT) '+
                           ' VALUES('+inttostr(iIdplanass)+','+inttostr(iIdpessjur)+','+inttostr(iIdpessoa)+','+inttostr(iIddependente)+','+sTipoEvento+',TO_DATE('''+sDataEvento+''',''DDMMYY''),'+inttostr(iIdplanoprev)+', TO_DATE('''+sData+''',''DDMMYY''),'+sValPago+','+floattostr(preco)+')');
            qryaux.execsql;
            qryaux.close;

         end;
      end;
  end;


 {

  bInconsist := False;
  memErro.Lines.Add('Cadastramento de Eventos - INSCONSISTÊNCIAS');

  while not openArq.EOF do
  begin
      // Ler linha
      sLinha := openArq.LeLinha;

      // Ler campos da linha corrente
      sMatricula := openArq.LeCampo('Matricula');
      sData := openArq.LeCampo('DataReferencia');
      sValRecebido := openArq.LeCampo('ValorContrib');
      sCodContrib := openArq.LeCampo('CodContrib');

      if (Trim(sMatricula) = '') or (Trim(sData) = '') or
         (Trim(sValRecebido) = '')
      then begin
        memErro.Lines.Add(sLinha);
        bInconsist := True;
      end
      else begin { Processar campos
         with qryAux do
         begin
            Verificar se a matricula
            Close;
            SQL.Clear;
            SQL.Add(' SELECT IDPESSOA,IDPESSJUR FROM ELEGPATRO '+
                    ' WHERE MATRICULA = '+Trim(sMatricula) );
            Open;
            if IsEmpty
            then begin
               memErro.Lines.Add(sLinha);
               bInconsist := True;
            end;
            iIdPessoa := FieldByName('IdPessoa').AsInteger;
//          PAREI AQUI  =>

         end;
      end;
  end;
  if (bInconsist) and
     (MsgDlg('Ocorreram algumas insconsistências durante o processo.'+
             'Deseja visualizá-las ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes)
  then begin
    pnlRecebimento.SendToBack;
    memErro.BringToFront;
  end; }

//CLOSE;
posicao.position := 1000;
qrybenefass.open;
showmessage('Foram gerados com êxito  '+inttostr(qrybenefass.recordcount - contador)+'  registros    OBS.: Não foram inseridos '+inttostr(numlinha)+' eventos que apresentavam algum tipo de inconsistência , esses foram gravados em um arquivo texto de nome Inconsis.txt no mesmo diretório de onde foi lido o arquivo de entrada . ');
qrybenefass.close;


with FrmCadEventAssist do
begin { atualiza querys do evento }
     qrydepend.close;
     qrytit.close;
     qryevent.close;
     qryplanass.close;
     qryplanoprev.close;
     qrypatro.close;
     qrycadevent.close;

     qrycadevent.open;
     qrypatro.open;
     qryplanoprev.open;
     qryplanass.open;
     qryevent.open;
     qrytit.Open;
     qrydepend.open;


end;

{ grava o conteúdo do memo1 em um arquivo chamado inconsis.txt onde estão os
  registros onde tinham erros , e não puderam ser incluídos }
     fname := 'Inconsis.txt';
     assignfile(F,fname);
     rewrite(F);
     writeln(F,memo1.text);
     closefile(F);

end;

procedure TfrmImport.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;

end.
