unit uCtrlSPED;
//***************************************************************************************
//Rotina.............: VerificaContaZerada
//N. WO..............: 38016
//Data da Alteração..: 07/05/2026
//Responsável........: Leandro Pocebon
//Descrição..........: Verifica se vlr debito e vlr credito iguais e zera a conta
//***************************************************************************************
//Rotina.............: ListaResponsavel
//N. SIG.............: 127797
//Data da Alteração..: 05/08/2022
//Responsável........: André Imakawa
//Descrição..........: Retornar o responsavel da CONTAB com base no Resposanvel pelo Centro
//                     de Custo ao invés do cargo.
//***************************************************************************************
//Rotina.............: GeraLinha0500, abreGrupoContas
//N. SIG.............: 113742
//Data da Alteração..: 22/02/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Função alterada para passar o ano de exercicio afim de selecionar o
//                     plano de contas corretamente.
//***************************************************************************************
//Rotina.............: GeraLinha0000, RetornaVersaoEFD
//N. SIG.............: 88842
//Data da Alteração..: 16/01/2019                
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação para indicação da versão de declaração EFD-Contribuição
//*****************************************************************************************
//Rotina.............: GeraLinha0000
//N. SIG.............: 84511
//Data da Alteração..: 09/12/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração da versão do leiuate da EFD-Contribuições.
//***************************************************************************************
//Rotina.............: GerarArquivos, GeraLinhaBlocoM200e600
//N. SIG.............: 82251
//Data da Alteração..: 14/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da geração do EFD-Contribuição para o leiuate de 2019.
//***************************************************************************************
//Rotina.............: GeraLinhaBlocoI100, GeraLinhaBlocoM200e600
//N. SIG.............: 81493
//Data da Alteração..: 13/02/2019
//Responsável........: Cássio Florencio Rvaroto
//Descrição..........: Correção no procedimento de cálculo de base de cálculo para PIS e COFINS.  
//***************************************************************************************
//Rotina.............: PreencheDadosAnaliticos, CalculaSaldoSintetico, PreencheDadosSinteticos,
//                     CalculaValorBaseAjustada, ListaDadosSinteticos, ListaDadosAnaliticos,
//                     GeraLinhaBlocoM200e600, GetDadosContasContabAjustes, CalculaReducao,
//                     CalculaAcrescimo, CalculaTotaisAjustes, GerarArquivos, GetVlrAcrescimoReducao
//N. SIG.............: 72274
//Data da Alteração..:  18/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Ajuste na funcionalidade de geração do EFD-Contribuição, permitindo
//                     a definição de base de cálculo ajustada. 
//***************************************************************************************
{
*******************************************************************************
Analista.: FHBS
Data.....: 06/08/2018
Sol......: 73038
Descrição: Alteração codigo da versão para 004 na rotina GeraLinha0000
*******************************************************************************
Analista.: Darivaldo Alencar
Data.....: 12/01/2018
Sol......: 52031
Descrição: Separado contas contabeis na linha I300
*******************************************************************************
Analista.: Felipe A. Santos
Data.....: 21/05/2015
PPM......: 796205
Sol......: 244830/17209
Descrição: Previa demonstrativo
*******************************************************************************
Analista.: Wylliam Leite da Silva
Data.....: 12/06/2015
PPM......: 834433
Sol......: 244831
Descrição: Troca de posição da linha 199 pela 200
*******************************************************************************
Analista.: William Santana
Data.....: 10/06/2014                                           
PPM......: 413667
Sol......: 233374
Descrição: Melhorias sobre os processos de geração do arquivo
*******************************************************************************
Analista.: William Santana
Data.....: 15/04/2014
PPM......: 352242
Sol......: 230351
Descrição: Falha na Geração de Arquivo SPED
*******************************************************************************
Analista.: William Santana
Data.....: 17/02/2014
Kintana..: 2051763
Sol......: 155850-15363
Descrição: Alteração da Funcionalidade SPED
*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Kintana..: 2051763
Sol......: 155850-15363
Descrição: Inclusão da Funcionalidade SPED
*******************************************************************************}

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     classes, Forms, uCMMath, dbtables, mconnect, ucmFileUtils, FileCtrl,
     uCmCustomCdbObject, ADODb, provider, {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
     uCripto, wwQuery, FProgresso, dBasedados, uDbEfdDetalhe, uCtrlFuncoesIRRF, uDBLinhasSPED,
     uDbRelatorioDados;

  Type
    tLinhaBloco = Class
    Public
       IdBloco : string;
       iQtd    : Integer;

       Constructor Create;
       Procedure AtualizarValores(Const pQtde : integer);
       Procedure InserirValores(Const pIdBloco: string; Const pQtde : Integer);
    End;

    tLinhasInformeSPED = Class
    Protected
       FLinhasBloco: tList;
       Function  GetLinhas(Index: Integer): tLinhaBloco;
       Procedure SetLinhas(Index: Integer; Const Value: tLinhaBloco);


    Public
       Constructor Create;
       Destructor Destroy; Override;

       Function  Add: tLinhaBloco;
       Function  AdicionarValores(Const pIdBloco: string; Const pQtdLinhas: Integer): tLinhaBloco;
       Function  Count: Integer;
       Procedure Clear;
       Procedure Delete(Const pIndex: Integer);
       Function  IndexOfLinha(Const pIdBloco: string): Integer;
       procedure Ordena;

       Property LinhasBloco[Index: Integer]: tLinhaBloco Read GetLinhas Write SetLinhas; Default;
    End;


    TCtrlSPED = Class(TCmControlObject)

    private
      //Darivaldo Alencar SIG52031 -inicio
      iLinha300      : Integer;
      FcdsSintetico3 : TClientDataSet;
      //Darivaldo Alencar SIG52031 -fim
      FMaxProgresso  : Integer;
      FProgresso     : Integer;
      cdsAux         : TClientDataSet;
      _sSQL          : TStringList;
      FcdsAnalitico  : TClientDataSet;
      FcdsSintetico  : TClientDataSet;
      FcdsEfdDetalhe : TClientDataSet;
      FcdsLinhas     : TClientDataSet;
      FDbEfdDetalhe  : TDbEfdDetalhe;
      FDbRelatorio   : TDbRelatorioDados;
      FDbLinhasSPED  : TDbLinhasSPED;
      FLinhasEFD     : tLinhasInformeSPED;
      FcdsDemonstrativo: TClientDataSet;
      //Início - William Santana SOL 155850-15363 KIN 2051763
      FcdsContas       : TClientDataSet;
      FcdsAnalitico2   : TClientDataSet;
      FcdsGrupoXconta  : TClientDataSet;
      FcdsSintetico2   : TClientDataSet;
      //Término - William Santana SOL 155850-15363 KIN 2051763


      procedure SetcdsDemonstrativo(const Value: TClientDataSet);
      procedure SetcdsAnalitico(const Value: TClientDataSet);
      procedure SetcdsEfdDetalhe(const Value: TClientDataSet);
      procedure SetLinhasEFD(sBloco : string; iQtde : integer);
      procedure SetcdsSintetico(const Value: TClientDataSet);

      function  GeraLinha0000(sTipoArq, sRecibo, sPeriodo, sExercicio : string; var NumLin : integer) : string;
      function  GeraLinha0100(var NumLin : integer) : string;
      function  GeraLinha0110(var NumLin : integer) : string;
      //Início - William Santana SOL 155850-15363 KIN 2051763
      function  Geralinha0140(var NumLin : integer) : string ;
      function  GeraLinha0500(sPeriodo, sExercicio : string ; var NumLin : integer) : string;
      function  GeraLinhaBlocoM200e600(sPeriodo, sExercicio, sIdNorma: string; var Arquivo : TStringList; var NumLin : integer) : string;

      function  GeraLinhaBlocoI100(var Arquivo : TStringList; var NumLin : integer) : string;
  //    function  GeraLinhaBlocoI200(var arquivo : TStringList; var NumLin : integer; sTipo : string) : string;
      function  GeraLinhaBlocoI200(var arquivo : TStringList; var NumLin : integer) : string;
      function  GeraLinhaBlocoI300(var arquivo : TStringList; var NumLin : integer; sTipo , sCodLinha : string) : string;
  //    function  GeraLinhaBlocoI300(var arquivo : TStringList; var NumLin : integer; sCodLInha : string ) : string;
      //Término - William Santana SOL 155850-15363 KIN 2051763

      function  GeraBloco1010(var NumLin : integer) : string;
      function  GeraLinhaProcesso(sIdBloco : string; var NumLin : integer) : string;

      procedure GeraBlocoVazio(var Arquivo : TStringList; sIdBlocoAbre, sIdBlocoFecha, sCodMovimento : string);
      function  GeraLinhaBlocoReplicaValor(sIdBloco, sValor : string; iNumPipes : integer) : string;  overload;
      function  GeraLinhaBlocoReplicaValor(sIdBloco, sValor : string; iNumPipes : integer; var NumLin : integer) : string;  overload;
      function  GeraLinhaFimBloco(sIdBloco, sNumLinhas : string) : string; overload;
      function  GeraLinhaFimBloco(sIdBloco, sNumLinhas : string; var NumLin : integer) : string; overload;
      function  TiraCaracteres(sTexto, sCaracter : string) : string;
      //Início - William Santana SOL 155850-15363 KIN 2051763
      function  abreGrupoContas(sExercicio : String): OleVariant;
      function  abreRelLInhaPai_Filho(sIdLinha : String): Boolean;
      function  ContasContabeisRelacionadas(sIdLinha , sTipo : String): String;
      function  VerificaCodContrib(iTipo : integer ; iVlrTotPeriodo : Currency ):Currency;
      function  calculaValTot(var Valor: double; sTipo, sCodLinha: string): double;
      function  PreencheZeros(campo : string ; posicoes : integer ):String;
      function  VerificaContaZerada( Cds : TClientDataSet ; sCodLinha : string): boolean ;
      //Término - William Santana SOL 155850-15363 KIN 2051763
      //Darivaldo Alencar 52031 -inicio
      function Translate(sCampo: String;  bVirgula: boolean): String;
      function ListaDadosSinteticosComAssociacao(iIdRelatorio : integer) : OleVariant;
      //Darivaldo Alencar 52031 -fim

      function RetornaVersaoEFD(pDataInicio: TDateTime): string; //Cássio Rovaroto - SIG nº 88842
    protected
       procedure DoChangeDataBase; Override;
       procedure AfterInitialize; Override;
       function  ExisteRelatorio(iTipoRel : integer; sExercicio, sPeriodo : string) : boolean;

       function  SomaBaseCalculo : Double;
       function  InserirDetalheRelatorio : boolean;

    public
       Property Progresso : Integer read FProgresso;
       Property MaxProgresso : Integer read FMaxProgresso;
       Property cdsDemonstrativo : TClientDataSet read FcdsDemonstrativo write SetcdsDemonstrativo;
       Property cdsAnalitico     : TClientDataSet read FcdsAnalitico write SetcdsAnalitico;
       Property cdsSintetico     : TClientDataSet read FcdsSintetico write SetcdsSintetico;
       property cdsEfdDetalhe    : TClientDataSet read FcdsEfdDetalhe write SetcdsEfdDetalhe;
       property LinhasEFD        : tLinhasInformeSPED read FLinhasEFD;

       Constructor Create; Override;
       Destructor Destroy; Override;

       Function  ListaEndereco(iIdPessoa : integer) : OleVariant;
       Function  ListaResponsavel(iIdPessoa : integer) : OleVariant;
       Function  ListaInstituicao(iIdPessoa : integer) : OleVariant;
       Function  BuscaEndereco(iIdEndereco : integer) : OleVariant;
       Function  ListaOpcoes(iIdComponente : integer) : OleVariant;

       Function  ListaDemonstrativos(const iIdRelatorio : integer = -1) : OleVariant;
       Function  ListaDadosSinteticos(iIdRelatorio : integer) : OleVariant;
       Function  ListaDadosAnaliticos(iIdRelatorio : integer) : OleVariant;
       Function  ListaDadosDetalhe(iIdRelatorio : integer) : OleVariant;
       Function  PreencheDadosAnaliticos(pExercicio, pPeriodo, pNorma : integer) : OleVariant;
       Function  PreencheDadosSinteticos(pExercicio, pPeriodo, pNorma : integer) : OleVariant;
       procedure CalculaSaldoSintetico(sIdLinha : string = '');
       procedure CalculaTotais(var rReceita, rGeral, rEspecifico : currency; bExcluiAjuste: Boolean = True);
       procedure CalculaAcrescimo(var rAcrescimo:  Currency);
       procedure CalculaReducao(var rReducoes:  Currency);
       procedure CalculaTotaisAjustes(var rReceita, rGeral, rEspecifico : currency);
       procedure CalculaValorBase(var vlrBase : currency);
       function CalculaValorBaseAjustada: Currency;//Cássio Rovaroto - SIG nº 72274

       function  GerarArquivos(iTipoRel : integer; sTipoArq, sExercicio, sPeriodo, sCaminho, sIdNorma : string): boolean;
       function  CarregaDadosLinhas(pIdNorma: Integer): OleVariant;
       function  ExcluiDemonstrativo(iIdRelatorio : integer) : boolean;
       function  LocalizaNormaVigente(sTipoRelatorio : string): integer;
       function  GravarRelatorio(bGravarDetalhes : boolean) : boolean;
       function  GetNumeroRelatorio : integer;
       procedure GetAliquotaImpostos(var pPIS, pCOFINS : double);
       procedure AplicaRemoveFiltro( _cdsFiltro : TClientDataSet; sFiltro : string);

       function ListaDadosContribuicao(iGrupotributo: integer): OleVariant;      //William Santana SOL 155850-15363 KIN 2051763
       function GetDadosContasContabAjustes(pIdNorma, pPeriodo, pExercicio: String): OleVariant;
       procedure  GetVlrAcrescimoReducao(pIdNorma, pPeriodo, pExercicio: String; var pVlrAcrescimo, pVlrReducao: Currency);
  end;

implementation

function ComparaBloco(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(tLinhaBloco(Item1).IdBloco, tLinhaBloco(Item2).IdBloco);
end;


//------------------------------------------------------------------------------
{ tLinhaBloco }
//------------------------------------------------------------------------------

procedure tLinhaBloco.AtualizarValores(const pQtde: integer);
begin
  iQtd := iQtd + pQtde;
end;

constructor tLinhaBloco.Create;
begin
  IdBloco := '';
  iQtd    := 0;
end;

procedure tLinhaBloco.InserirValores(const pIdBloco: string;
  const pQtde: Integer);
begin
  IdBloco := pIdBloco;
  iQtd    := pQtde;
end;

//------------------------------------------------------------------------------
{ tLinhasInformeSPED }
//------------------------------------------------------------------------------

function tLinhasInformeSPED.Add: tLinhaBloco;
begin
  Result := tLinhaBloco.create;
  FLinhasBloco.Add(Result);
end;

function tLinhasInformeSPED.AdicionarValores(const pIdBloco: string;
  const pQtdLinhas: Integer): tLinhaBloco;
begin
  Result := Add;
  Result.InserirValores(pIdBloco, pQtdLinhas);
end;

procedure tLinhasInformeSPED.Clear;
begin
  While Count > 0 Do
      Delete(0);
   FLinhasBloco.Clear;
end;

function tLinhasInformeSPED.Count: Integer;
begin
  Result := FLinhasBloco.count;
end;

constructor tLinhasInformeSPED.Create;
begin
  Inherited;
  FLinhasBloco := TList.Create;
  FLinhasBloco.Clear;
end;

procedure tLinhasInformeSPED.Delete(const pIndex: Integer);
begin
   tLinhaBloco(FLinhasBloco[pIndex]).Free;
   FLinhasBloco.Delete(pIndex);
end;

destructor tLinhasInformeSPED.Destroy;
begin
  inherited;
  Clear;
  FreeAndNil(FLinhasBloco);
end;

function tLinhasInformeSPED.GetLinhas(Index: Integer): tLinhaBloco;
begin
  Result := tLinhaBloco(FLinhasBloco[index]);
end;

function tLinhasInformeSPED.IndexOfLinha(const pIdBloco: string): Integer;
Var i: integer;
Begin
  result := -1;
  For i := 0 To Count-1 Do
  Begin
    if tLinhaBloco(FLinhasBloco[i]).IdBloco = pIdBloco then
    Begin
      result := i;
      break;
    End;
  End;
end;

procedure tLinhasInformeSPED.Ordena;
begin
  FLinhasBloco.Sort(ComparaBloco);
end;

procedure tLinhasInformeSPED.SetLinhas(Index: Integer; const Value: tLinhaBloco);
begin
  FLinhasBloco[Index] := Value;
end;



//------------------------------------------------------------------------------
{ TCtrlSPED }
//------------------------------------------------------------------------------

procedure TCtrlSPED.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlSPED.Create;
begin
  inherited;
  FDbEfdDetalhe     := TDbEfdDetalhe.create(self);
  FDbRelatorio      := TDbRelatorioDados.create(self);
  FDbLinhasSPED     := TDbLinhasSPED.create(self);
  FLinhasEFD        := tLinhasInformeSPED.create;

  cdsAux            := TClientDataSet.Create(nil);
  FcdsDemonstrativo := TClientDataSet.Create(nil);
  FcdsAnalitico     := TClientDataSet.Create(nil);
  FcdsLinhas        := TClientDataSet.Create(nil);
  //Início - William Santana SOL 155850-15363 KIN 2051763
  FcdsContas        := TClientDataSet.Create(nil);
  FcdsAnalitico2    := TClientDataSet.Create(nil);
  FcdsGrupoXconta   := TClientDataSet.Create(nil);
  FcdsSintetico2    := TClientDataSet.Create(nil);
  //Início - William Santana SOL 155850-15363 KIN 2051763
  _sSQL             := TStringList.create;

  FcdsSintetico3    := TClientDataSet.Create(nil); //Darivaldo Alencar SIG52031
end;

destructor TCtrlSPED.Destroy;
begin
  inherited;
  FDbEfdDetalhe.Free;
  FDbRelatorio.free;
  FDbLinhasSPED.free;
  FLinhasEFD.free;

  FreeAndNil(cdsAux);
  FreeAndNil(FcdsDemonstrativo);
  FreeAndNil(FcdsAnalitico);
  FreeAndNil(FcdsLinhas);
  FreeAndNil(_sSQL);
  //Início - William Santana SOL 155850-15363 KIN 2051763
  FreeAndNil(FcdsContas);
  FreeAndNil(FcdsAnalitico2);
  FreeAndNil(FcdsGrupoXConta);
  FreeAndNil(FcdsSintetico2);
  //Término - William Santana SOL 155850-15363 KIN 2051763
  FreeAndNil(FcdsSintetico3);//Darivaldo Alencar SIG52031
end;

procedure TCtrlSPED.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlSPED.ExcluiDemonstrativo(iIdRelatorio: integer): boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarRelatorio(FcdsDemonstrativo.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           // apagando relatorio
           FcdsDemonstrativo.DisableControls;
           FcdsDemonstrativo.delete;
           // apagando detalhes
           if not(FCdsEfdDetalhe.IsEmpty) then
           FCdsEfdDetalhe.delete;
           // apagando linhas
           FcdsAnalitico.first;
           while not FcdsAnalitico.eof do
             FcdsAnalitico.delete;

           StartTransaction;

           Result := ApplyCds(FCdsEfdDetalhe,FDbEfdDetalhe,[],[] );
           If Not Result Then
              Raise Exception.Create(FDbEfdDetalhe.MessageInfo);

           Result := ApplyCds(FcdsAnalitico,FDbLinhasSPED,[],[] );
           If Not Result Then
              Raise Exception.Create(FDbLinhasSPED.MessageInfo);

           Result := ApplyCds(FcdsDemonstrativo,FDbRelatorio,[],[] );
           If Not Result Then
              Raise Exception.Create(FDbRelatorio.MessageInfo);

           Commit;

           FcdsDemonstrativo.EnableControls;

        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
               Raise Exception.Create(MessageInfo);
            End;
        End;
     End;

end;

function TCtrlSPED.GerarArquivos(iTipoRel : integer; sTipoArq, sExercicio, sPeriodo, sCaminho, sIdNorma : string): boolean;
var
   lstArquivo : TStringList;
   nomeArq : string;
   sRecAnt : string;
   sLinha  : string;
   sPasta  : string;
   c, iNumLinhas, ind, idrelatorio : integer;
   iTotal, iParcial, iTotBloco : integer;
begin
  Result := true;

  FcdsSintetico2.CloneCursor(fcdssintetico, false, true);

  AplicaRemoveFiltro(FcdsSintetico, '');
  AplicaRemoveFiltro(FcdsAnalitico, '');
  AplicaRemoveFiltro(FcdsSintetico2, '');

  case iTipoRel of
    3 : sPasta := '\Contribuicao';
    else
      sPasta := '';
  end;

  if not DirectoryExists(sCaminho+sPasta) then
  begin
    if not DirectoryExists(sCaminho) then
       result := CreateDir(sCaminho);

    if result then
       result := CreateDir(sCaminho+sPasta);
  end;
  sCaminho := sCaminho + sPasta;


  if Result then
  begin
    nomeArq := '\EFD'+sExercicio+sPeriodo+FormatDateTime('DD', date)+FormatDateTime('hhmm', now)+'_'+fu.iff(sTipoArq='N', 'NOM', 'RET')+'.txt';
    //Guardando IDRELATORIODADOS em variavél, pois
    //FcdsDemonstrativo se perde após passar pela funcão abaixo
     idrelatorio := FcdsDemonstrativo.FieldByName('IDRELATORIODADOS').AsInteger;

    // se o tipo de arquivo for Normal e já existir um relatorio gerado, alterar tipo para RETIFICADORA
    if (ExisteRelatorio(iTipoRel, sExercicio, sPeriodo)) and (sTipoArq = 'S') then
    begin
      sTipoArq := 'S';
      //Cássio Rovaroto - SIG nº 82251 - Início
      //sRecAnt  := FcdsDemonstrativo.FieldByName('NURECIBO').AsString;
      sRecAnt  := StringReplace(StringReplace(FcdsDemonstrativo.FieldByName('NURECIBO').AsString, '.', '', [rfReplaceAll, rfIgnoreCase]), '-', '', [rfReplaceAll, rfIgnoreCase]);
      //Cássio Rovaroto - SIG nº 82251 - Fim
    end
    else
      sRecAnt  := '';

     //Reposicionando ponteiro na registro certo.
     FcdsDemonstrativo.Locate('IDRELATORIODADOS', idrelatorio , []) ;
    try
      try
        iTotBloco  := 0;
        iTotal     := 0;
        iParcial   := 0;
        
        lstArquivo  := TStringList.Create;

        //bloco 0: Abertura, Identificação e Referências

        //Inicio - William Santana - SOL 155850-15363 KIN 2051763
        for c := 1 to 7 do
        begin
          case c of
            1 : sLinha := GeraLinha0000(sTipoArq, sRecAnt, sPeriodo, sExercicio, iNumLinhas);
            2 : sLinha := GeraLinhaBlocoReplicaValor('|0001', '0', 1, iNumLinhas);
            3 : sLinha := GeraLinha0100(iNumLinhas);
            4 : sLinha := GeraLinha0110(iNumLinhas);
            5 : sLinha := GeraLinha0140(iNumLinhas);
            6 : sLinha := GeraLinha0500(sPeriodo, sExercicio, iNumLinhas);
            7 : sLinha := GeraLinhaFimBloco('|0990', IntToStr(iTotBloco+1), iNumLinhas);
          end;
          lstArquivo.Add( sLinha );

           iTotBloco := iTotBloco + iNumLinhas;
           
          // guarda bloco e no. de linhas do bloco
          SetLinhasEFD(copy(sLinha, 2,4), iNumLinhas);

        end;

        iTotBloco := 0;
        { for c := 1 to 6 do
        begin
          case c of
            1 : sLinha := GeraLinha0000(sTipoArq, sRecAnt, sPeriodo, sExercicio, iNumLinhas);
            2 : sLinha := GeraLinhaBlocoReplicaValor('0001', '0', 1, iNumLinhas);
            3 : sLinha := GeraLinha0100(iNumLinhas);
            4 : sLinha := GeraLinha0110(iNumLinhas);
            5 : sLinha := GeraLinhaBlocoReplicaValor('0140', '', 8, iNumLinhas);
            6 : sLinha := GeraLinhaFimBloco('0990', '6', iNumLinhas);
          end;
          lstArquivo.Add( sLinha );

          // guarda bloco e no. de linhas do bloco
          SetLinhasEFD(copy(sLinha, 1,4), iNumLinhas);
        end;}
        //Término - William Santana - SOL 155850-15363 KIN 2051763

        //bloco A: Documentos Fiscais - Serviços (ISS)
        GeraBlocoVazio(lstArquivo, '|A001', '|A990', '1');

        //bloco C: Documentos Fiscais I - Mercadorias (ICMS/IPI)
        GeraBlocoVazio(lstArquivo, '|C001', '|C990', '1');

        //bloco D: Documentos Fiscais II - Serviços (ICMS)
        GeraBlocoVazio(lstArquivo, '|D001', '|D990', '1');

        //bloco F: Demais Documentos e Operações
        GeraBlocoVazio(lstArquivo, '|F001', '|F990', '1');

        //bloco H: Operações de Pessoas Jurídicas Componentes do Sistema Financeiro, Seguradoras, Previdência, Capitalização e Operadoras de Planos de Assistência à Saúde
        //GeraBlocoVazio(lstArquivo, '|H001', '|H990', '1'); //William Santana - SOL 155850-15363 KIN 2051763

        //bloco I: Escrituração das entidades financeiras, seguradoras, entidades de previdência privada, empresas de capitalização e operadoras de planos de assistência à saúde
        //Início - William Santana SOL 155850-15363 KIN 2051763
        // if (StrToInt(sPeriodo) >= 7) and (StrToInt(sExercicio) >= 2013) then
        if (StrToInt(sExercicio) > 2013) or ((StrToInt(sPeriodo) >= 7) and (StrToInt(sExercicio) >= 2013)) then
        //Término - William Santana SOL 155850-15363 KIN 2051763
        begin
          for c := 1 to 4 do
          begin
            case c of
             1 : sLinha := GeraLinhaBlocoReplicaValor('|I001', '0', 1, iNumLinhas);
             2 : sLinha := GeraLinhaBlocoReplicaValor('|I010', TiraCaracteres(FcdsEfdDetalhe.FieldByName('CNPJPESJUR').AsString, '.- ')+'|03|', 1, iNumLinhas);
             3 : sLinha := GeraLinhaBlocoI100(lstArquivo, iNumLinhas);
//              4 : sLinha := GeraLinhaProcesso('I299', iNumLinhas);
//              6 : sLinha := GeraLinhaBlocoI300(iNumLinhas);
//              7 : sLinha := GeraLinhaProcesso('I399', iNumLinhas);
              4 : sLinha := GeraLinhaFimBloco('|I990', IntToStr(iTotBloco+1), iNumLinhas);
            end;

            iTotBloco := iTotBloco + iNumLinhas;

            // guarda bloco e no. de linhas do bloco
            if sLinha <> '' then
            begin
              lstArquivo.Add( sLinha );
              SetLinhasEFD(copy(sLinha, 2,4), iNumLinhas);
            end;
          end;
        end
        else
        begin
          GeraBlocoVazio(lstArquivo, '|I001', '|I990', '1');
        end;

        //bloco M: Apuração da Contribuição e Crédito de PIS/PASEP e da COFINS
        //Início - William Santana SOL 155850-15363 KIN 2051763
        // GeraBlocoVazio(lstArquivo, '|M001', '|M990', '1');
        iTotBloco := 0;
        for c:= 1 to 3 do
        begin
         case c of
          1: sLinha := GeraLinhaBlocoReplicaValor('|M001', '0', 1, iNumLinhas);
          //Cássio Rovaroto - SIG nº 72274 - Início
          //2: sLinha := GeraLinhaBlocoM200e600(sPeriodo, sExercicio, sIdNorma, lstArquivo, iNumLinhas);
          2: sLinha := GeraLinhaBlocoM200e600(sPeriodo, sExercicio, sIdNorma, lstArquivo, iNumLinhas);
          //Cássio Rovaroto - SIG nº 72274 - Fim
          3: sLinha := GeraLinhaFimBloco('|M990', IntToStr(iTotBloco+1), iNumLinhas);
         end;

           iTotBloco := iTotBloco + iNumLinhas;

         if sLinha <> '' then
         begin
           lstArquivo.Add( sLinha );
           SetLinhasEFD(copy(sLinha, 2,4), iNumLinhas);
         end;
         
        end;
        //Término - William Santana SOL 155850-15363 KIN 2051763

        //bloco P: Apuração da Contribuição Previdenciária sobre a Receita Bruta
        GeraBlocoVazio(lstArquivo, '|P001', '|P990', '1');

        //bloco 1: Complemento da Escrituração - Controle de Saldos de Créditos e de Retenções, Operações Extemporâneas e Outras Informações
        iTotBloco := 0;

        for c := 1 to 3 do
        begin
          case c of
            1 : sLinha := GeraLinhaBlocoReplicaValor('|1001', '0', 1, iNumLinhas);
            2 : sLinha := GeraBloco1010(iNumLinhas);
            3 : sLinha := GeraLinhaFimBloco('|1990', IntToStr(iTotBloco+1), iNumLinhas);
          end;

          iTotBloco := iTotBloco + iNumLinhas;

          if sLinha <> '' then
          begin
            lstArquivo.Add( sLinha );
            // guarda bloco e no. de linhas do bloco
            SetLinhasEFD(copy(sLinha, 2,4), iNumLinhas);
          end;
        end;

        // Bloco totalizadores -------------------------------------------------
        iTotal := 0;
        iParcial := 0;

        // guarda bloco e no. de linhas do bloco
        SetLinhasEFD('9001', 1);
        SetLinhasEFD('9990', 1);
        SetLinhasEFD('9999', 1);

        // ordena antes de gerar o totalizador
        LinhasEFD.Ordena();

        //bloco 9: Controle e Encerramento do Arquivo Digital
        sLinha := GeraLinhaBlocoReplicaValor( '|9001', '0', 1, iNumLinhas);
        lstArquivo.Add( sLinha );

        for c := 0 to LinhasEFD.Count-1 do
        begin
          sLinha := GeraLinhaBlocoReplicaValor('|9900', LinhasEFD[c].IdBloco+'|'+IntToStr(LinhasEFD[c].iQtd), 1);
          lstArquivo.Add( sLinha );
          
          iParcial := iParcial + 1;
          iTotal := itotal + LinhasEFD[c].iQtd;
        end;
        iParcial := iParcial + 1;
        sLinha := GeraLinhaBlocoReplicaValor('|9900', '9900|'+IntToStr(iParcial), 1);
        lstArquivo.Add( sLinha );

        //Início - William Santana - SOL 155850-15363 KIN 2051763
        // total de linhas do bloco iniciado por 9
        //iParcial := iParcial + 2; // conta o bloco 9001 e 9990 e 9999
        sLinha := GeraLinhaBlocoReplicaValor('|9990', IntToStr(iParcial+3), 1);
        lstArquivo.Add( sLinha );

        {
         //iParcial := iParcial + 2; // conta o bloco 9001 e 9990
        sLinha := GeraLinhaBlocoReplicaValor('|9990', IntToStr(iParcial+2), 1);
        lstArquivo.Add( sLinha );
        }
        //Término - William Santana - SOL 155850-15363 KIN 2051763

        // total de linhas do arquivo
        sLinha := GeraLinhaBlocoReplicaValor('|9999', IntToStr( iTotal + iParcial ), 1);
        lstArquivo.Add( sLinha );


        //CloseFile(Arquivo);
        lstArquivo.SaveToFile(sCaminho + nomeArq);

        Result := True;
      Except
        Result := False;
      End;

    finally
      lstArquivo.Free;
      LinhasEFD.clear;
    end;
  end;

   AplicaRemoveFiltro(FcdsSintetico, '');
   AplicaRemoveFiltro(FcdsAnalitico, '');
   AplicaRemoveFiltro(FcdsSintetico2, '');
end;


function TCtrlSPED.ListaDadosSinteticos(iIdRelatorio : integer) : OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('SELECT LR.IDLINHA,  ');
  _sSQL.Add('       LR.IDNORMA,  ');
  _sSQL.Add('       LR.DESCRICAO,');
  _sSQL.Add('       CE.DESCRICAO AS CARACTERISTICA,');  // William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('       LR.COD_LINHA,                  ');
   //Início - William Santana - SOL 230351 PPM 352242
  _sSQL.Add('       SUBSTR(LR.COD_LINHA,0,5) AS SUBS_COD_LINHA,  ');
 // _sSQL.Add('       SUM(DECODE(NA.DESCRICAO, ''POSITIVA'', ABS(LS.TOTAL), ');
 // _sSQL.Add('                               DECODE(SIGN(LS.TOTAL), 1, LS.TOTAL*-1, LS.TOTAL))) AS VALOR, ');
  _sSQL.Add('   DECODE(LR.IDNATUREZA,2,- ABS(SUM(LS.TOTAL)),SUM(LS.TOTAL)) AS VALOR ,       ');
  //Término - William Santana - SOL 230351 PPM 352242
  _sSQL.Add('       DECODE(LR.IDNATUREZA, 2, - ABS(SUM(LS.TOTAL_AJUSTE)),SUM(LS.TOTAL_AJUSTE)) AS VALORAJUST, '); //Cássio Rovaroto - SIG nº 72274
  _sSQL.Add('       LS.IDRELATORIODADOS, ');
  _sSQL.Add('       RE.NURECIBO,         ');
  _sSQL.Add('       tc.descricaocategoria as categoria,');
  _sSQL.Add('       decode(tc.descricaocategoria, ''RECEITA'', ''02'',  ');
  _sSQL.Add('                                     ''GERAL'',   ''04'',''05'') AS IDCAMPO,  ');
  _sSQL.Add('       decode(TC.DESCRICAOCATEGORIA, ''RECEITA'', 1, ''ESPECÍFICO'', 2, 3) AS ORDEM '); // Felipe A. Santos SOL 244830/17209 PPM 796205
  _sSQL.Add('  FROM (SELECT IDLINHASPED, IDRELATORIODADOS, IDASSOCIACAO, ');
   //Início - William Santana - SOL 230351 PPM 352242
 // _sSQL.Add('                     VLRCREDITO, VLRDEBITO, NVL(VLRCREDITO,0)-NVL(VLRDEBITO,0) TOTAL ');
  _sSQL.Add('                     VLRCREDITO, VLRDEBITO, NVL(VLRDEBITO,0)-NVL(VLRCREDITO,0) TOTAL ');
  _sSQL.Add('               , ((NVL(VLRDEBITO,0)-NVL(VLRCREDITO,0)) + (NVL(VLRACRESCIMO,0)-NVL(VLRREDUCAO,0))) TOTAL_AJUSTE ');  //Cássio Rovaroto - SIG nº 72274
   //Término - William Santana - SOL 230351 PPM 352242
  _sSQL.Add('                FROM LINHAS_SPED ');
  _sSQL.Add('       ) LS, ');
  _sSQL.Add('       NATUREZA_LINHA             NA, ');
  _sSQL.Add('       LINHA_RELATORIO            LR, ');
  _sSQL.Add('       TIPODECATEGORIA            TC, ');
  _sSQL.Add('       RELATORIO_DADOS_CADASTRAIS RE, ');
  _sSQL.Add('       LINHAXCONTACONTABIL        LXC ');
  _sSQL.Add('     , CARACTERISTICA_GRUPO_EFD CE    '); //William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add(' WHERE TC.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA ');
  _sSQL.Add('   AND LR.IDLINHA = LXC.IDLINHA           ');
  _sSQL.Add('   AND LXC.IDASSOCIACAO = LS.IDASSOCIACAO ');
  _sSQL.Add('   AND LS.IDRELATORIODADOS = RE.IDRELATORIODADOS ');
  _sSQL.Add('   AND LR.IDNATUREZA = NA.IDNATUREZA ');
  _sSQL.Add('   AND CE.IDTIPOCARACTERISTICA = LR.IDTIPOCARACTERISTICA   ');       //William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('   AND RE.IDRELATORIODADOS = '+IntToStr(iIdRelatorio) );
  _sSQL.Add('GROUP BY LR.IDLINHA,       ');
  _sSQL.Add('         LR.COD_LINHA,          ');
  _sSQL.Add('         LR.IDNORMA,          ');
  _sSQL.Add('         LR.DESCRICAO,        ');
  _sSQL.Add('         LR.COD_LINHA,        ');
  _sSQL.Add('         LS.IDRELATORIODADOS, ');
  _sSQL.Add('         RE.NURECIBO,         ');
  _sSQL.Add('         tc.descricaocategoria');
  _sSQL.Add('        , CE.DESCRICAO, LR.IDNATUREZA    ');               //William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add(' ORDER BY ORDEM, LR.COD_LINHA'); // Felipe A. Santos SOL 244830/17209 PPM 796205 - Ordem

  Result := GetDataPacket( _sSQL.GetText );

  ListaDadosSinteticosComAssociacao(iIdRelatorio);//Darivaldo Alencar SIG52031
end;

function TCtrlSPED.ListaDemonstrativos(const iIdRelatorio : integer): OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('SELECT R.IDRELATORIODADOS,');
  _sSQL.Add('       R.IDTIPO,          ');
  _sSQL.Add('       R.IDNORMA,         ');
  _sSQL.Add('       R.DATAGERACAO,     ');
  _sSQL.Add('       R.EXERCICIO,       ');
  _sSQL.Add('       R.PERIODO,         ');
  _sSQL.Add('       R.NURECIBO,        ');
  _sSQL.Add('       R.NURECRETIFICADOR,');
  _sSQL.Add('       R.RETIFICADORA,    ');
  _sSQL.Add('       R.BASECALC,        ');
  _sSQL.Add('       R.VLRPIS,          ');
  _sSQL.Add('       R.VLRCOFINS        ');
  //Cássio Rovaroto - SIG nº 72274 - Início
  _sSQL.Add('       , R.BASECALCAJUST,   ');
  _sSQL.Add('       R.VLRACRESCIMO,    ');
  _sSQL.Add('       R.VLRREDUCAO       ');
  //Cássio Rovaroto - SIG nº 72274 - Fim
  _sSQL.Add('  FROM RELATORIO_DADOS_CADASTRAIS R ');
  _sSQL.Add(' WHERE IDTIPO = 3' );
  if iIdRelatorio >= 0 then
     _sSQL.Add('   and IDRELATORIODADOS = '+IntToStr(iIdRelatorio) );
  _sSQL.Add(' ORDER BY R.EXERCICIO, R.PERIODO, R.IDRELATORIODADOS ');

  Result := GetDataPacket( _sSQL.GetText );

end;

function TCtrlSPED.ListaEndereco(iIdPessoa : integer): OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('SELECT END.NOME AS ENDERECO,');
  _sSQL.Add('       END.NUMERO AS NUMERO,');
  _sSQL.Add('       '' AS COMPLEMENTO,   ');
  _sSQL.Add('       END.BAIRRO AS BAIRRO,');
  _sSQL.Add('       END.CEP AS CEP,      ');
  _sSQL.Add('       CID.NOME AS CIDADE,  ');
  _sSQL.Add('       END.CODESTADO AS UF  ');
  _sSQL.Add('  FROM ENDPESS END          ');
  _sSQL.Add('  JOIN CIDADES CID ON CID.IDCIDADES = END.IDCIDADES');
  _sSQL.Add(' WHERE IDPESSOA = '+IntToStr(iIdPessoa));

  Result := GetDataPacket( _sSQL.GetText );
end;

function TCtrlSPED.ListaInstituicao(iIdPessoa: integer): OleVariant;
begin
  _sSQL.clear;

  //BUSCA DADOS DA FUNDAÇÃO (idPessoa = 1 -> fundacao)
  _sSQL.Add('SELECT PES.RAZAOSOCIAL  AS NOME,     ');
  _sSQL.Add('       PES.NUMDOCUMENTO AS CNPJ,     ');
  _sSQL.Add('       TRANSLATE(TO_CHAR(LPAD(REPLACE(PES.NUMDOCUMENTO,'' ''),14,''0'') / 100,''00,000,000,0000.00''), '',.'', ''.-'') CNPJ_MASCARA, ');
  _sSQL.Add('       ''0'' || TEL.DDD||TEL.NUMERO AS TELEFONE, ');
  _sSQL.Add('       END.NOME      AS ENDERECO,    ');
  _sSQL.Add('       END.NUMERO    AS NUMERO,      ');
  _sSQL.Add('       '' ''         AS COMPLEMENTO, ');
  _sSQL.Add('       END.BAIRRO    AS BAIRRO,      ');
  _sSQL.Add('       END.CEP       AS CEP,         ');
  _sSQL.Add('       CID.NOME      AS CIDADE,      ');
  _sSQL.Add('       END.CODESTADO AS UF,          ');
  _sSQL.Add('       END.IDENDERECO                ');
  _sSQL.Add('  FROM PESSOA PES ');
  _sSQL.Add('  LEFT JOIN ENDPESS END ON END.IDPESSOA  = PES.IDPESSOA  ');
  _sSQL.Add('  LEFT JOIN CIDADES CID ON CID.IDCIDADES = END.IDCIDADES ');
  _sSQL.Add('  LEFT JOIN TELENDPESS TEL ON TEL.IDENDERECO = END.IDENDERECO AND TEL.TIPO = ''C'' ');
  _sSQL.Add(' WHERE PES.IDPESSOA = '+IntToStr(iIdPessoa));

  Result := GetDataPacket( _sSQL.GetText );
end;

function TCtrlSPED.ListaResponsavel(iIdPessoa: integer): OleVariant;
begin
  _sSQL.clear;

  if iIdPessoa = 1 then
  begin
    // Andre Imakawa - SIG 127797 - Inicio
    // BUSCA RESPONSÁVEL PELO PREENCHIMENTO PADRÃO
    _sSQL.Add('SELECT NOME, CPF, CPF_MASCARA, EMAIL, IDCONTADOR');
    _sSQL.Add('FROM(      ');
    _sSQL.Add('SELECT PES.NOME AS NOME,          ');
    _sSQL.Add('       PES.NUMDOCUMENTO AS CPF,   ');
    _sSQL.Add('       TRANSLATE(TO_CHAR(PES.NUMDOCUMENTO / 100, ''000,000,000.00''), '',.'', ''.-'') CPF_MASCARA, ');
    _sSQL.Add('       PES.EMAIL AS EMAIL,        ');
    _sSQL.Add('       PES.IDPESSOA AS IDCONTADOR ');
    _sSQL.Add('  FROM PESSOA PES                 ');
    _sSQL.Add('  JOIN CENTCUST CEN ON CEN.STATUSGRUPOCDC = ''A'' AND CEN.ATIVO = ''S'' AND CEN.NOME = ''CONTAB'' ');
    _sSQL.Add('  JOIN FUNCIONARIO FUN ON FUN.IDPESSOA = PES.IDPESSOA AND FUN.CODCENTROCUSTO = CEN.CODCENTROCUSTO AND FUN.IDSITFUNC = 1 ');
    _sSQL.Add('  JOIN RESPCENTCUST R ON R.CODCENTROCUSTO  = FUN.CODCENTROCUSTO AND FUN.IDPESSOA = R.IDPESSOA  ');
    _sSQL.Add('  WHERE ((R.TIPORESPCENTCUST =  ''G'' AND (R.DTFIMVIG IS NULL OR R.DTFIMVIG >= SYSDATE))');
    _sSQL.Add('  OR(R.TIPORESPCENTCUST =  ''S'' AND (R.DTFIMVIG IS NULL OR R.DTFIMVIG >= SYSDATE)))');
    _sSQL.Add('  ORDER BY TIPORESPCENTCUST, ORDEM)');
    _sSQL.Add('  WHERE ROWNUM = 1');
    // Andre Imakawa - SIG 127797 - Fim
  end
  else
  begin
    _sSQL.add('SELECT P.IDPESSOA AS IDCONTADOR,         ');
    _sSQL.add('       P.NUMDOCUMENTO AS CPF,            ');
    _sSQL.Add('       CASE                              ');
    _sSQL.Add('         WHEN LENGTH(TRIM(P.NUMDOCUMENTO)) = 14 ');
    _sSQL.Add('             THEN TRANSLATE(TO_CHAR(LPAD(REPLACE(P.NUMDOCUMENTO,'' ''),14,''0'') / 100,''00,000,000,0000.00''), '',.'', ''.-'')');
    _sSQL.Add('             ELSE TRANSLATE(TO_CHAR(P.NUMDOCUMENTO / 100, ''000,000,000.00''), '',.'', ''.-'')                                 ');
    _sSQL.Add('       END  CPF_MASCARA,                 ');
    _sSQL.add('       P.NOME,                           ');
    _sSQL.add('       T.DDD,                            ');
    _sSQL.add('       T.NUMERO,                         ');
    _sSQL.add('       ''(''||TRIM(T.DDD)||'') ''||T.NUMERO DDD_TEL, ');
    _sSQL.add('       P.EMAIL                           ');
    _sSQL.add('  FROM PESSOA P, ENDPESS E, TELENDPESS T ');
    _sSQL.add(' WHERE E.IDPESSOA   = P.IDPESSOA         ');
    _sSQL.add('   AND E.IDENDERECO = T.IDENDERECO       ');
    _sSQL.add('   AND T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE)FROM TELENDPESS T1 WHERE T.IDENDERECO = T1.IDENDERECO)');
    _sSQL.add('   AND P.IDPESSOA = ' + IntToStr(iIdPessoa));
  end;

  Result := GetDataPacket( _sSQL.GetText );
end;


procedure TCtrlSPED.SetcdsAnalitico(const Value: TClientDataSet);
begin
  FcdsAnalitico := Value;
end;

procedure TCtrlSPED.SetcdsDemonstrativo(const Value: TClientDataSet);
begin
  FcdsDemonstrativo := Value; 
end;

//Início - William Santana SOL 155850-15363 KIN 2051763


function TCtrlSPED.ListaDadosContribuicao(iGrupotributo: integer): OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('SELECT N.DESCRICAO, (TO_CHAR(N.CODNATUREZA) || NVL(N.VARIACAO,''00'')) AS CODIDENTIFICADOR');
  _sSQL.Add('  FROM NATURENDIMENTO N ');
  _sSQL.Add('  WHERE N.GRUPOTRIBUTO = 0'+IntToStr(iGrupotributo + 5 ));
  _sSQL.Add(' AND N.RECPAG = ''P'' ');

  Result := GetDataPacket( _sSQL.GetText );
end;
 //Término - William Santana SOL 155850-15363 KIN 2051763

function TCtrlSPED.ListaOpcoes(iIdComponente: integer): OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('SELECT P.DESCRICAO, P.CODIDENTIFICADOR');
  _sSQL.Add('  FROM DADOS_EFD_CONTRIB_PARAMETROS P ');
  _sSQL.Add(' WHERE P.CODCOMPONENTE = '+IntToStr(iIdComponente));
  _sSQL.Add(' ORDER BY CODIDENTIFICADOR');

  Result := GetDataPacket( _sSQL.GetText );

end;


function TCtrlSPED.ListaDadosDetalhe(iIdRelatorio: integer): OleVariant;
begin

  _sSQL.clear;
  _sSQL.Add('SELECT DET.IDCODDETALHE,     ');
  _sSQL.Add('       DET.IDRELATORIODADOS, ');
  _sSQL.Add('       DET.CODQUALIPESJUR,   ');    // natureza pessoa juridica
  _sSQL.Add('       DET.CODATIVIDADE,     ');    // atividade preponderante
  _sSQL.Add('       DET.CODSITTRIB,       ');    // situacao tributaria
  _sSQL.Add('       DET.NUMPROCESSO,      ');    // no. de processo
  _sSQL.Add('       DET.CODORIGEMPROCESSO,');    // origem do processo
  _sSQL.Add('       DET.CODINCIDTRIB,     ');    // incidencia tributaria
  _sSQL.Add('       DET.CODAPROPCRED,     ');    // apropriacao de credito
  _sSQL.Add('       DET.CODCRITESCRIT,    ');    // criterio de escrituracao
  _sSQL.Add('       DET.CODCONTRIBAPUR,   ');    // contribuicao apurada
  _sSQL.Add('       DET.IDFUNDACAO,       ');

  //Darivaldo Alencar SIG52031 -inicio
  //_sSQL.Add('       FND.RAZAOSOCIAL,      ');
  _sSQL.Add(Translate('FND.RAZAOSOCIAL',True));
  //_sSQL.Add('       TRANSLATE(FND.RAZAOSOCIAL,''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'') AS RAZAOSOCIAL, ');
  //Darivaldo Alencar SIG52031

  _sSQL.Add('       DET.CNPJPESJUR,       ');
  _sSQL.Add('       DET.IDCONTADOR,       ');
  _sSQL.Add('       PES.NOME AS CONTADOR, ');
  _sSQL.Add('       DET.CPF_CONTADOR,     ');
  _sSQL.Add('       DET.CRC,              ');
  _sSQL.Add('       DET.TELEFONE,         ');
  _sSQL.Add('       DET.EMAIL,            ');
  _sSQL.Add('       DET.IDENDPESS,        ');
  _sSQL.Add('       ED.NOME      AS ENDERECO,   ');
  _sSQL.Add('       ED.NUMERO    AS NUMERO,     ');
  _sSQL.Add('       ''  ''       AS COMPLEMENTO,');
  _sSQL.Add('       ED.BAIRRO    AS BAIRRO,     ');
  _sSQL.Add('       ED.CEP       AS CEP,        ');
  _sSQL.Add('       CID.NOME     AS CIDADE,     ');
  _sSQL.Add('       CID.CODMUNICIPIO AS CODIBGE, ');       //William Santana - SOL 230351 PPM 352242
//  _sSQL.Add('       CID.CODMUNICIPIOIBGE AS CODIBGE, '); //William Santana - SOL 230351 PPM 352242
  _sSQL.Add('       ED.CODESTADO AS UF,   ');
  _sSQL.Add('       DET.NUMPROCJUD,       ');
  _sSQL.Add('       DET.NATUREZAACAO,     ');
  _sSQL.Add('       DET.SECAOJUD,         ');
  _sSQL.Add('       DET.VARA,             ');
  _sSQL.Add('       DET.DATASENTENCA,     ');
  _sSQL.Add('       DET.DESCRICAOJUD,      ');

  //Início - William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('       DET.TIPOCONTRIBPISCONFINS, ');
  _SSQL.ADD('       DET.CODCONTRIBAPURADA,     ');      // código contribuição social
  _SSQL.ADD('       DET.CODRFBPIS,             ');
  _SSQL.ADD('       DET.CODRFBCONFINS          ');
  //Término - William Santana SOL 155850-15363 KIN 2051763

  _sSQL.Add('  FROM DADOS_EFD_CONTRIB_DETALHE DET,');
  _sSQL.Add('       ENDPESS ED,                   ');
  _sSQL.Add('       CIDADES CID,                  ');
  _sSQL.Add('       PESSOA PES,                   ');
  _sSQL.Add('       PESSOA FND                    ');
  _sSQL.Add(' WHERE CID.IDCIDADES = ED.IDCIDADES  ');
  _sSQL.Add('   AND ED.IDENDERECO = DET.IDENDPESS ');
  _sSQL.Add('   AND FND.IDPESSOA  = DET.IDFUNDACAO');
  _sSQL.Add('   AND PES.IDPESSOA  = DET.IDCONTADOR');
  //Início - William Santana SOL 155850-15363 KIN 2051763
  if iIdRelatorio = -1 then
  _sSQL.Add('   AND DET.IDRELATORIODADOS = (select max(IDRELATORIODADOS) from DADOS_EFD_CONTRIB_DETALHE)')
  else
  //Término - William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('   AND DET.IDRELATORIODADOS = '+IntToStr(iIdRelatorio) );



  Result := GetDataPacket( _sSQL.GetText );

end;


function TCtrlSPED.ListaDadosAnaliticos(iIdRelatorio: integer): OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('SELECT DISTINCT(LS.IDLINHASPED), ');      //William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('   LR.COD_LINHA, PC.PLACONTA,      ');       //William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('       LS.IDRELATORIODADOS, ');
  _sSQL.Add('       LXC.IDASSOCIACAO,    ');
  _sSQL.Add('       LXC.IDLINHA,         ');
  _sSQL.Add('       LXC.PLACONTA,        ');
  _sSQL.Add('       PC.PLANOME,          ');
  _sSQL.Add('       DECODE(LENGTH(TRIM(LXC.PLACONTA)), 2, ''S'', 3, ''S'', ''A'') FLGTIPO, ');
  _sSQL.Add('       DECODE(TC.DESCRICAOCATEGORIA, ''ESPECÍFICO'', ''DEDUÇÃO'', TC.DESCRICAOCATEGORIA) AS CATEGORIA, ');  // Alterado por Felipe A. Santos SOL 244830/17209 PPM 796205
  _sSQL.Add('       CE.DESCRICAO AS CARACTERISTICA,  ');
  //Cássio Rovaroto - SIG nº 72274 - Início
  //_sSQL.Add('       NVL(LS.VLRCREDITO,0) VLRCREDITO, ');
  _sSQL.Add('       DECODE(NVL(LXC.TIPOBASECALC, 0), 0, NVL(LS.VLRCREDITO,0), 0) VLRCREDITO, ');
  _sSQL.Add('       DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(LS.VLRCREDITO,0), 0) VLRCREDITO_AJUSTE, ');
  //_sSQL.Add('       NVL(LS.VLRDEBITO, 0) VLRDEBITO,  ');
  _sSQL.Add('       DECODE(NVL(LXC.TIPOBASECALC, 0), 0, NVL(LS.VLRDEBITO, 0), 0) VLRDEBITO, ');
  _sSQL.Add('       DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(LS.VLRDEBITO, 0), 0) VLRDEBITO_AJUSTE,');
  //Início - William Santana SOL 155850-15363 KIN 2051763
  // _sSQL.Add('       DECODE(NA.DESCRICAO, ''POSITIVA'', ABS(LS.TOTAL), ');
  //Início - William Santana - SOL 233374 PPM 413667
  // _sSQL.Add('                            DECODE(SIGN(LS.TOTAL), 1, LS.TOTAL*-1, LS.TOTAL)) AS TOTAL ');
  // _sSQL.Add('       DECODE (LXC.PLANATUREZA,''D'',-LS.TOTAL,LS.TOTAL) AS TOTAL  ');
  //_sSQL.Add( 'NVL(DECODE(LR.IDNATUREZA,2,-ABS(LS.TOTAL),LS.TOTAL) ,0)  AS TOTAL, ');
  _sSQL.Add('       DECODE(NVL(LXC.TIPOBASECALC, 0), 0, NVL(DECODE(LR.IDNATUREZA,2,-ABS(LS.TOTAL),LS.TOTAL) ,0), 0)  AS TOTAL, ');
  _sSQL.Add('       DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.IDNATUREZA,2,-ABS(LS.TOTAL),LS.TOTAL) ,0), 0)  AS TOTAL_AJUSTE,');
  //Cássio Rovaroto - SIG nº 72274 - Fim
  _sSQL.Add('      DECODE(TC.DESCRICAOCATEGORIA, ''RECEITA'', 1, ''ESPECÍFICO'', 2, 3) AS ORDEM '); // Felipe A. Santos SOL 244830/17209 PPM 796205
  //Término - William Santana - SOL 233374 PPM 413667
  //Término - William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add(' FROM (SELECT IDLINHASPED, IDRELATORIODADOS, IDASSOCIACAO, ');
    //Início - William Santana - SOL 230351 PPM 352242
  // _sSQL.Add('                     VLRCREDITO, VLRDEBITO, NVL(VLRCREDITO,0)-NVL(VLRDEBITO,0) TOTAL ');
  _sSQL.Add('                     VLRCREDITO, VLRDEBITO, NVL(VLRDEBITO,0)-NVL(VLRCREDITO,0) TOTAL ');
   //Término - William Santana - SOL 230351 PPM 352242
  _sSQL.Add('         FROM LINHAS_SPED       ');
  _sSQL.Add('       ) LS,                    ');
  _sSQL.Add('       LINHAXCONTACONTABIL LXC, ');
  _sSQL.Add('       PLANOCONTA PC,           ');
  _sSQL.Add('       TIPODECATEGORIA TC,      ');
  _sSQL.Add('       LINHA_RELATORIO LR,      ');
  _sSQL.Add('       NATUREZA_LINHA  NA,      ');
  _sSQL.Add('       CARACTERISTICA_GRUPO_EFD CE ');
  _sSQL.Add(' WHERE LR.IDLINHA = LXC.IDLINHA ');
  _sSQL.Add('   AND LR.IDNATUREZA = NA.IDNATUREZA ');
  _sSQL.Add('   AND TC.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA   ');
  _sSQL.Add('   AND CE.IDTIPOCARACTERISTICA = LR.IDTIPOCARACTERISTICA ');
  _sSQL.Add('   AND LS.IDASSOCIACAO(+) = LXC.IDASSOCIACAO         ');
  _sSQL.Add('   AND LS.IDRELATORIODADOS = '+IntToStr(iIdRelatorio) );
  _sSQL.Add('   AND TRIM(LXC.PLACONTA) = TRIM(PC.PLACONTA)        ');
  _sSQL.Add('   AND LXC.PLANO = PC.PLANO                          ');
   //Início - William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('   AND LR.IDLINHA IN (SELECT DISTINCT F.IDLINHAFILHO FROM LINHA_RELATORIO L,    ');
  _sSQL.ADD(' (SELECT IDLINHA AS IDLINHAFILHO, SUBSTR(COD_LINHA,1,5) AS FILHO ,');
  _sSQL.ADD('      COD_LINHA AS COD_LINHA_FILHO FROM LINHA_RELATORIO ) F       ');
  _sSQL.ADD('               WHERE                                              ');
  _sSQL.ADD('               L.IDLINHA <> F.IDLINHAFILHO                        ');
  _sSQL.ADD('               AND                                                ');
  _sSQL.ADD('               F.FILHO = L.COD_LINHA                              ');
  _sSQL.ADD('               AND                                                ');
  _sSQL.ADD('               L.IDNORMA = 7      )                               ');
  _sSQL.Add(' ORDER BY ORDEM, LR.COD_LINHA, PC.PLACONTA ');  // Felipe A. Santos SOL 244830/17209 PPM 796205 - ORDEM
  //Término - William Santana SOL 155850-15363 KIN 2051763

  Result := GetDataPacket( _sSQL.GetText );
end;


function TCtrlSPED.ExisteRelatorio(iTipoRel : integer; sExercicio, sPeriodo: string): boolean;
begin
  // verifica se já existe relatorio gerado
  Result := false;
  if FcdsDemonstrativo.Locate('IDTIPO;EXERCICIO;PERIODO', VarArrayOf([iTipoRel, sExercicio, sPeriodo]), []) then
     if FcdsDemonstrativo.FieldByName('NURECIBO').AsString <> '' then
        Result := true;
end;

Function TCtrlSPED.CarregaDadosLinhas(pIdNorma: Integer): OleVariant;
Begin
  _sSQL.clear;
  _sSQL.Add('SELECT LR.IDLINHA, LR.DESCRICAO ');
  _sSQL.Add('  FROM LINHA_RELATORIO LR ');
  _sSQL.Add(' WHERE LR.IDNORMA = ' + IntToStr(pIdNorma) );

  Result := GetDataPacket( _sSQL.GetText );
End;

function TCtrlSPED.InserirDetalheRelatorio: boolean;
Var
   Msg  : String;
   binTrans : boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.InserirDetalheRelatorio(FCdsEfdDetalhe.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           bInTrans := InTransaction;

           if not bInTrans then
              StartTransaction;

           Result := ApplyCds(FCdsEfdDetalhe,FDbEfdDetalhe,[],[] );
           Msg    := FDbEfdDetalhe.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           if not bInTrans then
              Commit;
        except
           On E:Exception Do
            Begin

              if not bInTrans then
                 Rollback;

               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;

procedure TCtrlSPED.SetcdsEfdDetalhe(const Value: TClientDataSet);
begin
  FcdsEfdDetalhe := Value;
end;

function TCtrlSPED.LocalizaNormaVigente(sTipoRelatorio: string): integer;
Begin
  result := -1;

  _sSQL.clear;
  _sSQL.Add('SELECT IDNORMA ');
  _sSQL.Add('  FROM NORMA_VIGENTE ');
  _sSQL.Add(' WHERE IDTIPO = '+sTipoRelatorio );
  _sSQL.Add('and (DATAFIM IS NULL or DATAFIM = TO_DATE(''30/12/1899'',''DD/MM/YYYY''))');

  CdsAux.data := GetDataPacket( _sSQL.GetText );

  if not CdsAux.isEmpty then
     result := CdsAux.Fields[0].AsInteger;

end;


function TCtrlSPED.GravarRelatorio(bGravarDetalhes : boolean) : boolean;
Var
   Msg  : String;
   ind  : byte;
   binTrans : boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarRelatorio(FcdsDemonstrativo.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           // inserir linhas
           FcdsLinhas.data := ListaDadosAnaliticos(-1); 
           FcdsAnalitico.DisableControls;
           while not FcdsAnalitico.eof do
           begin
             FcdsLinhas.insert;
             for ind := 1 to FcdsAnalitico.Fields.Count-1 do
                FcdsLinhas.Fields[ind].Value := FcdsAnalitico.Fields[ind].Value;

             FcdsLinhas.Post;
             FcdsAnalitico.next;
           end;
           FcdsAnalitico.EnableControls;

           bInTrans := InTransaction;

           if not bInTrans then
              StartTransaction;

           Result := ApplyCds(FcdsDemonstrativo,FDbRelatorio,[],[] );
           Msg    := FDbRelatorio.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           if bGravarDetalhes then
           begin
             Result := ApplyCds(FCdsEfdDetalhe,FDbEfdDetalhe,[],[] );
             Msg    := FDbEfdDetalhe.MessageInfo;
             If Not Result Then Raise Exception.Create(Msg);

             Result := ApplyCds(FcdsLinhas,FDbLinhasSPED,[],[] );
             Msg    := FDbLinhasSPED.MessageInfo;
             If Not Result Then Raise Exception.Create(Msg);
           end;

           if not bInTrans then
              Commit;
              
        except
           On E:Exception Do
            Begin
              if not bInTrans then
                 Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;


function TCtrlSPED.SomaBaseCalculo: Double;
begin
  Result := 0;
  FcdsAnalitico.DisableControls;
  FcdsAnalitico.First;
  While Not FcdsAnalitico.Eof Do
  Begin
    Result := Result + FcdsAnalitico.FieldByName('TOTAL').AsCurrency;

    FcdsAnalitico.Next;
  End;
  FcdsAnalitico.First;
  FcdsAnalitico.EnableControls;
end;

function TCtrlSPED.GeraLinha0000(sTipoArq, sRecibo, sPeriodo, sExercicio : string; var NumLin : integer): string;
var
  sLinha, sUltDia : string;
  sVersao: string;  //Cássio Rovaroto - SIG nº 88842
  dDataInicio: TDateTime;  //Cássio Rovaroto - SIG nº 88842
begin
  sUltDia := IntToStr(FU.TrazUltDiaMes(StrToInt(sPeriodo), StrToInt(sExercicio))); // ultimo dia de um mes/ano
  dDataInicio := StrToDate('01/' + sPeriodo + '/' + sExercicio);   //Cássio Rovaroto - SIG nº 88842
  sVersao := RetornaVersaoEFD(dDataInicio);      //Cássio Rovaroto - SIG nº 88842


  sLinha := '|0000|' +                                                           // identificador linha: fixo 000
                        //Cássio Rovaroto -  SIG nº 84511 - Início
            // Alterado por FHBS - 06/08/2018 - SIG73038
            //'004|' +                                                            // codigo da versão: fixo 004
            //'005|' +                                                              // codigo da versão atual: fixo 005
            // Fim Alterado por FHBS - 06/08/2018 - SIG73038
            //Cássio Rovaroto -  SIG nº 84511 - Fim
            sVersao + '|' +                                                     //Cássio Rovaroto - SIG nº 88842
            FU.IFF(sTipoArq='N','0','1')+'|'+                                   // tipo de escrituracao
            '0|' +                                                              // situacao especial: 0 - abertura
            FU.IFF(sTipoArq='N', '', PreencheZeros(sRecibo , 41))+'|'+          // no. do recibo anterior para retificadora
            '01'+sPeriodo+sExercicio+'|'+                                       // data inicial do periodo/exercicio
            sUltDia+sPeriodo+sExercicio+'|'+                                    // data final do periodo/exercicio
            FcdsEfdDetalhe.FieldByName('RAZAOSOCIAL').AsString+'|'+             // razao social
            TiraCaracteres(FcdsEfdDetalhe.FieldByName('CNPJPESJUR').AsString, '.- ')+'|'+   // CNPJ
            FcdsEfdDetalhe.FieldByName('UF').AsString+'|'+                      // Estado
            PreencheZeros(FcdsEfdDetalhe.FieldByName('CODIBGE').AsString,7)+'|'+  // Codigo IBGE do municipio
            '|'+                                                                // codigo suframa: nulo
            FcdsEfdDetalhe.FieldByName('CODQUALIPESJUR').AsString+'|'+          // Natureza da Pessoa Juridica
            FcdsEfdDetalhe.FieldByName('CODATIVIDADE').AsString+'|';            // Atividade preponderante
            //#13+#10;                                                            // fim da linha
  NumLin := 1;
  Result := sLinha;
end;


function TCtrlSPED.GeraLinha0100(var NumLin : integer): string;
var
  sLinha : string;
begin
  sLinha := '|0100|' +                                                                            // identificador linha: fixo 0100
            Trim(FcdsEfdDetalhe.FieldByName('CONTADOR').AsString)+'|'+                            // nome contador
            TiraCaracteres(FcdsEfdDetalhe.FieldByName('CPF_CONTADOR').AsString, '.- ')+'|'+       // CPF contador
            Trim(PreencheZeros(FcdsEfdDetalhe.FieldByName('CRC').AsString,15))+'|'+                                 // CRC contador
            '|'+                                                                                  // CNPJ escritorio contabilidade
            PreencheZeros(TiraCaracteres(FcdsEfdDetalhe.FieldByName('CEP').AsString, '- '),8)+'|'+// CEP do endereço informado
            Trim(FcdsEfdDetalhe.FieldByName('ENDERECO').AsString)+'|'+                            // endereço informado
            Trim(FcdsEfdDetalhe.FieldByName('NUMERO').AsString)+'|'+                              // numero do endereço informado
            Trim(FcdsEfdDetalhe.FieldByName('COMPLEMENTO').AsString)+'|'+                         // compl do endereço informado
            Trim(FcdsEfdDetalhe.FieldByName('BAIRRO').AsString)+'|'+                              // bairro do endereço informado
            PreencheZeros(TiraCaracteres(FcdsEfdDetalhe.FieldByName('TELEFONE').AsString, '-  '),10)+'|'+          // telefone de contato
            '|'+                                                                                  // fax
            Trim(FcdsEfdDetalhe.FieldByName('EMAIL').AsString)+'|'+                               // email de contato
            Trim(PreencheZeros(FcdsEfdDetalhe.FieldByName('CODIBGE').AsString,7))+'|';                             // codigo municipio ibge
            //#13+#10;                                                                            // fim da linha
  NumLin := 1;
  Result := sLinha;
end;

function TCtrlSPED.GeraLinha0110(var NumLin : integer): string;
var
  sLinha : string;
begin
  sLinha := '|0110|' +                                                          // identificador linha: fixo 0110
            Trim(FcdsEfdDetalhe.FieldByName('CODINCIDTRIB').AsString)+'|'+      // incidencia tributaria
            Trim(FcdsEfdDetalhe.FieldByName('CODAPROPCRED').AsString)+'|'+      // apropriacao de credito
            Trim(FcdsEfdDetalhe.FieldByName('CODCONTRIBAPUR').AsString)+'|'+    // tipo contrib apurada
            Trim(FcdsEfdDetalhe.FieldByName('CODCRITESCRIT').AsString)+'|';     // tipo escrituracao
            //#13+#10;                                                          // fim da linha

  NumLin := 1;
  Result := sLinha;
end;

function TCtrlSPED.GeraLinhaFimBloco(sIdBloco, sNumLinhas: string): string;
var
  sLinha : string;
begin
  sLinha := sIdBloco+'|' +                                                      // identificador linha: fixo
            sNumLinhas+'|';                                                     // quantidade de linhas do blocos iniciado por xxx (inclusive este)
            //#13+#10;                                                            // fim da linha

  Result := sLinha;
end;


function TCtrlSPED.GeraLinhaFimBloco(sIdBloco, sNumLinhas: string; var NumLin : integer): string;
var
  sLinha : string;
begin
  sLinha := GeraLinhaFimBloco(sIdBloco, sNumLinhas);

  NumLin := 1;
  Result := sLinha;
end;

procedure TCtrlSPED.GeraBlocoVazio(var Arquivo : TStringList; sIdBlocoAbre, sIdBlocoFecha, sCodMovimento : string);
var
  c, ind : byte;
  sLinha : string;
begin

  for c := 1 to 2 do
  begin
    case c of
      1 : sLinha := GeraLinhaBlocoReplicaValor(sIdBlocoAbre, sCodMovimento, 1);
      2 : sLinha := GeraLinhaFimBloco(sIdBlocoFecha, '2');
    end;
    Arquivo.Add( sLinha );

    // guarda bloco e no. de linhas do bloco
    SetLinhasEFD(copy(sLinha, 2,4), 1);
  end;

end;

function TCtrlSPED.GeraLinhaBlocoReplicaValor(sIdBloco, sValor: string; iNumPipes: integer): string;
var
  sLinha : string;
begin
  sLinha := sIdBloco+'|' +                                                      // identificador linha: fixo
            FU.Replicate(sValor+'|', iNumPipes);                                // quantidade de dados
            //#13+#10;                                                            // fim da linha

  Result := sLinha;
end;

function TCtrlSPED.GeraLinhaBlocoReplicaValor(sIdBloco, sValor: string; iNumPipes: integer; var NumLin : integer): string;
var
  sLinha : string;
begin
  sLinha := GeraLinhaBlocoReplicaValor(sIdBloco, sValor, iNumPipes);

  NumLin := 1;
  Result := sLinha;
end;

//Início - William Santana SOL 155850-15363 KIN 2051763
function TCtrlSPED.GeraLinhaBlocoI100(var Arquivo : TStringList; var NumLin: integer): string;
var
  sLinha, sTipo : string;
  ind    : byte;
  rPis, rCofins : double;
  VlrRec, VlrGeral, VlrEspec : currency;
  VlrBase, VlrPis, VlrCofins : currency;
  iNunLinhasBlocoI : Integer;
begin
  GetAliquotaImpostos( rPis, rCofins );
  CalculaTotais(VlrRec, vlrGeral, vlrEspec);

  //Cássio Rovaroto - SIG nº 81493 - Início
  //VlrBase   := vlrRec - (vlrGeral + vlrEspec);
  VlrBase   := vlrRec - abs((vlrGeral + vlrEspec));
  //Cássio Rovaroto - SIG nº 81493 - Fim  
  VlrPis    := VlrBase * (rPis/100);
  VlrCofins := VlrBase * (rCofins/100);
  iNunLinhasBlocoI := 0;
 // for ind := 1 to 3 do
  begin
    sLinha := '|I100|' +                                                        // identificador linha: fixo I100
              FormatFloat('#0.00',abs(VlrRec))+'|'+                             // total fat / receita bruta
              Trim(FcdsEfdDetalhe.FieldByName('CODSITTRIB').AsString)+'|'+      // cod situacao tributaria
              FormatFloat('#0.00',abs(VlrGeral))+'|'+                           // total deducoes/exclusoes carater geral
              FormatFloat('#0.00',abs(VlrEspec))+'|'+                           // total deducoes/exclusoes carater especifico
              FormatFloat('#0.00',abs(VlrBase))+'|'+                            // base calculo PIS
              FormatFloat('#0.00',abs(rPis))+'|'+                               // aliquota PIS
              FormatFloat('#0.00',abs(vlrPis))+'|'+                             // valor PIS
              FormatFloat('#0.00',abs(VlrBase))+'|'+                            // base calculo COFINS
              FormatFloat('#0.00',abs(rCofins))+'|'+                            // aliquota COFINS
              FormatFloat('#0.00',abs(vlrCofins))+'|'+                          // valor COFINS
              'Apuração PIS e COFINS|';                                         // informação complementar
              //#13+#10;                                                        // fim da linha

    iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    arquivo.Add(sLinha);
    SetLinhasEFD(copy(sLinha, 2,4), 1);

    //Wylliam Leite da Silva - SOL: 244831 PPM: 834433 - Início
    sLinha := GeraLinhaProcesso('|I199', NumLin);

    arquivo.Add(sLinha);

    // insere detalhes dos tipos: 02 - receita / 04 - deducao geral / 05 - deducao especif
     GeraLinhaBlocoI200(Arquivo, NumLin);

     iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    //Wylliam Leite da Silva - SOL: 244831 PPM: 834433 - Fim

    SetLinhasEFD(copy(sLinha, 2,4), 1);

  end;
  Result := '';
  NumLin := iNunLinhasBlocoI;
end;


function TCtrlSPED.GeraLinhaBlocoI200(var arquivo : TStringList; var NumLin: integer): string;
var
  sLinha, sTipo, sIdLinha, sCodLinha: string;
  fValTot: double;
  contapaizerada : boolean;  //William Santana - SOL 230351 PPM 352242
begin

 // AplicaRemoveFiltro(FcdsSintetico, 'CARACTERISTICA = ''CONSOLIDADA''');
      sCodLinha := '';
  while not FcdsSintetico.eof do
  begin

    if sCodLinha = FcdsSintetico.FieldByName('SUBS_COD_LINHA').AsString then
    begin
       FcdsSintetico.next;
       continue;
    end;

    //Início - William Santana - SOL 230351 PPM 352242
     contapaizerada := false;
    if (FcdsSintetico.FieldByName('VALOR').AsFloat = 0) then
      contapaizerada:= VerificaContaZerada(FcdsAnalitico, FcdsSintetico.FieldByName('COD_LINHA').AsString);

    if not(contapaizerada) then
    begin
    //Término - William Santana - SOL 230351 PPM 352242
      sTipo     := FcdsSintetico.FieldByName('IDCAMPO').AsString ;
      sIdLinha  := FcdsSintetico.FieldByName('IDLINHA').AsString ;
      sCodLinha := FcdsSintetico.FieldByName('SUBS_COD_LINHA').AsString ;
      fValTot   := calculaValTot(fValTot, sTipo, sCodLinha);

      sLinha := '|I200|' +                                                             // identificador linha: fixo I200
                 sTipo+'|'+                                                            // valor: 02 - receita / 04 - deducao geral / 05 - deducao especif
                 sCodLinha+'|'+                                                        // codigo de detalhamento: ex - R0402, D0399
                 FormatFloat('#0.00',abs(fValTot))+'|'                               // valor referente ao codigo de detalhamento
                 +'|'                                                                  // conta contábil
                 +'|';                                                                 // descrição grupo contábil

      NumLin := NumLin +1;
      arquivo.Add(sLinha);
      SetLinhasEFD(copy(sLinha, 2,4), 1);
      GeraLinhaBlocoI300(Arquivo, NumLin , sTipo, sCodLinha );
    end; 
    FcdsSintetico.next;
  end;
  Result := '';
end;


function TCtrlSPED.calculaValTot(var Valor: double; sTipo , sCodLinha: string): double;
begin

  AplicaRemoveFiltro(FcdsSintetico2, 'CARACTERISTICA = ''ANALÍTICA'' AND IDCAMPO = '+sTipo
                                    +' AND SUBS_COD_LINHA = ' + quotedstr(sCodLinha));
  Valor := 0;
  while not FcdsSintetico2.eof do
  begin
    
    Valor := Valor + FcdsSintetico2.FieldByName('VALOR').AsFloat;

    FcdsSintetico2.next;
  end;
  result := Valor;
end;


function TCtrlSPED.GeraLinhaBlocoI300(var arquivo : TStringList; var NumLin: integer; sTipo, sCodLinha :string): string;
var
  sLinha , sIdlinha: string;
  contazerada : boolean;
begin
  AplicaRemoveFiltro(FcdsSintetico2, 'CARACTERISTICA = ''ANALÍTICA'' AND IDCAMPO = '+sTipo
                                    +' AND SUBS_COD_LINHA = ' + quotedstr(sCodLinha));
  while not FcdsSintetico2.eof do
  begin
     contazerada := false;    

     if (FcdsSintetico2.FieldByName('VALOR').AsFloat = 0) then
      contazerada:= VerificaContaZerada(FcdsAnalitico, FcdsSintetico2.FieldByName('COD_LINHA').AsString);

     if not contazerada then
     begin
       sIdLinha := FcdsSintetico2.FieldByName('IDLINHA').AsString  ;

//Darivaldo Alencar SIG52031 -inicio
//       sLinha := '|I300|' +                                                                // identificador linha: fixo I200
//                FcdsSintetico2.FieldByName('COD_LINHA').AsString+'|'+                      // codigo de detalhamento: ex - R0402, D0399
//                FormatFloat('#0.00',abs(FcdsSintetico2.FieldByName('VALOR').AsFloat))+'|'+ // valor referente ao codigo de detalhamento
//                Trim(ContasContabeisRelacionadas(sIdLinha, 'conta'))+'|'+                  // conta contábil
//                Trim(copy(ContasContabeisRelacionadas(sIdLinha, 'desc'), 1,51))+'|';       // descrição grupo contábil
         sLinha := ContasContabeisRelacionadas(sIdLinha, 'desc');
//         NumLin := NumLin +1;
         NumLin := NumLin + iLinha300;
//Darivaldo Alencar SIG52031 -fim

       arquivo.Add(sLinha);
       //SetLinhasEFD(copy(sLinha, 2,4), 1);
       SetLinhasEFD(copy(sLinha, 2,4), iLinha300); //Darivaldo Alencar SIG52031

     end;
    FcdsSintetico2.next;
  end;
  Result := sLinha;
  
end;

{
function TCtrlSPED.GeraLinhaBlocoI100(var Arquivo : TStringList; var NumLin: integer): string;
var
  sLinha, sTipo : string;
  ind    : byte;
  rPis, rCofins : double;
  VlrRec, VlrGeral, VlrEspec : currency;
  VlrBase, VlrPis, VlrCofins : currency;
begin
  GetAliquotaImpostos( rPis, rCofins );
  CalculaTotais(VlrRec, vlrGeral, vlrEspec);

  VlrBase   := vlrRec - (vlrGeral + vlrEspec);
  VlrPis    := VlrBase * (rPis/100);
  VlrCofins := VlrBase * (rCofins/100);

  for ind := 1 to 3 do
  begin
    sLinha := 'I100|' +                                                         // identificador linha: fixo I100
              FU.IFF(ind = 1, FormatFloat('#0.00',VlrRec), '0,00')+'|'+         // total fat / receita bruta
              Trim(FcdsEfdDetalhe.FieldByName('CODSITTRIB').AsString)+'|'+      // cod situacao tributaria
              FU.IFF(ind = 2, FormatFloat('#0.00',VlrGeral), '0,00')+'|'+       // total deducoes/exclusoes carater geral
              FU.IFF(ind = 3, FormatFloat('#0.00',VlrEspec), '0,00')+'|'+       // total deducoes/exclusoes carater especifico
              FormatFloat('#0.00',VlrBase)+'|'+                                 // base calculo PIS
              FormatFloat('#0.00',rPis)+'|'+                                    // aliquota PIS
              FormatFloat('#0.00',vlrPis)+'|'+                                  // valor PIS
              FormatFloat('#0.00',VlrBase)+'|'+                                 // base calculo COFINS
              FormatFloat('#0.00',rCofins)+'|'+                                 // aliquota COFINS
              FormatFloat('#0.00',vlrCofins)+'|'+                               // valor COFINS
              'Apuração PIS e COFINS|';                                         // informação complementar
              //#13+#10;                                                          // fim da linha

    arquivo.Add(sLinha);
    SetLinhasEFD(copy(sLinha, 1,4), 1);

    sTipo := FU.IFF(ind = 1, '02', FU.IFF(ind = 2, '04', '05'));

    // insere detalhes dos tipos: 02 - receita / 04 - deducao geral / 05 - deducao especif
    GeraLinhaBlocoI200(Arquivo, NumLin, sTipo);

    // lanca processo I299
    sLinha := GeraLinhaProcesso('I299', NumLin);
    arquivo.Add(sLinha);
    SetLinhasEFD(copy(sLinha, 1,4), 1);

    // insere detalhes dos tipos: 02 - receita / 04 - deducao geral / 05 - deducao especif
    GeraLinhaBlocoI300(Arquivo, NumLin, sTipo);

    // lanca processo  I399
    sLinha := GeraLinhaProcesso('I399', NumLin);
    arquivo.Add(sLinha);
    SetLinhasEFD(copy(sLinha, 1,4), 1);

  end;
  //NumLin := 0;
  Result := '';

end;

function TCtrlSPED.GeraLinhaBlocoI200(var arquivo : TStringList; var NumLin: integer; sTipo : string): string;
var
  sLinha : string;
begin
  AplicaRemoveFiltro(FcdsSintetico, 'CARACTERISTICA = ''CONSOLIDADA'' AND IDCAMPO = '+sTipo);

  while not FcdsSintetico.eof do
  begin
    AplicaRemoveFiltro(FcdsAnalitico, 'CATEGORIA = '+Quotedstr(FcdsSintetico.FieldByName('CATEGORIA').AsString));
    while not FcdsAnalitico.eof do
    begin
      sLinha := 'I200|' +                                                       // identificador linha: fixo I200
                sTipo+'|'+                                                      // valor: 02 - receita / 04 - deducao geral / 05 - deducao especif
                FcdsSintetico.FieldByName('COD_LINHA').AsString+'|'+            // codigo de detalhamento: ex - R0402, D0399
                FormatFloat('#0.00',FcdsSintetico.FieldByName('VALOR').AsFloat)+'|'+   // valor referente ao codigo de detalhamento
                Trim(FcdsAnalitico.FieldByName('PLACONTA').AsString)+'|'+       // conta contábil
                Trim(FcdsAnalitico.FieldByName('PLANOME').AsString)+'|';        // descrição conta contábil
              //#13+#10;                                                        // fim da linha

      NumLin := NumLin +1;

      arquivo.Add(sLinha);
      SetLinhasEFD(copy(sLinha, 1,4), 1);

      FcdsAnalitico.next;
    end;
    FcdsSintetico.next;
  end;
  Result := sLinha;
end;


function TCtrlSPED.GeraLinhaBlocoI300(var arquivo : TStringList; var NumLin: integer; sTipo : string): string;
var
  sLinha : string;
begin
  AplicaRemoveFiltro(FcdsSintetico, 'CARACTERISTICA = ''ANALÍTICA'' AND IDCAMPO = '+sTipo);

  while not FcdsSintetico.eof do
  begin
    AplicaRemoveFiltro(FcdsAnalitico, 'CATEGORIA = '+Quotedstr(FcdsSintetico.FieldByName('CATEGORIA').AsString));
    while not FcdsAnalitico.eof do
    begin
      sLinha := 'I300|' +                                                       // identificador linha: fixo I200
                sTipo+'|'+                                                      // valor: 02 - receita / 04 - deducao geral / 05 - deducao especif
                FcdsSintetico.FieldByName('COD_LINHA').AsString+'|'+            // codigo de detalhamento: ex - R0402, D0399
                FormatFloat('#0.00',FcdsSintetico.FieldByName('VALOR').AsFloat)+'|'+   // valor referente ao codigo de detalhamento
                Trim(FcdsAnalitico.FieldByName('PLACONTA').AsString)+'|'+       // conta contábil
                Trim(FcdsAnalitico.FieldByName('PLANOME').AsString)+'|';        // descrição conta contábil
              //#13+#10;                                                        // fim da linha

      NumLin := NumLin +1;

      arquivo.Add(sLinha);
      SetLinhasEFD(copy(sLinha, 1,4), 1);

      FcdsAnalitico.next;
    end;
    FcdsSintetico.next;
  end;
  Result := sLinha;

end;
      }

//Término - William Santana SOL 155850-15363 KIN 2051763

function TCtrlSPED.GeraBloco1010(var NumLin: integer): string;
var
  sLinha : string;
begin
  if FcdsEfdDetalhe.FieldByName('NATUREZAACAO').AsString <> '' then
  begin
   
      sLinha := '|1010|'+                                                         // identificador linha
              PreencheZeros(Trim(FcdsEfdDetalhe.FieldByName('NUMPROCJUD').AsString),20)+'|'+      // Identificação do processo
              Trim(FcdsEfdDetalhe.FieldByName('SECAOJUD').AsString)+'|'+        // Identificação da seção judiciaria
              FcdsEfdDetalhe.FieldByName('VARA').AsString+'|'+                  // Identificação da vara
              FcdsEfdDetalhe.FieldByName('NATUREZAACAO').AsString+'|'+          // natureza da acao
              FcdsEfdDetalhe.FieldByName('DESCRICAOJUD').AsString +'|'+          // descricao da sentença
              FormatDateTime('DDMMYYYY', FcdsEfdDetalhe.FieldByName('DATASENTENCA').AsDateTime)+'|';  // data da sentença

    NumLin := 1;
    result := sLinha;
  end
  else
  begin
    NumLin := 0;
    result := '';
  end;
end;

function TCtrlSPED.GeraLinhaProcesso(sIdBloco : string; var NumLin : integer) : string;
var
  sLinha : string;
begin
  if (Trim(FcdsEfdDetalhe.FieldByName('NUMPROCESSO').AsString) <> '') and
     (Trim(FcdsEfdDetalhe.FieldByName('CODORIGEMPROCESSO').AsString) <> '') then
  begin
    sLinha := sIdBloco+'|' +                                                        // identificador linha
              PreencheZeros(Trim(FcdsEfdDetalhe.FieldByName('NUMPROCESSO').AsString),20)+'|'+  // Identificação do processo ou ato concessório
              Trim(FcdsEfdDetalhe.FieldByName('CODORIGEMPROCESSO').AsString)+'|';              // origem do processo:

    NumLin := 1;
  end
  else
  begin
    sLinha := sIdBloco+'|||';
    NumLin := 0;
  end;
  Result := sLinha;
end;

procedure TCtrlSPED.SetLinhasEFD(sBloco: string; iQtde: integer);
var
  ind : integer;
begin
  ind := FLinhasEFD.IndexOfLinha(sBloco);
  if ind = -1 then
     FLinhasEFD.AdicionarValores(sBloco, iQtde)
  else
     FLinhasEFD[ind].AtualizarValores(iQtde);
end;

function TCtrlSPED.GetNumeroRelatorio: integer;
begin
  result := FDbRelatorio.GetNumero();
end;

procedure TCtrlSPED.GetAliquotaImpostos(var pPIS, pCOFINS: double);
begin
  _sSQL.clear;
  _sSQL.Add('SELECT C.MOECODIGO, M.MOESIGLA /*M.MOEDESC*/, C.COTVALOR ');
  _sSQL.Add('  FROM MOEDA M, COTACAOMOEDA C            ');
  _sSQL.Add(' WHERE C.MOECODIGO = M.MOECODIGO          ');
  _sSQL.Add('   AND (TRIM(M.MOESIGLA) = ''COFINS'' OR TRIM(M.MOESIGLA) = ''PIS'')');
//  _sSQL.Add('   AND (COTDATAFIM IS NULL or COTDATAFIM = TO_DATE(''30/12/1899'',''DD/MM/YYYY''))');

  CdsAux.data := GetDataPacket( _sSQL.GetText );

  while not CdsAux.eof do
  begin
    if CdsAux.Fields[1].AsString = 'COFINS' then
       pCOFINS := CdsAux.Fields[2].AsFloat
    else if CdsAux.Fields[1].AsString = 'PIS' then
       pPIS := CdsAux.Fields[2].AsFloat;

    CdsAux.next;
  end;
end;

function TCtrlSPED.PreencheDadosAnaliticos(pExercicio, pPeriodo, pNorma: integer): OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('SELECT  0 IDLINHASPED, ');
  _sSQL.Add('   LR.COD_LINHA, PC.PLACONTA,   ');   //William Santana SOL 155850-15363 KIN 2051763
  _sSQL.Add('       0 IDRELATORIODADOS, ');
  _sSQL.Add('       LXC.IDASSOCIACAO,    ');
  _sSQL.Add('       LXC.IDLINHA,         ');
  _sSQL.Add('       LXC.PLACONTA,        ');
  _sSQL.Add('       PC.PLANOME,          ');
  _sSQL.Add('       DECODE(LENGTH(TRIM(LXC.PLACONTA)), 2, ''S'', 3, ''S'', ''A'') FLGTIPO, ');
  _sSQL.Add('       DECODE(TC.DESCRICAOCATEGORIA, ''ESPECÍFICO'', ''DEDUÇÃO'', TC.DESCRICAOCATEGORIA)  AS CATEGORIA, '); // Alterado por Felipe A. Santos SOL 244830/17209 PPM 796205
  _sSQL.Add('       NA.DESCRICAO AS NATUREZA, ');
  //Início - William Santana SOL 155850-15363 KIN 2051763
//  _sSQL.Add('       PS.VLRCREDITO,       ');
//  _sSQL.Add('       PS.VLRDEBITO,        ');
//  _sSQL.Add('       DECODE(NA.DESCRICAO, ''POSITIVA'', ABS(PS.TOTAL), ');
//  _sSQL.Add('                            DECODE(SIGN(PS.TOTAL), 1, PS.TOTAL*-1, PS.TOTAL)) AS TOTAL ');
//Cássio Rovaroto - SIG nº 72274 - Início
  //_sSQL.Add('   NVL(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.VLRCREDITO,2,PS2.VLRCREDITO,PS3.VLRCREDITO),0) VLRCREDITO,               ');
  _sSQL.Add('   NVL(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.VLRCREDITO,2,PS2.VLRCREDITO,PS3.VLRCREDITO),0) VLRCREDITO, ');
  _sSQL.Add('   DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.VLRCREDITO,2,PS2.VLRCREDITO,PS3.VLRCREDITO),0), 0) VLRCREDITO_AJUSTE, ');
  //_sSQL.Add('   NVL(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.VLRDEBITO,2,PS2.VLRDEBITO,PS3.VLRDEBITO),0) VLRDEBITO,                   ');
  _sSQL.Add('   NVL(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.VLRDEBITO,2,PS2.VLRDEBITO,PS3.VLRDEBITO),0) VLRDEBITO, ');
  _sSQL.Add('   DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.VLRDEBITO,2,PS2.VLRDEBITO,PS3.VLRDEBITO),0), 0) VLRDEBITO_AJUSTE, ');
 // _sSQL.Add('   NVL(DECODE(LXC.PLANATUREZA,''D'', DECODE(LR.TIPOCONTABILIZACAO,1,-ABS(PS1.TOTAL),2, -ABS(PS2.TOTAL),-ABS(PS3.TOTAL)),');  // William Santana - SOL 230351 PPM 352242
 // _sSQL.Add('                              ''C'', DECODE(LR.TIPOCONTABILIZACAO,1,ABS(PS1.TOTAL),2, ABS(PS2.TOTAL), ABS(PS3.TOTAL)), ');
 // _sSQL.Add('                                     DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL)),0) TOTAL       ');
 //Início - William Santana - SOL 233374 PPM 413667
 // _sSQL.Add('    NVL(DECODE( LR.IDNATUREZA,2,-(DECODE(LXC.PLANATUREZA,''D'', DECODE(LR.TIPOCONTABILIZACAO,1,-ABS(PS1.TOTAL),2, -ABS(PS2.TOTAL), -ABS(PS3.TOTAL)), ');
//  _sSQL.Add('                           ''C'', DECODE(LR.TIPOCONTABILIZACAO,1,abs(PS1.TOTAL),2, abs(PS2.TOTAL), abs(PS3.TOTAL)),                                 ');
//  _sSQL.Add('                                DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))),                                                ');
//  _sSQL.Add('      (DECODE(LXC.PLANATUREZA,''D'', DECODE(LR.TIPOCONTABILIZACAO,1,-ABS(PS1.TOTAL),2, -ABS(PS2.TOTAL), -ABS(PS3.TOTAL)),                          ');
//  _sSQL.Add('                           ''C'', DECODE(LR.TIPOCONTABILIZACAO,1,abs(PS1.TOTAL),2, abs(PS2.TOTAL), abs(PS3.TOTAL)),                                ');
//  _sSQL.Add('                                DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))))                                               ');
//  _sSQL.Add('                             ,0) TOTAL                                                                     ');

//  _sSQL.Add('   NVL(DECODE(LR.IDNATUREZA,2,-(ABS(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))),     ');
//  _sSQL.Add('      (DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))),0) TOTAL,                          ');
  _sSQL.Add('   NVL(DECODE(LR.IDNATUREZA,2,-(ABS(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))), ');
  _sSQL.Add('         (DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))), 0) TOTAL, ');
  _sSQL.Add('   DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.IDNATUREZA,2,-(ABS(DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))), ');
  _sSQL.Add('         (DECODE(LR.TIPOCONTABILIZACAO,1,PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))),0), 0) TOTAL_AJUSTE, ');
//Cássio Rovaroto - SIG nº 72274 - Fim
 //Término - William Santana - SOL 233374 PPM 413667
 //Término - William Santana - SOL 230351 PPM 352242
  _sSQL.Add('   DECODE(TC.DESCRICAOCATEGORIA, ''RECEITA'', 1, ''ESPECÍFICO'', 2, 3) AS ORDEM '); // Felipe A. Santos SOL 244830/17209 PPM 796205
  _sSQL.Add('  FROM TIPODECATEGORIA TC, LINHAXCONTACONTABIL LXC, PLANOCONTA PC, LINHA_RELATORIO LR, NATUREZA_LINHA NA,');
  _sSQL.Add('       (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO, ');
  _sSQL.Add('               SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,             ');
  _sSQL.Add('               SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                  ');
  _sSQL.Add('               SUM(P.PLSCREDITOCOR-P.PLSDEBITOCORRENTE) AS TOTAL   ');
  _sSQL.Add('          FROM PLANOSALDO P                                        ');
  _sSQL.Add('         WHERE P.IDPLANOPREV IN (SELECT IDPLANOPREV                ');
  _sSQL.Add('                                FROM PLANPREVCONTABIL              ');
  _sSQL.Add('                                WHERE ATIVO = ''S''                ');
  _sSQL.Add('                                AND IDPLANOPREV <> 110)            ');
  _sSQL.Add('           AND P.PEREXERCICIO = '+IntToStr(pExercicio)             );
  _sSQL.Add('           AND P.PERNUMERO = '+IntToStr(pPeriodo)                  );
  _sSQL.Add('         GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO ');
  _sSQL.Add('       ) PS1 ,                                                       ');
   _sSQL.Add('       (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO, ');
  _sSQL.Add('               SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,             ');
  _sSQL.Add('               SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                  ');
  _sSQL.Add('               SUM(P.PLSCREDITOCOR-P.PLSDEBITOCORRENTE) AS TOTAL   ');
  _sSQL.Add('          FROM PLANOSALDO P                                        ');
  _sSQL.Add('         WHERE P.IDPLANOPREV = 110                                 ');
  _sSQL.Add('           AND P.PEREXERCICIO = '+IntToStr(pExercicio)              );
  _sSQL.Add('           AND P.PERNUMERO = '+IntToStr(pPeriodo)                  );
  _sSQL.Add('         GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO ');
  _sSQL.Add('       ) PS2,                                                        ');
  _sSQL.Add('       (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO, ');
  _sSQL.Add('               SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,             ');
  _sSQL.Add('               SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                  ');
  _sSQL.Add('               SUM(P.PLSCREDITOCOR-P.PLSDEBITOCORRENTE) AS TOTAL   ');
  _sSQL.Add('          FROM PLANOSALDO P                                        ');
  _sSQL.Add('         WHERE P.PEREXERCICIO = '+IntToStr(pExercicio) );
  _sSQL.Add('           AND P.PERNUMERO = '+IntToStr(pPeriodo)      );
  _sSQL.Add('         GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO ');
  _sSQL.Add('       ) PS3                                                        ');
  _sSQL.Add(' WHERE TC.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA                 ');
  _sSQL.Add('   AND ((TRIM(PS1.PLACONTA(+)) = TRIM(PC.PLACONTA))                ');
  _sSQL.Add('   AND  (PS1.PLANO(+) = PC.PLANO))                                 ');
  _sSQL.Add('   AND ((TRIM(PS2.PLACONTA(+)) = TRIM(PC.PLACONTA))                ');
  _sSQL.Add('   AND  (PS2.PLANO(+) = PC.PLANO))                                 ');
  _sSQL.Add('   AND ((TRIM(PS3.PLACONTA(+)) = TRIM(PC.PLACONTA))                ');
  _sSQL.Add('   AND  (PS3.PLANO(+) = PC.PLANO))                                 ');
  _sSQL.Add('   AND PC.PLACONTA = LXC.PLACONTA                                  ');
  _sSQL.Add('   AND PC.PLANO = LXC.PLANO                                        ');
  _sSQL.Add('   AND LR.IDNATUREZA = NA.IDNATUREZA                               ');
  _sSQL.Add('   AND LXC.IDLINHA = LR.IDLINHA                                    ');
  _sSQL.Add('   AND LR.IDNORMA = '+IntToStr(pNorma)                              );
  _sSQL.Add(' ORDER BY ORDEM, LR.COD_LINHA, PC.PLACONTA                         '); // Felipe A. Santos - SOL 244830/17209 PPM 796205 - Ordem
  //Término - William Santana SOL 155850-15363 KIN 2051763

  Result := GetDataPacket( _sSQL.GetText );

end;

function TCtrlSPED.PreencheDadosSinteticos(pExercicio, pPeriodo, pNorma: integer): OleVariant;
begin
  _sSQL.clear;
  _sSQL.Add('select lr.idlinha,      ');
  _sSQL.Add('       lr.cod_linha,    ');
  _sSQL.Add('       lr.descricao,    ');
  _sSQL.Add('       0.00 as valor,   ');
  _sSQL.Add('       0.00 as valorajust, ');//Cássio Rovaroto - SIG nº 72274
  _sSQL.Add('       tc.descricaocategoria AS CATEGORIA,');
  _sSQL.Add('       na.DESCRICAO as natureza, ');
  _sSQL.Add('       decode(tc.descricaocategoria, ''RECEITA'', ''02'',  ');
  _sSQL.Add('                                     ''GERAL'',   ''04'',''05'') AS IDCAMPO,  ');
  _sSQL.Add('       decode(TC.DESCRICAOCATEGORIA, ''RECEITA'', 1, ''ESPECÍFICO'', 2, 3) AS ORDEM '); // Felipe A. Santos SOL 244830/17209 PPM 796205
  //_sSQL.Add('       nvl(sum(lc.VLRCREDITO-lc.VLRDEBITO),0) valor ');
  _sSQL.Add('  from LINHA_RELATORIO lr, TIPODECATEGORIA tc, NATUREZA_LINHA na ');
{  _sSQL.Add('       (select lxc.idlinha,                   ');
  _sSQL.Add('               ps.VLRCREDITO,                 ');
  _sSQL.Add('               ps.VLRDEBITO                   ');
  _sSQL.Add('          from LINHAXCONTACONTABIL LXC,       ');
  _sSQL.Add('               (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, ');
  _sSQL.Add('                       SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,           ');
  _sSQL.Add('                       SUM(P.PLSCREDITOCOR) AS VLRDEBITO                 ');
  _sSQL.Add('                  FROM PLANOSALDO P                                      ');
  _sSQL.Add('                 WHERE P.PEREXERCICIO = '+IntToStr(pExercicio) );
  _sSQL.Add('                   AND P.PERNUMERO = '+IntToStr(pPeriodo)      );
  _sSQL.Add('                 GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO ');
  _sSQL.Add('               ) PS                                                        ');
  _sSQL.Add('         where lxc.placonta = ps.placonta                                  ');
  _sSQL.Add('       ) lc                                                                ');
  _sSQL.Add(' where lc.idlinha(+) = lr.idlinha                                          ');   }
  _sSQL.Add(' where TC.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA ');
  _sSQL.Add('   AND LR.IDNATUREZA = NA.IDNATUREZA               ');
  _sSQL.Add('   AND LR.IDNORMA = '+IntToStr(pNorma) );
{  _sSQL.Add(' group by lr.cod_linha,                            ');
  _sSQL.Add('          lc.idlinha,                              ');
  _sSQL.Add('          lr.descricao                             ');}
  _sSQL.Add(' order by ordem, lr.cod_linha                       '); // Felipe A. Santos SOL 244830/17209 PPM 796205 - Ordem

  Result := GetDataPacket( _sSQL.GetText );

end;

function TCtrlSPED.BuscaEndereco(iIdEndereco: integer): OleVariant;
begin
  _sSQL.Clear;
  _sSQL.Add('SELECT E.NOME      AS ENDERECO,    ');
  _sSQL.Add('       E.NUMERO    AS NUMERO,      ');
  _sSQL.Add('       '' ''       AS COMPLEMENTO, ');
  _sSQL.Add('       E.BAIRRO    AS BAIRRO,      ');
  _sSQL.Add('       E.CEP       AS CEP,         ');
  _sSQL.Add('       C.NOME      AS CIDADE,      ');
  _sSQL.Add('       E.CODESTADO AS UF,          ');
  _sSQL.Add('       E.IDENDERECO                ');
  _sSQL.add('  FROM ENDPESS E, TELENDPESS T, CIDADES C');
  _sSQL.add(' WHERE E.IDENDERECO = T.IDENDERECO       ');
  _sSQL.add('   AND C.IDCIDADES  = E.IDCIDADES ');
  _sSQL.add('   AND T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE)FROM TELENDPESS T1 WHERE T.IDENDERECO = T1.IDENDERECO)');
  _sSQL.add('   AND E.IDENDERECO = ' + IntToStr(iIdEndereco));

  Result := GetDataPacket( _sSQL.GetText );
end;


function TCtrlSPED.TiraCaracteres(sTexto, sCaracter: string): string;
var
  i : integer;
begin
  Result := sTexto;
  for i := 0 to length(sCaracter)-1 do
    result := FU.TrocaCaracter(result, sCaracter[i], '');  // TiraCaracter(result, sCaracter[i]);
end;


procedure TCtrlSPED.CalculaSaldoSintetico(sIdLinha : string);
var
  Dados : OleVariant;
  //sIdLinha : string;
  rVlrDeb, rVlrCred, rVlrTot, rVlrSaldo, rVlrSaldoAjust : extended; //currency;
  rTotLinha : currency;
begin
  FcdsAnalitico.DisableControls;
  FcdsSintetico.DisableControls;

  // filtrando apenas sinteticos
  Dados := FCdsSintetico.data; //FcdsAnalitico.Data;
  CdsAux.data := Dados;
  if sIdlinha <> '' then
     AplicaRemoveFiltro(CdsAux, 'IDLINHA = '+sIdLinha);
{     AplicaRemoveFiltro(CdsAux, 'FLGTIPO = ''S''  AND IDLINHA = '+sIdLinha)
  else
     AplicaRemoveFiltro(CdsAux, 'FLGTIPO = ''S'' ');
}
  sIdLinha := CdsAux.FieldByName('idlinha').AsString;
  while not CdsAux.eof do
  begin
    rVlrDeb  := 0;
    rVlrCred := 0;
    rVlrTot  := 0;
    rVlrSaldo := 0;
    rVlrSaldoAjust := 0;

    // filtra os analiticos
    AplicaRemoveFiltro(FcdsAnalitico, 'IDLINHA = '+CdsAux.FieldByName('idlinha').AsString {+' AND FLGTIPO = ''A'' '});
    if not FcdsAnalitico.eof then
    begin
      while not FcdsAnalitico.eof do
      begin
        //if copy(FcdsAnalitico.FieldByName('PLACONTA').AsString,1,2) = TRIM(CdsAux.FieldByName('PLACONTA').AsString) then
        //begin
          rVlrTot := rVlrTot + (FcdsAnalitico.FieldByName('TOTAL').AsCurrency);
          rVlrSaldoAjust := rVlrSaldoAjust + FcdsAnalitico.FieldByName('TOTAL_AJUSTE').AsCurrency; //Cássio Rovaroto - SIG nº 72274
          //rVlrCred := rVlrCred + FcdsAnalitico.FieldByName('VLRCREDITO').AsCurrency;
          //rVlrDeb  := rVlrDeb  + FcdsAnalitico.FieldByName('VLRDEBITO').AsCurrency;
        //end;
        FcdsAnalitico.next;
      end;
    {end
    else
    begin
      rVlrCred := CdsAux.FieldByName('VLRCREDITO').AsCurrency;
      rVlrDeb  := CdsAux.FieldByName('VLRDEBITO').AsCurrency;}
    end;

    {rVlrTot := rVlrCred - rVlrDeb;
    if CdsAux.FieldByName('NATUREZA').AsString = 'POSITIVA' then
       rVlrTot := Abs(rVlrTot)
    else if (CdsAux.FieldByName('TOTAL').AsCurrency > 0) then
       rVlrTot := (rVlrTot * -1);

    {CdsAux.Edit;
    CdsAux.FieldByName('VLRCREDITO').AsCurrency := rVlrCred;
    CdsAux.FieldByName('VLRDEBITO').AsCurrency  := rVlrDeb;
    CdsAux.FieldByName('TOTAL').AsCurrency      := rVlrTot;
    CdsAux.Post;    }

    CdsAux.next;

    //if (not CdsAux.Eof) and (sIdLinha = CdsAux.FieldByName('idlinha').AsString) then
    //   rTotLinha := rTotLinha + {(rVlrCred - rVlrDeb)} rVlrTot
    //else
    if (CdsAux.Eof) or (sIdLinha <> CdsAux.FieldByName('idlinha').AsString) then
    begin
      rTotLinha := {(rVlrCred - rVlrDeb)} rVlrTot;

      if FcdsSintetico.locate('IDLINHA', sIdLinha, []) then
      begin
        FcdsSintetico.Edit;
        FcdsSintetico.FieldByName('VALOR').AsCurrency := rTotLinha;
        FcdsSintetico.FieldByName('VALORAJUST').AsCurrency := rVlrSaldoAjust; //Cássio Rovaroto - SIG nº 72274 - Início
        FcdsSintetico.Post;
      end;
      if not cdsAux.Eof then
         sIdLinha := CdsAux.FieldByName('idlinha').AsString;
    end;
  end;

   {
  // preenche o valor dos sinteticos
  if sIdlinha <> '' then
     AplicaRemoveFiltro(FcdsAnalitico, 'FLGTIPO = ''S''  AND IDLINHA = '+sIdLinha)
  else
     AplicaRemoveFiltro(FcdsAnalitico, 'FLGTIPO = ''S'' ');
  cdsAux.first;
  while not cdsAux.eof do
  begin
    if cdsAnalitico.Locate('IDLINHA', cdsAux.FieldByName('IDLINHA').AsString, []) then
    begin
      cdsAnalitico.Edit;
      cdsAnalitico.FieldByName('VLRCREDITO').AsCurrency  := cdsAux.FieldByName('VLRCREDITO').AsCurrency ;
      cdsAnalitico.FieldByName('VLRDEBITO').AsCurrency   := cdsAux.FieldByName('VLRDEBITO').AsCurrency ;
      cdsAnalitico.FieldByName('TOTAL').AsCurrency       := cdsAux.FieldByName('TOTAL').AsCurrency ;
      cdsAnalitico.Post;
    end;

    cdsAux.next;
  end;
  }
  AplicaRemoveFiltro(FcdsAnalitico, '');
  AplicaRemoveFiltro(CdsAux, '');

  FcdsAnalitico.SaveToFile('c:\planus\temp\teste.xml', dfxml);

  FcdsSintetico.EnableControls;
  FcdsAnalitico.EnableControls;
end;

procedure TCtrlSPED.SetcdsSintetico(const Value: TClientDataSet);
begin
  FcdsSintetico := Value;
end;

procedure TCtrlSPED.CalculaTotais(var rReceita, rGeral, rEspecifico: Currency; bExcluiAjuste: Boolean);
var
  ind : byte;
  sFiltro : string;
  rValor  : currency;
begin
  FcdsSintetico.DisableControls;

  for ind := 1 to 3 do
  begin
    rValor := 0;
    case ind of
      1 : sFiltro := 'CATEGORIA = ''RECEITA''';
      2 : sFiltro := 'CATEGORIA = ''GERAL''';
      3 : sFiltro := 'CATEGORIA = ''ESPECÍFICO''';
    end;
    AplicaRemoveFiltro(FcdsSintetico, sFiltro);

    while not FcdsSintetico.Eof do
    begin
      if bExcluiAjuste then
        rValor := rValor + FcdsSintetico.FieldByName('VALOR').AsCurrency
      else
        rValor := rValor + (FcdsSintetico.FieldByName('VALOR').AsCurrency - Abs(FcdsSintetico.FieldByName('VALORAJUST').AsCurrency));
      FcdsSintetico.Next;
    end;

    case ind of
      1 : rReceita    := rValor;
      2 : rGeral      := rValor;
      3 : rEspecifico := rValor;
    end;

  end;

  AplicaRemoveFiltro(FcdsSintetico, '');
  FcdsSintetico.EnableControls;
end;

procedure TCtrlSPED.CalculaValorBase(var vlrBase: currency);
var
  vlrRec, vlrEspec, vlrGeral : currency;
begin
  CalculaTotais(vlrRec, vlrGeral, vlrEspec);
  vlrBase := vlrRec - ABS(vlrGeral + vlrEspec);
  vlrBase := ABS(vlrBase);
end;

procedure TCtrlSPED.AplicaRemoveFiltro(_cdsFiltro: TClientDataSet; sFiltro: string);
begin
  _cdsFiltro.Filtered := false;
  _cdsFiltro.Filter   := sFiltro;

  if sFiltro <> '' then
    _cdsFiltro.Filtered := true;

end;

//Início - William Santana SOL 155850-15363 KIN 2051763

function TCtrlSPED.Geralinha0140( var NumLin: integer ) : string ;
var
   sLinha : string;
begin
   sLinha := '|0140||FUNDAÇÃO DOS ECONOMIARIOS FEDERAIS - FUNCEF|00436923000190|DF||5300108|||' ;

   NumLin := 1;
   
   result := sLinha;  
end;


function TCtrlSPED.abreGrupoContas(sExercicio : String): OleVariant ;
begin
  //Ewerton Beltramini - 22/02/2021 - SIG 113742 - Acrescentada a vefificação do ano do exercicio para a escolha do plano.
  if ((sExercicio <= '2020') or (sExercicio = '')) then
  begin
       FcdsContas.data := GetDataPacket (' SELECT DECODE(PC.PLAGRUPO, ''A'', ''01'', ''P'', ''02'', ''04'') AS COD_NAT_CC,         ' +
                                         '        DECODE(PC.PLATIPO, ''S'', ''S'', ''A'') AS IND_CTA, TO_CHAR(PC.PLAGRAU)AS NIVEL, ' +
                                         '        TRIM(PC.PLACONTA) AS COD_CTA, PC.PLANOME AS NOME_CTA,                            ' +
                                         '        '' '' AS COD_CTA_REF, ''00436923000190'' AS CNPJ                                 ' +
                                         ' FROM PLANOCONTA PC                                                                      ' +
                                         ' WHERE PC.PLANO = 43                                                                     ' +  // Plano de Contas Atual    //(Ewerton Beltramini - 22/02/2021 - SIG 113742 - Plano Anterior)
                                         '   AND PC.PLAINATIVA = ''A''                                                             ' +  // Apenas contas contábeis ativas
                                         '   AND PC.PLAGRUPO IN (''A'', ''P'', ''D'', ''O'', ''R'')                                ' +  // Contas do tipo: A - ATIVO; P - PATRIMÔNIO; D - DESPESA, O - OUTROS; R - RECEITAS
                                         '   AND PC.PLATIPO = ''S''                                                                ');  // Contas contábeis do tipo Sintéticas
  end
  else if sExercicio >= '2021' then
  begin
       FcdsContas.data := GetDataPacket (' SELECT DECODE(PC.PLAGRUPO, ''A'', ''01'', ''P'', ''02'', ''04'') AS COD_NAT_CC,         ' +
                                         '        DECODE(PC.PLATIPO, ''S'', ''S'', ''A'') AS IND_CTA, TO_CHAR(PC.PLAGRAU)AS NIVEL, ' +
                                         '        TRIM(PC.PLACONTA) AS COD_CTA, PC.PLANOME AS NOME_CTA,                            ' +
                                         '        '' '' AS COD_CTA_REF, ''00436923000190'' AS CNPJ                                 ' +
                                         ' FROM PLANOCONTA PC                                                                      ' +
                                         ' WHERE PC.PLANO = 44                                                                     ' +  // Plano de Contas Atual -   //(Ewerton Beltramini - 22/02/2021 - SIG 113742 - Plano Atual)
                                         '   AND PC.PLAINATIVA = ''A''                                                             ' +  // Apenas contas contábeis ativas
                                         '   AND PC.PLAGRUPO IN (''A'', ''P'', ''D'', ''O'', ''R'')                                ' +  // Contas do tipo: A - ATIVO; P - PATRIMÔNIO; D - DESPESA, O - OUTROS; R - RECEITAS
                                         '   AND PC.PLATIPO = ''S''                                                                ');  // Contas contábeis do tipo Sintéticas
  end;

end ;

function TCtrlSPED.GeraLinha0500(sPeriodo, sExercicio : string ; var NumLin: integer): string;
var
  sList : TStringList;
  sLinha : string;

begin

   abreGrupoContas(sExercicio);    //Ewerton Beltramini - 22/02/2021 - SIG 113742 - Função alterada para passar o ano de exercicio.
   NumLin := 0;
   sList := TStringList.Create;
   sList.Clear;
   sLinha := '';

 while not (FcdsContas.Eof) do
 begin

   sLinha :=  '|0500|' +  '01'+ sPeriodo + sExercicio               + '|' +
               TRIM(copy(FcdsContas.fieldByName('COD_NAT_CC').AsString,0,2))  + '|' +
               TRIM(copy(FcdsContas.fieldByName('IND_CTA').AsString,0,1))     + '|' +
               TRIM(copy(FcdsContas.fieldByName('NIVEL').AsString,0,5))       + '|' +
               TRIM(copy(FcdsContas.fieldByName('COD_CTA').AsString,0,60))     + '|' +
               TRIM(copy(FcdsContas.fieldByName('NOME_CTA').AsString,0,60))    + '|' +
               TRIM(copy(FcdsContas.fieldByName('COD_CTA_REF').AsString,0,60)) + '|' +
               TRIM(FcdsContas.fieldByName('CNPJ').AsString)        + '|' ;

   sList.Add(sLinha);
   FcdsContas.Next;
   inc(NumLin);
 end;

  Result := Trim(sList.Text);
  
  FreeAndNil(sList);
end;

function TCtrlSPED.abreRelLInhaPai_Filho(sIdLinha : string): Boolean ;
begin
   result := false;

   FcdsContas.data := GetDataPacket('SELECT L.IDLINHA FROM LINHA_RELATORIO L,   '
                                   +'(SELECT IDLINHA AS IDLINHAFILHO, SUBSTR(COD_LINHA,1,5) AS FILHO , '
                                   +' COD_LINHA AS Cod_linha_filho FROM LINHA_RELATORIO ) F            '
                                   +' WHERE L.IDLINHA <> F.IDLINHAFILHO                                '
                                   +' AND F.FILHO = L.COD_LINHA                                        '
                                   +' AND L.IDNORMA = 7                                                '
                                   +' AND L.IDLINHA = ' + sIdLinha                                     );

   if not(FcdsContas.IsEmpty) then
    result := true;

end;


function TCtrlSPED.ContasContabeisRelacionadas(sIdLinha , sTipo : string) :string;
var
 sDesContas : string;
 //Darivaldo Alencar SIG52031 -Inicio
 sRow       :array[1..2] of string;
 dValor     :array[1..2] of double;
 bPulaLinha :boolean;
 bGrava     :boolean;
 cdsAUX     :TClientDataSet;
 iLinha     :array[1..2] of Integer;
 sPlaConta  : String;
 LstNaoEncontrada: TStringlist;

Procedure AtualizaSintetico;
var
 bBuscaSintetica: Boolean;

 begin
    FcdsGrupoXconta.first;
    while not(FcdsGrupoXconta.eof)do
     begin
       sPlaConta  := Trim(FcdsGrupoXconta.FieldByname('PLACONTA').asstring);
       iLinha[2]  := Length(sPlaConta);

       repeat
           if (LstNaoEncontrada.IndexOf(sPlaConta) <= -1) then
            begin
              cdsAUX.Data := GetDataPacket(' SELECT PC.PLACONTA,PC.PLANOME,UPPER(PC.PLATIPO) PLATIPO                              '+
                                           '    FROM LINHAXCONTACONTABIL LXC, PLANOCONTA PC                                     '+
                                           '  WHERE LXC.PLACONTA = PC.PLACONTA                                                  '+
                                           '        AND LXC.PLANO = PC.PLANO                                                    '+
                                           '        AND PC.PLACONTA = ' + sPlaConta                                              +
                                           '  GROUP BY PC.PLACONTA,PC.PLATIPO,PC.PLANOME                                        '
                                           );

              if (Trim(cdsAUX.FieldByname('PLATIPO').asstring) ='S') then
                 begin
                   FcdsGrupoXconta.Edit;
                   FcdsGrupoXconta.FieldByname('PLACONTAsintetico').asstring:= Trim(cdsAUX.FieldByname('PLACONTA').asstring);
                   FcdsGrupoXconta.FieldByname('PLANOMEsintetico').asstring := Trim(cdsAUX.FieldByname('PLANOME').asstring);
                   FcdsGrupoXconta.Post;
                 end
              else begin
                if (LstNaoEncontrada.IndexOf(sPlaConta) <= -1) then
                    LstNaoEncontrada.add(sPlaConta);
              end;
            end;
            sPlaConta  := copy(Trim(sPlaConta), 1 ,Length(sPlaConta) -1);
            dec(iLinha[2]);
       until(cdsAUX.FieldByname('PLATIPO').asstring ='S') or (iLinha[2] = 0);
       FcdsGrupoXconta.next;
     end;
     FcdsGrupoXconta.first;
 end;
 //Darivaldo Alencar SIG52031 -Fim
 
begin
     //Darivaldo Alencar SIG52031 -Inicio
     //FcdsGrupoXconta.Data := GetDataPacket(' SELECT LXC.PLACONTA, PC.PLANOME FROM                            '
     FcdsGrupoXconta.Data := GetDataPacket(' SELECT LXC.PLACONTA, PC.PLANOME, LXC.IDASSOCIACAO, PC.PLATIPO,   '
                                           +' LEAD(PC.PLATIPO) OVER (ORDER BY LXC.PLACONTA) PROXIMO,          '
                                           +' LEAD(PC.PLACONTA) OVER (ORDER BY LXC.PLACONTA) PXPLACONTA,      '
                                           +' 0 as PLACONTAsintetico, LPAD(''*'',51,''*'') as PLANOMEsintetico '
                                           +' FROM                                                            '
     //Darivaldo Alencar SIG52031 -Fim
                                           +' LINHAXCONTACONTABIL LXC, PLANOCONTA PC WHERE                    '
                                           +' LXC.PLACONTA = PC.PLACONTA                                      '
                                           +' AND LXC.PLANO = PC.PLANO                                        '
                                           +' AND LXC.IDLINHA = '+ sIdLinha
     //Darivaldo Alencar SIG52031 -Inicio
                                           +' ORDER BY  LXC.PLACONTA                                          '
                                           );

     try
       cdsAUX:= TClientDataSet.create(nil);
       LstNaoEncontrada:= Tstringlist.create;
       AtualizaSintetico;
     finally
       FreeAndNil(cdsAUX);
       FreeAndNil(LstNaoEncontrada);
     end;

     iLinha300:= 0;
     sRow[1]:= '|I300|' + FcdsSintetico2.FieldByName('COD_LINHA').AsString+'|';
     sRow[2]:= emptystr;
     bPulaLinha:= False;
     dValor[1]    := 0;
     FcdsGrupoXconta.first;
     while not(FcdsGrupoXconta.eof) do
       begin
          if FcdsSintetico3.Locate('COD_LINHA;IDASSOCIACAO',VarArrayOf([FcdsSintetico2.FieldByName('COD_LINHA').AsString,FcdsGrupoXconta.Fieldbyname('IDASSOCIACAO').asstring]),[]) then
              begin
                  dValor[1] := dValor[1] + FcdsSintetico3.fieldbyname('VALOR').asfloat;
                  sPlaConta := Trim(FcdsGrupoXconta.fieldByName('PLACONTAsintetico').AsString);

                  if (FcdsGrupoXconta.fieldbyname('PXPlACONTA').asstring<> EmptyStr) then
                     //outro grupo de conta
                     bGrava := (Copy(Trim(FcdsGrupoXconta.fieldbyname('PXPlACONTA').asstring),1 , Length(sPlaConta)) <> sPlaConta)
                  else
                     bGrava:= true; //Grava pq é a ultima linha

                  if bGrava then
                    begin
                       if (dValor[1]<> 0) then
                          begin
                            if bPulaLinha then
                               sRow[2]:= sRow[2] + #13#10;

                            sRow[2]:= sRow[2] + sRow[1] +
                                      FormatFloat('#0.00',abs(dValor[1]))+'|'+
                                      Trim(FcdsGrupoXconta.fieldByName('PLACONTAsintetico').AsString)+'|' +
                                      Trim(copy(FcdsGrupoXconta.fieldByName('PLANOMEsintetico').AsString + '  ' , 1,51))+'|';;

                            inc(iLinha300);
                          end;

                        dValor[2]:= dValor[1];
                        dValor[1] := 0;
                    end;
              end;
          FcdsGrupoXconta.next;

          if not(FcdsGrupoXconta.eof) and (bGrava) and (dValor[2] <> 0) then
             bPulaLinha:= True;
       end;

       result := sRow[2];

      //    if sTipo = 'conta' then
      //    begin
      //     if (FcdsGrupoXconta.recordcount = 1) then
      //       Result :=  FcdsGrupoXconta.fieldByName('PlACONTA').AsString;
      //     else
      //     Result := '';
      //    end;
      //
      //    if sTipo = 'desc' then
      //    begin
      //     while not(FcdsGrupoXconta.Eof) do
      //     begin
      //        sDesContas := sDesContas + FcdsGrupoXconta.fieldByName('PlACONTA').AsString  + ' '
      //                                 + FcdsGrupoXconta.fieldByName('PlANOME').AsString + '  ';
      //        FcdsGrupoXconta.next;
      //     end;
      //     Result := 'Contas contábeis ' + sDesContas;
      //    end;
      //Darivaldo Alencar SIG52031 -Fim
end;

function TCtrlSPED.GeraLinhaBlocoM200e600(sPeriodo, sExercicio, sIdNorma: string; var Arquivo : TStringList; var NumLin : integer) : string;

//Início - William Santana - SOL 233374 PPM 413667
//função interna para verificar o tipo de contribuição
function VerificaTipoCotrib(x: currency): currency;
begin
    //Caso seja tipo 12, do tipo cumulativa, retorna 0
 if (Trim(FcdsEfdDetalhe.FieldByName('TIPOCONTRIBPISCONFINS').AsString) = '12') then
  Result := 0
 else
  Result := x;
end;
//Término - William Santana - SOL 233374 PPM 413667

var
  sLinha, sTipo : string;
  rPis, rCofins : double;
  VlrRec, VlrGeral, VlrEspec, VlrBase, VlrPis, VlrCofins,
  VlrTotPeriodo, VlrAjstAcres, VlrAjstRed, VlrContrbDif, VlrContrbDifAnt, OutrasDed,
  VlrTotNaoCumul, VlrTotDesc, VlrTotDescAnt, VlrTotContribDev, VlrNaoCumulRetFonte,
  VlrContribRecPag, VlrTotContribCumul, VlrCumulRetFonte, VlrOutrDed, VlrContribCumul, VlrTotContrib: currency;
  iNunLinhasBlocoI : Integer;
  rVlrAcrescimoBase, rVlrReducaoBase, rVlrBaseAjustada: Currency;
  bMontaLinhaM215e615: Boolean;

  teste, teste1: Currency;
begin

  iNunLinhasBlocoI := 0;
  bMontaLinhaM215e615:= False;
  
  //cálculos base Pis/Confins
  GetAliquotaImpostos( rPis, rCofins );
  CalculaTotais(VlrRec, vlrGeral, vlrEspec);
  GetVlrAcrescimoReducao(sIdNorma, sPeriodo, sExercicio, rVlrAcrescimoBase, rVlrReducaoBase);
  //Cássio Rovaroto - SIG nº 81493 - Início
  //VlrBase   := (vlrRec - (vlrGeral + vlrEspec)) - rVlrAcrescimoBase + rVlrReducaoBase;
  VlrBase   := (vlrRec - abs((vlrGeral + vlrEspec))) - rVlrAcrescimoBase + rVlrReducaoBase;
  //Cássio Rovaroto - SIG nº 81493 - Fim
  rVlrBaseAjustada := (VlrBase + rVlrAcrescimoBase) + rVlrReducaoBase;
  //Cássio Rovaroto - SIG nº 81493 - Início
  //VlrRec := rVlrBaseAjustada + (vlrGeral + vlrEspec) - rVlrAcrescimoBase + rVlrReducaoBase;
  VlrRec := rVlrBaseAjustada + abs((vlrGeral + vlrEspec)) - rVlrAcrescimoBase + rVlrReducaoBase;
  //Cássio Rovaroto - SIG nº 81493 - Fim  

  //Cássio Rovaroto - SIG nº 72274 - Início


  if (rVlrAcrescimoBase <> 0) or (rVlrReducaoBase <> 0) then
    bMontaLinhaM215e615 := True;



  //VlrPis    := VlrBase * (rPis/100);
  VlrPis := rVlrBaseAjustada * (rPis/100);
  //VlrCofins := VlrBase * (rCofins/100);
  VlrCofins := rVlrBaseAjustada * (rCofins/100);
  //Cássio Rovaroto - SIG nº 72274 - Fim

  //cálculos para linha M210
  VlrAjstAcres     := 0;
  VlrAjstRed       := 0;
  VlrContrbDif     := 0;
  VlrContrbDifAnt  := 0;
  VlrTotPeriodo :=  VlrPis + VlrAjstAcres - VlrAjstRed - VlrContrbDif + VlrContrbDifAnt ;

  //cálculos para linha M200
  VlrTotNaoCumul       := VerificaCodContrib(0,VlrTotPeriodo);
  VlrTotDesc           := 0;
  VlrTotDescAnt        := 0;
  VlrTotContribDev     := VerificaTipoCotrib((VlrTotNaoCumul - VlrTotDesc - VlrTotDescAnt)); //William Santana - SOL 233374 PPM 413667
  VlrNaoCumulRetFonte  := 0;
  OutrasDed            := 0;
  VlrContribRecPag     := VerificaTipoCotrib((VlrTotContribDev - VlrNaoCumulRetFonte - OutrasDed)); //Início - William Santana - SOL 233374 PPM 413667
  VlrTotContribCumul   := VerificaCodContrib(1,VlrTotPeriodo);
  VlrCumulRetFonte     := 0;
  VlrOutrDed           := 0;
  VlrContribCumul      := VlrTotContribCumul - VlrCumulRetFonte - VlrOutrDed;
  VlrTotContrib        := VlrContribRecPag + VlrTotContribCumul;


  //Bloco M200 é referênte ao PIS

    sLinha := '|M200|' +                                                        // identificador linha: fixo M200
              FormatFloat('#0.00',abs(VlrTotNaoCumul))      +'|'+                    // valor total não cumulativo
              FormatFloat('#0.00',abs(VlrTotDesc))          +'|'+                    // valor total descontado
              FormatFloat('#0.00',abs(VlrTotDescAnt))       +'|'+                    // valor total descontado anterior
              FormatFloat('#0.00',abs(VlrTotContribDev))    +'|'+                    // valor total contribuição devida
              FormatFloat('#0.00',abs(VlrNaoCumulRetFonte)) +'|'+                    // valor não cumulativo retido fonte
              FormatFloat('#0.00',abs(OutrasDed))           +'|'+                    // outras deduções
              FormatFloat('#0.00',abs(VlrContribRecPag))    +'|'+                    // valor contribuição recolher/pagar
              FormatFloat('#0.00',abs(VlrTotContribCumul))  +'|'+                    // valor contribuição cumulativo
              FormatFloat('#0.00',abs(VlrCumulRetFonte))    +'|'+                    // valor cumulativo retido fonte
              FormatFloat('#0.00',abs(VlrOutrDed))          +'|'+                    // valor outras deduções
              FormatFloat('#0.00',abs(VlrContribCumul))     +'|'+                    // valor contribuição cumulativa
              FormatFloat('#0.00',abs(VlrTotContrib))       +'|' ;                   // valor total contribuição


    arquivo.Add(sLinha);
    iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    SetLinhasEFD(copy(sLinha, 2,4), 1);

    sLinha := '|M205|' +                                                              // identificador linha: fixo M205
              Trim(FcdsEfdDetalhe.FieldByName('TIPOCONTRIBPISCONFINS').AsString)+'|'+  // tipo contribuição pis/pasep
              Trim(FcdsEfdDetalhe.FieldByName('CODRFBPIS').AsString)            +'|'+  // código receita
              FormatFloat('#0.00',abs(vlrPis))                                  +'|';  // valor débito

    arquivo.Add(sLinha);
    iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    SetLinhasEFD(copy(sLinha, 2,4), 1);


    sLinha := '|M210|' +                                                           // identificador linha: fixo M210
              Trim(FcdsEfdDetalhe.FieldByName('CODCONTRIBAPURADA').AsString)+'|'+  // código contribuição social
              FormatFloat('#0.00',abs(VlrRec))      +'|'+                          // valor receita bruta
//Cássio Rovaroto - SIG nº 82251 - Início
//              FormatFloat('#0.00',abs(VlrBase))     +'|'+                          // base calculo PIS
              FormatFloat('#0.00',abs(VlrBase))     +'|';                          // base calculo PIS
    if StrToInt(sExercicio) > 2018 then
      sLinha := sLinha +
              //Cássio Rovaroto - SIG nº 72274 - Início
              FormatFloat('#0.00', Abs(rVlrAcrescimoBase)) +'|'+                   //valor do total dos ajustes de acréscimo da base
              FormatFloat('#0.00', Abs(rVlrReducaoBase)) +'|'+                     //valor do total dos ajustes de redução da base
              FormatFloat('#0.00', Abs(rVlrBaseAjustada)) +'|';                    //base de cálculo ajustada
              //Cássio Rovaroto - SIG nº 72274 - Fim
    sLinha := sLinha +
//Cássio Rovaroto - SIG nº 82251 - Fim
              FormatFloat('#0.00',abs(rPis))        +'|'+                          // aliquota PIS
              '0'                                   +'|'+                          // quantidade base cálculo: este será preenchido com o valor 0 (zero);
              ''                                    +'|'+                          // valor alíquota pis: este campo permanecerá em branco;
              FormatFloat('#0.00',abs(vlrPis))           +'|'+                     // valor contribuição apurada : valor PIS
              FormatFloat('#0.00',abs(VlrAjstAcres))     +'|'+                     // valor ajuste acrescimo: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrAjstRed))       +'|'+                     // valor ajuste redução: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrContrbDif))     +'|'+                     // valor contribuição diferir: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrContrbDifAnt))  +'|'+                     // valor contribuição diferido anterior: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrTotPeriodo))    +'|';                     // Valor total contribuição período

    arquivo.Add(sLinha);
    iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    SetLinhasEFD(copy(sLinha, 2,4), 1);

  //Cássio Rovaroto - SIG nº 72274 - Início
  if bMontaLinhaM215e615 then
  begin
    cdsAux.Data := GetDadosContasContabAjustes(sIdNorma, sPeriodo, sExercicio);
    if not cdsAux.IsEmpty then
    begin
      while not cdsAux.Eof do
      begin
        if cdsAux.FieldByName('ACRESCIMO').AsCurrency > 0 then
        begin
          sLinha := '|M215|' +
                    '0'      +'|'+
                    FormatFloat('#0.00', Abs(cdsAux.FieldByName('ACRESCIMO').AsCurrency)) +'|'+
                    cdsAux.FieldByName('CODAJUSTE').AsString +'|'+
                    cdsAux.FieldByname('NUMPROCESSO').AsString +'|'+
                    cdsAux.FieldByName('DESCRAJUSTE').AsString +'|'+
                    '|'+
                    cdsAux.FieldByName('PLACONTA').AsString +'|'+
                    cdsAux.FieldByName('CNPJ').AsString +'|'+
                    cdsAux.FieldByName('INFOAJUSTE').AsString +'|';
          arquivo.Add(sLinha);
          iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
          SetLinhasEFD(copy(sLinha, 2,4), 1);
        end
        else
          if cdsAux.FieldByName('REDUCAO').AsCurrency < 0 then
          begin
            sLinha := '|M215|' +
                    '1'      +'|'+
                    FormatFloat('#0.00', Abs(cdsAux.FieldByName('REDUCAO').AsCurrency)) +'|'+
                    cdsAux.FieldByName('CODAJUSTE').AsString +'|'+
                    cdsAux.FieldByname('NUMPROCESSO').AsString +'|'+
                    cdsAux.FieldByName('DESCRAJUSTE').AsString +'|'+
                    '|'+
                    cdsAux.FieldByName('PLACONTA').AsString +'|'+
                    cdsAux.FieldByName('CNPJ').AsString +'|'+
                    cdsAux.FieldByName('INFOAJUSTE').AsString +'|';
            arquivo.Add(sLinha);
            iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
            SetLinhasEFD(copy(sLinha, 2,4), 1);
          end;
        cdsAux.Next;
      end;
    end;
  end;
  //Cássio Rovaroto - SIG nº 72274 - Fim

  //Bloco M600 é referênte ao CONFINS

  //cálculos para linha M610
  VlrAjstAcres     := 0;
  VlrAjstRed       := 0;
  VlrContrbDif     := 0;
  VlrContrbDifAnt  := 0;
  VlrTotPeriodo :=  VlrCofins + VlrAjstAcres - VlrAjstRed - VlrContrbDif + VlrContrbDifAnt ;

  //cálculos para linha M600
  VlrTotNaoCumul       := VerificaCodContrib(0,VlrTotPeriodo);
  VlrTotDesc           := 0;
  VlrTotDescAnt        := 0;
  VlrTotContribDev     := VerificaTipoCotrib((VlrTotNaoCumul - VlrTotDesc - VlrTotDescAnt)); //William Santana - SOL 233374 PPM 413667
  VlrNaoCumulRetFonte  := 0;
  OutrasDed            := 0;
  VlrContribRecPag     := VerificaTipoCotrib((VlrTotContribDev - VlrNaoCumulRetFonte - OutrasDed));  //William Santana - SOL 233374 PPM 413667
  VlrTotContribCumul   := VerificaCodContrib(1,VlrTotPeriodo);
  VlrCumulRetFonte     := 0;
  VlrOutrDed           := 0;
  VlrContribCumul      := VlrTotContribCumul - VlrCumulRetFonte - VlrOutrDed;
  VlrTotContrib        := VlrContribRecPag + VlrTotContribCumul;

    sLinha := '|M600|' +                                                        // identificador linha: fixo M200
              FormatFloat('#0.00',abs(VlrTotNaoCumul))      +'|'+                    // valor total não cumulativo
              FormatFloat('#0.00',abs(VlrTotDesc))          +'|'+                    // valor total descontado
              FormatFloat('#0.00',abs(VlrTotDescAnt))       +'|'+                    // valor total descontado anterior
              FormatFloat('#0.00',abs(VlrTotContribDev))    +'|'+                    // valor total contribuição devida
              FormatFloat('#0.00',abs(VlrNaoCumulRetFonte)) +'|'+                    // valor não cumulativo retido fonte
              FormatFloat('#0.00',abs(OutrasDed))           +'|'+                    // outras deduções
              FormatFloat('#0.00',abs(VlrContribRecPag))    +'|'+                    // valor contribuição recolher/pagar
              FormatFloat('#0.00',abs(VlrTotContribCumul))  +'|'+                    // valor contribuição cumulativo
              FormatFloat('#0.00',abs(VlrCumulRetFonte))    +'|'+                    // valor cumulativo retido fonte
              FormatFloat('#0.00',abs(VlrOutrDed))          +'|'+                    // valor outras deduções
              FormatFloat('#0.00',abs(VlrContribCumul))     +'|'+                    // valor contribuição cumulativa
              FormatFloat('#0.00',abs(VlrTotContrib))       +'|' ;                   // valor total contribuição


    arquivo.Add(sLinha);
    iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    SetLinhasEFD(copy(sLinha, 2,4), 1);

    sLinha := '|M605|' +                                                             // identificador linha: fixo M205
              Trim(FcdsEfdDetalhe.FieldByName('TIPOCONTRIBPISCONFINS').AsString)+'|'+  // tipo contribuição pis/pasep
              Trim(FcdsEfdDetalhe.FieldByName('CODRFBCONFINS').AsString)     +'|'+  // código receita
              FormatFloat('#0.00',abs(VlrCofins))                                +'|';  // valor débito

    arquivo.Add(sLinha);
    iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    SetLinhasEFD(copy(sLinha, 2,4), 1);


    sLinha := '|M610|' +                                                           // identificador linha: fixo M610
              Trim(FcdsEfdDetalhe.FieldByName('CODCONTRIBAPURADA').AsString)+'|'+  // código contribuição social
              FormatFloat('#0.00',abs(VlrRec))           +'|'+                          // valor receita bruta
//Cássio Rovaroto - SIG nº 82251 - Início
//              FormatFloat('#0.00',abs(VlrBase))     +'|'+                          // base calculo PIS
               FormatFloat('#0.00',abs(VlrBase))     +'|';                          // base calculo PIS
    if StrToInt(sExercicio) > 2018 then
      sLinha := sLinha +
              //Cássio Rovaroto - SIG nº 72274 - Início
              FormatFloat('#0.00', Abs(rVlrAcrescimoBase)) +'|'+                        //valor do total dos ajustes de acréscimo da base
              FormatFloat('#0.00', Abs(rVlrReducaoBase)) +'|'+                          //valor do total dos ajustes de redução da base
              FormatFloat('#0.00', Abs(rVlrBaseAjustada)) +'|';                         //base de cálculo ajustada
              //Cássio Rovaroto - SIG nº 72274 - Fim
       sLinha := sLinha +
//Cássio Rovaroto - SIG nº 82251 - Fim
              FormatFloat('#0.00',abs(rCofins))          +'|'+                          // aliquota CONFINS
              '0'                                        +'|'+                          // quantidade base cálculo: este será preenchido com o valor 0 (zero);
              ''                                         +'|'+                          // valor alíquota Cofins: este campo permanecerá em branco;
              FormatFloat('#0.00',abs(VlrCofins))        +'|'+                          // valor contribuição apurada : valor COFINS
              FormatFloat('#0.00',abs(VlrAjstAcres))     +'|'+                          // valor ajuste acrescimo: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrAjstRed))       +'|'+                          // valor ajuste redução: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrContrbDif))     +'|'+                          // valor contribuição diferir: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrContrbDifAnt))  +'|'+                          // valor contribuição diferido anterior: este será preenchido com o valor 0 (zero);
              FormatFloat('#0.00',abs(VlrTotPeriodo))    +'|';                          // Valor total contribuição período

    arquivo.Add(sLinha);
    iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
    SetLinhasEFD(copy(sLinha, 2,4), 1);

  //Cássio Rovaroto - SIG nº 72274 - Início
  if bMontaLinhaM215e615 then
  begin
    cdsAux.Data := GetDadosContasContabAjustes(sIdNorma, sPeriodo, sExercicio);
    if not cdsAux.IsEmpty then
    begin
      while not cdsAux.Eof do
      begin
        if cdsAux.FieldByName('ACRESCIMO').AsCurrency > 0 then
        begin
          sLinha := '|M615|' +
                    '0'      +'|'+
                    FormatFloat('#0.00', Abs(cdsAux.FieldByName('ACRESCIMO').AsCurrency)) +'|'+
                    cdsAux.FieldByName('CODAJUSTE').AsString +'|'+
                    cdsAux.FieldByname('NUMPROCESSO').AsString +'|'+
                    cdsAux.FieldByName('DESCRAJUSTE').AsString +'|'+
                    '|'+
                    cdsAux.FieldByName('PLACONTA').AsString +'|'+
                    cdsAux.FieldByName('CNPJ').AsString +'|'+
                    cdsAux.FieldByName('INFOAJUSTE').AsString +'|';
          arquivo.Add(sLinha);
          iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
          SetLinhasEFD(copy(sLinha, 2,4), 1);
        end
        else
          if cdsAux.FieldByName('REDUCAO').AsCurrency < 0 then
          begin
            sLinha := '|M615|' +
                    '1'      +'|'+
                    FormatFloat('#0.00', Abs(cdsAux.FieldByName('REDUCAO').AsCurrency)) +'|'+
                    cdsAux.FieldByName('CODAJUSTE').AsString +'|'+
                    cdsAux.FieldByname('NUMPROCESSO').AsString +'|'+
                    cdsAux.FieldByName('DESCRAJUSTE').AsString +'|'+
                    '|'+
                    cdsAux.FieldByName('PLACONTA').AsString +'|'+
                    cdsAux.FieldByName('CNPJ').AsString +'|'+
                    cdsAux.FieldByName('INFOAJUSTE').AsString +'|';
            arquivo.Add(sLinha);
            iNunLinhasBlocoI := iNunLinhasBlocoI + NumLin;
            SetLinhasEFD(copy(sLinha, 2,4), 1);
          end;
        cdsAux.Next;
      end;
    end;
  end;
  //Cássio Rovaroto - SIG nº 72274 - Fim

  Result := '';
  NumLin := iNunLinhasBlocoI;
end;

function TCtrlSPED.VerificaCodContrib(iTipo : integer ; iVlrTotPeriodo : Currency ): Currency;
 var
   CodContrib :integer;
begin
  result := 0;

  try
   CodContrib := Strtoint(FcdsEfdDetalhe.FieldByName('CODCONTRIBAPURADA').AsString);
  Except
   CodContrib := -1;
  end;

  if iTipo = 0 then   // Valor Total Não Cumulativo
  begin
    case CodContrib of
      01, 02, 03, 04, 32, 71 : Result := iVlrTotPeriodo;
    end;
  end;

  if iTipo = 1 then  // Valor Total de Contribuição Cumulativa
  begin
    case CodContrib of
     31, 32, 51, 52, 53, 54, 72 : Result := iVlrTotPeriodo;
    end;
  end;

end;

function TCtrlSPED.PreencheZeros(campo : string ; posicoes : integer ):String;

var 
sZeros: string;
iTamanho, iContador: integer;

begin

  itamanho:= Length(Trim(campo));
  sZeros:= '';

  for iContador:= 1 to posicoes do
  sZeros:= sZeros + '0';

  Result:= Copy(Trim(sZeros)+Trim(campo),iTamanho+1,posicoes);

end;

function TCtrlSPED.VerificaContaZerada( Cds : TClientDataSet ; sCodLinha : string): boolean ;
begin    
     AplicaRemoveFiltro(Cds, 'CATEGORIA = '+Quotedstr(FcdsAnalitico.FieldByName('CATEGORIA').AsString)
                                     +' AND COD_LINHA = ' +Quotedstr(sCodLinha) );

   result := true;                                  
   while not Cds.eof do
   begin
    if (Cds.FieldByName('VLRCREDITO').AsFloat <> 0) or (Cds.FieldByName('VLRDEBITO').AsFloat <> 0) then
      if (Cds.FieldByName('VLRCREDITO').AsFloat <> Cds.FieldByName('VLRDEBITO').AsFloat) then            //WO38016 Leandro
        result := false;

    Cds.next;
   end;

end;
//Término - William Santana SOL 155850-15363 KIN 2051763

//Darivaldo Alencar SIG52031 -inicio
function TCtrlSPED.Translate(sCampo: String; bVirgula: boolean): String;
var
  i: Integer;
  sOwner: String;
begin
    sOwner:= emptystr;
    sCampo:= Trim(sCampo);
    for i:= 1 to length(sCampo) do
      begin
        sOwner:= sOwner + sCampo[i];
        if (sCampo[i] = '.') then
          sOwner:= emptystr;
      end;

    result:= 'TRANSLATE( '+sCampo+',''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')AS ' + sOwner;
    if bVirgula then
       result:= result + ',';
end;

function TCtrlSPED.ListaDadosSinteticosComAssociacao(iIdRelatorio : integer) : OleVariant;
var
 _sSQL2: TStringlist;
begin
  try
    _sSQL2:= TStringlist.create;
    _sSQL2.Add('SELECT LR.IDLINHA, ');
    _sSQL2.Add('       LS.IDASSOCIACAO, ');
    _sSQL2.Add('       LR.IDNORMA,  ');
    _sSQL2.Add('       LR.DESCRICAO,');
    _sSQL2.Add('       CE.DESCRICAO AS CARACTERISTICA,');
    _sSQL2.Add('       LR.COD_LINHA,                  ');
    _sSQL2.Add('       SUBSTR(LR.COD_LINHA,0,5) AS SUBS_COD_LINHA,  ');
    _sSQL2.Add('   DECODE(LR.IDNATUREZA,2,- ABS(SUM(LS.TOTAL)),SUM(LS.TOTAL)) AS VALOR ,       ');
    _sSQL2.Add('       LS.IDRELATORIODADOS, ');
    _sSQL2.Add('       RE.NURECIBO,         ');
    _sSQL2.Add('       tc.descricaocategoria as categoria,');
    _sSQL2.Add('       decode(tc.descricaocategoria, ''RECEITA'', ''02'',  ');
    _sSQL2.Add('                                     ''GERAL'',   ''04'',''05'') AS IDCAMPO,  ');
    _sSQL2.Add('       decode(TC.DESCRICAOCATEGORIA, ''RECEITA'', 1, ''ESPECÍFICO'', 2, 3) AS ORDEM ');
    _sSQL2.Add('  FROM (SELECT IDLINHASPED, IDRELATORIODADOS, IDASSOCIACAO, ');
    _sSQL2.Add('                     VLRCREDITO, VLRDEBITO, NVL(VLRDEBITO,0)-NVL(VLRCREDITO,0) TOTAL ');
    _sSQL2.Add('                FROM LINHAS_SPED ');
    _sSQL2.Add('       ) LS, ');
    _sSQL2.Add('       NATUREZA_LINHA             NA, ');
    _sSQL2.Add('       LINHA_RELATORIO            LR, ');
    _sSQL2.Add('       TIPODECATEGORIA            TC, ');
    _sSQL2.Add('       RELATORIO_DADOS_CADASTRAIS RE, ');
    _sSQL2.Add('       LINHAXCONTACONTABIL        LXC, ');
    _sSQL2.Add('       CARACTERISTICA_GRUPO_EFD CE    ');
    _sSQL2.Add(' WHERE TC.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA ');
    _sSQL2.Add('   AND LR.IDLINHA = LXC.IDLINHA           ');
    _sSQL2.Add('   AND LXC.IDASSOCIACAO = LS.IDASSOCIACAO ');
    _sSQL2.Add('   AND LS.IDRELATORIODADOS = RE.IDRELATORIODADOS ');
    _sSQL2.Add('   AND LR.IDNATUREZA = NA.IDNATUREZA ');
    _sSQL2.Add('   AND CE.IDTIPOCARACTERISTICA = LR.IDTIPOCARACTERISTICA   ');
    _sSQL2.Add('   AND RE.IDRELATORIODADOS = '+IntToStr(iIdRelatorio) );
    _sSQL2.Add(' GROUP BY LR.IDLINHA,    ');
    _sSQL2.Add('         LS.IDASSOCIACAO, ');
    _sSQL2.Add('         LR.COD_LINHA,          ');
    _sSQL2.Add('         LR.IDNORMA,          ');
    _sSQL2.Add('         LR.DESCRICAO,        ');
    _sSQL2.Add('         LR.COD_LINHA,        ');
    _sSQL2.Add('         LS.IDRELATORIODADOS, ');
    _sSQL2.Add('         RE.NURECIBO,         ');
    _sSQL2.Add('         tc.descricaocategoria,');
    _sSQL2.Add('         CE.DESCRICAO, LR.IDNATUREZA    ');
    _sSQL2.Add(' ORDER BY ORDEM, LR.COD_LINHA');

    FcdsSintetico3.data := GetDataPacket( _sSQL2.GetText );
  finally
      FreeandNil(_sSQL2);
  end;
end;
//Darivaldo Alencar SIG52031 -fim

function  TCtrlSPED.CalculaValorBaseAjustada: Currency;
var
  vlrRec, vlrEspec, vlrGeral, vlrBaseAjust : currency;
begin
  CalculaTotaisAjustes(vlrRec, vlrGeral, vlrEspec);
  vlrBaseAjust := vlrRec - ABS(vlrGeral + vlrEspec);
  Result := ABS(vlrBaseAjust);
end;

procedure TCtrlSPED.CalculaTotaisAjustes(var rReceita, rGeral, rEspecifico : currency);
var
  ind : byte;
  sFiltro : string;
  rValor  : currency;
begin
  FcdsSintetico.DisableControls;

  for ind := 1 to 3 do
  begin
    rValor := 0;
    case ind of
      1 : sFiltro := 'CATEGORIA = ''RECEITA''';
      2 : sFiltro := 'CATEGORIA = ''GERAL''';
      3 : sFiltro := 'CATEGORIA = ''ESPECÍFICO''';
    end;
    AplicaRemoveFiltro(FcdsSintetico, sFiltro);

    while not FcdsSintetico.Eof do
    begin
      rValor := rValor + fcdsSintetico.FieldByName('VALOR').asCurrency;
      FcdsSintetico.Next;
    end;

    case ind of
      1 : rReceita    := rValor;
      2 : rGeral      := rValor;
      3 : rEspecifico := rValor;
    end;
  end;

  AplicaRemoveFiltro(FcdsSintetico, '');
  FcdsSintetico.EnableControls;
end;

procedure TCtrlSPED.CalculaAcrescimo(var rAcrescimo: Currency);
var
  ind : byte;
  sFiltro : string;
  rValor, rVlrAcresReceita, rVlrAcresGeral, rVlrAcresEsp  : currency;
begin
  rVlrAcresReceita := 0;
  rVlrAcresGeral := 0;
  rVlrAcresEsp := 0;
  rValor := 0;

  FcdsSintetico.DisableControls;

  for ind := 1 to 3 do
  begin
    rValor := 0;
    case ind of
      1 : sFiltro := 'CATEGORIA = ''RECEITA''';
      2 : sFiltro := 'CATEGORIA = ''GERAL''';
      3 : sFiltro := 'CATEGORIA = ''ESPECÍFICO''';
    end;
    AplicaRemoveFiltro(FcdsSintetico, sFiltro);

    while not FcdsSintetico.eof do
    begin
      if FcdsSintetico.FieldByName('VALORAJUST').AsCurrency > 0 then
        rValor := rValor + FcdsSintetico.FieldByName('VALORAJUST').AsCurrency
      else
        rValor := rValor + 0;
      FcdsSintetico.next;
    end;

    case ind of
      1 : rVlrAcresReceita := rValor;
      2 : rVlrAcresGeral   := rValor;
      3 : rVlrAcresEsp     := rValor;
    end;
  end;

  rAcrescimo := rVlrAcresReceita - Abs(rVlrAcresGeral + rVlrAcresEsp);
  AplicaRemoveFiltro(FcdsSintetico, '');
  FcdsSintetico.EnableControls;
end;

procedure TCtrlSPED.CalculaReducao(var rReducoes: Currency);
var
  ind : byte;
  sFiltro : string;
  rValor, rVlrReducReceita, rVlrReducGeral, rVlrReducEsp  : currency;
begin
  rValor := 0;
  rVlrReducReceita := 0;
  rVlrReducGeral := 0;
  rVlrReducEsp := 0;

  FcdsSintetico.DisableControls;

  for ind := 1 to 3 do
  begin
    rValor := 0;
    case ind of
      1 : sFiltro := 'CATEGORIA = ''RECEITA''';
      2 : sFiltro := 'CATEGORIA = ''GERAL''';
      3 : sFiltro := 'CATEGORIA = ''ESPECÍFICO''';
    end;
    AplicaRemoveFiltro(FcdsSintetico, sFiltro);

    while not FcdsSintetico.eof do
    begin
      if FcdsSintetico.FieldByName('VALORAJUST').AsCurrency < 0 then
        rValor := rValor + FcdsSintetico.FieldByName('VALORAJUST').AsCurrency
      else
        rValor := rValor + 0;
      FcdsSintetico.next;
    end;

    case ind of
      1 : rVlrReducReceita := rValor;
      2 : rVlrReducGeral   := rValor;
      3 : rVlrReducEsp     := rValor;
    end;
  end;

  rReducoes := rVlrReducReceita - Abs(rVlrReducGeral + rVlrReducEsp);
  AplicaRemoveFiltro(FcdsSintetico, '');
  FcdsSintetico.EnableControls;
end;

function TCtrlSPED.GetDadosContasContabAjustes(
  pIdNorma, pPeriodo, pExercicio: String): OleVariant;
var
    sSQL: String;
begin
  sSQL := 'SELECT TRIM(PC.PLACONTA) AS PLACONTA,                                                                        '+#13#10+
          '       LXC.CODAJUSTE,                                                                                        '+#13#10+
          '       LXC.NUMPROCESSO,                                                                                      '+#13#10+
          '       LXC.DESCRAJUSTE,                                                                                      '+#13#10+
          '       LXC.INFOAJUSTE,                                                                                       '+#13#10+
          '       DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.IDNATUREZA,2, 0, DECODE(LR.TIPOCONTABILIZACAO,1,    '+#13#10+
          '                  PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL)),0),0) AS ACRESCIMO,                                    '+#13#10+
          '       DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.IDNATUREZA,2,-(ABS(DECODE(LR.TIPOCONTABILIZACAO,1,  '+#13#10+
          '                  PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))),0),0),0) AS REDUCAO,                                  '+#13#10+
          '       TRIM(PE.NUMDOCUMENTO) AS CNPJ                                                                         '+#13#10+
          '  FROM TIPODECATEGORIA TC,                                                                                   '+#13#10+
          '       LINHAXCONTACONTABIL LXC,                                                                              '+#13#10+
          '       PLANOCONTA PC,                                                                                        '+#13#10+
          '       PARAMCONTAB P,                                                                                        '+#13#10+
          '       PESSOA PE,                                                                                            '+#13#10+
          '       LINHA_RELATORIO LR,                                                                                   '+#13#10+
          '       NATUREZA_LINHA NA,                                                                                    '+#13#10+
          '       (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO,                                  '+#13#10+
          '               SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,                                                       '+#13#10+
          '               SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                                                            '+#13#10+
          '               SUM(P.PLSCREDITOCOR - P.PLSDEBITOCORRENTE) AS TOTAL                                           '+#13#10+
          '          FROM PLANOSALDO P                                                                                  '+#13#10+
          '         WHERE P.IDPLANOPREV IN (SELECT IDPLANOPREV                                                          '+#13#10+
          '                                   FROM PLANPREVCONTABIL                                                     '+#13#10+
          '                                  WHERE ATIVO =  ''S''                                                       '+#13#10+
          '                                    AND IDPLANOPREV <> 110)                                                  '+#13#10+
          '           AND P.PEREXERCICIO = ' + pExercicio                                                                +#13#10+
          '           AND P.PERNUMERO = ' + pPeriodo                                                                     +#13#10+
          '         GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO) PS1,                          '+#13#10+
          '       (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO,P.PLSTIPO,                                   '+#13#10+
          '               SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,                                                       '+#13#10+
          '               SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                                                            '+#13#10+
          '               SUM(P.PLSCREDITOCOR - P.PLSDEBITOCORRENTE) AS TOTAL                                           '+#13#10+
          '          FROM PLANOSALDO P                                                                                  '+#13#10+
          '         WHERE P.IDPLANOPREV = 110                                                                           '+#13#10+
          '           AND P.PEREXERCICIO = ' + pExercicio                                                                +#13#10+
          '           AND P.PERNUMERO = ' + pPeriodo                                                                     +#13#10+
          '         GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO) PS2,                          '+#13#10+
          '       (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO,                                  '+#13#10+
          '               SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,                                                       '+#13#10+
          '               SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                                                            '+#13#10+
          '               SUM(P.PLSCREDITOCOR - P.PLSDEBITOCORRENTE) AS TOTAL                                           '+#13#10+
          '          FROM PLANOSALDO P                                                                                  '+#13#10+
          '         WHERE P.PEREXERCICIO = ' + pExercicio                                                                +#13#10+
          '           AND P.PERNUMERO = ' + pPeriodo                                                                     +#13#10+
          '         GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO) PS3                           '+#13#10+
          ' WHERE TC.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA                                                           '+#13#10+
          '   AND ((TRIM(PS1.PLACONTA(+)) = TRIM(PC.PLACONTA)) AND                                                      '+#13#10+
          '       (PS1.PLANO(+) = PC.PLANO))                                                                            '+#13#10+
          '   AND ((TRIM(PS2.PLACONTA(+)) = TRIM(PC.PLACONTA)) AND                                                      '+#13#10+
          '       (PS2.PLANO(+) = PC.PLANO))                                                                            '+#13#10+
          '   AND ((TRIM(PS3.PLACONTA(+)) = TRIM(PC.PLACONTA)) AND                                                      '+#13#10+
          '       (PS3.PLANO(+) = PC.PLANO))                                                                            '+#13#10+
          '   AND PC.PLACONTA = LXC.PLACONTA                                                                            '+#13#10+
          '   AND PC.PLANO = LXC.PLANO                                                                                  '+#13#10+
          '   AND LR.IDNATUREZA = NA.IDNATUREZA                                                                         '+#13#10+
          '   AND LXC.IDLINHA = LR.IDLINHA                                                                              '+#13#10+
          '   AND P.PLANO = PC.PLANO                                                                                    '+#13#10+
          '   AND P.IDPESSOA = PE.IDPESSOA                                                                              '+#13#10+
          '   AND LR.IDNORMA = ' + pIdNorma                                                                              +#13#10+
          ' ORDER BY PC.PLACONTA                                                                                        ';
  Result := GetDataPacket(sSQL);
end;

procedure TCtrlSPED.GetVlrAcrescimoReducao(pIdNorma, pPeriodo,
  pExercicio: String; var pVlrAcrescimo: Currency; var pVlrReducao: Currency);
var
  sSQL: string;
begin
  sSQL:= 'SELECT SUM(ACRESCIMO) AS ACRESCIMO,                                                                                  '+#13#10+
         '       SUM(REDUCAO) AS REDUCAO                                                                                       '+#13#10+
         '  FROM (SELECT TRIM(PC.PLACONTA) AS PLACONTA,                                                                        '+#13#10+
         '               DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.IDNATUREZA,2, 0, DECODE(LR.TIPOCONTABILIZACAO,1,    '+#13#10+
         '                  PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL)),0),0) AS ACRESCIMO,                                    '+#13#10+
         '               DECODE(NVL(LXC.TIPOBASECALC, 0), 1, NVL(DECODE(LR.IDNATUREZA,2,-(ABS(DECODE(LR.TIPOCONTABILIZACAO,1,  '+#13#10+
         '                  PS1.TOTAL,2, PS2.TOTAL, PS3.TOTAL))),0),0),0) AS REDUCAO,                                  '+#13#10+
         '               TRIM(PE.NUMDOCUMENTO) AS CNPJ                                                                         '+#13#10+
         '          FROM TIPODECATEGORIA TC,                                                                                   '+#13#10+
         '               LINHAXCONTACONTABIL LXC,                                                                              '+#13#10+
         '               PLANOCONTA PC,                                                                                        '+#13#10+
         '               PARAMCONTAB P,                                                                                        '+#13#10+
         '               PESSOA PE,                                                                                            '+#13#10+
         '               LINHA_RELATORIO LR,                                                                                   '+#13#10+
         '               NATUREZA_LINHA NA,                                                                                    '+#13#10+
         '               (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO,                                  '+#13#10+
         '                       SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,                                                       '+#13#10+
         '                       SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                                                            '+#13#10+
         '                       SUM(P.PLSCREDITOCOR - P.PLSDEBITOCORRENTE) AS TOTAL                                           '+#13#10+
         '                  FROM PLANOSALDO P                                                                                  '+#13#10+
         '                 WHERE P.IDPLANOPREV IN (SELECT IDPLANOPREV                                                          '+#13#10+
         '                                           FROM PLANPREVCONTABIL                                                     '+#13#10+
         '                                          WHERE ATIVO =  ''S''                                                       '+#13#10+
         '                                            AND IDPLANOPREV <> 110)                                                  '+#13#10+
         '                   AND P.PEREXERCICIO = ' + pExercicio                                                                +#13#10+
         '                   AND P.PERNUMERO = ' + pPeriodo                                                                     +#13#10+
         '                 GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO) PS1,                          '+#13#10+
         '               (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO,P.PLSTIPO,                                   '+#13#10+
         '                       SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,                                                       '+#13#10+
         '                       SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                                                            '+#13#10+
         '                       SUM(P.PLSCREDITOCOR - P.PLSDEBITOCORRENTE) AS TOTAL                                           '+#13#10+
         '                  FROM PLANOSALDO P                                                                                  '+#13#10+
         '                 WHERE P.IDPLANOPREV = 110                                                                           '+#13#10+
         '                   AND P.PEREXERCICIO = ' + pExercicio                                                                +#13#10+
         '                   AND P.PERNUMERO = ' + pPeriodo                                                                     +#13#10+
         '                 GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO) PS2,                          '+#13#10+
         '               (SELECT P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO,                                  '+#13#10+
         '                       SUM(P.PLSDEBITOCORRENTE) AS VLRCREDITO,                                                       '+#13#10+
         '                       SUM(P.PLSCREDITOCOR) AS VLRDEBITO,                                                            '+#13#10+
         '                       SUM(P.PLSCREDITOCOR - P.PLSDEBITOCORRENTE) AS TOTAL                                           '+#13#10+
         '                  FROM PLANOSALDO P                                                                                  '+#13#10+
         '                 WHERE P.PEREXERCICIO = ' + pExercicio                                                                +#13#10+
         '                   AND P.PERNUMERO = ' + pPeriodo                                                                     +#13#10+
         '                 GROUP BY P.PLACONTA, P.PLANO, P.PEREXERCICIO, P.PERNUMERO, P.PLSTIPO) PS3                           '+#13#10+
         '         WHERE TC.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA                                                           '+#13#10+
         '           AND ((TRIM(PS1.PLACONTA(+)) = TRIM(PC.PLACONTA)) AND                                                      '+#13#10+
         '                (PS1.PLANO(+) = PC.PLANO))                                                                            '+#13#10+
         '           AND ((TRIM(PS2.PLACONTA(+)) = TRIM(PC.PLACONTA)) AND                                                      '+#13#10+
         '                (PS2.PLANO(+) = PC.PLANO))                                                                            '+#13#10+
         '           AND ((TRIM(PS3.PLACONTA(+)) = TRIM(PC.PLACONTA)) AND                                                      '+#13#10+
         '                (PS3.PLANO(+) = PC.PLANO))                                                                            '+#13#10+
         '           AND PC.PLACONTA = LXC.PLACONTA                                                                            '+#13#10+
         '           AND PC.PLANO = LXC.PLANO                                                                                  '+#13#10+
         '           AND LR.IDNATUREZA = NA.IDNATUREZA                                                                         '+#13#10+
         '           AND LXC.IDLINHA = LR.IDLINHA                                                                              '+#13#10+
         '           AND P.PLANO = PC.PLANO                                                                                    '+#13#10+
         '           AND P.IDPESSOA = PE.IDPESSOA                                                                              '+#13#10+
         '           AND LR.IDNORMA = ' + pIdNorma + ')                                                                        ';

  cdsAux.Data := GetDataPacket(sSQL);
  if not cdsAux.IsEmpty then
  begin
    if cdsAux.FieldByName('ACRESCIMO').AsCurrency <> 0 then
      pVlrAcrescimo := cdsAux.FieldByName('ACRESCIMO').AsCurrency;

    if cdsAux.FieldByName('REDUCAO').AsCurrency <> 0 then
      pVlrReducao := cdsAux.FieldByName('REDUCAO').AsCurrency;
  end;

end;

function TCtrlSPED.RetornaVersaoEFD(pDataInicio: TDateTime): string;
begin
  Result :=  '';

  if (pDataInicio >= StrToDate('01/01/2011')) and
     (pDataInicio <= StrToDate('30/06/2012')) then
     Result := '002'
  else
    if (pDataInicio >= StrToDate('01/07/2012')) and
       (pDataInicio <= StrToDate('31/05/2018')) then
        Result := '003'
    else
      if (pDataInicio >= StrToDate('01/05/2018')) and
         (pDataInicio <= StrToDate('31/12/2018')) then
          Result := '004'
      else
        if (pDataInicio >= StrToDate('01/01/2019')) and
           (pDataInicio <= StrToDate('31/12/2019')) then
            Result := '005'
        else
          if (pDataInicio >= StrToDate('01/01/2020')) then
               Result := '006';
end;

end.

