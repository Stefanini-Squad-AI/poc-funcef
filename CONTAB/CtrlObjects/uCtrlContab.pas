unit uCtrlContab;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,
     uCtrlContaContabil,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

Type
  TCtrlContab = class(TCmControlObject)

  Protected
      procedure AfterInitialize;override;
  private
    _ParamLoaded: Boolean;
    FPlnCodigo     : Double;
    FReduza        : integer;
    FReduzp        : integer;
    FReduzr        : integer;
    FReduzd        : integer;
    FReduzc        : integer;
    FReduze        : integer;
    FReduzo        : integer;
    FSiglaMoeda    : string;
    FCaminhoFidelio:string;
    ContaContabilP  : TCtrlContaContabil;
    FExercicioAtual: Integer;
    //Fplanocontabcli : Integer;
   // Fplanocredcli   : Integer;
    Fcontacontabcli : String;
    Fcontacredcli   : String;
    FAceitaContraNat: String;
    FPacDebCre      : String;
    FPacPesqPlaResumida: String;
    FTipoOperLanca  : String;
    FTipoFechamento : string;
    FTipoOperMoeda  : string;
    FPerdaGanho     : string;
    FTipoOperImp    : string;
    FPlaReduz       : string;
    FDefTec         : String;
    FResCont        : String;
    FFdoCobOscRisc  : String;
    FProgPrev       : String;
    FFormDefTec     : String;
    FRevSupTecn     : String;
    FFormSupTec     : String;
    FResMat         : string;
    FRevDefTec      : String;
    FCodHist        : String;
    FDefTecA        : string;
    FResContA       : String;
    FFdoCobOscRiscA :String;
    FMoedaGeren1: Integer;
    FMoedaGerencial: Integer;
    FMoedaGeren2: Integer;
    FMoedaCotas: Integer;
    FMoedaOficial: Integer;
    FTestaExisteMoeda: Boolean;
    FCorrespond :string;
    FPlanoParam: Integer;
    FPlanoData: Integer;
    FMascaraContaParam: String;
    FNumeracaoPlanilha: String;
    FObrigaAtivProj: String;
    FObrigaTipoOper: String;
    FObrigaNumDoc: String;
    FObrigaHistorico: String;
    FCaixaAlta: String;
    FPermiteZero: String;
    FSubGrp1: String;
    FSubGrp2: String;
    FSubGrp3: String;
    FSubGrp4: String;
    FOrdenaSubConta: String;
    FTipoOpEncer: String;
    FDataUltFecha :TDateTime;
    FContaEncer: String;
    FMantemLancTela: String;
    FMascaraContaData: String;
    procedure SetPacSubGrp1(const Value: String);
    procedure SetPacSubGrp2(const Value: String);
    procedure SetPacSubGrp3(const Value: String);
    procedure SetPacSubGrp4(const Value: String);
    procedure SetExercicioAtual(const Value: Integer);
    procedure SetAceitaContraNat(const Value: String);
    procedure SetMoedaGeren1(const Value: Integer);
    procedure SetMoedaGeren2(const Value: Integer);
    procedure SetCorrespond(const Value : String);
    procedure SetMoedaGerencial(const Value: Integer);
    procedure SetMoedaOficial(const Value: Integer);
    procedure SetTestaExisteMoeda(const Value: Boolean);
    procedure SetPlanoData(const Value: Integer);
    procedure SetPlanoParam(const Value: Integer);
    procedure SetMascaraContaParam(const Value: String);
    procedure SetNumeracaoPlanilha(const Value: String);
    procedure SetObrigaAtivProj(const Value: String);
    procedure SetCaixaAlta(const Value: String);
    procedure SetPermiteZero(const Value: String);
    procedure SetContaEncer(const Value: String);
    procedure SetTipoOpEncer(const Value: String);
    procedure SetObrigaNumDoc(const Value: String);
    procedure SetObrigaTipoOper(const Value: String);
    procedure SetObrigaHistorico(const Value: String);
    procedure SetTipoFechamento(const Value: String);
    procedure SetTipoOperImp(const Value: String);
    procedure SetDataUltFecha(const Value: TDateTime);
    procedure SetMantemLancTela(const Value: String);
    procedure SetMascaraContaData(const Value: String);
  public
     // property Planocontabcli: integer Read Fplanocontabcli Write Fplanocontabcli;
     // property Planocredcli: integer Read Fplanocredcli Write Fplanocredcli;
      property PacDebCre: String Read FPacDebCre Write FPacDebCre;
      property PacPesqPlaResumida: String Read FPacPesqPlaResumida Write FPacPesqPlaResumida;
      property PlnCodigo: Double Read FPlnCodigo Write FPlnCodigo;
      property Contacontabcli: String Read Fcontacontabcli Write Fcontacontabcli;
      property Contacredcli: String Read Fcontacredcli Write Fcontacredcli;
      property Reduza: integer Read FReduza Write FReduza;
      property Reduzp: integer Read FReduzp Write FReduzp;
      property Reduzr: integer Read FReduzr Write FReduzr;
      property Reduzd: integer Read FReduzd Write FReduzd;
      property Reduzc: integer Read FReduzc Write FReduzc;
      property Reduze: integer Read FReduze Write FReduze;
      property Reduzo: integer Read FReduzo Write FReduzo;
      property DefTec: String Read FDefTec Write FDefTec;
      property PlaReduz: String Read FPlaReduz Write FPlaReduz;
      property ResCont: String Read FResCont Write FResCont;
      property FdoCobOscRisc: String Read FFdoCobOscRisc Write FFdoCobOscRisc;
      property ProgPrev: String Read FProgPrev Write FProgPrev;
      property FormDefTec: String Read FFormDefTec Write FFormDefTec;
      property RevSupTecn: String Read FRevSupTecn Write FRevSupTecn;
      property FormSupTec: String Read FFormSupTec Write FFormSupTec;
      property ResMat: String Read FResMat Write FResMat;
      property TipoOperMoeda: String Read FTipoOperMoeda Write FTipoOperMoeda;
      property RevDefTec: String Read FRevDefTec Write FRevDefTec;
      property CodHist: String Read FCodHist Write FCodHist;
      property DefTecA: String Read FDefTecA Write FDefTecA;
      property ResContA: String Read FResContA Write FResContA;
      property FdoCobOscRiscA: String Read FFdoCobOscRiscA Write FFdoCobOscRiscA;
      property TipoOperLanca: String Read FTipoOperLanca Write FTipoOperLanca;
      property OrdenaSubConta: String Read FOrdenaSubConta Write FOrdenaSubConta;
      property SiglaMoeda: String Read FSiglaMoeda Write FSiglaMoeda;
      property PerdaGanho: String Read FPerdaGanho Write FPerdaGanho;
      property CaminhoFidelio: String Read FCaminhoFidelio Write FCaminhoFidelio;
      Property DataUltFecha : TDateTime read FDataUltFecha write SetDataUltFecha;
      Property TipoOpEncer  : String read FTipoOpEncer write SetTipoOpEncer;
      Property TipoOperImp  : String read FTipoOperImp write SetTipoOperImp;
      Property ContaEncer  : String read FContaEncer write SetContaEncer;
      Property MantemLancTela: String read FMantemLancTela write SetMantemLancTela;
      Property SubGrp1: String read FSubGrp1 write SetPacSubGrp1;
      Property SubGrp2: String read FSubGrp2 write SetPacSubGrp2;
      Property SubGrp3: String read FSubGrp3 write SetPacSubGrp3;
      Property SubGrp4: String read FSubGrp4 write SetPacSubGrp4;
      Property ObrigaHistorico: String read FObrigaHistorico write SetObrigaHistorico;
      Property TipoFechamento: String read FTipoFechamento write SetTipoFechamento;
      Property ObrigaNumDoc: String read FObrigaNumDoc write SetObrigaNumDoc;
      Property ObrigaTipoOper: String read FObrigaTipoOper write SetObrigaTipoOper;
      Property ExercicioAtual : Integer read FExercicioAtual write SetExercicioAtual;
      Property AceitaContraNat: String read FAceitaContraNat write SetAceitaContraNat;
      Property NumeracaoPlanilha: String read FNumeracaoPlanilha write SetNumeracaoPlanilha;
      Property ObrigaAtivProj : String read FObrigaAtivProj write SetObrigaAtivProj;
      Property CaixaAlta : String  read FCaixaAlta write SetCaixaAlta;
      Property PermiteZero : String read FPermiteZero write SetPermiteZero;
      Property Correspond : String read FCorrespond write SetCorrespond;
      Property MoedaGerencial : Integer read FMoedaGerencial write SetMoedaGerencial;
      Property MoedaGeren1 : Integer read FMoedaGeren1 write SetMoedaGeren1;
      Property MoedaGeren2 : Integer read FMoedaGeren2 write SetMoedaGeren2;
      Property MoedaCotas : Integer read FMoedaCotas write FMoedaCotas;
      Property MoedaOficial : Integer read FMoedaOficial write SetMoedaOficial;
      Property TestaExisteMoeda : Boolean read FTestaExisteMoeda write SetTestaExisteMoeda;
      Property PlanoParam   : Integer read FPlanoParam write SetPlanoParam;
      Property MascaraContaParam : String read FMascaraContaParam write SetMascaraContaParam;
      Property MascaraContaData : String read FMascaraContaData write SetMascaraContaData;
      Property PlanoData    : Integer read FPlanoData write SetPlanoData;
      Constructor Create; Override;
      Destructor  Destroy;Override;
      {Esta função tem como objetivo retornar os Parametros do sistema de Contabilidade  }
      Function SelecionaParametros( IdEmpresa : Double ) : Boolean;
      Function SelecionaParametrosProc( IdEmpresa : Double ) : Boolean;
      {Esta função tem como objetivo retornar o Plano de Determinada Data  }
      Function SelecionaPlanoData(IdEmpresa: Double; sData: String): Boolean;
      Function SelecionaPlanoDataProc(IdEmpresa: Double; sData: String): Boolean;
      {Esta função tem como objetivo bloquear determinada data }
      Function BloqueiaData(idEmpresa : Double; sData: String): Boolean;
      {Esta função tem como objetivo testar se a data está bloqueada }
      Function TestaDataBloqueada(idEmpresa,idModulo : Double; sData: String): Boolean;
      Function TestaDataBloqueadaProc(idEmpresa,idModulo : Double; sData: String): Boolean;
      {Esta função retorna todos os registros da tabela PlanoPrevContail}
      Function 	RetornaRegistrosPlanoPrev :Boolean;
      {Esta função tem como objetivo retorna a sigla da moeda}
      Function RetornaSiglaMoeda(iCodMoeda :Integer) :Boolean;
      {Esta função repete o caracter passado n vezes(Tamanho)}
      Function ReplicateAnyThing(Caracter: Char; Tamanho: Integer): string;
      {Esta função tem o objetivo de remover qualquer  caracter de uma string}
      Function RemoveAnyThing(S: String; C:Char): String;
      {Esta função tem o objetivo de testar a cotacao de uma moeda}
      Function TestaCotacaoMoeda(rCodMoeda : Double; dDataLanc : TDateTime; bExato : Boolean) : Double;
      {Esta função faz decode}
      Function Decode(Expr,Exprc, ResultTrue,ResultFalse: Variant): Variant;
      {Esta função remove mascara}
      Function RemoveMascara( S : String ): String;

      {Esta função tem o objetivo de completar a string com zero}
      Function CompletaZero(sNome: String; iTam : integer):String;

      {Esta função tem o objetivo de retornar o nome do mes}
      Function RetornaNomeMes(iMes:Integer):String;

      {Esta função tem o objetivo de completar a string com zero}
      Function ZE(N:string; T:Integer):String;
      Function  RetiraEspacos(S:String): String;
      Function  MascaraAlfa(S:string): String;

  end;

implementation


function  TCtrlContab.MascaraAlfa(S:string): String;
Var sAuxiliar: String;
    x, iTam: Integer;
Begin
  sAuxiliar := S;
  iTam := Length(S);
  For X:=0 to iTam Do
  Begin
       Case SAuxiliar[x] of
       'Á','À','Ã','Ä','Â','á','à','ã','ä','â': SAuxiliar[x] := 'A';
       'Ô','Ó','Ò','Õ','Ö','ô','ó','ò','õ','ö': SAuxiliar[x] := 'O';
       'Ê','É','È','Ë','ê','é','è','ë': SAuxiliar[x] := 'E';
       'Î','Í','Ì','Ï','î','í','ì','ï': SAuxiliar[x] := 'I';
       'Û','Ü','Ú','Ù','û','ü','ú','ù': SAuxiliar[x] := 'U';
       'Ç','ç': SAuxiliar[x] := 'C';
       'Ñ','ñ': SAuxiliar[x] := 'N';
       '`','''','@','-','_','+','*','|','\','/','$','%','&': SAuxiliar[x] := ' ';
       ',': SAuxiliar[x] := '.';
       end;
  End;

  Result := UpperCase(sAuxiliar);
end;

Function TCtrlContab.RetiraEspacos(S:String): String;
Var sAuxiliar: String;
    iPosEspacos, iTam, x : Integer;
    sAtual: Char;
Begin
  //Retira Espaços em branco da string
  Result := S;

  sAuxiliar := Trim(S);

  iPosEspacos := Pos(' ',sAuxiliar);

  While  iPosEspacos <> 0 Do
  Begin
        iTam := Length(sAuxiliar);

        for x:= iposEspacos to iTam - 1 do
        Begin
          sAtual := sAuxiliar[x];
          sAuxiliar[x] := sAuxiliar[x+1];
          sAuxiliar[x+1] := sAtual;
        End;

        sAuxiliar := Trim(sAuxiliar);
        iPosEspacos := Pos(' ',sAuxiliar);
  End;

  Result := Trim(sAuxiliar);


End;

Function TCtrlContab.TestaCotacaoMoeda(rCodMoeda : Double; dDataLanc : TDateTime; bExato : Boolean) : Double;
var
   sSql: String;
   cdsCotacaoMoeda :TClientDataSet;
begin
   try
      cdsCotacaoMoeda:=TClientDataSet.Create(nil);
      try
         sSql:='SELECT '+
               '   M.MOECODIGO, '+
               '   C.COTVALOR, '+
               '   C.COTDATA, ' +
               '   M.MOEDESC, '+
               '   M.MOESIGLA '+
               'FROM '+
               '   COTACAOMOEDA C, '+
               '   MOEDA M '+
               'WHERE '+
               '   (M.MOECODIGO = C.MOECODIGO(+)) AND '+
               '   (M.MOECODIGO = '+FloatToStr(rCodMoeda)+') AND ';
         if bExato then
            sSql:=sSql+'(TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataLanc)+''',''dd/mm/yyyy'') >='+
                       '    C.COTDATA) AND '+
                       '(TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataLanc)+''',''dd/mm/yyyy'') <='+
                       '    DECODE(C.COTDATAFIM,NULL,C.COTDATA,C.COTDATAFIM))'
         else
            sSql:=sSql+'   (C.COTDATA <= TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataLanc)+''',''dd/mm/yyyy'')) '+
                       'ORDER BY C.COTDATA DESC ';
         cdsCotacaoMoeda.Data:=GetDataPacket(sSql);
         cdsCotacaoMoeda.First;
         if cdsCotacaoMoeda.IsEmpty then begin
            Result:=0;
            MessageInfo:='Moeda não Cadastrada';
         end else begin
            if cdsCotacaoMoeda.FieldByName('COTVALOR').IsNull then begin
               Result:=0;
               if bExato then
                  MessageInfo:='Não existe cotação cadastrada para a Moeda '+cdsCotacaoMoeda.FieldByName('MOEDESC').AsString+
                               ' no dia '+FormatDateTime('dd/mm/yyyy',dDataLanc)+'. Verifique.'
               else
                  MessageInfo:='Não existe cotação cadastrada para a Moeda '+cdsCotacaoMoeda.FieldByName('MOEDESC').AsString+
                               ' anterior ao dia '+FormatDateTime('dd/mm/yyyy',dDataLanc)+'. Verifique.';
            end else begin
               Result:=cdsCotacaoMoeda.FieldByName('COTVALOR').AsFloat;
            end;
         end;
      finally
         cdsCotacaoMoeda.Free;
      end;
   except
      on E:Exception do
      begin
         Result := 0;
         MessageInfo := E.Message;
      end;
   end;
end;

function  TCtrlContab.CompletaZero(sNome: String; iTam : integer):String;
var i, k : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := '';
   for k := 1 to (iTam - i) do
      Result := Result + '0';
   Result := Result + sNome;
end;

function TCtrlContab.SelecionaParametros( IdEmpresa : Double) : Boolean;
begin
      Result := True;

      If Not _ParamLoaded Then
      Begin
         {** GUSTAVO VIEGAS 23/04/2002 **}
         _Cds.Data := GetDataPacket(
                          'SELECT PACEXERCICIOATUAL, PACCONTRANATUR, PLANO, PACDIAMES, PACATIVPROJ,   ' +
                          '       PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2, PACMOEDAOFICIAL, ' +
                          '       PACREDUZA, PACREDUZP, PACREDUZR, PACREDUZD, PACREDUZC, PACCORRESPOND,' +
                          '       PACSUBGRP1, PACSUBGRP2, PACSUBGRP3, PACSUBGRP4,PACNUMDOC,DATAULTFECHA, ' +
                          '       PACREDUZO, PACREDUZE,PACTIPOPERRESULT,PACCONRESULT,FLGTIPOFECHAMENTO, ' +
                          '       FLGHISTCAIXAALTA, FLGPERMITEZERO,PACTIPOOPER,PACOBRIGAHIST,PACTIPOPERIMPTXT, ' +
                          '       CAMINHOFIDELIO,PACTIPOPERLANC, PACMANTEM,PACORDEMSUBCONTA,PACPERDAGANHO, '+
                          '       PACDEFITECN,PACRESECONT,PACFDOCOBOSCRISC,PACPROGPREV,PACFORMDEFITECN, '+
                          '       PACREVESUPETECN,PACFORMSUPETECN,PACRESEMAT,PACREVEDEFITECN,PACHISTDEFSUP, '+
                          '       PACDEFITECNA,PACRESECONTA,PACFDOCOBOSCRISCA,PACTIPOPERMOEDA,PACMOEDACOTAS, '+
                          '       PACCODRED,CONTACONTABCLI,CONTACREDCLI,PACPLNCODIGO,PACDEBCRE, PACPESQPLALANC '+
                          'FROM PARAMCONTAB                         ' +
                          'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')');


         if _Cds.isEmpty then begin
           // Fplanocontabcli    := 0;
           // Fplanocredcli      := 0;
            FPacDebCre         := '';
            Fcontacontabcli    := '';
            Fcontacredcli      := '';
            FplnCodigo         := 0;
            FReduza            := 0;
            FMantemLancTela    := '';
            FReduzp            := 0;
            FReduzr            := 0;
            FReduzd            := 0;
            FReduzc            := 0;
            FReduze            := 0;
            FReduzo            := 0;
            FExercicioAtual    := 0;
            FSubGrp1           := '';
            FOrdenaSubconta    := '';
            FPacPesqPlaResumida := '';
            FSubGrp2           := '';
            FSubGrp3           := '';
            FTipoFechamento    := '';
            FPerdaGanho        := '';
            FMoedaCotas        := 0;
            FDefTec            := '';
            FResCont           := '';
            FFdoCobOscRisc     := '';
            FProgPrev          := '';
            FFormDefTec        := '';
            FRevSupTecn        := '';
            FFormSupTec        := '';
            FResMat            := '';
            FRevDefTec         := '';
            FCodHist           := '';
            FPlareduz          := '';
            FDefTecA           := '';
            FResContA          := '';
            FFdoCobOscRiscA    := '';
            FTipoOperLanca     := '';
            FTipoOperMoeda     := '';
            FSubGrp4           := '';
            FTipoOperImp       := '';
            FCorrespond        := '';
            FTipoOpEncer       := '';
            FObrigaTipoOper    := '';
            FContaEncer        := '';
            FNumeracaoPlanilha := '';
            FCaminhoFidelio    := '';
            FObrigaAtivProj    := '';
            FObrigaNumdoc      := '';
            FObrigaHistorico   := '';
            FCaixaAlta         := '';
            FAceitaContraNat   := '';
            FDataUltFecha      := 0;
            FPermiteZero       := '';
            FMoedaGerencial    := 0;
            FMoedaGeren1       := 0;
            FMoedaGeren2       := 0;
            FMoedaOficial      := 0;
            FPlanoParam        := 0;
            MessageInfo := 'Não Existe nenhum parâmetro contábil para esta Empresa';
            Result := False;
            _ParamLoaded := False;
         end else begin
            MessageInfo := '';
            FPacPesqPlaResumida := _Cds.FieldByName('PACPESQPLALANC').AsString;
            FPacDebCre          := _Cds.FieldByName('PACDEBCRE').AsString;
            FplnCodigo          := _Cds.FieldByName('PACPLNCODIGO').AsFloat;
            Fcontacontabcli     := _Cds.FieldByName('CONTACONTABCLI').AsString;
            Fcontacredcli       := _Cds.FieldByName('CONTACREDCLI').AsString;
            FMoedaCotas         := _Cds.FieldByName('PACMOEDACOTAS').AsInteger;
            FTipoOperMoeda      := _Cds.FieldByName('PACTIPOPERMOEDA').AsString;
            FOrdenaSubConta     := _Cds.FieldByName('PACORDEMSUBCONTA').AsString;
            FMantemLancTela     := _Cds.FieldByName('PACMANTEM').AsString;
            FTipoOperLanca      := _Cds.FieldByName('PACTIPOPERLANC').AsString;
            FCaminhoFidelio     := _Cds.FieldByName('CAMINHOFIDELIO').AsString;
            FPerdaGanho         := _Cds.FieldByName('PACPERDAGANHO').AsString;
            FTipoOperImp        := _Cds.FieldByName('PACTIPOPERIMPTXT').AsString;
            FExercicioAtual     := _Cds.FieldByName('PACEXERCICIOATUAL').AsInteger;
            FAceitaContraNat    := _Cds.FieldByName('PACCONTRANATUR').AsString;
            FNumeracaoPlanilha  := _Cds.FieldByName('PACDIAMES').AsString;
            FPlaReduz           := _Cds.FieldByName('PACCODRED').AsString;
            FMoedaGerencial     := _Cds.FieldByName('PACMOEDAGERENCIAL').AsInteger;
            FMoedaGeren1        := _Cds.FieldByName('PACMOEDAGEREN1').AsInteger;
            FMoedaGeren2        := _Cds.FieldByName('PACMOEDAGEREN2').AsInteger;
            FMoedaOficial       := _Cds.FieldByName('PACMOEDAOFICIAL').AsInteger;
            FPlanoParam         := _Cds.FieldByName('PLANO').AsInteger;
            FObrigaAtivProj     := _Cds.FieldByName('PACATIVPROJ').AsString;
            FObrigaNumDoc       := _Cds.FieldByName('PACNUMDOC').AsString;
            FObrigaHistorico    := _Cds.FieldByName('PACOBRIGAHIST').AsString;
            FObrigaTipoOper     := _Cds.FieldByName('PACTIPOOPER').AsString;
            FCaixaAlta          := _Cds.FieldByName('FLGHISTCAIXAALTA').AsString;
            FPermiteZero        := _Cds.FieldByName('FLGPERMITEZERO').AsString;
            FSubGrp1            := _Cds.FieldByName('PACSUBGRP1').AsString;
            FSubGrp2            := _Cds.FieldByName('PACSUBGRP2').AsString;
            FSubGrp3            := _Cds.FieldByName('PACSUBGRP3').AsString;
            FSubGrp4            := _Cds.FieldByName('PACSUBGRP4').AsString;
            FCorrespond         := _Cds.FieldByName('PACCORRESPOND').AsString;
            FTipoOpEncer        := _Cds.FieldByName('PACTIPOPERRESULT').AsString;
            FContaEncer         := _Cds.FieldByName('PACCONRESULT').AsString;
            FReduza             := _Cds.FieldByName('PACREDUZA').AsInteger;
            FReduzp             := _Cds.FieldByName('PACREDUZP').AsInteger;
            FReduzr             := _Cds.FieldByName('PACREDUZR').AsInteger;
            FReduzd             := _Cds.FieldByName('PACREDUZD').AsInteger;
            FReduzc             := _Cds.FieldByName('PACREDUZC').AsInteger;
            FReduze             := _Cds.FieldByName('PACREDUZE').AsInteger;
            FReduzo             := _Cds.FieldByName('PACREDUZO').AsInteger;
            FTipoFechamento     := _Cds.FieldByName('FLGTIPOFECHAMENTO').AsString;
            FDataUltFecha       := _Cds.FieldByName('DATAULTFECHA').AsDateTime;
            FDefTec             := _Cds.FieldByName('PACDEFITECN').AsString;
            FResCont            := _Cds.FieldByName('PACRESECONT').AsString;
            FFdoCobOscRisc      := _Cds.FieldByName('PACFDOCOBOSCRISC').AsString;
            FProgPrev           := _Cds.FieldByName('PACPROGPREV').AsString;
            FFormDefTec         := _Cds.FieldByName('PACFORMDEFITECN').AsString;
            FRevSupTecn         := _Cds.FieldByName('PACREVESUPETECN').AsString;
            FFormSupTec         := _Cds.FieldByName('PACFORMSUPETECN').AsString;
            FResMat             := _Cds.FieldByName('PACRESEMAT').AsString;
            FRevDefTec          := _Cds.FieldByName('PACREVEDEFITECN').AsString;
            FCodHist            := _Cds.FieldByName('PACHISTDEFSUP').AsString;
            FDefTecA            := _Cds.FieldByName('PACDEFITECNA').AsString;
            FResContA           := _Cds.FieldByName('PACRESECONTA').AsString;
            FFdoCobOscRiscA     := _Cds.FieldByName('PACFDOCOBOSCRISCA').AsString;

            if not ContaContabilP.BuscaMascaraConta(FPlanoParam) then
            Begin
              Result := False;
              MessageInfo := ContaContabilP.MessageInfo;
              Exit;
            End;

            FMascaraContaParam := ContaContabilP.MascaraConta;

            Result := True;
            _ParamLoaded := True;
         end;

         if (FMoedaGerencial <> 0) or (FMoedaGeren1 <> 0) or (FMoedaGeren2 <> 0) or (FMoedaOficial <> 0) then
            FTestaExisteMoeda := True
         else
            FTestaExisteMoeda := False;
      End;
end;

function TCtrlContab.RemoveAnyThing(S: String; C:Char): String;
var x : Integer;
begin
   For x:= 1 To Length(S) do
   Begin
      if s[x] = C Then
      Begin
         Delete(S,x,1);
      End;
   End;

   Result := S;

end;


Function TCtrlContab.ZE(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := Trim(MascaraAlfa(N));

     temp := RetiraEspacos(temp);

     Tam := length(temp);

     for cont:=1 to t - Tam do
     temp:=temp+'0';
     result := temp;
end;

Function TCtrlContab.ReplicateAnyThing(Caracter: Char; Tamanho: Integer): string;
var
  iMax    : Integer;
  cRetorno: string;
begin
  cRetorno := '';
  iMax := 1;
  while iMax <= Tamanho do
  begin
    cRetorno := cRetorno + Caracter;
    iMax := iMax + 1;
  end;
  Result := cRetorno;

end;

function TCtrlContab.RetornaSiglaMoeda(iCodMoeda:integer):Boolean;
begin
    result       := false;
       {** GUSTAVO VIEGAS 23/04/2002 **}
      _Cds.Data := GetDataPacket('SELECT                                       ' +
                                 '    MOESIGLA                                 ' +
                                 'FROM                                         ' +
                                 '   MOEDA                                     ' +
                                 'WHERE (MOECODIGO  = '+ FloatToStr(iCodMoeda)+')');

     If Not _Cds.isEmpty Then
     Begin
        Result := True;
        FSiglaMoeda  := _Cds.FieldByName('MOESIGLA').asString;
     End;

end;


procedure TCtrlContab.SetExercicioAtual(const Value: Integer);
begin
  FExercicioAtual := Value;
end;

procedure TCtrlContab.SetAceitaContraNat(const Value: String);
begin
  FAceitaContraNat := Value;
end;

procedure TCtrlContab.SetMoedaGeren1(const Value: Integer);
begin
  FMoedaGeren1 := Value;
end;

procedure TCtrlContab.SetMoedaGeren2(const Value: Integer);
begin
  FMoedaGeren2 := Value;
end;

procedure TCtrlContab.SetMoedaGerencial(const Value: Integer);
begin
  FMoedaGerencial := Value;
end;

procedure TCtrlContab.SetMoedaOficial(const Value: Integer);
begin
  FMoedaOficial := Value;
end;

procedure TCtrlContab.SetTestaExisteMoeda(const Value: Boolean);
begin
  FTestaExisteMoeda := Value;
end;

procedure TCtrlContab.SetPlanoData(const Value: Integer);
begin
  FPlanoData := Value;
end;

procedure TCtrlContab.SetPlanoParam(const Value: Integer);
begin
  FPlanoParam := Value;
end;

function TCtrlContab.SelecionaPlanoData(IdEmpresa: Double; sData: String): Boolean;
begin
      Result := True;
      {** GUSTAVO VIEGAS 23/04/2002 **}
      _Cds.Data := GetDataPacket('SELECT PLANO   ' +
                                 'FROM PLANODATA ' +
                                 'WHERE ( TO_DATE('''+sData+''',''DD/MM/YYYY'') BETWEEN DATAINICIO AND DATAFIM )' +
                                 '  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')');

      if _Cds.isEmpty then begin
         FPlanoData := FPlanoParam;
      end else begin
         FPlanoData := _Cds.FieldByName('PLANO').AsInteger;
      end;

      if not ContaContabilP.BuscaMascaraConta(FPlanoData) then
      Begin
         Result := False;
         MessageInfo := ContaContabilP.MessageInfo;
         Exit;
      End;

     FMascaraContaData := ContaContabilP.MascaraConta;

end;

procedure TCtrlContab.SetMascaraContaParam(const Value: String);
begin
  FMascaraContaParam := Value;
end;

constructor TCtrlContab.Create;
begin
  inherited;
  ContaContabilP  := TCtrlContaContabil.Create;
  _ParamLoaded := False;
end;

destructor TCtrlContab.Destroy;
begin
  inherited;
  ContaContabilP.Free;
end;

Function TCtrlContab.RetornaRegistrosPlanoPrev :Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
 {  If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.RetornaRegistrosPlanoPrev;
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin }
       {** GUSTAVO VIEGAS 23/04/2002 **}
      _Cds.Data := GetDataPacket(
      'SELECT                                       ' +
      '   IDPLANOPREV, NOME                         ' +
      'FROM                                         ' +
      '  PLANPREVCONTABIL                           ' +
      'ORDER BY NOME                                ');

      Result := Not _Cds.isEmpty;

end;

function TCtrlContab.BloqueiaData(idEmpresa : Double; sData: String): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.BloqueiaData(idEmpresa,sData);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      {** GUSTAVO VIEGAS 23/04/2002 **}
      Result := ExecSQL('UPDATE PARAMCONTAB SET PACDATABLOQ = TO_DATE('''+sData+''',''DD/MM/YYYY'') ' +
                        'WHERE ((PACDATABLOQ < TO_DATE('''+sData+''',''DD/MM/YYYY'')) OR (PACDATABLOQ IS NULL))' +
                        '  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')');
      If Not Result Then
         MessageInfo := 'Erro ao Bloquear a Data.';
   end;
end;

function TCtrlContab.TestaDataBloqueada(idEmpresa,idModulo: Double;
  sData: String): Boolean;
begin
      Result := True;
      {** GUSTAVO VIEGAS 23/04/2002 **}
      _Cds.Data := GetDataPacket('SELECT PACDATABLOQ                                 ' +
                                 'FROM PARAMCONTAB                                   ' +
                                 'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')       ' +
                                 ' AND  (PACDATABLOQ IS NOT NULL)                    ' +
                                 ' AND  (PACDATABLOQ >= TO_DATE('''+sData+''',''DD/MM/YYYY'')) ');

      if not _Cds.isEmpty then begin
         Result := False;
         MessageInfo := 'Contabilidade Bloqueada até '+_Cds.FieldByName('PACDATABLOQ').AsString;
      end;

      _Cds.Data := GetDataPacket('SELECT (SYSDATE - NUMDIAS) as DATALIM ' +
                                 'FROM DIASBLOQMOD                      ' +
                                 'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+') ' +
                                 ' AND  (IDMODULO = '+FloatToStr(IdModulo)+')');

      if (not _Cds.isEmpty) and (StrToDate(sdata) < _Cds.FieldByName('DATALIM').AsDateTime) then begin
         Result := False;
         MessageInfo := 'Contabilidade Bloqueada até '+_Cds.FieldByName('DATALIM').AsString;
      end;
end;

procedure TCtrlContab.SetNumeracaoPlanilha(const Value: String);
begin
  FNumeracaoPlanilha := Value;
end;
procedure TCtrlContab.SetCorrespond(const Value: String);
begin
  FCorrespond := Value;
end;

procedure TCtrlContab.SetObrigaAtivProj(const Value: String);
begin
  FObrigaAtivProj := Value;
end;

procedure TCtrlContab.SetCaixaAlta(const Value: String);
begin
  FCaixaAlta := Value;
end;

procedure TCtrlContab.SetPermiteZero(const Value: String);
begin
  FPermiteZero := Value;
end;

procedure TCtrlContab.SetPacSubGrp1(const Value: String);
begin
  FSubGrp1 := Value;
end;

procedure TCtrlContab.SetPacSubGrp2(const Value: String);
begin
  FSubGrp2 := Value;
end;

procedure TCtrlContab.SetPacSubGrp3(const Value: String);
begin
  FSubGrp3 := Value;
end;

procedure TCtrlContab.SetPacSubGrp4(const Value: String);
begin
  FSubGrp4 := Value;
end;




procedure TCtrlContab.SetContaEncer(const Value: String);
begin
  FContaEncer := Value;
end;

procedure TCtrlContab.SetTipoOpEncer(const Value: String);
begin
  FTipoOpEncer := Value;
end;

procedure TCtrlContab.SetObrigaNumDoc(const Value: String);
begin
    FObrigaNumDoc := Value;
end;

procedure TCtrlContab.SetObrigaTipoOper(const Value: String);
begin
   FObrigaTipoOper := Value;
end;

procedure TCtrlContab.SetObrigaHistorico(const Value: String);
begin
   FObrigaHistorico := Value;
end;

procedure TCtrlContab.SetTipoFechamento(const Value: String);
begin
   FTipoFechamento := Value;
end;

procedure TCtrlContab.SetDataUltFecha(const Value: TDateTime);
begin
     FDataUltFecha := Value;
end;

procedure TCtrlContab.SetTipoOperImp(const Value: String);
begin
  FTipoOperImp := Value;
end;

procedure TCtrlContab.AfterInitialize;
begin
  inherited;
  ContaContabilP.initializeas(self);
end;

procedure TCtrlContab.SetMantemLancTela(const Value: String);
begin
  FMantemLancTela := Value;
end;

function TCtrlContab.SelecionaParametrosProc(IdEmpresa: Double): Boolean;
begin
      Result := True;

      If Not _ParamLoaded Then
      Begin
         {** GUSTAVO VIEGAS 23/04/2002 **}
         OpenDataSet('SELECT PACEXERCICIOATUAL, PACCONTRANATUR, PLANO, PACDIAMES, PACATIVPROJ,   ' +
                     '       PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2, PACMOEDAOFICIAL, ' +
                     '       PACREDUZA, PACREDUZP, PACREDUZR, PACREDUZD, PACREDUZC, PACCORRESPOND,' +
                     '       PACSUBGRP1, PACSUBGRP2, PACSUBGRP3, PACSUBGRP4,PACNUMDOC,DATAULTFECHA, ' +
                     '       PACREDUZO, PACREDUZE,PACTIPOPERRESULT,PACCONRESULT,FLGTIPOFECHAMENTO, ' +
                     '       FLGHISTCAIXAALTA, FLGPERMITEZERO,PACTIPOOPER,PACOBRIGAHIST,PACTIPOPERIMPTXT, ' +
                     '       CAMINHOFIDELIO,PACTIPOPERLANC, PACMANTEM,PACORDEMSUBCONTA,PACPERDAGANHO, '+
                     '       PACDEFITECN,PACRESECONT,PACFDOCOBOSCRISC,PACPROGPREV,PACFORMDEFITECN, '+
                     '       PACREVESUPETECN,PACFORMSUPETECN,PACRESEMAT,PACREVEDEFITECN,PACHISTDEFSUP, '+
                     '       PACDEFITECNA,PACRESECONTA,PACFDOCOBOSCRISCA,PACTIPOPERMOEDA,PACMOEDACOTAS, '+
                     '       PACCODRED,CONTACONTABCLI,CONTACREDCLI,PACPLNCODIGO,PACDEBCRE,PACPESQPLALANC '+
                     'FROM PARAMCONTAB                         ' +
                     'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')');

         if _lDataSet.isEmpty then begin
           // Fplanocontabcli    := 0;
           // Fplanocredcli      := 0;
            FPacDebCre         := '';
            Fplncodigo         := 0;
            Fcontacontabcli    := '';
            Fcontacredcli      := '';
            FReduza            := 0;
            FMantemLancTela    := '';
            FReduzp            := 0;
            FReduzr            := 0;
            FReduzd            := 0;
            FReduzc            := 0;
            FReduze            := 0;
            FReduzo            := 0;
            FExercicioAtual    := 0;
            FMoedaCotas        := 0;
            FPacPesqPlaResumida := '';
            FSubGrp1           := '';
            FSubGrp2           := '';
            FSubGrp3           := '';
            FTipoFechamento    := '';
            FTipoOperLanca     := '';
            FSubGrp4           := '';
            FTipoOperImp       := '';
            FCorrespond        := '';
            FPlaReduz          := '';
            FTipoOpEncer       := '';
            FObrigaTipoOper    := '';
            FContaEncer        := '';
            FNumeracaoPlanilha := '';
            FCaminhoFidelio    := '';
            FObrigaAtivProj    := '';
            FObrigaNumdoc      := '';
            FObrigaHistorico   := '';
            FCaixaAlta         := '';
            FAceitaContraNat   := '';
            FDataUltFecha      := 0;
            FPermiteZero       := '';
            FMoedaGerencial    := 0;
            FMoedaGeren1       := 0;
            FMoedaGeren2       := 0;
            FMoedaOficial      := 0;
            FPlanoParam        := 0;
            MessageInfo := 'Não Existe nenhum parâmetro contábil para esta Empresa';
            Result := False;
            _ParamLoaded := False;
         end else begin
            MessageInfo  := '';
            FPacPesqPlaResumida := _lDataSet.FieldByName('PACPESQPLALANC').AsString;
            FPacDebCre          := _lDataSet.FieldByName('PACDEBCRE').AsString;
            FplnCodigo          := _lDataSet.FieldByName('PACPLNCODIGO').AsFloat;
            Fcontacontabcli     := _lDataSet.FieldByName('CONTACONTABCLI').AsString;
            Fcontacredcli       := _lDataSet.FieldByName('CONTACREDCLI').AsString;
            FMoedaCotas         := _lDataSet.FieldByName('PACMOEDACOTAS').AsInteger;
            FMantemLancTela     := _lDataSet.FieldByName('PACMANTEM').AsString;
            FTipoOperLanca      := _lDataSet.FieldByName('PACTIPOPERLANC').AsString;
            FCaminhoFidelio     := _lDataSet.FieldByName('CAMINHOFIDELIO').AsString;
            FTipoOperImp        := _lDataSet.FieldByName('PACTIPOPERIMPTXT').AsString;
            FExercicioAtual     := _lDataSet.FieldByName('PACEXERCICIOATUAL').AsInteger;
            FPlaReduz           := _lDataSet.FieldByName('PACCODRED').AsString;
            FAceitaContraNat    := _lDataSet.FieldByName('PACCONTRANATUR').AsString;
            FNumeracaoPlanilha  := _lDataSet.FieldByName('PACDIAMES').AsString;
            FMoedaGerencial     := _lDataSet.FieldByName('PACMOEDAGERENCIAL').AsInteger;
            FMoedaGeren1        := _lDataSet.FieldByName('PACMOEDAGEREN1').AsInteger;
            FMoedaGeren2        := _lDataSet.FieldByName('PACMOEDAGEREN2').AsInteger;
            FMoedaOficial       := _lDataSet.FieldByName('PACMOEDAOFICIAL').AsInteger;
            FPlanoParam         := _lDataSet.FieldByName('PLANO').AsInteger;
            FObrigaAtivProj     := _lDataSet.FieldByName('PACATIVPROJ').AsString;
            FObrigaNumDoc       := _lDataSet.FieldByName('PACNUMDOC').AsString;
            FObrigaHistorico    := _lDataSet.FieldByName('PACOBRIGAHIST').AsString;
            FObrigaTipoOper     := _lDataSet.FieldByName('PACTIPOOPER').AsString;
            FCaixaAlta          := _lDataSet.FieldByName('FLGHISTCAIXAALTA').AsString;
            FPermiteZero        := _lDataSet.FieldByName('FLGPERMITEZERO').AsString;
            FSubGrp1            := _lDataSet.FieldByName('PACSUBGRP1').AsString;
            FSubGrp2            := _lDataSet.FieldByName('PACSUBGRP2').AsString;
            FSubGrp3            := _lDataSet.FieldByName('PACSUBGRP3').AsString;
            FSubGrp4            := _lDataSet.FieldByName('PACSUBGRP4').AsString;
            FCorrespond         := _lDataSet.FieldByName('PACCORRESPOND').AsString;
            FTipoOpEncer        := _lDataSet.FieldByName('PACTIPOPERRESULT').AsString;
            FContaEncer         := _lDataSet.FieldByName('PACCONRESULT').AsString;
            FReduza             := _lDataSet.FieldByName('PACREDUZA').AsInteger;
            FReduzp             := _lDataSet.FieldByName('PACREDUZP').AsInteger;
            FReduzr             := _lDataSet.FieldByName('PACREDUZR').AsInteger;
            FReduzd             := _lDataSet.FieldByName('PACREDUZD').AsInteger;
            FReduzc             := _lDataSet.FieldByName('PACREDUZC').AsInteger;
            FReduze             := _lDataSet.FieldByName('PACREDUZE').AsInteger;
            FReduzo             := _lDataSet.FieldByName('PACREDUZO').AsInteger;
            FTipoFechamento     := _lDataSet.FieldByName('FLGTIPOFECHAMENTO').AsString;
            FDataUltFecha       := _lDataSet.FieldByName('DATAULTFECHA').AsDateTime;
            if not ContaContabilP.BuscaMascaraConta(FPlanoParam) then
            Begin
              Result := False;
              MessageInfo := ContaContabilP.MessageInfo;
              Exit;
            End;

            FMascaraContaParam := ContaContabilP.MascaraConta;

            Result := True;
            _ParamLoaded := True;
         end;

         if (FMoedaGerencial <> 0) or (FMoedaGeren1 <> 0) or (FMoedaGeren2 <> 0) or (FMoedaOficial <> 0) then
            FTestaExisteMoeda := True
         else
            FTestaExisteMoeda := False;
      End;
end;

procedure TCtrlContab.SetMascaraContaData(const Value: String);
begin
  FMascaraContaData := Value;
end;

function TCtrlContab.SelecionaPlanoDataProc(IdEmpresa: Double;
  sData: String): Boolean;
begin
      Result := True;
      {** GUSTAVO VIEGAS 23/04/2002 **}
      OpenDataSet('SELECT PLANO   ' +
                  'FROM PLANODATA ' +
                  'WHERE ( TO_DATE('''+sData+''',''DD/MM/YYYY'') BETWEEN DATAINICIO AND DATAFIM )' +
                  '  AND ( IDPESSOA = '+FloatToStr(IdEmpresa)+')');

      if _lDataSet.isEmpty then begin
         FPlanoData := FPlanoParam;
      end else begin
         FPlanoData := _lDataSet.FieldByName('PLANO').AsInteger;
      end;

      if not ContaContabilP.BuscaMascaraConta(FPlanoData) then
      Begin
         Result := False;
         MessageInfo := ContaContabilP.MessageInfo;
         Exit;
      End;

     FMascaraContaData := ContaContabilP.MascaraConta;


end;

function TCtrlContab.TestaDataBloqueadaProc(idEmpresa,idModulo: Double;
  sData: String): Boolean;
begin
      Result := True;
      {** GUSTAVO VIEGAS 23/04/2002 **}
      OpenDataSet('SELECT PACDATABLOQ                                 ' +
                   'FROM PARAMCONTAB                                   ' +
                   'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')       ' +
                   ' AND  (PACDATABLOQ IS NOT NULL)                    ' +
                   ' AND  (PACDATABLOQ >= TO_DATE('''+sData+''',''DD/MM/YYYY'')) ');

      if not _lDataSet.IsEmpty then begin
         Result := False;
         MessageInfo := 'Contabilidade Bloqueada até '+_lDataSet.FieldByName('PACDATABLOQ').AsString;
      end;

      _Cds.Data := GetDataPacket('SELECT (SYSDATE - NUMDIAS) as DATALIM ' +
                                 'FROM DIASBLOQMOD                      ' +
                                 'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+') ' +
                                 ' AND  (IDMODULO = '+FloatToStr(IdModulo)+')');

      if (not _Cds.isEmpty) and (StrToDate(sdata) < _Cds.FieldByName('DATALIM').AsDateTime) then begin
         Result := False;
         MessageInfo := 'Contabilidade Bloqueada até '+_Cds.FieldByName('DATALIM').AsString;
      end;

end;

function TCtrlContab.Decode(Expr, Exprc, ResultTrue, ResultFalse: Variant): Variant;
begin
   If Expr = Exprc Then
      Result     := ResultTrue
   Else
      Result     := ResultFalse;

end;

function TCtrlContab.RemoveMascara(S: String): String;
var x : Integer;
    d, c : Char;
    sSemMasc : String;
begin
   sSemMasc := '';
   S := trim(S);
   c := '.';
   d := '-';
   for x:= 1 To Length(S) do begin
      if s[x] = D then
         Break;
      if (s[x] <> C) then
         sSemMasc := sSemMasc + s[x];
   end;
   RemoveMascara := sSemMasc;
end;


function TCtrlContab.RetornaNomeMes(iMes: Integer): String;
begin
    Result := '';
    case iMes of
      1  : Result := 'Janeiro';
      2  : Result := 'Fevereiro';
      3  : Result := 'Março';
      4  : Result := 'Abril';
      5  : Result := 'Maio';
      6  : Result := 'Junho';
      7  : Result := 'Julho';
      8  : Result := 'Agosto';
      9  : Result := 'Setembro';
      10 : Result := 'Outubro';
      11 : Result := 'Novembro';
      12 : Result := 'Dezembro';
    end;
end;

end.



