// Alterações
{
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 168331
Kintana..: 1482898
Data.....: 05/01/2012
Rotina...: getMaiorAnoVigencia
Descrição: Foi criada uma rotina para retornar o maior Ano de Vigencia da tabela
           Informe.
********************************************************************************
N. Sol............: 132541
N. Kintana........: 767595
Data..............: 23/04/2010
Responsável.......: Arnaldo V. Scarin
Descrição.........: Correção do Select que busca os dados para geração do arquivo
                    da Dirf, que estava apresentando problemas para os codigos
                    de natureza de rendimentos 5565 e 3223, quando o beneficiario
                    tem 13o. salario
********************************************************************************
Rotina............: Principal
N. Sol............: 129737
N. Kintana........: 706853
Data..............: 04/02/2010
Responsável.......: Bruno Bastos
Descrição.........: Preencher a última coluna do registro de ação judicial.
********************************************************************************
Rotina............: Principal
N. Sol............: 127098
N. Kintana........: 672221
Data..............: 18/01/2010
Responsável.......: Marilza Colpani
Descrição.........: Correção do erro apresentado na primeira linha do arquivo texto.
                   O email da pessoa está aparecendo com os caracteres especiais. 
********************************************************************************
Rotina............: SubstCarEspeciais, CaracteresEspeciais , ListToText, Principal
N. Sol............: 125645
N. Kintana........: 649749
Data..............: 29/10/2009
Responsável.......: Marilza Colpani
Descrição.........: Criadas funções para substituir caracteres especiais na geração
                   de arquivo.
********************************************************************************
Rotina............: ListGeraDirfFUNCEF
N. Sol.............: 108580
N. Kintana......: 492447
Data...............: 11/03/2009
Responsável...: Ricardo Alves
Descrição........: Alterados hints das querys para melhoria de performance
---------------------------------------------------------------------------}

{**********************************************************************
Analista.: Henrique Massão
Pendencia: SOL 109421 KINTANA 496332
Data.....: 26/02/2009
Descrição: Alteração de gravação de arquivos de log na raiz do disco C: 
**********************************************************************}
{**********************************************************************
Analista.: Claudio Faria
Pendencia: 27026
Data.....: 31/01/2008
Rotina...: Principal
Descrição: Geração do novo layout da DIRF
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 27026
Data.....: 25/01/2008
Rotina...: ListGeraDirf, ListGeraDirfFuncef e ListGeraDirfJudicial_Suspensa
Descrição: Geração do novo layout da DIRF
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 27159
Data.....: 21/12/2007
Rotina...: ListGeraDirf, ListGeraDirfFuncef e ListGeraDirfJudicial_Suspensa
Descrição: Não filtrar nada pelo campo numdocumento da lancirrf.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19285
Data.....: 20/09/2007
Rotina...: ListGeraDirfFuncef
Descrição: Coloquei o if para condicionar o union na HstContribPrev
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24531
Data.....: 18/09/2007
Rotina...: ListGeraDirf e ListGeraDirfFuncef
Descrição: Ordenação na query por nome e cpf quando for folha de pagamento.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24505
Data.....: 29/03/2007
Rotina...: ListGeraDirf e ListGeraDirfFuncef
Descrição: Tratamento na query de valores retidos e valor de rendimentos.
**********************************************************************}
{**********************************************************************
Analista.: Flavio Dias
Pendencia:
Data.....: 14/02/2007
Rotina...:
Descrição: Acrescentar parâmetro EdPessoanotin nas Funções GeraDirf e ListaGeraDirf,
           para retirar da query da DIRF as pessoas do edit.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21576
Data.....: 08/02/2007
Rotina...: ListGeraDirfJudicial_Suspensa
Descrição: Tratar na query a troca de natureza de rendimento através do decode.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21576
Data.....: 08/02/2006
Rotina...: Principal
Descrição: Gravar registro de depósito judicial sempre com a natureza 0561.
**********************************************************************}
{**********************************************************************
Analista.: Paulo Ramos
Pendencia: 21490
Data.....: 08/02/2006
Rotina...: BuscaDadosInforme e BuscaDadosInformeMatriculas
Descrição: Filtrar por IDMODULORESPON ao invés do IDMODULO.
**********************************************************************}
{**********************************************************************
Analista.: Paulo Ramos
Pendencia: 18801
Data.....: 08/02/2006
Rotina...: Principal
Descrição: Gravar os campos DDD,Telefone, Ramal, Fax com zeros a esquerda.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21299
Data.....: 20/01/2006
Rotina...: ListGeraDirfFUNCEF
Descrição: Adicionei o filtro idmodulo = 3, quando a dirf for do contas a pagar.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20594
Data.....: 16/12/2005
Rotina...: Geral
Descrição: Todas queries que filtravam por datalancamento, passa a ter o filtro
           por datapagamento.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20460
Data.....: 19/10/2005
Rotina...: Principal
Descrição: Marcar o cds de todas as naturezas, procurar no cdsjudicial todas as
           pessoas que não estão no cds, gravar no arquivo e voltar para o ponto
           marcado no cds, para processar o restante das naturezas.
           Obs.: Melhorar este código.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20201
Data.....: 20/09/2005
Rotina...: Principal
Descrição: Gravar também as pessoas que têm apenas exigibilidade suspensa.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19161
Data.....: 04/05/2005
Rotina...: ListGeraDirfFUNCEF e ListGeraDirf
Descrição: Foi colocado no campo RazaoSocial um trim para Funcef e um Rtrim e
           Ltrim para as outras fundações, por causa da versão do Oracle na CBS.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 18801
Rotina...: Principal e ListResponsavel
Descrição: Coloquei um zero na posição 41 antes do espaço em branco e do nome da
           Fundação na rotina Principal. Na rotina ListResponsavel, coloquei o
           campo FAX com o mesmo tratamento do campo TELEFONE.
**********************************************************************}
{**********************************************************************
Analista.: Marchetti
Pendencia: 16155
Rotina...:
Descrição: Lista os registros dos mantidos que pagaram contribuição
**********************************************************************}
{**********************************************************************
Analista.: Marchetti
Pendencia: 17658
Rotina...:
Descrição: Quando os valores são negativos, devem aparecer como ZERO
**********************************************************************}
{**********************************************************************
Analista.: Marchetti
Pendencia: 17460
Rotina...: Principal
Descrição: Conforme IN 440/2004, colocado o redutor de R$100,00 nas deduções
           de agosto a Dezembro, inclusive 13º Salário
**********************************************************************}

unit uCtrlGeraDirf;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     classes, Forms,
     dbtables, mconnect, ucmFileUtils,
     uCmCustomCdbObject, ADODb, provider, {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
     uCripto, wwQuery, FProgresso;

  Type
    TCtrlGeraDirf = Class(TCmControlObject)

    private
    FMaxProgresso: Integer;
    FProgresso: Integer;
    Cds : TclientDataSet;
    cds21Normal: TclientDataSet;
    cdsDif21Normal: TclientDataSet;
    cds21Judicial: TclientDataSet;
    cdsDif21Judicial: TclientDataSet;


    CdsJudicial : TclientDataSet;
    CdsResponsavel : TclientDataSet;
    CdsEmpresa : TclientDataSet;
    protected
      procedure DoChangeDataBase; Override;
      function  ListValoresModuloDif21Normal(const iIDBenefIrrf : Extended; sCodNatureza, DataIni, DataFim : String) : OleVariant;
      function  ListValoresModulo21Normal(const iIDBenefIrrf : Extended; sCodNatureza,DataIni, DataFim : String) : OleVariant;
      function  ListValoresModuloDif21Judicial(const iIDBenefIrrf : Extended; sCodNatureza, DataIni, DataFim : String) : OleVariant;
      function  ListValoresModulo21Judicial(const iIDBenefIrrf : Extended; sCodNatureza,DataIni, DataFim : String) : OleVariant;

    public
      Property Progresso : Integer read FProgresso;
      Property MaxProgresso : Integer read FMaxProgresso;

      Constructor Create; Override;

      Destructor Destroy; Override;
      //Lista Valores principais da Dirf
      function ListGeraDirf(IdPessoa,iSistema : Integer; DataIni, DataFim, NumDocumento : string; bRetencao : Boolean; rValorMinimo : Real; chkParticipMantido : Boolean; edPessoanotin : String) : OleVariant;
      //Lista valores de decisão judicial e exigibilidade suspensa da dirf

      function ListGeraDirfFUNCEF(IdPessoa,iSistema : Integer; DataIni, DataFim, NumDocumento : string; bRetencao : Boolean; rValorMinimo : Real; chkParticipMantido : Boolean; edPessoanotin : String) : OleVariant;

      function ListGeraDirfJudicial_Suspensa(IdPessoa,iSistema : Integer; DataIni, DataFim, NumDocumento : string; rValorMinimo : Real) : OleVariant;

      function GeraLinhaTipoZeroExigSuspensa(piSeqArq: Integer): String;
      function GeraLinhaTipoUmExigSuspensa  (piSeqArq: Integer): String;
      function GeraLinhaTipoDoisExigSuspensa(piSeqArq: Integer): String;

      function ListResPonsavel(IdPessoa : LongInt) : OleVariant;
      function ListEmpresa(IdPessoa : LongInt) : OleVariant;

      function GeraDirf(IdPessoa, IdResponsavel, TipoArquivo,  iSistema, NaturDeclar : Integer; DataIni, DataFim, TextImport, sNomeArquivo, sCamImporta, sAno, sAnoref : string; bRetencao,
                        bImporta, PesExi : Boolean; rValorMinimo : Real; chkParticipMantido:Boolean; edPessoanotin: String) : Boolean;

      procedure Principal(IdResponsavel, TipoArquivo, NaturDeclar : LongInt; Retencao, PesExi : Boolean; rValorMinimo : Real;
                          sNomeArquivo, sAno, sAnoref : string; IdPessoa, iSistema : Longint; DataIni, DataFim, Numdocumento : string);

      procedure Importa(arquivo :string);
      procedure GravaTexto(sNomeArquivo : string);
      procedure ListToText(lista : tstringlist; sNomeArquivo : string);

      procedure Junta;
      procedure Rodape(contador_:integer);
      function  Completa(sNome: String; iTam : integer):String;
      function  CompletaZero(sNome: String; iTam : integer):String;

      function GetDataPacketTeste(Sql: TstringList): OleVariant;

      function SubstCarEspeciais(const pString: String): String; //Marilza Colpani-SOL 125645/KTN 649749

      function CaracteresEspeciais(const  sTexto: String) : String; //Marilza Colpani-SOL 125645/KTN 649749

    protected

    End;

implementation

Var
  sMens : string;
  listaDirf                : tstringlist;
  listaImport              : tstringlist;
  listatemp                : tstringlist;
  bTxtImportado            : boolean;
{ TCtrlGeraDirf }

function TCtrlGeraDirf.Completa(sNome: String; iTam: integer): String;
var
  i, k : integer;
  Espacos : string;
begin
   sNome   := trim(sNome);
   i       := length(sNome);
   Espacos := '';
   for k := 1 to (iTam - i) do
      Espacos := Espacos + ' ';

   Result := sNome + Espacos;
end;

function TCtrlGeraDirf.CompletaZero(sNome: String; iTam: integer): String;
var i, k : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := '';
   for k := 1 to (iTam - i) do
      Result := Result + '0';
   Result := Result + sNome;
end;

constructor TCtrlGeraDirf.Create;
begin
  inherited;
  cds            := TclientDataSet.Create(nil);
  CdsResponsavel := TClientDataSet.Create(nil);
  CdsEmpresa     := TClientDataSet.Create(nil);
  CdsJudicial    := TClientDataSet.create(nil);
  cds21Normal    := TClientDataSet.create(nil);
  cdsDif21Normal := TClientDataSet.create(nil);
  cds21Judicial    := TClientDataSet.create(nil);
  cdsDif21Judicial := TClientDataSet.create(nil);

end;

destructor TCtrlGeraDirf.Destroy;
begin
  inherited;
  cds.free;
  cds21Normal.Free;
  cdsDif21Normal.Free;
  cds21Judicial.Free;
  cdsDif21Judicial.Free;
  CdsResponsavel.free;
  CdsEmpresa.free;
  CdsJudicial.free;
  if listaDirf   <> nil then
     listaDirf.Free;
  if listaImport <> nil then
     listaImport.Free;
  if listatemp   <> nil then
     listatemp.Free;
end;

procedure TCtrlGeraDirf.DoChangeDataBase;
begin
  inherited;

end;


function TCtrlGeraDirf.GeraDirf(IdPessoa, IdResponsavel, TipoArquivo, iSistema, NaturDeclar : Integer; DataIni, DataFim, TextImport, sNomeArquivo,
                                sCamImporta, sAno, sAnoref : string; bRetencao, bImporta, PesExi : Boolean; rValorMinimo: Real; chkParticipMantido : Boolean; edPessoanotin : String): Boolean;

                                begin
  Result := True;
  Try
    CdsEmpresa.data := ListEmpresa(IdPessoa);

    cds21Normal.Data := GetDataPacket('SELECT NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');

    if cds21Normal.FieldByName('FLGEXCEPCIONAL').AsInteger = 1 then
       //cds.data := ListGeraDirfFUNCEF(IdPessoa, iSistema, DataIni, DataFim, Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,1,8), bRetencao, rValorMinimo, chkParticipMantido, edPessoanotin)
       cds.data := ListGeraDirfFUNCEF(IdPessoa, iSistema, DataIni, DataFim, Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,1,8), bRetencao, rValorMinimo, chkParticipMantido, edPessoanotin)
    else
       cds.data := ListGeraDirf(IdPessoa, iSistema, DataIni, DataFim, Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,1,8), bRetencao, rValorMinimo, chkParticipMantido, edPessoanotin);

    Principal(IdResponsavel, TipoArquivo, NaturDeclar, bRetencao, PesExi, rValorMinimo, sNomeArquivo, sAno, sAnoref,
              IdPessoa, iSistema, DataIni, DataFim, Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,1,8));
    if (bImporta) and (trim(TextImport) <> '') then
      Begin
        listaDirf  := TStringList.Create;
        listaDirf.LoadFromFile(sNomeArquivo);
        Importa(sCamImporta);
        Junta;
        GravaTexto(sNomeArquivo);
      end;
    MessageInfo := 'Geração efetuada com sucesso!';
  except
    On E:Exception Do
      Begin
         Result := False;
         CMDebugToFile(E.Message);
         MessageInfo := E.Message;
      End;
  end;

end;

function TCtrlGeraDirf.GetDataPacketTeste(Sql: TstringList): OleVariant;
Var
  lQry: TwwQuery;
  lDsp: TDatasetProvider;
  lCds: TClientDataSet;
begin
  Begin
     Result := null;

     lQry := TwwQuery.Create(nil);
     lDsp := TDatasetProvider.Create(nil);
     lCds := TClientDataSet.Create(nil);
     Try
       lQry.DatabaseName := DataBaseName;
       lQry.Sql := Sql;

       lDsp.DataSet := lQry;

       lCds.SetProvider(lDsp);

       lCds.Open;
       Result := lCds.Data;
       lCds.Close;
     finally
       lCds.ProviderName := '';
       lCds.free;

       lDsp.DataSet := nil;
       lDsp.free;

       lQry.free;
     End;
  End;
end;

procedure TCtrlGeraDirf.GravaTexto(sNomeArquivo : string);
begin
   if bTxtImportado then
     Begin
       //grava a partir de listatemp
       ListToText(listatemp, sNomeArquivo);
     end
   else
     Begin
       //grava a partir de  listaDirf
       ListToText(listaDirf, sNomeArquivo);
     end;
end;

procedure TCtrlGeraDirf.Importa(arquivo: string);
var
  FromF: file;
  i,NumRead: Integer;
  Buf: array[1..732] of Char;
  temp : string;
begin
    temp:='';
    listaImport := tstringlist.Create;
    if arquivo <> '' then begin
       AssignFile(FromF,arquivo);
       Reset(FromF, 1);
       repeat
          BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
          if Numread > 0 then begin
             temp:='';
             for i:= 1 to numread-2 do temp:=temp+buf[i];
             listaImport.add(temp);
          end;
       until (NumRead = 0);
          CloseFile(FromF);
    end;
    bTxtImportado := true;
end;

procedure TCtrlGeraDirf.Junta;
var
i,j,k,temp,temp2,contador: integer;
bdirf : BOOLEAN;
temp3,scontador : string;
begin
   bdirf:= false;
   contador:=2;
   listaTemp:= tstringlist.create;
   temp := cds.fieldbyname('CODNATUREZA').asinteger;
   temp2:= strtoint(listaImport[1][24]+listaImport[1][25]+
           listaImport[1][26]+listaImport[1][27]);
   listatemp.add(listaDirf[0]);
   if temp <= temp2 then
     Begin
       for i:= 1 to listaDirf.count-2 do
         Begin
           scontador:= completazero(inttostr(contador),8);
           temp3:= listaDirf[i];
           for k:= 1 to 8 do temp3[k]:= scontador[k];
           listatemp.add(temp3);
           inc(contador);
         end;
       for i:= 1 to listaImport.count-2 do
         Begin
           scontador:= completazero(inttostr(contador),8);
           temp3:= listaImport[i];
           for k:= 1 to 8 do temp3[k]:= scontador[k];
             listatemp.add(temp3);
           inc(contador);
         end;
     end
   else
     Begin
       scontador:= completazero(inttostr(contador),8);
       temp3:= listaImport[1];
       for k:= 1 to 8 do temp3[k]:= scontador[k];
         listatemp.add(temp3);
       inc(contador);
       for i := 2 to listaImport.count-2 do
         Begin
           if temp <= temp2 then
             Begin
               for j:= 1 to listaDirf.count-2 do
                 Begin
                   scontador:= completazero(inttostr(contador),8);
                   temp3:= listaDirf[j];
                   for k:= 1 to 8 do temp3[k]:= scontador[k];
                      listatemp.add(temp3);
                   inc(contador);
                 end;
               bdirf:=true;
             end
           else
             Begin
               scontador:= completazero(inttostr(contador),8);
               temp3:= listaImport[i];
               for k:= 1 to 8 do temp3[k]:= scontador[k];
                 listatemp.add(temp3);
               inc(contador);
             end;
         end;
         if not(bdirf) then
           for j:= 1 to listaDirf.count-2 do
             Begin
               scontador:= completazero(inttostr(contador),8);
               temp3:= listaDirf[j];
               for k:= 1 to 8 do temp3[k]:= scontador[k];
                 listatemp.add(temp3);
               inc(contador);
             end;
     end;
   rodape(contador);
end;

function TCtrlGeraDirf.ListEmpresa(IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT RAZAOSOCIAL, NUMDOCUMENTO '+
          '  FROM PESSOA '+
          ' WHERE IDPESSOA = '+IntToStr(IdPessoa);
  Result := GetDataPacket(SSql);
end;

function TCtrlGeraDirf.ListGeraDirf(IdPessoa,iSistema : Integer; DataIni, DataFim, NumDocumento : string; bRetencao : Boolean; rValorMinimo : Real; chkParticipMantido : Boolean; edPessoanotin : String): OleVariant;
Var

  Ssql       : TstringList;
  iAno, iMes, iDia : word;
begin

  DecodeDate(StrToDate(DataIni), iAno, iMes, iDia);

  Ssql := TStringList.Create;
  with Ssql do
    Begin
      Append('SELECT  XB.IDBENEFIRRF, P.TIPO, P.RAZAOSOCIAL AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF,                         ');
      Append(' XB.TIPOREG, '); //CPREV - Pend. 27026
      Append('        E.NUMDOCUMENTO AS CGCEMPRE, RTRIM(LTRIM(E.RAZAOSOCIAL)) AS NOMEEMPRE, RTRIM(XB.CODNATUREZA) AS CODNATUREZA,  ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN1),-1,0,XB.JAN1*100)),0) AS JAN1,NVL(TRUNC(DECODE(SIGN(XB.JAN2),-1,0,XB.JAN2*100)),0) AS JAN2,NVL(TRUNC(DECODE(SIGN(XB.JAN3),-1,0,XB.JAN3*100)),0) AS JAN3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV1),-1,0,XB.FEV1*100)),0) AS FEV1,NVL(TRUNC(DECODE(SIGN(XB.FEV2),-1,0,XB.FEV2*100)),0) AS FEV2,NVL(TRUNC(DECODE(SIGN(XB.FEV3),-1,0,XB.FEV3*100)),0) AS FEV3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR1),-1,0,XB.MAR1*100)),0) AS MAR1,NVL(TRUNC(DECODE(SIGN(XB.MAR2),-1,0,XB.MAR2*100)),0) AS MAR2,NVL(TRUNC(DECODE(SIGN(XB.MAR3),-1,0,XB.MAR3*100)),0) AS MAR3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR1),-1,0,XB.ABR1*100)),0) AS ABR1,NVL(TRUNC(DECODE(SIGN(XB.ABR2),-1,0,XB.ABR2*100)),0) AS ABR2,NVL(TRUNC(DECODE(SIGN(XB.ABR3),-1,0,XB.ABR3*100)),0) AS ABR3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI1),-1,0,XB.MAI1*100)),0) AS MAI1,NVL(TRUNC(DECODE(SIGN(XB.MAI2),-1,0,XB.MAI2*100)),0) AS MAI2,NVL(TRUNC(DECODE(SIGN(XB.MAI3),-1,0,XB.MAI3*100)),0) AS MAI3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN1),-1,0,XB.JUN1*100)),0) AS JUN1,NVL(TRUNC(DECODE(SIGN(XB.JUN2),-1,0,XB.JUN2*100)),0) AS JUN2,NVL(TRUNC(DECODE(SIGN(XB.JUN3),-1,0,XB.JUN3*100)),0) AS JUN3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL1),-1,0,XB.JUL1*100)),0) AS JUL1,NVL(TRUNC(DECODE(SIGN(XB.JUL2),-1,0,XB.JUL2*100)),0) AS JUL2,NVL(TRUNC(DECODE(SIGN(XB.JUL3),-1,0,XB.JUL3*100)),0) AS JUL3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO1),-1,0,XB.AGO1*100)),0) AS AGO1,NVL(TRUNC(DECODE(SIGN(XB.AGO2),-1,0,XB.AGO2*100)),0) AS AGO2,NVL(TRUNC(DECODE(SIGN(XB.AGO3),-1,0,XB.AGO3*100)),0) AS AGO3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET1),-1,0,XB.SET1*100)),0) AS SET1,NVL(TRUNC(DECODE(SIGN(XB.SET2),-1,0,XB.SET2*100)),0) AS SET2,NVL(TRUNC(DECODE(SIGN(XB.SET3),-1,0,XB.SET3*100)),0) AS SET3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT1),-1,0,XB.OUT1*100)),0) AS OUT1,NVL(TRUNC(DECODE(SIGN(XB.OUT2),-1,0,XB.OUT2*100)),0) AS OUT2,NVL(TRUNC(DECODE(SIGN(XB.OUT3),-1,0,XB.OUT3*100)),0) AS OUT3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV1),-1,0,XB.NOV1*100)),0) AS NOV1,NVL(TRUNC(DECODE(SIGN(XB.NOV2),-1,0,XB.NOV2*100)),0) AS NOV2,NVL(TRUNC(DECODE(SIGN(XB.NOV3),-1,0,XB.NOV3*100)),0) AS NOV3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ1),-1,0,XB.DEZ1*100)),0) AS DEZ1,NVL(TRUNC(DECODE(SIGN(XB.DEZ2),-1,0,XB.DEZ2*100)),0) AS DEZ2,NVL(TRUNC(DECODE(SIGN(XB.DEZ3),-1,0,XB.DEZ3*100)),0) AS DEZ3,              ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR131),-1,0,XB.VLR131*100)),0) AS VLR131,                                   ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR132),-1,0,XB.VLR132*100)),0) AS VLR132,                                   ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR133),-1,0,XB.VLR133*100)),0) AS VLR133                                    ');
      Append('  FROM  PESSOA P,PESSOA E,  (SELECT U.IDBENEFIRRF, U.CODNATUREZA,                                      ');
      Append('                                    U.TIPOREG, '); //CPREV - Pend. 27026
      Append('                                    SUM(U.JAN1) AS JAN1,  SUM(U.FEV1) AS FEV1,                         ');
      Append('                                    SUM(U.MAR1) AS MAR1,  SUM(U.ABR1) AS ABR1,                         ');
      Append('                                    SUM(U.MAI1) AS MAI1,  SUM(U.JUN1) AS JUN1,                         ');
      Append('                                    SUM(U.JUL1) AS JUL1,  SUM(U.AGO1) AS AGO1,                         ');
      Append('                                    SUM(U.SET1) AS SET1,  SUM(U.OUT1) AS OUT1,                         ');
      Append('                                    SUM(U.NOV1) AS NOV1,  SUM(U.DEZ1) AS DEZ1,                         ');
      Append('                                    SUM(U.JAN2) AS JAN2,  SUM(U.FEV2) AS FEV2,                         ');
      Append('                                    SUM(U.MAR2) AS MAR2,  SUM(U.ABR2) AS ABR2,                         ');
      Append('                                    SUM(U.MAI2) AS MAI2,  SUM(U.JUN2) AS JUN2,                         ');
      Append('                                    SUM(U.JUL2) AS JUL2,  SUM(U.AGO2) AS AGO2,                         ');
      Append('                                    SUM(U.SET2) AS SET2,  SUM(U.OUT2) AS OUT2,                         ');
      Append('                                    SUM(U.NOV2) AS NOV2,  SUM(U.DEZ2) AS DEZ2,                         ');
      Append('                                    SUM(U.JAN3) AS JAN3,  SUM(U.FEV3) AS FEV3,                         ');
      Append('                                    SUM(U.MAR3) AS MAR3,  SUM(U.ABR3) AS ABR3,                         ');
      Append('                                    SUM(U.MAI3) AS MAI3,  SUM(U.JUN3) AS JUN3,                         ');
      Append('                                    SUM(U.JUL3) AS JUL3,  SUM(U.AGO3) AS AGO3,                         ');
      Append('                                    SUM(U.SET3) AS SET3,  SUM(U.OUT3) AS OUT3,                         ');
      Append('                                    SUM(U.NOV3) AS NOV3,  SUM(U.DEZ3) AS DEZ3,                         ');
      Append('                                    SUM(U.VLR131) AS VLR131, SUM(U.VLR132) AS VLR132,                  ');
      Append('                                    SUM(U.VLR133) AS VLR133                                            ');
      Append('                              FROM ((SELECT L.IDBENEFIRRF, L.CODNATUREZA,                                             ');
      Append('                                            ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS JAN1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS FEV1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS MAR1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS ABR1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS MAI1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS JUN1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS JUL1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS AGO1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS SET1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS OUT1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS NOV1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0)) AS DEZ1,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JAN2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS FEV2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAR2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS ABR2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAI2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUN2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUL2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS AGO2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS SET2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS OUT2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS NOV2,   ');
      Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS DEZ2,   ');
      Append('                                            0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

      { CPrev - Pend. 27026 - Início Comentário
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS JAN3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS FEV3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS MAR3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS ABR3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS MAI3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS JUN3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS JUL3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS AGO3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS SET3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS OUT3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS NOV3, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS DEZ3, ');
      } //CPrev - Pend. 27026 - Fim Comentário

      Append('                                            SUM(DECODE(I.CODDIRF,''5'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0)) AS VLR131,                                                   ');
      //CPrev - Pend. 27026 - Append('                                            SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0)) AS VLR132,                                                   ');
      Append('                                            0 AS VLR132, '); //CPrev - Pend. 27026
      // Alterado por Arnaldo V. Scarin em 23/04/2010
      Append('                                            SUM(DECODE(I.CODDIRF,''7'',DECODE(L.CODNATUREZA,''5565'',0,''3223'',0, LI.VLRLANC),0)) AS VLR133');
      Append('                                       FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N                                               ');
      Append('                                      WHERE (I.IDINFORME = LI.IDINFORME)                                                                           ');
      Append('                                        AND (LI.IDLANCIRRF = L.IDLANCIRRF)                                                                         ');
      Append('                                        AND (L.CODNATUREZA = N.CODNATUREZA)                                                                        ');
      Append('                                        AND (N.FLGUSADONADIRF = ' + QuotedStr('S') + ')'                                                            );
      Append('                                        AND (I.CODDIRF <> 1)'                                                            );

      if edPessoanotin <> '' Then
         Append('                                     AND (L.IDBENEFIRRF NOT IN (' + edPessoanotin +'))'                                                            );


      if (iSistema = 0) then
         Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
      else
         if (iSistema = 1) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ') 
         else
            if (iSistema = 2) then
               Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) '); 

      Append('AND           (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY''))          ');
//CPREV - Pend. 27159 - Append('AND (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+')                                                                               ');

      If (iSistema >= 2) Then
        Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

      //CPREV - Pend. 27026 - Append('GROUP BY L.IDBENEFIRRF, L.CODNATUREZA )                                                                                     ');
      Append(' GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, ''0'') '); //CPREV - Pend. 27026

      Append('UNION ALL                                                                                                                   ');
      Append('(SELECT  L.IDBENEFIRRF, L.CODNATUREZA,                                                                                      ');
      Append(' ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRBASE,0)) AS JAN1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRBASE,0)) AS FEV1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRBASE,0)) AS MAR1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRBASE,0)) AS ABR1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRBASE,0)) AS MAI1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRBASE,0)) AS JUN1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRBASE,0)) AS JUL1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRBASE,0)) AS AGO1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRBASE,0)) AS SET1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRBASE,0)) AS OUT1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRBASE,0)) AS NOV1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRBASE,0)) AS DEZ1,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRIRRF,0)) AS JAN2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRIRRF,0)) AS FEV2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRIRRF,0)) AS MAR2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRIRRF,0)) AS ABR2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRIRRF,0)) AS MAI2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRIRRF,0)) AS JUN2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRIRRF,0)) AS JUL2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRIRRF,0)) AS AGO2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRIRRF,0)) AS SET2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRIRRF,0)) AS OUT2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRIRRF,0)) AS NOV2,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRIRRF,0)) AS DEZ2,                                              ');

      Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

      { CPrev - Pend. 27026 - Início Comentário
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRINSS,0)) AS JAN3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRINSS,0)) AS FEV3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRINSS,0)) AS MAR3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRINSS,0)) AS ABR3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRINSS,0)) AS MAI3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRINSS,0)) AS JUN3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRINSS,0)) AS JUL3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRINSS,0)) AS AGO3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRINSS,0)) AS SET3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRINSS,0)) AS OUT3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRINSS,0)) AS NOV3,                                              ');
      Append('         SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRINSS,0)) AS DEZ3,                                              ');
      } //CPrev - Pend. 27026 - Fim Comentário

      Append('         0 AS VLR131, 0 AS VLR132, 0 AS VLR133                                                                              ');
      Append('    FROM LANCIRRF L                                                                                                         ');
      Append('   WHERE (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF))                           ');
      Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) <> 18) ');

      if edPessoanotin <> '' Then        
         Append('                                     AND (L.IDBENEFIRRF NOT IN (' + edPessoanotin +'))'                                                            );


      if (iSistema = 0) then
         Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ') 
      else
         if (iSistema = 1) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ') 
         else
            if (iSistema = 2) then
               Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) '); 

      If (iSistema >= 2) Then
        Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

      Append('AND (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY''))                   ');
//CPREV - Pend. 27159 - Append('AND (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+')                                                                              ');
      //CPREV - Pend. 27026 - Append('GROUP BY L.IDMODULO, L.IDBENEFIRRF, L.CODNATUREZA) ');
      Append(' GROUP BY L.IDMODULO, L.IDBENEFIRRF, L.CODNATUREZA, ''0'') '); //CPREV - Pend. 27026

      // O select abaixo vai verificar se o participante possui contribuição como Mantido
      // para que seja adicionado na DIRF, visto que existe um relatório de informe de
      // rendimentos para mantidos que pagam contribuicão

      // somente se o usuário indicar na tela
      if chkParticipMantido Then Begin
          Append('UNION ALL                                                                                                                                          ');
          Append('SELECT ');
          Append('       P.IDPESSOA AS IDBENEFIRRF,');
          Append('       ''9999'' AS CODNATUREZA,');
          Append(' ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
          Append('       0 AS JAN1, 0 AS FEV1, 0 AS MAR1, 0 AS ABR1, 0 AS MAI1, 0 AS JUN1,');
          Append('       0 AS JUL1, 0 AS AGO1, 0 AS SET1, 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1,');
          Append('       0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2,');
          Append('       0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2,');

          Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

         { CPrev - Pend. 27026 - Início Comentário
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''01'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS JAN3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''02'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS FEV3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''03'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS MAR3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''04'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS ABR3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''05'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS MAI3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''06'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS JUN3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''07'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS JUL3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''08'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS AGO3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''09'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS SET3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''10'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS OUT3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''11'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS NOV3,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''12'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS DEZ3,');
          } //CPrev - Pend. 27026 - Fim Comentário

          Append('       0 AS VLR131, 0 AS VLR132,');
          Append('       SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''13'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS VLR133');
          Append('FROM   PESSOA P,');
          Append('       ELEGPATRO EL,');
          Append('       HSTCONTRIBPREV H,');
          Append('       CONTPREV CP,');
          Append('       PROVDESC PD,');
          Append('       INFORME I');
          Append('WHERE  CP.FLGPAGADOR IN (''C'',''P'')');

          Append('AND    CP.IDCONTRIBUICAO IN (19,26,215,358,560,580,600,601,621)');
          Append('AND    NVL(H.FLGDESCFOLHA,0) = 0 ');
          Append('AND    NVL(H.SITRECEBIMENTO,0) IN (2,3,5) ');
          Append('AND    CP.FLGINTERNO IN (''MA'',''MP'')');
          Append('AND    H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(iAno) + '/01'));
          Append('AND    H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(iAno) + '/13'));
          Append('AND    CP.IDPLANOPREV    = H.IDPLANOPREV');
          Append('AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
          Append('AND    EL.IDPESSJUR = H.IDPESSJUR');
          Append('AND    EL.IDPESSOA = H.IDPESSOA');
          Append('AND    P.IDPESSOA = EL.IDPESSOA');
          Append('AND    PD.IDPROVENTO = CP.IDRUBRICA');
          Append('AND    I.IDINFORME   = PD.IDINFORME');
          Append('GROUP BY');
          Append('       P.IDPESSOA');
      end;

      If (iSistema >= 2) Then
        Append(' UNION ALL (SELECT '+
                  ' T.IDBENEFIRRF, T.CODNATUREZA, '+
                  ' ''0'' AS TIPOREG, '+ //CPREV - Pend. 27026
                  ' SUM(T.JAN1) AS JAN1, SUM(T.FEV1) AS FEV1, SUM(T.MAR1) AS MAR1, '+
                  ' SUM(T.ABR1) AS ABR1, SUM(T.MAI1) AS MAI1, SUM(T.JUN1) AS JUN1, '+
                  ' SUM(T.JUL1) AS JUL1, SUM(T.AGO1) AS AGO1, SUM(T.SET1) AS SET1, '+
                  ' SUM(T.OUT1) AS OUT1, SUM(T.NOV1) AS NOV1, SUM(T.DEZ1) AS DEZ1, '+
                  ' 0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2, '+
                  ' 0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2, '+
                  ' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, '+
                  ' 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '+
                  ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 '+
                  ' FROM (SELECT DISTINCT L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, '+
                         ' MIN(L.IDLANCIRRF) AS IDLANCIRRF, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JAN1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS FEV1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAR1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS ABR1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAI1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUN1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUL1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS AGO1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS SET1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS OUT1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS NOV1, '+
                         ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS DEZ1  '+
                        ' FROM LANCXINFORME LI, LANCIRRF L, INFORME I '+
                        ' WHERE '+
//CPREV - Pend. 27159 - (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+') '+
                          '  (LI.IDLANCIRRF              = L.IDLANCIRRF) '+
                          ' AND (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) '+
                          ' AND (I.IDINFORME                = LI.IDINFORME) '+
                          ' AND (I.CODDIRF                 <> 1) '+
                          ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) '+
                          ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) '+ 
                        ' GROUP BY '+
                          ' L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                          ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) ) T '+
                  ' GROUP BY T.IDBENEFIRRF, T.CODNATUREZA) '+
                  ' UNION ALL '+
                  ' (SELECT  L.IDBENEFIRRF, L.CODNATUREZA, '+
                       ' ''0'' AS TIPOREG, '+ //CPREV - Pend. 27026

                       ' 0 AS JAN1, 0 AS FEV1, 0 AS MAR1, '+
                       ' 0 AS ABR1, 0 AS MAI1, 0 AS JUN1, '+
                       ' 0 AS JUL1, 0 AS AGO1, 0 AS SET1, '+
                       ' 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JAN2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS FEV2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAR2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS ABR2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAI2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUN2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUL2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS AGO2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS SET2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS OUT2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS NOV2, '+
                       ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS DEZ2, '+
                       ' 0 AS JAN3, '+
                       ' 0 AS FEV3, '+
                       ' 0 AS MAR3, '+
                       ' 0 AS ABR3, '+
                       ' 0 AS MAI3, '+
                       ' 0 AS JUN3, '+
                       ' 0 AS JUL3, '+
                       ' 0 AS AGO3, '+
                       ' 0 AS SET3, '+
                       ' 0 AS OUT3, '+
                       ' 0 AS NOV3, '+
                       ' 0 AS DEZ3, '+
                       ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 '+
                    ' FROM LANCIRRF L '+
                    ' WHERE (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) '+
//CPREV - Pend. 27159 - ' AND (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+') '+
                      ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) '+
                      ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) '+
                      ' GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');

      Append(') U');
      Append('GROUP BY U.IDBENEFIRRF, U.CODNATUREZA');
      Append(' , U.TIPOREG  '); //CPrev - Pend. 27026 - 29/01/2007

      //CPREV - Pend. 27026 - Início
      if ( iSistema <> 2 ) then
      begin
        Append(' ,U.TIPOREG ');
        Append(' UNION ALL ');
        Append(' SELECT ');
        Append('   P.IDPESSOA AS IDBENEFIRRF,  ');
        Append('   DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, ''1'' AS TIPOREG, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS JAN1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS FEV1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS MAR1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS ABR1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS MAI1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS JUN1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS JUL1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS AGO1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS SET1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS OUT1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS NOV1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS DEZ1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JAN2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS FEV2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAR2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS ABR2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAI2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUN2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUL2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS AGO2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS SET2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS OUT2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS NOV2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS DEZ2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ3, ');
        Append('   SUM(DECODE(I.CODDIRF,''22'',LI.VLRLANC,0)) AS VLR131, ');
        Append('   SUM(DECODE(I.CODDIRF,''23'',LI.VLRLANC,0)) AS VLR132, ');
        Append('   SUM(DECODE(I.CODDIRF,''24'',LI.VLRLANC,0)) AS VLR133 ');
        Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
        Append(' WHERE (I.IDINFORME                      = LI.IDINFORME) ');
        Append('   AND (LI.IDLANCIRRF                    = L.IDLANCIRRF) ');
        Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
        Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
        Append('   AND (I.CODDIRF                       <> 1) ');
        Append('   AND (P.IDPESSOA                       = L.IDBENEFIRRF) ');

        //CPrev - Pend. 27026 - 30/01/2008 - Início
        if (iSistema = 0) then
          Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
        else
          if (iSistema = 1) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
        //CPrev - Pend. 27026 - 30/01/2008 - Fim

      //Append(' AND (L.IDBENEFIRRF = 1229660)' ); //Teste - 16/01/2007

        //Pend. 27026 - Append('   AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
        Append('   AND (L.datapagamento            BETWEEN TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ');
        Append(' GROUP BY P.IDPESSOA, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''1'' ');
        Append(' UNION ALL');
        Append(' SELECT ');
        Append('   P.IDPESSOA AS IDBENEFIRRF, ');
        Append('   DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, ''2'' AS TIPOREG, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JAN1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS FEV1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAR1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS ABR1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAI1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUN1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUL1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS AGO1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS SET1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS OUT1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS NOV1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS DEZ1, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JAN2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS FEV2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAR2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS ABR2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAI2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUN2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUL2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS AGO2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS SET2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS OUT2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS NOV2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS DEZ2, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JAN3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS FEV3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAR3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS ABR3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAI3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUN3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUL3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS AGO3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS SET3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS OUT3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS NOV3, ');
        Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS DEZ3, ');
        Append('   SUM(DECODE(I.CODDIRF,''25'',LI.VLRLANC,0)) AS VLR131, ');
        Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR132, ');
        Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR133 ');
        Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
        Append(' WHERE (I.IDINFORME                      = LI.IDINFORME) ');
        Append('   AND (LI.IDLANCIRRF                    = L.IDLANCIRRF) ');
        Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
        Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
        Append('   AND (I.CODDIRF                       <> 1) ');
        Append('   AND (P.IDPESSOA                        = L.IDBENEFIRRF) ');

        //CPrev - Pend. 27026 - 30/01/2008 - Início
        if (iSistema = 0) then
          Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
        else
          if (iSistema = 1) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
        //CPrev - Pend. 27026 - 30/01/2008 - Fim

        //Append(' AND (L.IDBENEFIRRF = 1229660)' ); //Teste - 16/01/2007


        //Pend. 27026 - Append('   AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
        Append('   AND (L.datapagamento            BETWEEN TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ');
        Append(' GROUP BY P.IDPESSOA, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''2'' ');
      end;
      //CPREV - Pend. 27026 - Fim

      Append(' ) XB                                                                                                                      ');
      Append(' WHERE  (XB.IDBENEFIRRF = P.IDPESSOA)                                                                                      ');

      {CPrev - Pend. 27026 - Início Comentário      
      if bRetencao and (rValorMinimo > 0) Then
      begin
        Append(' AND (((XB.JAN2 + XB.FEV2 + XB.MAR2 + XB.ABR2 + XB.MAI2 + ');
        Append('        XB.JUN2 + XB.JUL2 + XB.AGO2 + XB.SET2 + XB.OUT2 + ');
        Append('        XB.NOV2 + XB.DEZ2 + XB.VLR133) <> 0 ) ');
        Append('  OR  ((XB.JAN1 + XB.FEV1 + XB.MAR1 + XB.ABR1 + XB.MAI1 + ');
        Append('        XB.JUN1 + XB.JUL1 + XB.AGO1 + XB.SET1 + XB.OUT1 + ');
        Append('        XB.NOV1 + XB.DEZ1 + XB.VLR131) >= '+FloatToStr(rValorMinimo) + '))');
      end
      else
      begin
        if rValorMinimo > 0 then
        begin
          Append(' AND ((XB.JAN1 + XB.FEV1 + XB.MAR1 + XB.ABR1 + XB.MAI1 + ');
          Append('       XB.JUN1 + XB.JUL1 + XB.AGO1 + XB.SET1 + XB.OUT1 + ');
          Append('       XB.NOV1 + XB.DEZ1 + XB.VLR131) >= '+FloatToStr(rValorMinimo) + ')');
        end
        else
        begin
          if bRetencao Then
          begin
            Append(' AND ((XB.JAN2 + XB.FEV2 + XB.MAR2 + XB.ABR2 + XB.MAI2 + ');
            Append('       XB.JUN2 + XB.JUL2 + XB.AGO2 + XB.SET2 + XB.OUT2 + ');
            Append('       XB.NOV2 + XB.DEZ2 + XB.VLR133) <> 0 ) ');
          end;
        end;
      end;
      } //CPrev - Pend. 27026 - Fim Comentário

      Append(' AND  (E.IDPESSOA = '+IntToStr(IdPessoa)+') ');

      if iSistema = 0 then
        Append('ORDER BY NOMEBENEF, CGCBENEF, XB.TIPOREG ')
      else
        Append('ORDER BY CODNATUREZA, P.TIPO, CGCBENEF, NOMEBENEF, XB.TIPOREG ');

    end; //fim do with
  //Henrique Massão
  //sSql.SaveToFile('c:\QueryDirf.txt');
  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QueryDirf.txt');
  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraDirf.ListGeraDirfJudicial_Suspensa(IdPessoa,
                                                     iSistema: Integer; DataIni, DataFim, NumDocumento: string;
                                                     rValorMinimo: Real): OleVariant;
Var
  Ssql : TstringList;
begin
  Ssql := TStringList.Create;

  cds21Normal.Data := GetDataPacket('SELECT NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');

  with Ssql do
    Begin
      Append('SELECT  XB.IDBENEFIRRF, P.TIPO, P.RAZAOSOCIAL AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF,                    ');
      Append('        E.NUMDOCUMENTO AS CGCEMPRE, E.RAZAOSOCIAL AS NOMEEMPRE, ');



      Append('        XB.CODNATUREZA,   '); 

      Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN4),-1,0,XB.JAN4*100)),0) AS JAN4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV4),-1,0,XB.FEV4*100)),0) AS FEV4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR4),-1,0,XB.MAR4*100)),0) AS MAR4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR4),-1,0,XB.ABR4*100)),0) AS ABR4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI4),-1,0,XB.MAI4*100)),0) AS MAI4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN4),-1,0,XB.JUN4*100)),0) AS JUN4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL4),-1,0,XB.JUL4*100)),0) AS JUL4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO4),-1,0,XB.AGO4*100)),0) AS AGO4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.SET4),-1,0,XB.SET4*100)),0) AS SET4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT4),-1,0,XB.OUT4*100)),0) AS OUT4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV4),-1,0,XB.NOV4*100)),0) AS NOV4,                                                                           ');
      Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ4),-1,0,XB.DEZ4*100)),0) AS DEZ4,                                                                           ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JAN5),-1,0,XB.JAN5*100)),0) AS JAN5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.FEV5),-1,0,XB.FEV5*100)),0) AS FEV5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.MAR5),-1,0,XB.MAR5*100)),0) AS MAR5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.ABR5),-1,0,XB.ABR5*100)),0) AS ABR5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.MAI5),-1,0,XB.MAI5*100)),0) AS MAI5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JUN5),-1,0,XB.JUN5*100)),0) AS JUN5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JUL5),-1,0,XB.JUL5*100)),0) AS JUL5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.AGO5),-1,0,XB.AGO5*100)),0) AS AGO5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.SET5),-1,0,XB.SET5*100)),0) AS SET5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.OUT5),-1,0,XB.OUT5*100)),0) AS OUT5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.NOV5),-1,0,XB.NOV5*100)),0) AS NOV5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.DEZ5),-1,0,XB.DEZ5*100)),0) AS DEZ5,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JAN6),-1,0,XB.JAN6*100)),0) AS JAN6,NVL(TRUNC(DECODE(SIGN(XB.JAN7),-1,0,XB.JAN7*100)),0) AS JAN7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.FEV6),-1,0,XB.FEV6*100)),0) AS FEV6,NVL(TRUNC(DECODE(SIGN(XB.FEV7),-1,0,XB.FEV7*100)),0) AS FEV7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.MAR6),-1,0,XB.MAR6*100)),0) AS MAR6,NVL(TRUNC(DECODE(SIGN(XB.MAR7),-1,0,XB.MAR7*100)),0) AS MAR7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.ABR6),-1,0,XB.ABR6*100)),0) AS ABR6,NVL(TRUNC(DECODE(SIGN(XB.ABR7),-1,0,XB.ABR7*100)),0) AS ABR7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.MAI6),-1,0,XB.MAI6*100)),0) AS MAI6,NVL(TRUNC(DECODE(SIGN(XB.MAI7),-1,0,XB.MAI7*100)),0) AS MAI7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JUN6),-1,0,XB.JUN6*100)),0) AS JUN6,NVL(TRUNC(DECODE(SIGN(XB.JUN7),-1,0,XB.JUN7*100)),0) AS JUN7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JUL6),-1,0,XB.JUL6*100)),0) AS JUL6,NVL(TRUNC(DECODE(SIGN(XB.JUL7),-1,0,XB.JUL7*100)),0) AS JUL7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.AGO6),-1,0,XB.AGO6*100)),0) AS AGO6,NVL(TRUNC(DECODE(SIGN(XB.AGO7),-1,0,XB.AGO7*100)),0) AS AGO7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.SET6),-1,0,XB.SET6*100)),0) AS SET6,NVL(TRUNC(DECODE(SIGN(XB.SET7),-1,0,XB.SET7*100)),0) AS SET7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.OUT6),-1,0,XB.OUT6*100)),0) AS OUT6,NVL(TRUNC(DECODE(SIGN(XB.OUT7),-1,0,XB.OUT7*100)),0) AS OUT7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.NOV6),-1,0,XB.NOV6*100)),0) AS NOV6,NVL(TRUNC(DECODE(SIGN(XB.NOV7),-1,0,XB.NOV7*100)),0) AS NOV7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.DEZ6),-1,0,XB.DEZ6*100)),0) AS DEZ6,NVL(TRUNC(DECODE(SIGN(XB.DEZ7),-1,0,XB.DEZ7*100)),0) AS DEZ7,                                                        ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JAN8),-1,0,XB.JAN8*100)),0) AS JAN8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.FEV8),-1,0,XB.FEV8*100)),0) AS FEV8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.MAR8),-1,0,XB.MAR8*100)),0) AS MAR8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.ABR8),-1,0,XB.ABR8*100)),0) AS ABR8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.MAI8),-1,0,XB.MAI8*100)),0) AS MAI8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JUN8),-1,0,XB.JUN8*100)),0) AS JUN8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.JUL8),-1,0,XB.JUL8*100)),0) AS JUL8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.AGO8),-1,0,XB.AGO8*100)),0) AS AGO8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.SET8),-1,0,XB.SET8*100)),0) AS SET8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.OUT8),-1,0,XB.OUT8*100)),0) AS OUT8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.NOV8),-1,0,XB.NOV8*100)),0) AS NOV8,                                                                            ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.DEZ8),-1,0,XB.DEZ8*100)),0) AS DEZ8,                                                                            ');

      //CPrev - Pend. 27026 - Início
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JAN9),-1,0,XB.JAN9*100)),0) AS JAN9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.FEV9),-1,0,XB.FEV9*100)),0) AS FEV9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAR9),-1,0,XB.MAR9*100)),0) AS MAR9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.ABR9),-1,0,XB.ABR9*100)),0) AS ABR9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAI9),-1,0,XB.MAI9*100)),0) AS MAI9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUN9),-1,0,XB.JUN9*100)),0) AS JUN9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUL9),-1,0,XB.JUL9*100)),0) AS JUL9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.AGO9),-1,0,XB.AGO9*100)),0) AS AGO9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.SET9),-1,0,XB.SET9*100)),0) AS SET9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.OUT9),-1,0,XB.OUT9*100)),0) AS OUT9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.NOV9),-1,0,XB.NOV9*100)),0) AS NOV9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.DEZ9),-1,0,XB.DEZ9*100)),0) AS DEZ9, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JAN10),-1,0,XB.JAN10*100)),0) AS JAN10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.FEV10),-1,0,XB.FEV10*100)),0) AS FEV10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAR10),-1,0,XB.MAR10*100)),0) AS MAR10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.ABR10),-1,0,XB.ABR10*100)),0) AS ABR10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAI10),-1,0,XB.MAI10*100)),0) AS MAI10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUN10),-1,0,XB.JUN10*100)),0) AS JUN10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUL10),-1,0,XB.JUL10*100)),0) AS JUL10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.AGO10),-1,0,XB.AGO10*100)),0) AS AGO10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.SET10),-1,0,XB.SET10*100)),0) AS SET10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.OUT10),-1,0,XB.OUT10*100)),0) AS OUT10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.NOV10),-1,0,XB.NOV10*100)),0) AS NOV10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.DEZ10),-1,0,XB.DEZ10*100)),0) AS DEZ10, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JAN11),-1,0,XB.JAN11*100)),0) AS JAN11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.FEV11),-1,0,XB.FEV11*100)),0) AS FEV11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAR11),-1,0,XB.MAR11*100)),0) AS MAR11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.ABR11),-1,0,XB.ABR11*100)),0) AS ABR11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAI11),-1,0,XB.MAI11*100)),0) AS MAI11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUN11),-1,0,XB.JUN11*100)),0) AS JUN11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUL11),-1,0,XB.JUL11*100)),0) AS JUL11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.AGO11),-1,0,XB.AGO11*100)),0) AS AGO11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.SET11),-1,0,XB.SET11*100)),0) AS SET11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.OUT11),-1,0,XB.OUT11*100)),0) AS OUT11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.NOV11),-1,0,XB.NOV11*100)),0) AS NOV11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.DEZ11),-1,0,XB.DEZ11*100)),0) AS DEZ11, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JAN12),-1,0,XB.JAN12*100)),0) AS JAN12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.FEV12),-1,0,XB.FEV12*100)),0) AS FEV12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAR12),-1,0,XB.MAR12*100)),0) AS MAR12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.ABR12),-1,0,XB.ABR12*100)),0) AS ABR12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.MAI12),-1,0,XB.MAI12*100)),0) AS MAI12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUN12),-1,0,XB.JUN12*100)),0) AS JUN12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.JUL12),-1,0,XB.JUL12*100)),0) AS JUL12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.AGO12),-1,0,XB.AGO12*100)),0) AS AGO12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.SET12),-1,0,XB.SET12*100)),0) AS SET12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.OUT12),-1,0,XB.OUT12*100)),0) AS OUT12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.NOV12),-1,0,XB.NOV12*100)),0) AS NOV12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.DEZ12),-1,0,XB.DEZ12*100)),0) AS DEZ12, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.VLR139),-1,0,XB.VLR139*100)), 0)  AS VLR139,  ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.VLR1310),-1,0,XB.VLR1310*100)),0) AS VLR1310, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.VLR1311),-1,0,XB.VLR1311*100)),0) AS VLR1311, ');
      Append('    NVL(TRUNC(DECODE(SIGN(XB.VLR1312),-1,0,XB.VLR1312*100)),0) AS VLR1312, ');
      //CPrev - Pend. 27026 - Fim

      Append('  NVL(TRUNC(DECODE(SIGN(XB.VLR134),-1,0,XB.VLR134*100)),0) AS VLR134,                                           ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.VLR135),-1,0,XB.VLR135*100)),0) AS VLR135,                                           ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.VLR136),-1,0,XB.VLR136*100)),0) AS VLR136,                                           ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.VLR137),-1,0,XB.VLR137*100)),0) AS VLR137,                                           ');
      Append('  NVL(TRUNC(DECODE(SIGN(XB.VLR138),-1,0,XB.VLR138*100)),0) AS VLR138                                            ');
      Append('FROM  PESSOA P,PESSOA E,  (SELECT U.IDBENEFIRRF, U.CODNATUREZA,                                   ');
      Append('                             SUM(U.JAN4) AS JAN4,  SUM(U.FEV4) AS FEV4,                         ');
      Append('                             SUM(U.MAR4) AS MAR4,  SUM(U.ABR4) AS ABR4,                         ');
      Append('                             SUM(U.MAI4) AS MAI4,  SUM(U.JUN4) AS JUN4,                         ');
      Append('                             SUM(U.JUL4) AS JUL4,  SUM(U.AGO4) AS AGO4,                         ');
      Append('                             SUM(U.SET4) AS SET4,  SUM(U.OUT4) AS OUT4,                         ');
      Append('                             SUM(U.NOV4) AS NOV4,  SUM(U.DEZ4) AS DEZ4,                         ');
      Append('                              SUM(U.JAN5) AS JAN5,  SUM(U.FEV5) AS FEV5,                          ');
      Append('                              SUM(U.MAR5) AS MAR5,  SUM(U.ABR5) AS ABR5,                          ');
      Append('                              SUM(U.MAI5) AS MAI5,  SUM(U.JUN5) AS JUN5,                          ');
      Append('                              SUM(U.JUL5) AS JUL5,  SUM(U.AGO5) AS AGO5,                          ');
      Append('                              SUM(U.SET5) AS SET5,  SUM(U.OUT5) AS OUT5,                          ');
      Append('                              SUM(U.NOV5) AS NOV5,  SUM(U.DEZ5) AS DEZ5,                          ');
      Append('                              SUM(U.JAN6) AS JAN6,  SUM(U.FEV6) AS FEV6,                          ');
      Append('                              SUM(U.MAR6) AS MAR6,  SUM(U.ABR6) AS ABR6,                          ');
      Append('                              SUM(U.MAI6) AS MAI6,  SUM(U.JUN6) AS JUN6,                          ');
      Append('                              SUM(U.JUL6) AS JUL6,  SUM(U.AGO6) AS AGO6,                          ');
      Append('                              SUM(U.SET6) AS SET6,  SUM(U.OUT6) AS OUT6,                          ');
      Append('                              SUM(U.NOV6) AS NOV6,  SUM(U.DEZ6) AS DEZ6,                          ');
      Append('                              SUM(U.JAN7) AS JAN7,  SUM(U.FEV7) AS FEV7,                          ');
      Append('                              SUM(U.MAR7) AS MAR7,  SUM(U.ABR7) AS ABR7,                          ');
      Append('                              SUM(U.MAI7) AS MAI7,  SUM(U.JUN7) AS JUN7,                          ');
      Append('                              SUM(U.JUL7) AS JUL7,  SUM(U.AGO7) AS AGO7,                          ');
      Append('                              SUM(U.SET7) AS SET7,  SUM(U.OUT7) AS OUT7,                          ');
      Append('                              SUM(U.NOV7) AS NOV7,  SUM(U.DEZ7) AS DEZ7,                          ');
      Append('                              SUM(U.JAN8) AS JAN8,  SUM(U.FEV8) AS FEV8,                          ');
      Append('                              SUM(U.MAR8) AS MAR8,  SUM(U.ABR8) AS ABR8,                          ');
      Append('                              SUM(U.MAI8) AS MAI8,  SUM(U.JUN8) AS JUN8,                          ');
      Append('                              SUM(U.JUL8) AS JUL8,  SUM(U.AGO8) AS AGO8,                          ');
      Append('                              SUM(U.SET8) AS SET8,  SUM(U.OUT8) AS OUT8,                          ');
      Append('                              SUM(U.NOV8) AS NOV8,  SUM(U.DEZ8) AS DEZ8,                          ');

      //CPrev - Pend. 27026 - Início
      Append(' SUM(U.JAN9) AS JAN9,  SUM(U.FEV9) AS FEV9, ');
      Append(' SUM(U.MAR9) AS MAR9,  SUM(U.ABR9) AS ABR9, ');
      Append(' SUM(U.MAI9) AS MAI9,  SUM(U.JUN9) AS JUN9, ');
      Append(' SUM(U.JUL9) AS JUL9,  SUM(U.AGO9) AS AGO9, ');
      Append(' SUM(U.SET9) AS SET9,  SUM(U.OUT9) AS OUT9, ');
      Append(' SUM(U.NOV9) AS NOV9,  SUM(U.DEZ9) AS DEZ9, ');
      Append(' SUM(U.JAN10) AS JAN10,  SUM(U.FEV10) AS FEV10, ');
      Append(' SUM(U.MAR10) AS MAR10,  SUM(U.ABR10) AS ABR10, ');
      Append(' SUM(U.MAI10) AS MAI10,  SUM(U.JUN10) AS JUN10, ');
      Append(' SUM(U.JUL10) AS JUL10,  SUM(U.AGO10) AS AGO10, ');
      Append(' SUM(U.SET10) AS SET10,  SUM(U.OUT10) AS OUT10, ');
      Append(' SUM(U.NOV10) AS NOV10,  SUM(U.DEZ10) AS DEZ10, ');
      Append(' SUM(U.JAN11) AS JAN11,  SUM(U.FEV11) AS FEV11, ');
      Append(' SUM(U.MAR11) AS MAR11,  SUM(U.ABR11) AS ABR11, ');
      Append(' SUM(U.MAI11) AS MAI11,  SUM(U.JUN11) AS JUN11, ');
      Append(' SUM(U.JUL11) AS JUL11,  SUM(U.AGO11) AS AGO11, ');
      Append(' SUM(U.SET11) AS SET11,  SUM(U.OUT11) AS OUT11, ');
      Append(' SUM(U.NOV11) AS NOV11,  SUM(U.DEZ11) AS DEZ11, ');
      Append(' SUM(U.JAN12) AS JAN12,  SUM(U.FEV12) AS FEV12, ');
      Append(' SUM(U.MAR12) AS MAR12,  SUM(U.ABR12) AS ABR12, ');
      Append(' SUM(U.MAI12) AS MAI12,  SUM(U.JUN12) AS JUN12, ');
      Append(' SUM(U.JUL12) AS JUL12,  SUM(U.AGO12) AS AGO12, ');
      Append(' SUM(U.SET12) AS SET12,  SUM(U.OUT12) AS OUT12, ');
      Append(' SUM(U.NOV12) AS NOV12,  SUM(U.DEZ12) AS DEZ12, ');
      Append(' SUM(U.VLR139) AS VLR139, ');
      Append(' SUM(U.VLR1310) AS VLR1310, ');
      Append(' SUM(U.VLR1311) AS VLR1311, ');
      Append(' SUM(U.VLR1312) AS VLR1312, ');
      //CPRev - Pend. 27026 - Fim

      Append('                              SUM(U.VLR134) AS VLR134,                                            ');
      Append('                              SUM(U.VLR135) AS VLR135,                                            ');
      Append('                              SUM(U.VLR136) AS VLR136,                                            ');
      Append('                              SUM(U.VLR137) AS VLR137,                                            ');
      Append('                              SUM(U.VLR138) AS VLR138                                             ');

      Append('                         FROM ((SELECT L.IDBENEFIRRF, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA) AS CODNATUREZA, '); 


      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS JAN4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS FEV4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS MAR4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS ABR4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS MAI4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS JUN4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS JUL4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS AGO4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS SET4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS OUT4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS NOV4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''8'',LI.VLRLANC,0),0)) AS DEZ4,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''9'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ5,    ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS JAN6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS FEV6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS MAR6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS ABR6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS MAI6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS JUN6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS JUL6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS AGO6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS SET6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS OUT6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS NOV6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''12'',LI.VLRLANC,0),0)) AS DEZ6,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS JAN7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS FEV7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS MAR7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS ABR7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS MAI7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS JUN7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS JUL7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS AGO7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS SET7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS OUT7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS NOV7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0)) AS DEZ7,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS JAN8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS FEV8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS MAR8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS ABR8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS MAI8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS JUN8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS JUL8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS AGO8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS SET8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS OUT8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS NOV8,   ');
      Append('                              SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''14'',LI.VLRLANC,0),0)) AS DEZ8,   ');

      //CPrev - Pend. 27026 - Início
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS JAN9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS FEV9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS MAR9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS ABR9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS MAI9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS JUN9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS JUL9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS AGO9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS SET9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS OUT9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS NOV9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''26'',LI.VLRLANC,0),0)) AS DEZ9, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''27'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ10, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS JAN11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS FEV11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS MAR11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS ABR11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS MAI11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS JUN11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS JUL11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS AGO11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS SET11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS OUT11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS NOV11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''28'',LI.VLRLANC,0),0)) AS DEZ11, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS JAN12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS FEV12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS MAR12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS ABR12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS MAI12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS JUN12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS JUL12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS AGO12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS SET12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS OUT12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS NOV12, ');
      Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''29'',LI.VLRLANC,0),0)) AS DEZ12, ');
      Append(' SUM(DECODE(I.CODDIRF,''30'',LI.VLRLANC,0)) AS VLR139, ');
      Append(' SUM(DECODE(I.CODDIRF,''31'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)) AS VLR1310, ');
      Append(' SUM(DECODE(I.CODDIRF,''32'',LI.VLRLANC,0)) AS VLR1311, ');
      Append(' SUM(DECODE(I.CODDIRF,''33'',LI.VLRLANC,0)) AS VLR1312, ');
      //CPrev - Pend. 27026 - Fim

      Append('                              SUM(DECODE(I.CODDIRF,''10'',LI.VLRLANC,0)) AS VLR134,                                                   ');
      Append('                              SUM(DECODE(I.CODDIRF,''11'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)) AS VLR135,                                                   ');
      Append('                              SUM(DECODE(I.CODDIRF,''15'',LI.VLRLANC,0)) AS VLR136,                                                   ');
      Append('                              SUM(DECODE(I.CODDIRF,''16'',LI.VLRLANC,0)) AS VLR137,                                                   ');
      Append('                              SUM(DECODE(I.CODDIRF,''17'',LI.VLRLANC,0)) AS VLR138                                                    ');
      Append('                         FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N                                                ');
      Append('                        WHERE (I.IDINFORME = LI.IDINFORME)                                                                            ');
      Append('                          AND (LI.IDLANCIRRF = L.IDLANCIRRF)                                                                          ');
      Append('                          AND (L.CODNATUREZA = N.CODNATUREZA)                                                                         ');
      Append('                          AND (N.FLGUSADONADIRF = ' + QuotedStr('S') + ')'                                                             );
      Append('                          AND (I.CODDIRF <> 1)'                                                            );

      if (iSistema = 0) then
         Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ') 
      else
         if (iSistema = 1) then
            Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ') 
         else
            if (iSistema = 2) then
               Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) '); 

      Append(' AND           (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY''))  ');
//CPREV - Pend. 27159 - Append(' AND (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+')                                                                                 ');


      Append('GROUP BY L.IDBENEFIRRF, DECODE(L.CODNATUREZA,''7416'',''0561'', ''7431'',''0561'', L.CODNATUREZA)) '); 

      Append(') U                         ');
      Append('GROUP BY U.IDBENEFIRRF, U.CODNATUREZA                             ');
      Append(' ) XB                                                             ');
      Append('WHERE  (XB.IDBENEFIRRF = P.IDPESSOA)                              ');
      Append(' AND  (E.IDPESSOA = '+IntToStr(IdPessoa)+') ');
      Append('AND  ( ((XB.JAN4 + XB.FEV4 + XB.MAR4 + XB.ABR4 + XB.MAI4 +       ');
      Append('        XB.JUN4 + XB.JUL4 + XB.AGO4 + XB.SET4 + XB.OUT4 +         ');
      Append('        XB.NOV4 + XB.DEZ4 + XB.VLR134) <> 0 )                     ');
      Append('   OR ((XB.JAN5 + XB.FEV5 + XB.MAR5 + XB.ABR5 + XB.MAI5 +       ');
      Append('        XB.JUN5 + XB.JUL5 + XB.AGO5 + XB.SET5 + XB.OUT5 +         ');
      Append('        XB.NOV5 + XB.DEZ5 + XB.VLR135) <> 0 )                     ');
      Append('   OR ((XB.JAN6 + XB.FEV6 + XB.MAR6 + XB.ABR6 + XB.MAI6 +         ');
      Append('        XB.JUN6 + XB.JUL6 + XB.AGO6 + XB.SET6 + XB.OUT6 +         ');
      Append('        XB.NOV6 + XB.DEZ6 + XB.VLR136) <> 0 )                     ');
      Append('   OR ((XB.JAN7 + XB.FEV7 + XB.MAR7 + XB.ABR7 + XB.MAI7 +         ');
      Append('        XB.JUN7 + XB.JUL7 + XB.AGO7 + XB.SET7 + XB.OUT7 +         ');
      Append('        XB.NOV7 + XB.DEZ7 + XB.VLR137) <> 0 )                     ');
      Append('   OR ((XB.JAN8 + XB.FEV8 + XB.MAR8 + XB.ABR8 + XB.MAI8 +         ');
      Append('        XB.JUN8 + XB.JUL8 + XB.AGO8 + XB.SET8 + XB.OUT8 +         ');
      Append('        XB.NOV8 + XB.DEZ8 + XB.VLR138) <> 0 )                     ');

      //CPrev - Pend. 27026 - Início
      Append('   OR ((XB.JAN9 + XB.FEV9 + XB.MAR9 + XB.ABR9 + XB.MAI9 + ');
      Append('        XB.JUN9 + XB.JUL9 + XB.AGO9 + XB.SET9 + XB.OUT9 + ');
      Append('        XB.NOV9 + XB.DEZ9 + XB.VLR139) <> 0 ) ');
      Append('   OR ((XB.JAN10 + XB.FEV10 + XB.MAR10 + XB.ABR10 + XB.MAI10 + ');
      Append('        XB.JUN10 + XB.JUL10 + XB.AGO10 + XB.SET10 + XB.OUT10 + ');
      Append('        XB.NOV10 + XB.DEZ10 + XB.VLR1310) <> 0 ) ');
      Append('   OR ((XB.JAN11 + XB.FEV11 + XB.MAR11 + XB.ABR11 + XB.MAI11 + ');
      Append('        XB.JUN11 + XB.JUL11 + XB.AGO11 + XB.SET11 + XB.OUT11 + ');
      Append('        XB.NOV11 + XB.DEZ11 + XB.VLR1311) <> 0 ) ');
      Append('   OR ((XB.JAN12 + XB.FEV12 + XB.MAR12 + XB.ABR12 + XB.MAI12 + ');
      Append('        XB.JUN12 + XB.JUL12 + XB.AGO12 + XB.SET12 + XB.OUT12 + ');
      Append('        XB.NOV12 + XB.DEZ12 + XB.VLR1312) <> 0 )) ');
      //CPrev - Pend. 27026 - Fim

      Append('ORDER BY CODNATUREZA, NOMEBENEF, P.TIPO, CGCBENEF                 ');
   end;
   sSql.SaveToFile(Sistema.TempDir + 'QueryDirfSuspensa.txt');

   Result := GetDataPacket(Ssql);
end;

function TCtrlGeraDirf.ListResPonsavel(IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT   P.RAZAOSOCIAL, P.NUMDOCUMENTO, EN.LOGRADOURO AS ENDEREO,  P.TIPO, P.EMAIL, '+
          '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME AS CIDADE,  EN.CEP, '+
          '         REPLACE(REPLACE(REPLACE(TF.NUMERO, ''-''), ''(''), '')'') AS FAX, '+
          '         ES.CODESTADO AS UF, REPLACE(REPLACE(REPLACE(T.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, T.DDD '+
          '  FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES, (SELECT DISTINCT IDENDERECO, TIPO, NUMERO, DDD FROM TELENDPESS) T, '+
          '        (SELECT IDENDERECO, Numero, Tipo, MAX(IDTELEFONE) AS IDTELEFONE '+
          '           FROM TELENDPESS GROUP BY IDENDERECO, NUMERO, TIPO) TF '+
          ' WHERE  (P.IDPESSOA = '+IntToStr(IdPessoa) +') AND '+
          '        (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND '+
          '        (EN.IDCIDADES     = C.IDCIDADES(+)) AND '+
          '        (ES.IDESTADO(+)    = C.IDESTADO) AND '+
          '        (EN.IDPESSOA(+)   = P.IDPESSOA) AND '+
          '        (EN.IDENDERECO = T.IDENDERECO(+)) AND'+
          '        (EN.IDENDERECO = TF.IDENDERECO(+))';
  Result := GetDataPacket(Ssql);

end;

procedure TCtrlGeraDirf.ListToText(lista: tstringlist; sNomeArquivo : string);
var
  ToF: file;
  indice,i,J: Integer;
  sLinha : String; //Marilza Colpani-SOL 125645/KTN 649749
  Buf:array[1..732] of Char;
begin
   indice:=0;
   AssignFile(ToF,sNomeArquivo);
   Rewrite(ToF,1);
   for J:= 0 to lista.count-1 do
     Begin
       if lista <> nil then
         Begin
           sLinha := CaracteresEspeciais(lista[J]); //Marilza Colpani-SOL 125645/KTN 649749
           for i:=1 to 730 do
           buf[i]  := sLinha[i];
           buf[731]:= #13;
           buf[732]:= #10;
           BlockWrite(ToF,Buf,sizeof(buf));
           inc(indice)
         end;
     end;
   CloseFile(ToF);
end;


procedure TCtrlGeraDirf.Principal(IdResponsavel, TipoArquivo, NaturDeclar : Integer; Retencao, PesExi : Boolean; rValorMinimo : Real;
                                  sNomeArquivo, sAno, sAnoref : string;
                                  IdPessoa, iSistema : Longint; DataIni, DataFim, Numdocumento : string);
var sLinha, SEI, sNatureza: string;
    ArquivoTexto : TextFile;
    bDelete, bSair : Boolean;
    j  : LongInt;
    sPesExi,sCGCBenef, sCodNatureza : string;
    rJan1, rFev1,rMar1,rAbr1,rMai1,rJun1,rJul1,rAgo1,rSet1,rOut1,rNov1,
    rDez1,rJan2,rFev2,rMar2,rAbr2,rMai2,rJun2,rJul2,rAgo2,rSet2,rOut2,rNov2,
    rDez2,rJan3,rFev3,rMar3,rAbr3,rMai3,rJun3,rJul3,rAgo3,rSet3,rOut3,rNov3,
    rDez3,r131,r132,r133 : Double;
    rJan4,rFev4,rMar4,rAbr4,rMai4,rJun4,rJul4,rAgo4,rSet4,rOut4,rNov4,
    rDez4,rJan5,rFev5,rMar5,rAbr5,rMai5,rJun5,rJul5,rAgo5,rSet5,rOut5,rNov5,
    rDez5,r134,r135 : Double;
    rJan6, rFev6,rMar6,rAbr6,rMai6,rJun6,rJul6,rAgo6,rSet6,rOut6,rNov6,
    rDez6,rJan7,rFev7,rMar7,rAbr7,rMai7,rJun7,rJul7,rAgo7,rSet7,rOut7,rNov7,
    rDez7,rJan8,rFev8,rMar8,rAbr8,rMai8,rJun8,rJul8,rAgo8,rSet8,rOut8,rNov8,
    rDez8 : Double;
    ContTipo2 : LongInt; //serve para contar os registros tipo 2 para informar no registro totalizador
    sNomeBenef  : String;
    sValor      : String;
    fRendimento : Extended;
    fValor      : Extended;
    iContador   : Integer;

    tbmDirf     : TBookMark; 
    bGerou      : Boolean; 

    //CPrev - Pend. 27026 - Início
    bTemTipoZero: Boolean;
    bTemRendMin : Boolean;
    //CPrev - Pend. 27026 - Fim
    bEntra      : Boolean;
    sVlrDezembro : Extended;
begin
   //
   bGerou := False;
   CdsResponsavel.data := ListResPonsavel(IdResponsavel);
   //

   case TipoArquivo of
     0: SEI := 'O';
     1: SEI := 'R';
   end;

   AssignFile(ArquivoTexto, sNomeArquivo);
   ReWrite(Arquivotexto);
   //Tratamento Especial
   sMens := 'Primeira Fase';

   FMaxProgresso      := cds.RecordCount;
   FProgresso         := 0;
   bSair := False;
   cds.First;
   j := 1;
   Cds.First;

   FMaxProgresso := Cds.RecordCount;
   FProgresso    := 0;
   sMens := 'Terceira Fase';
   if not PesExi then
     sPesExi := '0'
   else
     sPesExi := '1';
   //Gera o Cabeçalho do arquivo texto
   sLinha :=
     '00000001'+'1'+
     CompletaZero(Cds.fieldByname('CGCEMPRE').AsString,14)+'DIRF'+
     sAno+SEI+'1'+'2'+IntToStr(NaturDeclar)+sPesExi+sAnoRef+'0'+
     Completa('',1)+
     Completa(Cds.fieldByname('NOMEEMPRE').AsString,60)+
     CompletaZero(Copy(CdsResponsavel.fieldByname('NUMDOCUMENTO').AsString,1,11),11)+Completa('',37)+
     CompletaZero(Cds.fieldByname('CGCEMPRE').AsString,14)+Completa('',241)+
     CompletaZero(Copy(CdsResponsavel.fieldByname('NUMDOCUMENTO').AsString,1,11),11)+
     Completa(CdsResponsavel.fieldByname('RAZAOSOCIAL').AsString,60)+
     CompletaZero(Copy(CdsResponsavel.fieldByname('DDD').AsString,1,4),4)+
     CompletaZero(Copy(CdsResponsavel.fieldByname('TELEFONE').AsString,1,8),8)+
     CompletaZero('',6)+
     CompletaZero(Copy(CdsResponsavel.fieldByname('FAX').AsString,1,8),8)+
     Completa(Copy(CdsResponsavel.fieldByname('EMAIL').AsString,1,50),50)+
     Completa('',165) + Completa('',12) + '9';

   //Marilza Colpani-SOL 127098/KTN 672221 - código comentado para trazer a primeira linha do arquivo txt com caracteres especiais.
   //sLinha := CaracteresEspeciais( sLinha );

   WriteLn(ArquivoTexto, sLinha);

   CdsJudicial.data := ListGeraDirfJudicial_Suspensa(IdPessoa, iSistema, DataIni, DataFim, Copy(cdsEmpresa.FieldByName('NUMDOCUMENTO').AsString,1,8), rValorMinimo);

   iContador := 0;
   frmProgresso.MostraFormProgresso('Processando',True,False,True,0,cds.RecordCount);

   sCgcBenef := ''; //CPrev - Pend. 27026

   //1º while
   //Este while é para gerar os registros de rendimentos comuns do beneficiário.
   While not Cds.EOF do
   Begin
     sNatureza := Cds.fieldByname('CODNATUREZA').AsString;
     CdsJudicial.first;
     While (sNatureza = Cds.fieldByname('CODNATUREZA').AsString) and (not Cds.EOF) do
     Begin

       //CPrev - Pend. 27026 - Início
       if (sCgcBenef <> Cds.fieldByname('CGCBENEF').AsString) then
       begin
         //CPrev - Pend. 27026 - 30/01/2008 - if retencao then
         //CPrev - Pend. 27026 - 30/01/2008 - begin
         if ((cds.fieldByname('JAN2').AsFloat +
              cds.fieldByname('FEV2').AsFloat +
              cds.fieldByname('MAR2').AsFloat +
              cds.fieldByname('ABR2').AsFloat +
              cds.fieldByname('MAI2').AsFloat +
              cds.fieldByname('JUN2').AsFloat +
              cds.fieldByname('JUL2').AsFloat +
              cds.fieldByname('AGO2').AsFloat +
              cds.fieldByname('SET2').AsFloat +
              cds.fieldByname('OUT2').AsFloat +
              cds.fieldByname('NOV2').AsFloat +
              cds.fieldByname('DEZ2').AsFloat) > 0) and
             (cds.fieldByname('TIPOREG').AsFloat = 0) then
           bTemTipoZero := True
         else
           bTemTipoZero := False;
         //CPrev - Pend. 27026 - 30/01/2008 - end
         //CPrev - Pend. 27026 - 30/01/2008 - else
         //CPrev - Pend. 27026 - 30/01/2008 -   bTemTipoZero := True;

         //CPrev - Pend. 27026 - 30/01/2008 - if rValorMinimo > 0 then
         //CPrev - Pend. 27026 - 30/01/2008 - begin
         if ((cds.fieldByname('JAN1').AsFloat +
              cds.fieldByname('FEV1').AsFloat +
              cds.fieldByname('MAR1').AsFloat +
              cds.fieldByname('ABR1').AsFloat +
              cds.fieldByname('MAI1').AsFloat +
              cds.fieldByname('JUN1').AsFloat +
              cds.fieldByname('JUL1').AsFloat +
              cds.fieldByname('AGO1').AsFloat +
              cds.fieldByname('SET1').AsFloat +
              cds.fieldByname('OUT1').AsFloat +
              cds.fieldByname('NOV1').AsFloat +
              cds.fieldByname('DEZ1').AsFloat) > (rValorMinimo * 100)) and
             (cds.fieldByname('TIPOREG').AsFloat = 0) then
           bTemRendMin := True
         else
           bTemRendMin := False;
         //CPrev - Pend. 27026 - 30/01/2008 - end
         //CPrev - Pend. 27026 - 30/01/2008 - else
         //CPrev - Pend. 27026 - 30/01/2008 -   bTemRendMin := True;
       end;

       {if (retencao) and (not bTemTipoZero) then
       begin
         sCgcBenef    := Cds.fieldByname('CGCBENEF').AsString;
         cds.Next;
         Continue;
       end;

       if (rValorMinimo > 0) and (not bTemRendMin) then
       begin
         sCgcBenef    := Cds.fieldByname('CGCBENEF').AsString;
         cds.Next;
         Continue;
       end;}

       {if (((retencao)         and (bTemTipoZero))  or
           ((not retencao)     and (bTemTipoZero))) and

          (((rValorMinimo > 0) and (bTemRendMin))  or
           ((rValorMinimo = 0) and (bTemRendMin))) then
       begin  }

       bEntra := False;

       If (((retencao) and (bTemTipoZero)) and (rValorMinimo = 0)) or                      // Entra somente Reteção
          (((retencao) and (bTemTipoZero)) or  ((rValorMinimo <> 0) and (bTemRendMin))) or // Entra ou Retenção ou Rendimento Minimo
          ((Not retencao) and ((rValorMinimo <> 0) and (bTemRendMin))) or                  // Entra Só Rendimento Mínimo
          ((Not retencao) and (rValorMinimo = 0)) Then                                    // Entra Todos
         bEntra := True;

       If bEntra Then
       begin
       //CPrev - Pend. 27026 - Fim

         FProgresso := FProgresso + 1;
         Inc(j);
         inc(ContTipo2);

         inc(iContador);
         frmProgresso.AndaFormProgresso(iContador);
         Application.ProcessMessages;
         frmProgresso.Repaint;

         sLinha := '';
         sLinha := sLinha + CompletaZero(IntToStr(j),8);
         sLinha := sLinha + '2';
         sLinha := sLinha + CompletaZero(Cds.fieldByname('CGCEMPRE').AsString,14);
         sLinha := sLinha + CompletaZero(Cds.fieldByname('CODNATUREZA').AsString,4);
         if Cds.fieldByname('TIPO').AsString = 'J' then
            sLinha := sLinha + '2'
         else                                   
            sLinha := sLinha + '1';
         sLinha := sLinha + CompletaZero(Cds.fieldByname('CGCBENEF').AsString,14);
         sLinha := sLinha + Completa(Cds.fieldByname('NOMEBENEF').AsString,60);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JAN1').AsString, '-', '', [rfReplaceAll]),15);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JAN3').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JAN2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('FEV1').AsString, '-', '', [rfReplaceAll]),15);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('FEV3').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('FEV2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('MAR1').AsString, '-', '', [rfReplaceAll]),15);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('MAR3').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('MAR2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('ABR1').AsString, '-', '', [rfReplaceAll]),15);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('ABR3').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('ABR2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('MAI1').AsString, '-', '', [rfReplaceAll]),15);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('MAI3').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('MAI2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JUN1').AsString, '-', '', [rfReplaceAll]),15);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JUN3').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JUN2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JUL1').AsString, '-', '', [rfReplaceAll]),15);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JUL3').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('JUL2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('AGO1').AsString, '-', '', [rfReplaceAll]),15);

         fRendimento := StrToFloat(Cds.fieldByname('AGO1').AsString);
         sValor      := Cds.fieldByname('AGO3').AsString;
         fValor      := StrToFloat(Cds.fieldByname('AGO3').AsString);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('AGO2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('SET1').AsString, '-', '', [rfReplaceAll]),15);

         fRendimento := StrToFloat(Cds.fieldByname('SET1').AsString);
         sValor      := Cds.fieldByname('SET3').AsString;
         fValor      := StrToFloat(Cds.fieldByname('SET3').AsString);

         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);


         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('SET2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('OUT1').AsString, '-', '', [rfReplaceAll]),15);

         fRendimento := StrToFloat(Cds.fieldByname('OUT1').AsString);
         sValor      := Cds.fieldByname('OUT3').AsString;
         fValor      := StrToFloat(Cds.fieldByname('OUT3').AsString);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('OUT2').AsString, '-', '', [rfReplaceAll]),15);
         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('NOV1').AsString, '-', '', [rfReplaceAll]),15);

         fRendimento := StrToFloat(Cds.fieldByname('NOV1').AsString);
         sValor      := Cds.fieldByname('NOV3').AsString;
         fValor      := StrToFloat(Cds.fieldByname('NOV3').AsString);
         if Cds.fieldByname('TIPO').AsString = 'J' Then
           sLinha := sLinha + CompletaZero('0',15)
         else
           sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('NOV2').AsString, '-', '', [rfReplaceAll]),15);
         // Alterado Por Arnaldo V. Scarin em 03/01/2011 - SOL: 149436 KTN: 1071285
         // Essa correção foi implementada para que possa ser somado o valor do 13o. salario
         // no valor do beneficio do mes de dezembro.
         If (Cds.FieldByName('TIPOREG').AsString = '0') and
            (Cds.FieldByName('CODNATUREZA').asString = '5565') then
         begin
           sVlrDezembro := Cds.fieldByname('DEZ1').AsFloat + Cds.fieldByname('VLR131').AsFloat;
           sLinha := sLinha + CompletaZero(StringReplace(FloatToStr(sVlrDezembro), '-', '', [rfReplaceAll]),15);

           fRendimento := StrToFloat(Cds.fieldByname('DEZ1').AsString);
           sValor      := Cds.fieldByname('DEZ3').AsString;
           fValor      := StrToFloat(Cds.fieldByname('DEZ3').AsString);
           if Cds.fieldByname('TIPO').AsString = 'J' Then
             sLinha := sLinha + CompletaZero('0',15)
           else
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('DEZ2').AsString, '-', '', [rfReplaceAll]),15);
           sLinha := sLinha + CompletaZero('0',15);

           fRendimento := StrToFloat(Cds.fieldByname('VLR131').AsString);
           sValor      := Cds.fieldByname('VLR132').AsString;
           fValor      := StrToFloat(Cds.fieldByname('VLR132').AsString);
           if Cds.fieldByname('TIPO').AsString = 'J' Then
             sLinha := sLinha + CompletaZero('0',15)
           else
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);
         end
         else
         begin
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('DEZ1').AsString, '-', '', [rfReplaceAll]),15);

           fRendimento := StrToFloat(Cds.fieldByname('DEZ1').AsString);
           sValor      := Cds.fieldByname('DEZ3').AsString;
           fValor      := StrToFloat(Cds.fieldByname('DEZ3').AsString);
           if Cds.fieldByname('TIPO').AsString = 'J' Then
             sLinha := sLinha + CompletaZero('0',15)
           else
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('DEZ2').AsString, '-', '', [rfReplaceAll]),15);
           sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('VLR131').AsString, '-', '', [rfReplaceAll]),15);

           fRendimento := StrToFloat(Cds.fieldByname('VLR131').AsString);
           sValor      := Cds.fieldByname('VLR132').AsString;
           fValor      := StrToFloat(Cds.fieldByname('VLR132').AsString);
           if Cds.fieldByname('TIPO').AsString = 'J' Then
             sLinha := sLinha + CompletaZero('0',15)
           else
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);
         end;

         sLinha := sLinha + CompletaZero(StringReplace(Cds.fieldByname('VLR133').AsString, '-', '', [rfReplaceAll]),15);

         //CPREV - Pend. 27026 - sLinha := sLinha + Completa('',30)+Completa('',13);
         //CPREV - Pend. 27026 - Início
         sLinha := sLinha + '0';
         sLinha := sLinha + Cds.FieldByName('TIPOREG').AsString;
         sLinha := sLinha + Completa('',8);
         sLinha := sLinha + Completa('',32);
         sLinha := sLinha + '9';
         //CPREV - Pend. 27026 - Fim

         sLinha := CaracteresEspeciais( sLinha ); //Marilza Colpani-SOL 125645/KTN 649749
         WriteLn(ArquivoTexto, sLinha);

         //CPREV - Pend. 27026 - Início
         if cds.FieldByName('TIPOREG').AsInteger = 0 then
         begin
           rJan1 := rJan1 + Cds.fieldByname('JAN1').AsFloat;
           rFev1 := rFev1 + Cds.fieldByname('FEV1').AsFloat;
           rMar1 := rMar1 + Cds.fieldByname('MAR1').AsFloat;
           rAbr1 := rAbr1 + Cds.fieldByname('ABR1').AsFloat;
           rMai1 := rMai1 + Cds.fieldByname('MAI1').AsFloat;
           rJun1 := rJun1 + Cds.fieldByname('JUN1').AsFloat;
           rJul1 := rJul1 + Cds.fieldByname('JUL1').AsFloat;
           rAgo1 := rAgo1 + Cds.fieldByname('AGO1').AsFloat;
           rSet1 := rSet1 + Cds.fieldByname('SET1').AsFloat;
           rOut1 := rOut1 + Cds.fieldByname('OUT1').AsFloat;
           rNov1 := rNov1 + Cds.fieldByname('NOV1').AsFloat;
           rDez1 := rDez1 + Cds.fieldByname('DEZ1').AsFloat;
           rJan2 := rJan2 + Cds.fieldByname('JAN2').AsFloat;
           rFev2 := rFev2 + Cds.fieldByname('FEV2').AsFloat;
           rMar2 := rMar2 + Cds.fieldByname('MAR2').AsFloat;
           rAbr2 := rAbr2 + Cds.fieldByname('ABR2').AsFloat;
           rMai2 := rMai2 + Cds.fieldByname('MAI2').AsFloat;
           rJun2 := rJun2 + Cds.fieldByname('JUN2').AsFloat;
           rJul2 := rJul2 + Cds.fieldByname('JUL2').AsFloat;
           rAgo2 := rAgo2 + Cds.fieldByname('AGO2').AsFloat;
           rSet2 := rSet2 + Cds.fieldByname('SET2').AsFloat;
           rOut2 := rOut2 + Cds.fieldByname('OUT2').AsFloat;
           rNov2 := rNov2 + Cds.fieldByname('NOV2').AsFloat;
           rDez2 := rDez2 + Cds.fieldByname('DEZ2').AsFloat;
           rJan3 := rJan3 + Cds.fieldByname('JAN3').AsFloat;
           rFev3 := rFev3 + Cds.fieldByname('FEV3').AsFloat;
           rMar3 := rMar3 + Cds.fieldByname('MAR3').AsFloat;
           rAbr3 := rAbr3 + Cds.fieldByname('ABR3').AsFloat;
           rMai3 := rMai3 + Cds.fieldByname('MAI3').AsFloat;
           rJun3 := rJun3 + Cds.fieldByname('JUN3').AsFloat;
           rJul3 := rJul3 + Cds.fieldByname('JUL3').AsFloat;
           rAgo3 := rAgo3 + Cds.fieldByname('AGO3').AsFloat;
           rSet3 := rSet3 + Cds.fieldByname('SET3').AsFloat;
           rOut3 := rOut3 + Cds.fieldByname('OUT3').AsFloat;
           rNov3 := rNov3 + Cds.fieldByname('NOV3').AsFloat;
           rDez3 := rDez3 + Cds.fieldByname('DEZ3').AsFloat;
           r131  := r131  + Cds.fieldByname('VLR131').AsFloat;
           r132  := r132  + Cds.fieldByname('VLR132').AsFloat;
           r133  := r133  + Cds.fieldByname('VLR133').AsFloat;
         end;
       end;

       sCodNatureza := Cds.fieldByname('CODNATUREZA').AsString;
       sCgcBenef    := Cds.fieldByname('CGCBENEF').AsString;
       sNomeBenef := StringReplace(Cds.fieldByname('NOMEBENEF').AsString,'''','',[rfReplaceAll]);
       Cds.Next;

       if (sCGCBenef <> Cds.FieldByName('CGCBENEF').AsString) or
          (cds.Eof) then
       begin
       //CPREV - Pend. 27026 - Fim

         CdsJudicial.first;
         //CPrev - Pend. 27026 - sNomeBenef := StringReplace(Cds.fieldByname('NOMEBENEF').AsString,'''','',[rfReplaceAll]);
         //CPrev - Pend. 27026 - if CdsJudicial.Locate('CODNATUREZA;NOMEBENEF;CGCBENEF', VarArrayOf([Cds.fieldByname('CODNATUREZA').AsString, sNomeBenef, Cds.fieldByname('CGCBENEF').AsString]), []) THEN
         if CdsJudicial.Locate('CODNATUREZA;NOMEBENEF;CGCBENEF', VarArrayOf([sCodNatureza, sNomeBenef, sCgcBenef]), []) THEN //CPrev - Pend. 27026
         Begin
           //Verifica se tem compensação judicial para ser gerado o arquivo
           if (CdsJudicial.FieldByName('JAN4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR134').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JAN6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR136').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := '';
             sLinha := sLinha + CompletaZero(IntToStr(j),8);
             sLinha := sLinha + '2';
             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
             sLinha := sLinha + '0561';

             if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
               sLinha := sLinha + '2'
             else
               sLinha := sLinha + '1';
             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
             sLinha := sLinha + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

             sLinha := sLinha + CompletaZero(FormatFloat('0', CdsJudicial.fieldByname('JAN6').AsFloat),15);  //Valor Anos anteriores
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN4').AsFloat),15); //valor ano base
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15); //em branco

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);
             //Valor do 13º por decisão judicial
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR136').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR134').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + '1'; //Indentifica que o registro se refere a imposto compesado por decisão judicial
             //Bruno Bastos - Sol: 129737 - Kintana: 706853 - sLinha := sLinha + Completa('',42);
             //Bruno Bastos - Sol: 129737 - Kintana: 706853 - Início
             sLinha := sLinha + Completa('',41);
             sLinha := sLinha + '9';
             //Bruno Bastos - Sol: 129737 - Kintana: 706853 - Fim

             sLinha := CaracteresEspeciais( sLinha ); //Marilza Colpani-SOL 125645/KTN 649749
             WriteLn(ArquivoTexto, sLinha);
           end;


           //Verifica se tem exigibilidade suspensa para gerar o arquivo
           if (CdsJudicial.FieldByName('JAN5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR135').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := GeraLinhaTipoZeroExigSuspensa(j); //CPrev - Pend. 27026
             sLinha := CaracteresEspeciais( sLinha ); //Marilza Colpani-SOL 125645/KTN 649749
             WriteLn(ArquivoTexto, sLinha);
           end;

           //CPrev - Pend. 27026 - Início
           //Registro de tipo 1 de exigibilidade suspença
           if (CdsJudicial.FieldByName('JAN9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('FEV9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAR9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('ABR9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAI9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUN9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUL9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('AGO9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('SET9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('OUT9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('NOV9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('DEZ9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('VLR139').AsFloat  <> 0) or
              (CdsJudicial.FieldByName('JAN10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('FEV10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAR10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('ABR10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAI10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUN10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUL10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('AGO10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('SET10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('OUT10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('NOV10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('DEZ10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('VLR1310').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JAN11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('FEV11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAR11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('ABR11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAI11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUN11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUL11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('AGO11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('SET11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('OUT11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('NOV11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('DEZ11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('VLR1311').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := GeraLinhaTipoUmExigSuspensa(j); //CPrev - Pend. 27026
             sLinha := CaracteresEspeciais( sLinha ); //Marilza Colpani-SOL 125645/KTN 649749
             WriteLn(ArquivoTexto, sLinha);
           end;

           //Registro de tipo 2 de exigibilidade suspença
           if (CdsJudicial.FieldByName('JAN12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('FEV12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAR12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('ABR12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAI12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUN12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUL12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('AGO12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('SET12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('OUT12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('NOV12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('DEZ12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('VLR1312').AsFloat  <> 0) then
           Begin
             Inc(j);
             sLinha := GeraLinhaTipoDoisExigSuspensa(j); //CPrev - Pend. 27026
             sLinha := CaracteresEspeciais( sLinha ); //Marilza Colpani-SOL 125645/KTN 649749
             WriteLn(ArquivoTexto, sLinha);
           end;
           //CPrev - Pend. 27026 - Fim

           //Verifica se tem depósito judicial
           if (CdsJudicial.FieldByName('JAN8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR138').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := '';
             sLinha := sLinha + CompletaZero(IntToStr(j),8);
             sLinha := sLinha + '2';
             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
             sLinha := sLinha + '0561';
             if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
               sLinha := sLinha + '2'
             else
               sLinha := sLinha + '1';
             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
             sLinha := sLinha + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN8').AsFloat),15);  //Depósito Judicial
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);
             //Valor do depósito judicial do 13º
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR138').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);


             sLinha := sLinha + '3'; //Indentifica que o registro se refere a depósito judicial
             //Bruno Bastos - Sol: 129737 - Kintana: 706853 - sLinha := sLinha + Completa('',42);
             //Bruno Bastos - Sol: 129737 - Kintana: 706853 - Início
             sLinha := sLinha + Completa('',41);
             sLinha := sLinha + '9';
             //Bruno Bastos - Sol: 129737 - Kintana: 706853 - Fim

             sLinha := CaracteresEspeciais( sLinha ); //Marilza Colpani-SOL 125645/KTN 649749
             WriteLn(ArquivoTexto, sLinha);
           end;

         end;
       end;
       { //CPrev - Pend. 27026 - Início Comentário
       rJan1 := rJan1 + Cds.fieldByname('JAN1').AsFloat;
       rFev1 := rFev1 + Cds.fieldByname('FEV1').AsFloat;
       rMar1 := rMar1 + Cds.fieldByname('MAR1').AsFloat;
       rAbr1 := rAbr1 + Cds.fieldByname('ABR1').AsFloat;
       rMai1 := rMai1 + Cds.fieldByname('MAI1').AsFloat;
       rJun1 := rJun1 + Cds.fieldByname('JUN1').AsFloat;
       rJul1 := rJul1 + Cds.fieldByname('JUL1').AsFloat;
       rAgo1 := rAgo1 + Cds.fieldByname('AGO1').AsFloat;
       rSet1 := rSet1 + Cds.fieldByname('SET1').AsFloat;
       rOut1 := rOut1 + Cds.fieldByname('OUT1').AsFloat;
       rNov1 := rNov1 + Cds.fieldByname('NOV1').AsFloat;
       rDez1 := rDez1 + Cds.fieldByname('DEZ1').AsFloat;
       rJan2 := rJan2 + Cds.fieldByname('JAN2').AsFloat;
       rFev2 := rFev2 + Cds.fieldByname('FEV2').AsFloat;
       rMar2 := rMar2 + Cds.fieldByname('MAR2').AsFloat;
       rAbr2 := rAbr2 + Cds.fieldByname('ABR2').AsFloat;
       rMai2 := rMai2 + Cds.fieldByname('MAI2').AsFloat;
       rJun2 := rJun2 + Cds.fieldByname('JUN2').AsFloat;
       rJul2 := rJul2 + Cds.fieldByname('JUL2').AsFloat;
       rAgo2 := rAgo2 + Cds.fieldByname('AGO2').AsFloat;
       rSet2 := rSet2 + Cds.fieldByname('SET2').AsFloat;
       rOut2 := rOut2 + Cds.fieldByname('OUT2').AsFloat;
       rNov2 := rNov2 + Cds.fieldByname('NOV2').AsFloat;
       rDez2 := rDez2 + Cds.fieldByname('DEZ2').AsFloat;
       rJan3 := rJan3 + Cds.fieldByname('JAN3').AsFloat;
       rFev3 := rFev3 + Cds.fieldByname('FEV3').AsFloat;
       rMar3 := rMar3 + Cds.fieldByname('MAR3').AsFloat;
       rAbr3 := rAbr3 + Cds.fieldByname('ABR3').AsFloat;
       rMai3 := rMai3 + Cds.fieldByname('MAI3').AsFloat;
       rJun3 := rJun3 + Cds.fieldByname('JUN3').AsFloat;
       rJul3 := rJul3 + Cds.fieldByname('JUL3').AsFloat;
       rAgo3 := rAgo3 + Cds.fieldByname('AGO3').AsFloat;
       rSet3 := rSet3 + Cds.fieldByname('SET3').AsFloat;
       rOut3 := rOut3 + Cds.fieldByname('OUT3').AsFloat;
       rNov3 := rNov3 + Cds.fieldByname('NOV3').AsFloat;
       rDez3 := rDez3 + Cds.fieldByname('DEZ3').AsFloat;
       r131  := r131  + Cds.fieldByname('VLR131').AsFloat;
       r132  := r132  + Cds.fieldByname('VLR132').AsFloat;
       r133  := r133  + Cds.fieldByname('VLR133').AsFloat;

       sCgcBenef    := Cds.fieldByname('CGCBENEF').AsString; //CPrev - Pend. 27026
      Cds.Next;
       } //CPrev - Pend. 27026 - Fim Comentário
     end;

     (*
     If Not bGerou Then
     Begin
       CdsJudicial.first;
       //CPREV - Pend. 27026 - tbmDirf    := cds.GetBookmark;
       While not CdsJudicial.Eof Do
       Begin
         tbmDirf    := cds.GetBookmark; //CPREV - Pend. 27026
         sNomeBenef := StringReplace(CdsJudicial.fieldByname('NOMEBENEF').AsString,'''','',[rfReplaceAll]);
         if Cds.Locate('CODNATUREZA;NOMEBENEF;CGCBENEF;TIPOREG', VarArrayOf([CdsJudicial.fieldByname('CODNATUREZA').AsString, sNomeBenef, CdsJudicial.fieldByname('CGCBENEF').AsString, '2']), []) THEN
           CdsJudicial.Next
         Else
         Begin
           if (CdsJudicial.FieldByName('JAN4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ4').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR134').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JAN6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ6').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR136').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := '';
             sLinha := sLinha + CompletaZero(IntToStr(j),8);
             sLinha := sLinha + '2';
             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
             sLinha := sLinha + '0561';
             if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
               sLinha := sLinha + '2'
             else
               sLinha := sLinha + '1';

             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
             sLinha := sLinha + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

             sLinha := sLinha + CompletaZero(FormatFloat('0', CdsJudicial.fieldByname('JAN6').AsFloat),15);  //Valor Anos anteriores
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN4').AsFloat),15); //valor ano base
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15); //em branco

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ6').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ4').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);
              //Valor do 13º por decisão judicial
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR136').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR134').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',0),15);

             sLinha := sLinha + '1'; //Indentifica que o registro se refere a imposto compesado por decisão judicial
             sLinha := sLinha + Completa('',42);
             WriteLn(ArquivoTexto, sLinha);
           end;


           //Verifica se tem exigibilidade suspensa para gerar o arquivo
           (*
           if (CdsJudicial.FieldByName('JAN5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ5').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR135').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := '';
             sLinha := sLinha + CompletaZero(IntToStr(j),8);
             sLinha := sLinha + '2';
             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
             sLinha := sLinha + '0561';
             if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
               sLinha := sLinha + '2'
             else
               sLinha := sLinha + '1';

             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
             sLinha := sLinha + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN5').AsFloat),15);  //Rendimentos pagos cuja tributação está sob exigibilidade suspensa
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN7').AsFloat),15); //Dedução dos rendimentos pagos cuja tributação está sob exigibilidade suspensa
             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV5').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV7').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR5').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR7').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR5').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR7').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI5').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI7').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN5').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN7').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL5').AsFloat),15);
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL7').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO5').AsFloat),15);

             fRendimento := StrToFloat(CdsJudicial.fieldByname('AGO5').AsString);
             sValor      := FormatFloat('0',CdsJudicial.fieldByname('AGO7').AsFloat);
             fValor      := CdsJudicial.fieldByname('AGO7').AsFloat;
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET5').AsFloat),15);

             fRendimento := StrToFloat(CdsJudicial.fieldByname('SET5').AsString);
             sValor      := FormatFloat('0',CdsJudicial.fieldByname('SET7').AsFloat);
             fValor      := CdsJudicial.fieldByname('SET7').AsFloat;
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT5').AsFloat),15);

             fRendimento := StrToFloat(CdsJudicial.fieldByname('OUT5').AsString);
             sValor      := FormatFloat('0',CdsJudicial.fieldByname('OUT7').AsFloat);
             fValor      := CdsJudicial.fieldByname('OUT7').AsFloat;
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV5').AsFloat),15);

             fRendimento := StrToFloat(CdsJudicial.fieldByname('NOV5').AsString);
             sValor      := FormatFloat('0',CdsJudicial.fieldByname('NOV7').AsFloat);
             fValor      := CdsJudicial.fieldByname('NOV7').AsFloat;
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ5').AsFloat),15);

             fRendimento := StrToFloat(CdsJudicial.fieldByname('DEZ5').AsString);
             sValor      := FormatFloat('0',CdsJudicial.fieldByname('DEZ7').AsFloat);
             fValor      := CdsJudicial.fieldByname('DEZ7').AsFloat;
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.
             //Valor do 13º por exigibilidade suspensa
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR135').AsFloat),15);

             fRendimento := StrToFloat(CdsJudicial.fieldByname('VLR135').AsString);
             sValor      := FormatFloat('0',CdsJudicial.fieldByname('VLR137').AsFloat);
             fValor      := CdsJudicial.fieldByname('VLR137').AsFloat;
             sLinha := sLinha + CompletaZero(StringReplace(sValor, '-', '', [rfReplaceAll]),15);

             sLinha := sLinha + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

             sLinha := sLinha + '2'; //Indentifica que o registro se refere a exigibilidade
             sLinha := sLinha + Completa('',42);
             WriteLn(ArquivoTexto, sLinha);
           end;

           //Verifica se tem exigibilidade suspensa para gerar o arquivo
           if (CdsJudicial.FieldByName('JAN5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('FEV5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAR5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('ABR5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAI5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUN5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUL5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('AGO5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('SET5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('OUT5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('NOV5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('DEZ5').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('VLR135').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := GeraLinhaTipoZeroExigSuspensa(j); //CPrev - Pend. 27026
             WriteLn(ArquivoTexto, sLinha);
           end;

           //CPrev - Pend. 27026 - Início
           //Registro de tipo 1 de exigibilidade suspença
           if (CdsJudicial.FieldByName('JAN9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('FEV9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAR9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('ABR9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAI9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUN9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUL9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('AGO9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('SET9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('OUT9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('NOV9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('DEZ9').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('VLR139').AsFloat  <> 0) or
              (CdsJudicial.FieldByName('JAN10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('FEV10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAR10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('ABR10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAI10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUN10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUL10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('AGO10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('SET10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('OUT10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('NOV10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('DEZ10').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('VLR1310').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JAN11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('FEV11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAR11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('ABR11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('MAI11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUN11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('JUL11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('AGO11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('SET11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('OUT11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('NOV11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('DEZ11').AsFloat   <> 0) or
              (CdsJudicial.FieldByName('VLR1311').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := GeraLinhaTipoUmExigSuspensa(j); //CPrev - Pend. 27026
             WriteLn(ArquivoTexto, sLinha);
           end;

           //Registro de tipo 2 de exigibilidade suspença
           if (CdsJudicial.FieldByName('JAN12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('FEV12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAR12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('ABR12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('MAI12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUN12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('JUL12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('AGO12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('SET12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('OUT12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('NOV12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('DEZ12').AsFloat    <> 0) or
              (CdsJudicial.FieldByName('VLR1312').AsFloat  <> 0) then
           Begin
             Inc(j);
             sLinha := GeraLinhaTipoDoisExigSuspensa(j); //CPrev - Pend. 27026
             WriteLn(ArquivoTexto, sLinha);
           end;
           //CPrev - Pend. 27026 - Fim

           //Verifica se tem depósito judicial
           if (CdsJudicial.FieldByName('JAN8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('FEV8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAR8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('ABR8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('MAI8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUN8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('JUL8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('AGO8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('SET8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('OUT8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('NOV8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('DEZ8').AsFloat <> 0) or
              (CdsJudicial.FieldByName('VLR138').AsFloat <> 0) then
           Begin
             Inc(j);
             sLinha := '';
             sLinha := sLinha + CompletaZero(IntToStr(j),8);
             sLinha := sLinha + '2';
             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
             sLinha := sLinha + '0561';

             if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
                sLinha := sLinha + '2'
             else
                sLinha := sLinha + '1';

             sLinha := sLinha + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
             sLinha := sLinha + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN8').AsFloat),15);  //Depósito Judicial
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);

             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ8').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);
             //Valor do depósito judicial do 13º
             sLinha := sLinha + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR138').AsFloat),15);
             sLinha := sLinha + CompletaZero('0',15);
             sLinha := sLinha + CompletaZero('0',15);


             sLinha := sLinha + '3'; //Indentifica que o registro se refere a depósito judicial
             sLinha := sLinha + Completa('',42);
             WriteLn(ArquivoTexto, sLinha);
           end;

           CdsJudicial.next;
         end;
       End;
       bGerou := True;

       //CPrev - Pend. 27026 - Início
       sCgcBenef    := Cds.fieldByname('CGCBENEF').AsString; //CPrev - Pend. 27026
       Cds.Next;
       //CPrev - Pend. 27026 - Fim

       //CPREV - Pend. 27026 - cds.GotoBookmark(tbmDirf);
     End;
     *)

     //Pend. 20460 - 17/10/2005 cds.Last;

     (*
     	 //gerar tipo 3 aqui
     Inc(j);
     sLinha := '';
     sLinha := sLinha + CompletaZero(IntToStr(j),8);
     sLinha := sLinha + '3';
     sLinha := sLinha + CompletaZero(cds.fieldByname('CGCEMPRE').AsString,14);
     sLinha := sLinha + CompletaZero(sNatureza ,4);
     sLinha := sLinha + CompletaZero(intTostr(ContTipo2), 8);
     sLinha := sLinha + Completa('', 67);

     sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJan1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJan3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJan2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rFev1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rFev3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rFev2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMar1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMar3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMar2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAbr1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAbr3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAbr2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMai1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMai3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMai2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJun1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJun3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJun2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJul1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJul3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJul2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAgo1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAgo3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAgo2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rSet1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rSet3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rSet2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rOut1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rOut3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rOut2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rNov1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rNov3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rNov2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rDez1), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rDez3), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rDez2), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(r131), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(r132), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + CompletaZero(StringReplace(floatTostr(r133), '-', '', [rfReplaceAll]),15);
       sLinha := sLinha + Completa('', 30);

       //CPREV - Pend. 27026 - sLinha := sLinha + Completa('', 13);
       //CPREV - Pend. 27026 - Início
       sLinha := sLinha + Completa('', 12);
       sLinha := sLinha + '9';
       //CPREV - Pend. 27026 - Fim

       writeln(ArquivoTexto, sLinha);
     *)
   end; //end while principal

   //gerar tipo 3 aqui
   Inc(j);
   sLinha := '';
   sLinha := sLinha + CompletaZero(IntToStr(j),8);
   sLinha := sLinha + '3';
   sLinha := sLinha + CompletaZero(cds.fieldByname('CGCEMPRE').AsString,14);
   sLinha := sLinha + CompletaZero(sNatureza ,4);
   sLinha := sLinha + CompletaZero(intTostr(ContTipo2), 8);
   sLinha := sLinha + Completa('', 67);

   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJan1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJan3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJan2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rFev1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rFev3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rFev2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMar1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMar3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMar2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAbr1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAbr3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAbr2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMai1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMai3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rMai2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJun1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJun3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJun2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJul1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJul3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rJul2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAgo1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAgo3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rAgo2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rSet1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rSet3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rSet2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rOut1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rOut3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rOut2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rNov1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rNov3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rNov2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rDez1), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rDez3), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(rDez2), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(r131), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(r132), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + CompletaZero(StringReplace(floatTostr(r133), '-', '', [rfReplaceAll]),15);
   sLinha := sLinha + Completa('', 30);

   //CPREV - Pend. 27026 - sLinha := sLinha + Completa('', 13);
   //CPREV - Pend. 27026 - Início
   sLinha := sLinha + Completa('', 12);
   sLinha := sLinha + '9';
   //CPREV - Pend. 27026 - Fim

   sLinha := CaracteresEspeciais( sLinha ); //Marilza Colpani-SOL 125645/KTN 649749
   writeln(ArquivoTexto, sLinha);

   frmProgresso.EscondeFormProgresso;
   CloseFile(ArquivoTexto);
end;

procedure TCtrlGeraDirf.Rodape(contador_: integer);
var
k,j,i,temp:integer;
scontador,temp3 : string;
somatorioA,somatorioB : extended;
begin
   temp3:= '';
   scontador:= '';
   scontador:= completaZERO(inttostr(contador_),8);
   temp3:= listaDirf[listaDirf.count-1];
   for k:= 1 to 8 do temp3[k]:= scontador[k];
   scontador:= CompletaZero(inttostr(listaDirf.count+listaImport.count-4),4);
   for k:= 29 to 32 do temp3[k]:= scontador[k-28];
   temp := 103;
   for i:= 1 to 39 do
     Begin
       scontador:='';
       for k:= temp to temp+14 do
           scontador:= scontador+listaDirf[listaDirf.count-1][k];
       somatorioA:= strtofloat(scontador);
       scontador:='';
       for k:= temp to temp+14 do
         scontador:= scontador+listaImport[listaImport.count-1][k];
       somatorioB:= strtofloat(scontador);
       scontador:= CompletaZero(floattostr(somatorioA+somatorioB),15);
       j:=1;
       for k:= temp to temp+14 do
         Begin
           temp3[k]:= scontador[j];
           inc(j);
         end;
        inc(temp,15);
     end;
   listatemp.add(temp3);
end;

function TCtrlGeraDirf.ListValoresModulo21Normal(const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
var sSQL : String;
begin
   sSQl :=
   'SELECT  ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS AGO3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS SET3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS OUT3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS NOV3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))) * 100,0) AS DEZ3, ' +
   '    NVL((SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0))) * 100,0) AS VLR132 ' +
   'FROM ' +
   '    INFORME I, ' +
   '    LANCXINFORME LI, ' +
   '    LANCIRRF L, ' +
   '    NATURENDIMENTO N ' +
   'WHERE ' +
   '    (I.IDINFORME = LI.IDINFORME) ' +
   'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
   'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
   'AND (N.FLGUSADONADIRF = ''S'') ' +
   'AND (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ' +
   'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
   'AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ' + 
   'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';
   Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDirf.ListValoresModuloDif21Normal(const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
var sSQL : String;
begin
   sSQl :=
   'SELECT  ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS AGO3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS SET3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS OUT3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS NOV3, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0))+100) * 100,0) AS DEZ3, ' +
   '    NVL((SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0))+100) * 100,0) AS VLR132 ' +
   'FROM ' +
   '    INFORME I, ' +
   '    LANCXINFORME LI, ' +
   '    LANCIRRF L, ' +
   '    NATURENDIMENTO N ' +
   'WHERE ' +
   '    (I.IDINFORME = LI.IDINFORME) ' +
   'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
   'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
   'AND (N.FLGUSADONADIRF = ''S'') ' +
   'AND (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ' +
   'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
   'AND (NVL(L.IDMODULORESPON,L.IDMODULO) <> 21) ' + 
   'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';

   Result := GetDataPacket(sSQL);
end;



function TCtrlGeraDirf.ListValoresModulo21Judicial(const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
var sSQL : String;
begin
   sSQl :=
   'SELECT  ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS AGO7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS SET7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS OUT7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS NOV7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))) * 100,0) AS DEZ7, ' +
   '    NVL((SUM(DECODE(I.CODDIRF,''11'',LI.VLRLANC,0))) * 100,0) AS VLR135 ' +
   'FROM ' +
   '    INFORME I, ' +
   '    LANCXINFORME LI, ' +
   '    LANCIRRF L, ' +
   '    NATURENDIMENTO N ' +
   'WHERE ' +
   '    (I.IDINFORME = LI.IDINFORME) ' +
   'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
   'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
   'AND (N.FLGUSADONADIRF = ''S'') ' +
   'AND (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ' +
   'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
   'AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ' + 
   'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';
   Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDirf.ListValoresModuloDif21Judicial(const iIDBenefIrrf: Extended; sCodNatureza, DataIni, DataFim: String): OleVariant;
var sSQL : String;
begin
   sSQl :=
   'SELECT  ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS AGO7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS SET7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS OUT7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS NOV7, ' +
   '    NVL((SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''13'',LI.VLRLANC,0),0))+100) * 100,0) AS DEZ7, ' +
   '    NVL((SUM(DECODE(I.CODDIRF,''11'',LI.VLRLANC,0))+100) * 100,0) AS VLR135 ' +
   'FROM ' +
   '    INFORME I, ' +
   '    LANCXINFORME LI, ' +
   '    LANCIRRF L, ' +
   '    NATURENDIMENTO N ' +
   'WHERE ' +
   '    (I.IDINFORME = LI.IDINFORME) ' +
   'AND (LI.IDLANCIRRF = L.IDLANCIRRF) ' +
   'AND (L.CODNATUREZA = N.CODNATUREZA) ' +
   'AND (N.FLGUSADONADIRF = ''S'') ' +
   'AND (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ' +
   'AND (L.IDBENEFIRRF = ' + FloatToStr(iIDBenefIrrf) + ') ' +
   'AND (NVL(L.IDMODULORESPON,L.IDMODULO) <> 21) ' + 
   'AND (L.CODNATUREZA = ' + QuotedStr(sCodNatureza) + ') ';

   Result := GetDataPacket(sSQL);
end;


function TCtrlGeraDirf.ListGeraDirfFUNCEF(IdPessoa,iSistema : Integer; DataIni, DataFim, NumDocumento : string; bRetencao : Boolean; rValorMinimo : Real; chkParticipMantido : Boolean; edPessoanotin : String) : OleVariant;
Var

  Ssql       : TstringList;
  iAno, iMes, iDia : word;
begin

  DecodeDate(StrToDate(DataIni), iAno, iMes, iDia);

  Ssql := TStringList.Create;
  with Ssql do
  Begin
//    Append('SELECT  /*+leading(XB) index(p Xie10Pessoa) index(e IdxPessoa)*/ distinct');
    Append('SELECT distinct');
//    Append('        P.TIPO, TRIM(P.RAZAOSOCIAL) AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF,');
    Append('        P.TIPO, (TRIM(DECODE(P.RAZAOSOCIAL, '''', P.NOME, P.RAZAOSOCIAL))) AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF,'); //Marilza Colpani-SOL 125645/KTN 649749
    Append(' XB.TIPOREG, '); //CPREV - Pend. 27026
//    Append('        E.NUMDOCUMENTO AS CGCEMPRE, E.RAZAOSOCIAL AS NOMEEMPRE, RTRIM(XB.CODNATUREZA) AS CODNATUREZA,');
    Append('        E.NUMDOCUMENTO AS CGCEMPRE, (DECODE(E.RAZAOSOCIAL, '''', E.NOME, E.RAZAOSOCIAL)) AS NOMEEMPRE, RTRIM(XB.CODNATUREZA) AS CODNATUREZA,'); //Marilza Colpani-SOL 125645/KTN 649749
    Append('        NVL(TRUNC(DECODE(SIGN(XB.JAN1),-1,0,XB.JAN1*100)),0) AS JAN1,NVL(TRUNC(DECODE(SIGN(XB.JAN2),-1,0,XB.JAN2*100)),0) AS JAN2,NVL(TRUNC(DECODE(SIGN(XB.JAN3),-1,0,XB.JAN3*100)),0) AS JAN3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.FEV1),-1,0,XB.FEV1*100)),0) AS FEV1,NVL(TRUNC(DECODE(SIGN(XB.FEV2),-1,0,XB.FEV2*100)),0) AS FEV2,NVL(TRUNC(DECODE(SIGN(XB.FEV3),-1,0,XB.FEV3*100)),0) AS FEV3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.MAR1),-1,0,XB.MAR1*100)),0) AS MAR1,NVL(TRUNC(DECODE(SIGN(XB.MAR2),-1,0,XB.MAR2*100)),0) AS MAR2,NVL(TRUNC(DECODE(SIGN(XB.MAR3),-1,0,XB.MAR3*100)),0) AS MAR3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.ABR1),-1,0,XB.ABR1*100)),0) AS ABR1,NVL(TRUNC(DECODE(SIGN(XB.ABR2),-1,0,XB.ABR2*100)),0) AS ABR2,NVL(TRUNC(DECODE(SIGN(XB.ABR3),-1,0,XB.ABR3*100)),0) AS ABR3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.MAI1),-1,0,XB.MAI1*100)),0) AS MAI1,NVL(TRUNC(DECODE(SIGN(XB.MAI2),-1,0,XB.MAI2*100)),0) AS MAI2,NVL(TRUNC(DECODE(SIGN(XB.MAI3),-1,0,XB.MAI3*100)),0) AS MAI3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.JUN1),-1,0,XB.JUN1*100)),0) AS JUN1,NVL(TRUNC(DECODE(SIGN(XB.JUN2),-1,0,XB.JUN2*100)),0) AS JUN2,NVL(TRUNC(DECODE(SIGN(XB.JUN3),-1,0,XB.JUN3*100)),0) AS JUN3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.JUL1),-1,0,XB.JUL1*100)),0) AS JUL1,NVL(TRUNC(DECODE(SIGN(XB.JUL2),-1,0,XB.JUL2*100)),0) AS JUL2,NVL(TRUNC(DECODE(SIGN(XB.JUL3),-1,0,XB.JUL3*100)),0) AS JUL3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.AGO1),-1,0,XB.AGO1*100)),0) AS AGO1,NVL(TRUNC(DECODE(SIGN(XB.AGO2),-1,0,XB.AGO2*100)),0) AS AGO2,NVL(TRUNC(DECODE(SIGN(XB.AGO3),-1,0,XB.AGO3*100)),0) AS AGO3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.SET1),-1,0,XB.SET1*100)),0) AS SET1,NVL(TRUNC(DECODE(SIGN(XB.SET2),-1,0,XB.SET2*100)),0) AS SET2,NVL(TRUNC(DECODE(SIGN(XB.SET3),-1,0,XB.SET3*100)),0) AS SET3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.OUT1),-1,0,XB.OUT1*100)),0) AS OUT1,NVL(TRUNC(DECODE(SIGN(XB.OUT2),-1,0,XB.OUT2*100)),0) AS OUT2,NVL(TRUNC(DECODE(SIGN(XB.OUT3),-1,0,XB.OUT3*100)),0) AS OUT3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.NOV1),-1,0,XB.NOV1*100)),0) AS NOV1,NVL(TRUNC(DECODE(SIGN(XB.NOV2),-1,0,XB.NOV2*100)),0) AS NOV2,NVL(TRUNC(DECODE(SIGN(XB.NOV3),-1,0,XB.NOV3*100)),0) AS NOV3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.DEZ1),-1,0,XB.DEZ1*100)),0) AS DEZ1,NVL(TRUNC(DECODE(SIGN(XB.DEZ2),-1,0,XB.DEZ2*100)),0) AS DEZ2,NVL(TRUNC(DECODE(SIGN(XB.DEZ3),-1,0,XB.DEZ3*100)),0) AS DEZ3,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR131),-1,0,XB.VLR131*100)),0) AS VLR131,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR132),-1,0,XB.VLR132*100)),0) AS VLR132,');
    Append('        NVL(TRUNC(DECODE(SIGN(XB.VLR133),-1,0,XB.VLR133*100)),0) AS VLR133');
//    Append('        FROM  (SELECT /*+leading(u)*/');
    Append('        FROM  (SELECT ');
    //CPREV - Pend. 27026 - Append('                                    U.NOME, U.NUMDOCUMENTO, U.CODNATUREZA,');
    Append('                                    U.NOME, U.NUMDOCUMENTO, U.TIPOREG, U.CODNATUREZA,'); //CPREV - Pend. 27026
    Append('                                    SUM(U.JAN1) AS JAN1,  SUM(U.FEV1) AS FEV1,');
    Append('                                    SUM(U.MAR1) AS MAR1,  SUM(U.ABR1) AS ABR1,');
    Append('                                    SUM(U.MAI1) AS MAI1,  SUM(U.JUN1) AS JUN1,');
    Append('                                    SUM(U.JUL1) AS JUL1,  SUM(U.AGO1) AS AGO1,');
    Append('                                    SUM(U.SET1) AS SET1,  SUM(U.OUT1) AS OUT1,');
    Append('                                    SUM(U.NOV1) AS NOV1,  SUM(U.DEZ1) AS DEZ1,');
    Append('                                    SUM(U.JAN2) AS JAN2,  SUM(U.FEV2) AS FEV2,');
    Append('                                    SUM(U.MAR2) AS MAR2,  SUM(U.ABR2) AS ABR2,');
    Append('                                    SUM(U.MAI2) AS MAI2,  SUM(U.JUN2) AS JUN2,');
    Append('                                    SUM(U.JUL2) AS JUL2,  SUM(U.AGO2) AS AGO2,');
    Append('                                    SUM(U.SET2) AS SET2,  SUM(U.OUT2) AS OUT2,');
    Append('                                    SUM(U.NOV2) AS NOV2,  SUM(U.DEZ2) AS DEZ2,');
    Append('                                    SUM(U.JAN3) AS JAN3,  SUM(U.FEV3) AS FEV3,');
    Append('                                    SUM(U.MAR3) AS MAR3,  SUM(U.ABR3) AS ABR3,');
    Append('                                    SUM(U.MAI3) AS MAI3,  SUM(U.JUN3) AS JUN3,');
    Append('                                    SUM(U.JUL3) AS JUL3,  SUM(U.AGO3) AS AGO3,');
    Append('                                    SUM(U.SET3) AS SET3,  SUM(U.OUT3) AS OUT3,');
    Append('                                    SUM(U.NOV3) AS NOV3,  SUM(U.DEZ3) AS DEZ3,');
    Append('                                    SUM(U.VLR131) AS VLR131, SUM(U.VLR132) AS VLR132,');
    Append('                                    SUM(U.VLR133) AS VLR133');
    Append('                              FROM  ((');
//    Append('                                            SELECT /*+leading(L) index(L Xie14LancIrrf)');
    Append('                                            SELECT ');
//    Append('                                                      index(P IdxPessoa) index(Li Xie1LancXInforme)*/');
    Append('                                            /*+ INDEX (LI XIE1LANCXINFORME) USE_NL(LI , L) */');
    Append('                                            P.NOME, P.NUMDOCUMENTO, ');
    Append(' ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
    Append('                                            DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA,');

    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ1,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JAN2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS FEV2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAR2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS ABR2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAI2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUN2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUL2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS AGO2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS SET2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS OUT2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS NOV2,');
    Append('                                            SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS DEZ2,');

    Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

    { CPrev - Pend. 27026 - Início Comentário
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS JAN3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS FEV3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS MAR3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS ABR3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS MAI3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS JUN3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS JUL3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS AGO3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS SET3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS OUT3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS NOV3, ');
    Append(' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC, DECODE(I.CODDIRF,''18'',LI.VLRLANC, DECODE(I.CODDIRF,''19'',LI.VLRLANC, DECODE(I.CODDIRF,''20'',LI.VLRLANC, DECODE(I.CODDIRF,''21'',LI.VLRLANC,0))))))) AS DEZ3, ');
    } //CPrev - Pend. 27026 - Fim Comentário

    Append('                                            SUM(DECODE(I.CODDIRF,''5'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0)) AS VLR131,');
    //CPrev - Pend. 27026 - Append('                                            SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0)) AS VLR132, ');
    Append(' 0 AS VLR132, '); //CPrev - Pend. 27026
      // Alterado por Arnaldo V. Scarin em 23/04/2010
    Append('                                            SUM(DECODE(I.CODDIRF,''7'',DECODE(L.CODNATUREZA,''5565'',0,''3223'',0, LI.VLRLANC),0)) AS VLR133');
    Append('                                       FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P');
    Append('                                      WHERE (I.IDINFORME = LI.IDINFORME)');
    Append('                                        AND (LI.IDLANCIRRF = L.IDLANCIRRF)');
    Append('                                        AND (L.CODNATUREZA = N.CODNATUREZA)');
    Append('                                        AND (N.FLGUSADONADIRF = ''S'')');
    Append('                                        AND (I.CODDIRF <> 1)');
    Append('                                        AND P.IDPESSOA = L.IDBENEFIRRF');
    if (iSistema = 0) then
      Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
    else
      if (iSistema = 1) then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ')
      else
        if (iSistema = 2) then
          Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ');

    If (iSistema >= 2) Then
      Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

    Append('                                        AND           (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY''))          ');
    Append('                                        GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA)');
    Append(' ,''0'' '); //CPREV - Pend. 27026
    Append('                                        )');
    Append('                        UNION ALL');
    Append('                        (');
//    Append('                        SELECT  /*+index(L Xie14LancIrrf) index(P IdxPessoa)*/');
    Append('                        SELECT  ');

    //CPREV - Pend. 27026 - Append('                                 P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA,');
    Append('                                 P.NOME, P.NUMDOCUMENTO, ''0'' AS TIPOREG, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, '); //CPREV - Pend. 27026

    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRBASE,0)) AS JAN1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRBASE,0)) AS FEV1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRBASE,0)) AS MAR1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRBASE,0)) AS ABR1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRBASE,0)) AS MAI1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRBASE,0)) AS JUN1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRBASE,0)) AS JUL1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRBASE,0)) AS AGO1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRBASE,0)) AS SET1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRBASE,0)) AS OUT1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRBASE,0)) AS NOV1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRBASE,0)) AS DEZ1,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRIRRF,0)) AS JAN2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRIRRF,0)) AS FEV2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRIRRF,0)) AS MAR2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRIRRF,0)) AS ABR2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRIRRF,0)) AS MAI2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRIRRF,0)) AS JUN2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRIRRF,0)) AS JUL2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRIRRF,0)) AS AGO2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRIRRF,0)) AS SET2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRIRRF,0)) AS OUT2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRIRRF,0)) AS NOV2,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRIRRF,0)) AS DEZ2,');

    Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

    { CPrev - Pend. 27026 - Início Comentário
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRINSS,0)) AS JAN3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRINSS,0)) AS FEV3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRINSS,0)) AS MAR3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRINSS,0)) AS ABR3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRINSS,0)) AS MAI3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRINSS,0)) AS JUN3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRINSS,0)) AS JUL3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRINSS,0)) AS AGO3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRINSS,0)) AS SET3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRINSS,0)) AS OUT3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRINSS,0)) AS NOV3,');
    Append('                                 SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRINSS,0)) AS DEZ3,');
    } //CPrev - Pend. 27026 - Fim Comentário

    Append('                                 0 AS VLR131, 0 AS VLR132, 0 AS VLR133');
    Append('                            FROM LANCIRRF L, PESSOA P');
    Append('                           WHERE (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF))');

    if (iSistema = 0) then
      Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
    else
      if (iSistema = 1) then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ')
      else
        if (iSistema = 2) then
          Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) ');

    If (iSistema >= 2) Then
      Append(' AND (L.CODNATUREZA NOT IN (''5952'', ''5960'', ''5979'', ''5987'')) ');

    Append('                           AND           (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY''))          ');
    Append('                           AND P.IDPESSOA = L.IDBENEFIRRF');

    //CPREV - Pend. 27026 - Append('                        GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA))');
    Append('                        GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''0'')');//CPREV - Pend. 27026

    Append('                        UNION ALL');
    Append('                        SELECT');
    Append('                               P.NOME, P.NUMDOCUMENTO,');
    Append(' ''0'' AS TIPOREG, '); //CPREV - Pend. 27026
    Append('                               ''9999'' AS CODNATUREZA,');
    Append('                               0 AS JAN1, 0 AS FEV1, 0 AS MAR1, 0 AS ABR1, 0 AS MAI1, 0 AS JUN1,');
    Append('                               0 AS JUL1, 0 AS AGO1, 0 AS SET1, 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1,');
    Append('                               0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2,');
    Append('                               0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2,');

    Append(' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '); //CPrev - Pend. 27026

    { CPrev - Pend. 27026 - Início Comentário
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''01'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS JAN3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''02'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS FEV3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''03'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS MAR3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''04'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS ABR3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''05'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS MAI3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''06'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS JUN3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''07'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS JUL3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''08'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS AGO3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''09'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS SET3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''10'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS OUT3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''11'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS NOV3,');
      Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''12'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS DEZ3,');
    } //CPrev - Pend. 27026 - Fim Comentário

    Append('                               0 AS VLR131, 0 AS VLR132,');
    Append('                               SUM(DECODE(SUBSTR(H.MESCOBRANCA,6,2),''13'',DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO),0)) AS VLR133');
    Append('                        FROM   PESSOA P,');
    Append('                               ELEGPATRO EL,');
    Append('                               HSTCONTRIBPREV H,');
    Append('                               CONTPREV CP,');
    Append('                               PROVDESC PD,');
    Append('                               INFORME I');
    Append('                        WHERE  CP.FLGPAGADOR IN (''C'',''P'')');
    Append('                        AND    CP.IDCONTRIBUICAO IN (19,215,358,560,580,600,601,621)');
    Append('                        AND    NVL(H.FLGDESCFOLHA,0) = 0');
    Append('                        AND    NVL(H.SITRECEBIMENTO,0) IN (2,3,5)');
    Append('                        AND    CP.FLGINTERNO IN (''MA'',''MP'')');
    Append('                        AND    H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(iAno) + '/01'));
    Append('                        AND    H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(iAno) + '/13'));
    Append('                        AND    CP.IDPLANOPREV    = H.IDPLANOPREV');
    Append('                        AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
    Append('                        AND    EL.IDPESSJUR = H.IDPESSJUR');
    Append('                        AND    EL.IDPESSOA = H.IDPESSOA');
    Append('                        AND    P.IDPESSOA = EL.IDPESSOA');
    Append('                        AND    PD.IDPROVENTO = CP.IDRUBRICA');
    Append('                        AND    I.IDINFORME   = PD.IDINFORME');

    Append('                        GROUP BY');
    Append('                               P.NOME, P.NUMDOCUMENTO');

    If (iSistema >= 2) Then
      Append(' UNION ALL (SELECT '+
                ' P.NOME, P.NUMDOCUMENTO, '+
                ' ''0'' AS TIPOREG, '+ //CPREV - Pend. 27026
                ' T.CODNATUREZA, '+
                ' SUM(T.JAN1) AS JAN1, SUM(T.FEV1) AS FEV1, SUM(T.MAR1) AS MAR1, '+
                ' SUM(T.ABR1) AS ABR1, SUM(T.MAI1) AS MAI1, SUM(T.JUN1) AS JUN1, '+
                ' SUM(T.JUL1) AS JUL1, SUM(T.AGO1) AS AGO1, SUM(T.SET1) AS SET1, '+
                ' SUM(T.OUT1) AS OUT1, SUM(T.NOV1) AS NOV1, SUM(T.DEZ1) AS DEZ1, '+
                ' 0 AS JAN2, 0 AS FEV2, 0 AS MAR2, 0 AS ABR2, 0 AS MAI2, 0 AS JUN2, '+
                ' 0 AS JUL2, 0 AS AGO2, 0 AS SET2, 0 AS OUT2, 0 AS NOV2, 0 AS DEZ2, '+
                ' 0 AS JAN3, 0 AS FEV3, 0 AS MAR3, 0 AS ABR3, 0 AS MAI3, 0 AS JUN3, '+
                ' 0 AS JUL3, 0 AS AGO3, 0 AS SET3, 0 AS OUT3, 0 AS NOV3, 0 AS DEZ3, '+
                ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 '+
                ' FROM PESSOA P, (SELECT DISTINCT L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, '+
                       ' MIN(L.IDLANCIRRF) AS IDLANCIRRF, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JAN1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS FEV1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAR1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS ABR1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS MAI1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUN1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS JUL1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS AGO1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS SET1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS OUT1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS NOV1, '+
                       ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) AS DEZ1  '+
                      ' FROM LANCXINFORME LI, LANCIRRF L, INFORME I '+
                      ' WHERE '+
                      //CPREV - Pend. 27159 - ' (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+') '+
                        ' (LI.IDLANCIRRF              = L.IDLANCIRRF) '+
                        ' AND (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) '+
                        ' AND (I.IDINFORME                = LI.IDINFORME) '+
                        ' AND (I.CODDIRF                 <> 1) '+
                        ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) '+
                        ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) '+
                      ' GROUP BY '+
                        ' L.CODDOCUMENTO, L.IDBENEFIRRF, L.CODNATUREZA, '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0), '+
                        ' DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',DECODE(I.FLGNATUREZA,''N'',-LI.VLRLANC,LI.VLRLANC),0),0) ) T '+

                ' WHERE P.IDPESSOA = T.IDBENEFIRRF '+
                ' GROUP BY P.NOME, P.NUMDOCUMENTO, T.CODNATUREZA, '+
                ' ''0'') '+ //CPREV - Pend. 27026
                ' UNION ALL '+
                ' (SELECT P.NOME, P.NUMDOCUMENTO, '+
                     ' ''0'' AS TIPOREG, '+ //CPREV - Pend. 27026
                     ' L.CODNATUREZA, '+
                     ' 0 AS JAN1, 0 AS FEV1, 0 AS MAR1, '+
                     ' 0 AS ABR1, 0 AS MAI1, 0 AS JUN1, '+
                     ' 0 AS JUL1, 0 AS AGO1, 0 AS SET1, '+
                     ' 0 AS OUT1, 0 AS NOV1, 0 AS DEZ1, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JAN2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS FEV2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAR2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS ABR2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS MAI2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUN2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS JUL2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS AGO2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS SET2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS OUT2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS NOV2, '+
                     ' SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS), 0)) AS DEZ2, '+
                     ' 0 AS JAN3, '+
                     ' 0 AS FEV3, '+
                     ' 0 AS MAR3, '+
                     ' 0 AS ABR3, '+
                     ' 0 AS MAI3, '+
                     ' 0 AS JUN3, '+
                     ' 0 AS JUL3, '+
                     ' 0 AS AGO3, '+
                     ' 0 AS SET3, '+
                     ' 0 AS OUT3, '+
                     ' 0 AS NOV3, '+
                     ' 0 AS DEZ3, '+
                     ' 0 AS VLR131, 0 AS VLR132, 0 AS VLR133 '+
                  ' FROM LANCIRRF L, PESSOA P '+
                  ' WHERE (L.datapagamento BETWEEN TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) '+
                  //CPREV - Pend. 27159 - ' AND (SUBSTR(L.NUMDOCUMENTO,1,8) = '+quotedStr(NumDocumento)+') '+
                    ' AND (L.CODNATUREZA IN (''5952'', ''5960'', ''5979'', ''5987'')) '+
                    ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3) '+

                    ' AND (P.IDPESSOA = L.IDBENEFIRRF) '+
                  ' GROUP BY P.NOME, P.NUMDOCUMENTO, L.CODNATUREZA, '+
                  ' ''0'') '); //CPREV - Pend. 27026

    Append('                        ) U');
    Append('        GROUP BY U.NOME, U.NUMDOCUMENTO, U.CODNATUREZA');
    Append(' , U.TIPOREG  '); //CPrev - Pend. 27026 - 29/01/2007

    //CPREV - Pend. 27026 - Início
    Append(' ,U.TIPOREG ');
    Append(' UNION ALL ');
//    Append(' SELECT /*+leading(L) index(L Xie14LancIrrf) index(P IdxPessoa) index(Li Xie1LancXInforme)*/ ');
    Append(' SELECT ');
    Append('   P.NOME, P.NUMDOCUMENTO, ''1'' AS TIPOREG, ');
    Append('   DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS JAN1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS FEV1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS MAR1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS ABR1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS MAI1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS JUN1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS JUL1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS AGO1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS SET1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS OUT1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS NOV1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''18'',LI.VLRLANC,0),0)) AS DEZ1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JAN2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS FEV2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAR2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS ABR2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS MAI2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUN2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS JUL2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS AGO2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS SET2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS OUT2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS NOV2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''20'',LI.VLRLANC,0),0)) AS DEZ2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JAN3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS FEV3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAR3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS ABR3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS MAI3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUN3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS JUL3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS AGO3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS SET3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS OUT3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS NOV3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''19'',DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC*-1,LI.VLRLANC),0),0)) AS DEZ3, ');

    Append('   SUM(DECODE(I.CODDIRF,''22'',LI.VLRLANC,0)) AS VLR131, ');
    Append('   SUM(DECODE(I.CODDIRF,''23'',LI.VLRLANC,0)) AS VLR132, ');
    Append('   SUM(DECODE(I.CODDIRF,''24'',LI.VLRLANC,0)) AS VLR133 ');
    Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
    Append(' WHERE (I.IDINFORME                      = LI.IDINFORME) ');
    Append('   AND (LI.IDLANCIRRF                    = L.IDLANCIRRF) ');
    Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
    Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
    Append('   AND (I.CODDIRF                       <> 1) ');

    //Append(' AND (L.IDBENEFIRRF in (783081, 808600))' ); //Teste - 16/01/2007

    //CPrev - Pend. 27026 - 30/01/2008 - Início
    if (iSistema = 0) then
      Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
    else
      if (iSistema = 1) then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
    //CPrev - Pend. 27026 - 30/01/2008 - Fim
    Append('   AND (P.IDPESSOA                       = L.IDBENEFIRRF) ');
    //Pend. 27026 - Append('   AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
    Append('   AND (L.datapagamento            BETWEEN TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ');
    Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''1'' ');
    Append(' UNION ALL');
//    Append(' SELECT /*+leading(L) index(L Xie14LancIrrf) index(P IdxPessoa) index(Li Xie1LancXInforme)*/ ');
    Append(' SELECT ');
    Append('   /*+ INDEX (LI XIE1LANCXINFORME) USE_NL(LI , L) */');
    Append('   P.NOME, P.NUMDOCUMENTO, ''2'' AS TIPOREG, ');
    Append('   DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA) AS CODNATUREZA, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JAN1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS FEV1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAR1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS ABR1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS MAI1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUN1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS JUL1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS AGO1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS SET1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS OUT1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS NOV1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''21'',LI.VLRLANC,0),0)) AS DEZ1, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JAN2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS FEV2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAR2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS ABR2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAI2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUN2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUL2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS AGO2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS SET2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS OUT2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS NOV2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS DEZ2, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JAN3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS FEV3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAR3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS ABR3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS MAI3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUN3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS JUL3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS AGO3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS SET3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS OUT3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS NOV3, ');
    Append('   SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''0'',LI.VLRLANC,0),0)) AS DEZ3, ');
    Append('   SUM(DECODE(I.CODDIRF,''25'',LI.VLRLANC,0)) AS VLR131, ');
    Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR132, ');
    Append('   SUM(DECODE(I.CODDIRF,''0'' ,LI.VLRLANC,0)) AS VLR133 ');
    Append(' FROM INFORME I, LANCXINFORME LI, LANCIRRF L, NATURENDIMENTO N, PESSOA P ');
    Append(' WHERE (I.IDINFORME                      = LI.IDINFORME) ');
    Append('   AND (LI.IDLANCIRRF                    = L.IDLANCIRRF) ');
    Append('   AND (L.CODNATUREZA                    = N.CODNATUREZA) ');
    Append('   AND (N.FLGUSADONADIRF                 = ''S'') ');
    Append('   AND (I.CODDIRF                       <> 1) ');

    //Append(' AND (L.IDBENEFIRRF in (783081, 808600))' ); //Teste - 16/01/2007

    //CPrev - Pend. 27026 - 30/01/2008 - Início
    if (iSistema = 0) then
      Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) ')
    else
      if (iSistema = 1) then
        Append(' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
    //CPrev - Pend. 27026 - 30/01/2008 - Fim

    Append('   AND (P.IDPESSOA                        = L.IDBENEFIRRF) ');
    //Pend. 27026 - Append('   AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) ');
    Append('   AND (L.datapagamento            BETWEEN TO_DATE('+quotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'')) ');
    Append(' GROUP BY P.NOME, P.NUMDOCUMENTO, DECODE(L.CODNATUREZA,''7416'',''0561'',L.CODNATUREZA), ''2'' ');
    //CPREV - Pend. 27026 - Fim

    Append(' ) XB,');
    Append(' PESSOA P,PESSOA E');
    Append('WHERE  (XB.NUMDOCUMENTO = P.NUMDOCUMENTO)');
    Append('AND  (XB.NOME = P.NOME)');
    Append('AND (XB.NUMDOCUMENTO IS NOT NULL AND XB.NUMDOCUMENTO <> ''00000000000'')');
    Append('AND  (E.IDPESSOA = 1)');
    Append('AND CODNATUREZA <> ''9999''');

    { CPrev -`Pend. 27026 - Início Comentário
    if bRetencao and (rValorMinimo > 0) Then
    begin
      Append(' AND (((XB.JAN2 + XB.FEV2 + XB.MAR2 + XB.ABR2 + XB.MAI2 + ');
      Append('        XB.JUN2 + XB.JUL2 + XB.AGO2 + XB.SET2 + XB.OUT2 + ');
      Append('        XB.NOV2 + XB.DEZ2 + XB.VLR133) <> 0 ) ');
      Append('  OR  ((XB.JAN1 + XB.FEV1 + XB.MAR1 + XB.ABR1 + XB.MAI1 + ');
      Append('        XB.JUN1 + XB.JUL1 + XB.AGO1 + XB.SET1 + XB.OUT1 + ');
      Append('        XB.NOV1 + XB.DEZ1 + XB.VLR131) >= '+FloatToStr(rValorMinimo) + '))');
    end
    else
    begin
      if rValorMinimo > 0 then
      begin
        Append(' AND ((XB.JAN1 + XB.FEV1 + XB.MAR1 + XB.ABR1 + XB.MAI1 + ');
        Append('       XB.JUN1 + XB.JUL1 + XB.AGO1 + XB.SET1 + XB.OUT1 + ');
        Append('       XB.NOV1 + XB.DEZ1 + XB.VLR131) >= '+FloatToStr(rValorMinimo) + ')');
      end
      else
      begin
        if bRetencao Then
        begin
          Append(' AND ((XB.JAN2 + XB.FEV2 + XB.MAR2 + XB.ABR2 + XB.MAI2 + ');
          Append('       XB.JUN2 + XB.JUL2 + XB.AGO2 + XB.SET2 + XB.OUT2 + ');
          Append('       XB.NOV2 + XB.DEZ2 + XB.VLR133) <> 0 ) ');
        end;
      end;
    end;
    } //CPrev -`Pend. 27026 - Fim Comentário

    if iSistema = 0 then
      Append('ORDER BY NOMEBENEF, CGCBENEF, XB.TIPOREG ')
    else
      Append('ORDER BY CODNATUREZA, P.TIPO, CGCBENEF, NOMEBENEF, XB.TIPOREG ');

  end; //fim do with

  //Henrique Massão
  //sSql.SaveToFile('c:\QueryDirf_FUNCEF.txt');
//  sSql.Text := StringReplace(sSql.Text,
//                             '<> ''00000000000''',
//                             '<> ''00000000000'' and xb.numdocumento =  ''07698502945''',
//                             [rfreplaceall, rfignorecase]);

  sSql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\QueryDirf_FUNCEF.txt');
  Result := GetDataPacket(Ssql);
end;



function TCtrlGeraDirf.GeraLinhaTipoZeroExigSuspensa(piSeqArq: Integer): String;
begin
  Result := '';
  Result := Result + CompletaZero(IntToStr(piSeqArq),8);
  Result := Result + '2';
  Result := Result + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
  Result := Result + '0561';

  if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
    Result := Result + '2'
  else
    Result := Result + '1';

  Result := Result + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
  Result := Result + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN5').AsFloat),15);  //Rendimentos pagos cuja tributação está sob exigibilidade suspensa
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN5').AsFloat),15);
  Result := Result + CompletaZero('0',15);//CPrev - Pend. 27026
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL5').AsFloat),15);
  Result := Result + CompletaZero('0',15);//CPrev - Pend. 27026
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ5').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR135').AsFloat),15);
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15); //Imposto Retido dos rendimentos pagos cuja tributação está sob exigibilidade suspensa.

  Result := Result + '2'; //Indentifica que o registro se refere a exigibilidade

  Result := Result + '0';
  Result := Result + Completa('',40);
  Result := Result + '9';
end;

function TCtrlGeraDirf.GeraLinhaTipoDoisExigSuspensa(piSeqArq: Integer): String;
begin
  Result := '';
  Result := Result + CompletaZero(IntToStr(piSeqArq),8);
  Result := Result + '2';
  Result := Result + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
  Result := Result + '0561';

  if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
    Result := Result + '2'
  else
    Result := Result + '1';

  Result := Result + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
  Result := Result + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET12').AsFloat), 15);   //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT12').AsFloat), 15);   //Contribuição Previdência Privada
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV12').AsFloat), 15);   //Contribuição Previdência Privada
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ12').AsFloat), 15);   //Contribuição Previdência Privada
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR1312').AsFloat), 15);  //Contribuição Previdência Privada 13º
  Result := Result + CompletaZero('0',15);
  Result := Result + CompletaZero('0',15);

  Result := Result + '2'; //Identifica que o registro se refere a exigibilidade

  Result := Result + '2'; //Identifica que o tipo do registro da exigibilidade é para mostrar contribuição previdência privada
  Result := Result + Completa('',40);
  Result := Result + '9';
end;

function TCtrlGeraDirf.GeraLinhaTipoUmExigSuspensa(piSeqArq: Integer): String;
begin
  Result := '';
  Result := Result + CompletaZero(IntToStr(piSeqArq),8);
  Result := Result + '2';
  Result := Result + CompletaZero(CdsJudicial.fieldByname('CGCEMPRE').AsString,14);
  Result := Result + '0561';

  if CdsJudicial.fieldByname('TIPO').AsString = 'J' then
    Result := Result + '2'
  else
    Result := Result + '1';

  Result := Result + CompletaZero(CdsJudicial.fieldByname('CGCBENEF').AsString,14);
  Result := Result + Completa(CdsJudicial.fieldByname('NOMEBENEF').AsString,60);

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JAN11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('FEV11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAR11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('ABR11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('MAI11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUN11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('JUL11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('AGO11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('SET11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('OUT11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('NOV11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ9').AsFloat), 15);   //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ10').AsFloat),15);   //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('DEZ11').AsFloat),15);   //Pensão Alimentícia

  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR139').AsFloat),  15); //Contribuição Oficial
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR1310').AsFloat),15); //Dedução de Dependente
  Result := Result + CompletaZero(FormatFloat('0',CdsJudicial.fieldByname('VLR1311').AsFloat),15); //Pensão Alimentícia

  Result := Result + '2'; //Identifica que o registro se refere a exigibilidade

  Result := Result + '1'; //Identifica que o tipo do registro da exigibilidade é para mostrar contribuição oficial, dedução de dependente e pensão alimentícia
  Result := Result + Completa('',40);
  Result := Result + '9';
end;

//Marilza Colpani-SOL 125645/KTN 649749
//Função que substitui caracteres que possuem acentuações.
function TCtrlGeraDirf.SubstCarEspeciais(const pString: String): String;
begin
   {Esta procedure foi implementada para retirar alguns caracteres especiais dos dados em
    uso. Caso muito comum quando se usando dados de clientes de outros países}

   Result:=StringReplace(pString,'Á','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'À','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ã','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ä','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Â','A',[rfReplaceAll]);

   Result:=StringReplace(Result,'á','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'à','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'ã','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'ä','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'â','a',[rfReplaceAll]);

   Result:=StringReplace(Result,'É','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'È','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ë','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ê','E',[rfReplaceAll]);

   Result:=StringReplace(Result,'é','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'è','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'ë','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'ê','e',[rfReplaceAll]);

   Result:=StringReplace(Result,'Í','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ì','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ï','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Î','I',[rfReplaceAll]);

   Result:=StringReplace(Result,'í','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'ì','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'ï','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'î','i',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ó','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ò','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Õ','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ö','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ô','O',[rfReplaceAll]);

   Result:=StringReplace(Result,'ó','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ò','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'õ','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ö','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ô','o',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ú','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ù','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ü','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Û','U',[rfReplaceAll]);

   Result:=StringReplace(Result,'ú','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'ù','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'ü','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'û','u',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ñ','N',[rfReplaceAll]);
   Result:=StringReplace(Result,'ñ','n',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ç','C',[rfReplaceAll]);
   Result:=StringReplace(Result,'ç','c',[rfReplaceAll]);

   Result:=StringReplace(Result,'&','e',[rfReplaceAll]);
end;

//Marilza Colpani-SOL 125645/KTN 649749
//Função que substitui caracteres especiais.
function TCtrlGeraDirf.CaracteresEspeciais(const sTexto: String): String;
var iCount: integer;
     cCar : Char;
begin
  Result := SubstCarEspeciais(sTexto);
  for iCount := 1 to length(Result) do
  begin
    cCar := Result[iCount];
    If Not ( cCar in ['a'..'z','A'..'Z','0'..'9',' '] ) then
      Result := Copy(Result,1,iCount-1) + ' ' + Copy(Result,iCount+1,length(Result));
  end;
end;


end.


