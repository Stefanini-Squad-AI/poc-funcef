{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Métodos e Propriedades Globais do Projeto          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}

unit UModulocap;

interface

Uses
  SysUtils, Forms, Controls, StdCtrls, Wwdbigrd, Wwdbgrid, Classes, Windows,
  Dialogs, uCmTypes, db, pPCtrls, DbClient, uCmControlObject;

type TModulo = Class( TCmControlObject )
   private
    FExcluiContab: Boolean;
    FObrigaTrdxImposto: Boolean;
    FExisteParametros: Boolean;
    FValidaCCBaixa: Boolean;
    FControlaEmisCheque: Boolean;
    FObrigaTrdxCCxConta: Boolean;
    FLancaBaixaFloat: Boolean;
    FCorrigeDocAuto: Boolean;
    FCadastraModeloRelat: Boolean;
    FExcluiPlanil: Boolean;
    FEstornaFinanc: Boolean;
    FEmiteLancaBaixa: Boolean;
    FTipoBordero: Boolean;
    FObrigaFormaPagto: Boolean;
    FVlrRetencao: Double;
    FIdForCli: Double;
    FIdForCliIni: Double;
    FValorZero: Double;
    FIdReports: Integer;
    FIdTipoCliAdianto: Integer;
    FCodAForne: Integer;
    FNumLancto: Integer;
    FUsuario: Integer;
    FSubContaNaoIdent: Integer;
    FIdTipoProcRad: Integer;
    FRamoFornAdianto: Integer;
    FEmpresaProp: Integer;
    FModeloImpressora: Integer;
    FIndiceTipoBordero: Integer;
    FOrigemCm: Integer;
    FUnidNegoc: Integer;
    FCodDocCPMF: Integer;
    FCodDocumento: Integer;
    FsIntegraVHL: string;
    FFormParam: String;
    FContaNaoIdentificado: String;
    FPpReports: String;
    FFormEventos: String;
    FHistPadFinan: String;
    FVersao: string;
    FImpressoraDefault: string;
    FLancaFinan: string;
    FNomeReport: String;
    FCodTipRecDes: String;
    FLoteBordero: string;
    FSisCodOrigem: string;
    FCodPortForma: string;
    FPrevEfet: string;
    FModificaAlteradoresDocBaixados: Boolean;
    procedure SetCadastraModeloRelat(const Value: Boolean);
    procedure SetCodAForne(const Value: Integer);
    procedure SetCodDocCPMF(const Value: Integer);
    procedure SetCodDocumento(const Value: Integer);
    procedure SetCodPortForma(const Value: string);
    procedure SetCodTipRecDes(const Value: String);
    procedure SetContaNaoIdentificado(const Value: String);
    procedure SetControlaEmisCheque(const Value: Boolean);
    procedure SetCorrigeDocAuto(const Value: Boolean);
    procedure SetEmiteLancaBaixa(const Value: Boolean);
    procedure SetEmpresaProp(const Value: Integer);
    procedure SetEstornaFinanc(const Value: Boolean);
    procedure SetExcluiContab(const Value: Boolean);
    procedure SetExcluiPlanil(const Value: Boolean);
    procedure SetExisteParametros(const Value: Boolean);
    procedure SetFormEventos(const Value: String);
    procedure SetFormParam(const Value: String);
    procedure SetHistPadFinan(const Value: String);
    procedure SetIdForCli(const Value: Double);
    procedure SetIdForCliIni(const Value: Double);
    procedure SetIdReports(const Value: Integer);
    procedure SetIdTipoCliAdianto(const Value: Integer);
    procedure SetIdTipoProcRad(const Value: Integer);
    procedure SetImpressoraDefault(const Value: string);
    procedure SetIndiceTipoBordero(const Value: Integer);
    procedure SetLancaBaixaFloat(const Value: Boolean);
    procedure SetLancaFinan(const Value: string);
    procedure SetLoteBordero(const Value: string);
    procedure SetModeloImpressora(const Value: Integer);
    procedure SetNomeReport(const Value: String);
    procedure SetNumLancto(const Value: Integer);
    procedure SetObrigaFormaPagto(const Value: Boolean);
    procedure SetObrigaTrdxCCxConta(const Value: Boolean);
    procedure SetObrigaTrdxImposto(const Value: Boolean);
    procedure SetOrigemCm(const Value: Integer);
    procedure SetPpReports(const Value: String);
    procedure SetPrevEfet(const Value: string);
    procedure SetRamoFornAdianto(const Value: Integer);
    procedure SetsIntegraVHL(const Value: string);
    procedure SetSisCodOrigem(const Value: string);
    procedure SetSubContaNaoIdent(const Value: Integer);
    procedure SetTipoBordero(const Value: Boolean);
    procedure SetUnidNegoc(const Value: Integer);
    procedure SetUsuario(const Value: Integer);
    procedure SetValidaCCBaixa(const Value: Boolean);
    procedure SetValorZero(const Value: Double);
    procedure SetVersao(const Value: string);
    procedure SetVlrRetencao(const Value: Double);
    procedure SetModificaAlteradoresDocBaixados(const Value: Boolean);
   public
    Constructor Create; Override;
    Destructor Destroy; Override;

    property  ValorZero: Double read FValorZero write SetValorZero;
    property  VlrRetencao: Double read FVlrRetencao write SetVlrRetencao;
    property  IdForCli: Double read FIdForCli write SetIdForCli;
    property  IdForCliIni: Double read FIdForCliIni write SetIdForCliIni;
    property  ImpressoraDefault: string read FImpressoraDefault write SetImpressoraDefault;
    property  Versao: string read FVersao write SetVersao;
    property  HistPadFinan: String read FHistPadFinan write SetHistPadFinan;
    property  SisCodOrigem: string read FSisCodOrigem write SetSisCodOrigem;
    property  LoteBordero: string read FLoteBordero write SetLoteBordero;
    property  sIntegraVHL: string read FsIntegraVHL write SetsIntegraVHL;
    property  PrevEfet: string read FPrevEfet write SetPrevEfet;
    property  CodPortForma: string read FCodPortForma write SetCodPortForma;
    property  LancaFinan: string read FLancaFinan write SetLancaFinan;
    property  ContaNaoIdentificado: String read FContaNaoIdentificado write SetContaNaoIdentificado;
    property  NomeReport: String read FNomeReport write SetNomeReport;
    property  FormEventos: String read FFormEventos write SetFormEventos;
    property  FormParam: String read FFormParam write SetFormParam;
    property  PpReports: String read FPpReports write SetPpReports;
    property  CodTipRecDes: String read FCodTipRecDes write SetCodTipRecDes;
    property  SubContaNaoIdent: Integer read FSubContaNaoIdent write SetSubContaNaoIdent;
    property  ModeloImpressora: Integer read FModeloImpressora write SetModeloImpressora;
    property  EmpresaProp: Integer read FEmpresaProp write SetEmpresaProp;
    property  Usuario: Integer read FUsuario write SetUsuario;
    property  IdTipoCliAdianto: Integer read FIdTipoCliAdianto write SetIdTipoCliAdianto;
    property  UnidNegoc: Integer read FUnidNegoc write SetUnidNegoc;
    property  CodAForne: Integer read FCodAForne write SetCodAForne;
    property  IndiceTipoBordero: Integer read FIndiceTipoBordero write SetIndiceTipoBordero;
    property  RamoFornAdianto: Integer read FRamoFornAdianto write SetRamoFornAdianto;
    property  IdTipoProcRad: Integer read FIdTipoProcRad write SetIdTipoProcRad;
    property  NumLancto: Integer read FNumLancto write SetNumLancto;
    property  IdReports: Integer read FIdReports write SetIdReports;
    property  OrigemCm: Integer read FOrigemCm write SetOrigemCm;
    property  CodDocumento: Integer read FCodDocumento write SetCodDocumento;
    property  CodDocCPMF: Integer read FCodDocCPMF write SetCodDocCPMF;
    property  TipoBordero: Boolean read FTipoBordero write SetTipoBordero;
    property  EstornaFinanc: Boolean read FEstornaFinanc write SetEstornaFinanc;
    property  EmiteLancaBaixa: Boolean read FEmiteLancaBaixa write SetEmiteLancaBaixa;
    property  ObrigaFormaPagto: Boolean read FObrigaFormaPagto write SetObrigaFormaPagto;
    property  CorrigeDocAuto: Boolean read FCorrigeDocAuto write SetCorrigeDocAuto;
    property  ExcluiContab: Boolean read FExcluiContab write SetExcluiContab;
    property  ControlaEmisCheque: Boolean read FControlaEmisCheque write SetControlaEmisCheque;
    property  LancaBaixaFloat: Boolean read FLancaBaixaFloat write SetLancaBaixaFloat;
    property  ExcluiPlanil: Boolean read FExcluiPlanil write SetExcluiPlanil;
    property  CadastraModeloRelat: Boolean read FCadastraModeloRelat write SetCadastraModeloRelat;
    property  ExisteParametros: Boolean read FExisteParametros write SetExisteParametros;
    property  ObrigaTrdxCCxConta: Boolean read FObrigaTrdxCCxConta write SetObrigaTrdxCCxConta;
    property  ObrigaTrdxImposto: Boolean read FObrigaTrdxImposto write SetObrigaTrdxImposto;
    property  ValidaCCBaixa: Boolean read FValidaCCBaixa write SetValidaCCBaixa;
    property  ModificaAlteradoresDocBaixados: Boolean read FModificaAlteradoresDocBaixados write SetModificaAlteradoresDocBaixados;

    procedure BuscaParamCap(iEmpresa: Integer);
    Function GravaNumFatura(iCoddocumento, iNumLancto :LongInt; sNumFatura :String; cTipoDoc: Char; sMascara: String) :Boolean;
    function ArredondaParaComparar(rValor:Real;iNumDecimais: Integer):Real;
    function VerificaLinhaGrid(DataSet: TDataSet; iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
    function ExisteRegularizacao(iCodDocumento: LOngInt):Boolean;
    function ProcessoRadLiberado(NumLote: LongInt): Boolean;
    function ValidaDataPagtoRecto(iCoddocumento :LongInt; datapagto:string): Boolean;
    function ContabilizaIdModulo(sOper: string; iCodDoc: LongInt): boolean;
    function StatusIsAtivo(IdPessoa: Integer): Boolean;
   End;

var
  Modulo : TModulo;
  vDataModulo: TDateTime;

implementation

Uses uString, uRad, uCMFileUtils, uCtrlParamIntegra, uMensErro, uDataBase,
     uSistema, DCapCarMT, uCtrlPadroes;

Constructor TModulo.Create;
Begin
  Inherited Create;
  fValorZero            := 0;
  fIdReports            := 0;
  fOrigemCm             := 0;
  fCodDocumento         := 0;
  fNomeReport           := '';
  fFormEventos          := '';
  fFormParam            := '';
  fPpReports            := '';
  fCodTipRecDes         := '';
  fExisteParametros     := False;
  fObrigaTrdxCCxConta   := False;
  fObrigaTrdxImposto    := False;
  fCodDocCPMF           := 0;
  fValidaCCBaixa        := False;
End;

function TModulo.ContabilizaIdModulo(sOper: string; iCodDoc: LongInt): Boolean;
begin
  Result := True;

  if Trim(sOper) = '5' then
  Begin
    _Cds.Data := GetDataPacket('SELECT IDMODULO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDoc));

    if Not _Cds.IsEmpty then
      if _Cds.FieldByName('IDMODULO').AsInteger = 127 then
        Result := False;
  End;
end;

function TModulo.ArredondaParaComparar(rValor:Real;iNumDecimais: Integer):Real;
Var
  sMascara, sAuxValor:String;
Begin
    If iNumDecimais < 0 then
       sMascara := '%17.0f'
    Else
       sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

    sAuxValor := trim(Format(sMascara,[rValor]));

    while Pos('.',sAuxValor) <> 0 Do
             Delete(sAuxValor,Pos('.',sAuxValor),1);

    Result := StrToFloat(sAuxValor)
End;

procedure TModulo.BuscaParamCap(iEmpresa: Integer);
Begin
    _Cds.Data := GetDataPacket(
                 ' SELECT P.IMPGENERICA,P.IDTIPOCLIADIANTO, P.CODADFORNE, P.HISTPADFINAN, P.IDRAMOFORNECEDOR, ' +
                 ' P.IDIMPRESSORA, P.FLGESTEXCFINANC, P.FLGEMITELANCBAIX, P.FLGOBRIGFORMAPGTO, P.FLGCOMPLTIPOFAT, P.MASCARANODOCUM, ' +
                 ' P.FLGCORRIGEDOCAUTO, P.FLGEXCLUICONTAB, P.FLGCONTROLACHEQUE, P.FLGLANCAFLOAT, P.FLGEXCLUIPLANIL, R.NAME, ' +
                 ' R.FORMEVENTOS, R.FORMPARAMREL, R.PPREPORT, R.IDREPORTS, R.ORIGEMCM, P.FLGTRDXCCXCONTA, P.FLGTRDXIMPOSTOS, ' +
                 ' P.CODTIPDOCCPMF, P.FLGVALIDACCBAIXA, P.FLGMODADDOCPG '+
                 ' FROM PARAMCAP P, REPORTS R WHERE IDPESSOA = ' + IntToStr(iEmpresa) + ' AND RECPAG = ''' + ParamIntegra.RecPag + ''' AND P.IDREPORTS = R.IDREPORTS(+) AND P.ORIGEMCM = R.ORIGEMCM(+) ');

    If Not _Cds.IsEmpty Then
    Begin
       If Copy(_Cds.FieldByName('IMPGENERICA').AsString,Length(_Cds.FieldByName('IMPGENERICA').AsString),1) = '\' Then
          FImpressoraDefault := Copy(_Cds.FieldByName('IMPGENERICA').AsString,1,Length(_Cds.FieldByName('IMPGENERICA').AsString)-1)
       Else
          fImpressoraDefault := _Cds.FieldByName('IMPGENERICA').AsString;

       FIdTipocliAdianto    := _Cds.FieldByName('IDTIPOCLIADIANTO').AsInteger;
       FCodAForne           := _Cds.FieldByName('CODADFORNE').AsInteger;
       FHistPadFinan        := _Cds.FieldByName('HISTPADFINAN').AsString;
       FModeloImpressora    := _Cds.FieldByName('IDIMPRESSORA').AsInteger;
       FEstornaFinanc       := (_Cds.FieldByName('FLGESTEXCFINANC').AsString <> 'X');
       FEmiteLancaBaixa     := (_Cds.FieldByName('FLGEMITELANCBAIX').AsString = 'S');
       FObrigaFormaPagto    := (_Cds.FieldByName('FLGOBRIGFORMAPGTO').AsString = 'S');
       FCorrigeDocAuto      := (_Cds.FieldByName('FLGCORRIGEDOCAUTO').AsString = 'S');
       FExcluiContab        := (_Cds.FieldByName('FLGEXCLUICONTAB').AsString = 'S');
       FControlaEmisCheque  := (_Cds.FieldByName('FLGCONTROLACHEQUE').AsString = 'S');
       FRamoFornAdianto     := _Cds.FieldByName('IDRAMOFORNECEDOR').AsInteger;
       FLancaBaixaFloat     := (_Cds.FieldByName('FLGLANCAFLOAT').AsString = 'S');
       FExcluiPlanil        := (_Cds.FieldByName('FLGEXCLUIPLANIL').AsString = 'S');
       fIdReports           := _Cds.FieldByName('IDREPORTS').AsInteger;
       fOrigemCm            := _Cds.FieldByName('ORIGEMCM').AsInteger;
       fNomeReport          := _Cds.FieldByName('NAME').AsString ;
       fFormEventos         := _Cds.FieldByName('FORMEVENTOS').AsString ;
       fFormParam           := _Cds.FieldByName('FORMPARAMREL').AsString ;
       fPpReports           := _Cds.FieldByName('PPREPORT').AsString ;
       fObrigaTrdxCCxConta  := (_Cds.FieldByName('FLGTRDXCCXCONTA').AsString = 'S');
       fObrigaTrdxImposto   := (_Cds.FieldByName('FLGTRDXIMPOSTOS').AsString = 'S');
       fCodDocCPMF          := _Cds.FieldByName('CODTIPDOCCPMF').AsInteger;
       fValidaCCBaixa       := (_Cds.FieldByName('FLGVALIDACCBAIXA').AsString = 'S');
       fModificaAlteradoresDocBaixados := (_Cds.FieldByName('FLGMODADDOCPG').AsString <> 'N');

       _Cds.Data := GetDataPacket('SELECT CONTALANCNAOIDENT, SUBCONTANAOIDENT FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr(iEmpresa));
       If Not _Cds.IsEmpty Then
       Begin
          fContaNaoIdentificado := _Cds.FieldByName('CONTALANCNAOIDENT').AsString;
          fSubContaNaoIdent     := _Cds.FieldByName('SUBCONTANAOIDENT').AsInteger;
       End
       Else
       Begin
          fContaNaoIdentificado := '';
          fSubContaNaoIdent     := 0;
       End;

       fExisteParametros     := True;
    End
    Else
    Begin
       FImpressoraDefault    := '';
       FIdTipoCliAdianto     := 0;
       FCodAForne            := 0;
       FHistPadFinan         := '';
       FModeloImpressora     := -1;
       FEstornaFinanc        := True;
       FEmiteLancaBaixa      := False;
       FObrigaFormaPagto     := False;
       FCorrigeDocAuto       := False;
       FExcluiContab         := False;
       FControlaEmisCheque   := False;
       FRamoFornAdianto      := -1;
       FLancaBaixaFloat      := False;
       fContaNaoIdentificado := '';
       FExcluiPlanil         := False;
       fSubContaNaoIdent     := 0;
       fExisteParametros     := False;
       fIdReports            := 0;
       fOrigemCm             := 0;
       fNomeReport           := '';
       fFormEventos          := '';
       fFormParam            := '';
       fPpReports            := '';
       fObrigaTrdxCCxConta   := False;
       fObrigaTrdxImposto    := False;
       fCodDocCPMF           := 0;
       fValidaCCBaixa        := False;
       fModificaAlteradoresDocBaixados := True;
    End;

    _Cds.Data := GetDataPacket('SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO WHERE IDREFERENCIA = 6');

     If (Sistema.UsaRad) And (Not _Cds.IsEmpty) Then
        FIdTipoProcRad := _Cds.FieldByName('IDTIPOPROCESSO').AsInteger
     Else
        FIdTipoProcRad := 0;
End;

Function TModulo.VerificaLinhaGrid(DataSet: TDataSet; iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
Var X:Integer;
    sChave: String;
    ListaChave: TStrings;
Begin
   ListaChave := TStringList.Create;

   If DataSet.IsEmpty Then
   Begin
      Result := True;
      Exit;
   End;

   Try
      DataSet.First;
      While Not DataSet.Eof Do
      Begin
          sChave := '';
          For X:=0 To DataSet.FieldCount - 1 Do
              If (DataSet.Fields[X].Tag = iTagChave) Or (DataSet.Fields[X].Tag = iTagVazio) Then
              Begin
                 sChave  := sChave + Trim(DataSet.Fields[X].AsString);
                 If (Not bPermiteChaveVazia) And (DataSet.Fields[X].Tag <> iTagVazio) Then
                 Begin
                     If DataSet.Fields[X].IsNull Then
                     Begin
                       Application.MessageBox(PChar('O Campo ' + DataSet.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado'),'Atenção',Mb_IconInformation);
                       Result := False;
                       Exit;
                     End;
                 End;
              End;
          If ListaChave.IndexOf(sChave) <> -1 Then
          Begin
               Application.MessageBox(PChar('O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
          End
          Else
            If sChave = '' Then
            Begin
               Application.MessageBox(Pchar('O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
            End
            Else
               ListaChave.Add(sChave);
          DataSet.Next;
      End;
      DataSet.First;
      Result := True;
   Finally
      ListaChave.Free;
   End;
End;

function TModulo.ExisteRegularizacao(iCodDocumento: LOngInt):Boolean;
Begin
  With DtmCapCarMT Do
  Begin
    SQLTestaRegAdianto.Prepare;

    sqlTestaRegAdianto.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
    sqlTestaRegAdianto.ParamByName('OPERACAO').AsString := '16';
    sqlTestaRegAdianto.Open;

    Result := (Not CdsTestaRegAdianto.IsEmpty);

    If Result Then
       Msgdlg( 'Este lançamento corresponde a um adiantamento já regularizado ou ele consta num lote onde existiu tal regularização, Não é possível excluir/estornar a baixa' ,'Aviso',mtwarning,[mbOk],0);
  End;
End;

function TModulo.ProcessoRadLiberado(NumLote: LongInt): Boolean;
Var
  RadLote :Trad;
Begin
  With DtmCapCarMT Do
  Begin
    Result := True;
    RadLote := TRad.Create;

    Try
       If Sistema.UsaRAD Then
       Begin
         SQLTestaRad.Prepare;
         SQLTestaRad.ParamByName('NUMLOTE').AsFloat := NumLote;
         SQLTestaRad.Open;

         Result := CdsTestaRad.FieldByName('IDPROCESSO').IsNull;

         if Not Result Then
         Begin
           RadLote.IdProcesso   := CdsTestaRad.FieldByName('IDPROCESSO').AsInteger;
           Result               := RadLote.SituacaoProcesso;
           If Not Result Then
              Msgdlg('O Lote ' + IntToStr(NumLote) + ' não está autorizado para emissão','Aviso',mtinformation,[mbOk],0);
         End;
       End;

       If CdsTestaRad.Active Then CdsTestaRad.Close;
    finally
       RadLote.Free;
    End;
  End;
End;

Function TModulo.GravaNumFatura(iCoddocumento, iNumLancto :LongInt; sNumFatura :String; cTipoDoc: Char; sMascara: String) :Boolean;
Var
    sAuxNumFatura    :String;
    sSql             :String;
    Ano,Mes,Dia      :String;
    wAno,wMes,wDia   :Word;
    iAux, X, iPosFin :Integer;
    sValSeq          :String;
Begin
    sAuxNumFatura := sNumFatura;

    If (sMascara <> '') Then
    Begin
       sAuxNumFatura := sMascara;
       DecodeDate(Date,wAno,wMes,wDia);

       Ano  := IntToStr(wAno);
       Mes := IntToStr(wMes);
       Dia := IntToStr(wDia);

       If Length(Dia) = 1 Then
          Dia := '0' + Dia;

       If Length(Mes) = 1 Then
          Mes := '0' + Mes;


       If Length(Mes) = 1 Then
          Mes := '0' + Mes;

       If Length(Dia) = 1 Then
          Mes := '0' + Dia;

       iAux := Pos('DD',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Dia[1];
           sAuxNumFatura[iAux + 1] := Dia[2];
       End;

       iAux := Pos('MM',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Mes[1];
           sAuxNumFatura[iAux + 1] := Mes[2];
       End;

       iAux := Pos('YYYY',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Ano[1];
           sAuxNumFatura[iAux + 1] := Ano[2];
           sAuxNumFatura[iAux + 2] := Ano[3];
           sAuxNumFatura[iAux + 3] := Ano[4];
       End;

       iAux := Pos('YY',upperCase(sAuxNumFatura));
       If  iAux <> 0 Then
       Begin
           sAuxNumFatura[iAux] := Ano[3];
           sAuxNumFatura[iAux + 1] := Ano[4];
       End;

       iAux := Pos('#',upperCase(sAuxNumFatura));
       iPosFin := 0;
       If  iAux <> 0 Then
       Begin
           While Pos('#',upperCase(sAuxNumFatura)) <> 0 Do
           Begin
               iPosFin := Pos('#',upperCase(sAuxNumFatura));
               sAuxNumFatura[iPosFin] := '0';
           End;

           sValSeq := IntToStr(LeultRegistro(nil,'CERTFICADORETENCAO'));
           For X:=Length(sValSeq) DownTo 1 Do
           Begin
               sAuxNumFatura[iPosFin] := sValSeq[x];
               Dec(iPosFin);
           End;
       End;

       sSql := 'UPDATE LANCTODOCUM SET NUMRECIBO = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
               ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
               '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';

       Result := ((Trim(sAuxNumFatura) <> '') And ( Padroes.ExecSqlAndCommit(sSql)));
    End
    Else
    Begin
       If InputQuery('Atenção','Digite o Nº de controle Documento a ser impresso',sAuxNumFatura) Then
       Begin
          Case cTipoDoc of
          'F','C':
             sSql := 'UPDATE LANCTODOCUM SET NUMFATURA = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
                     ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
                     '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';
          'R':
             sSql := 'UPDATE LANCTODOCUM SET NUMRECIBO = ''' + sAuxNumFatura + ''', FLGFATEMITIDA = ''S''' +
                     ' WHERE (CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
                     '       (NUMLANCTO = ' + IntToStr(iNumLancto) + ')';
          End;

          Result := ((Trim(sAuxNumFatura) <> '') And ( Padroes.ExecSqlAndCommit(sSql)));
       End
       Else
          Result := False;
    End;
End;

Function TModulo.ValidaDataPagtoRecto(iCoddocumento :LongInt; datapagto:string): Boolean;
begin
   _Cds.Data := GetDataPacket('Select datalancto from lanctodocum where coddocumento='+
                                      inttostr(icoddocumento)+
                                      ' and operacao in (''2'',''3'',''1'',''14'') and '+
                                      ' datalancto > to_date('+#39+datapagto+#39+','+'''dd/mm/yyyy'')');
   result:= _Cds.IsEmpty;

   If Not Result Then
      MsgDlg('Data do Pagamento Menor que a do Lançamento do documento('+ _Cds.fieldbyname('datalancto').asstring+')','Erro',mterror,[mbOk],0);

   If _Cds.Active Then _Cds.close;
end;

function TModulo.StatusIsAtivo(IdPessoa: Integer): Boolean;
Var
   sNome :String;
begin
   If ParamIntegra.RecPag = 'P' Then
   Begin
      _Cds.Data := GetDataPacket(' SELECT FLGSTATUS FROM EMPRESAFORN WHERE IDFORCLI = ' + FloatToStr(IdPessoa) + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      sNome := 'Fornecedor\Favorecido';
   End
   Else
   Begin
      _Cds.Data := GetDataPacket('SELECT FLGSTATUS FROM EMPRESACLIENTE WHERE IDFORCLI = ' + FloatToStr(IdPessoa) + ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      sNome := 'Cliente';
   End;

   Result := _Cds.IsEmpty Or (_Cds.Fields[0].AsString <> 'I');

   If Not Result Then
      MsgDlg('Este ' + sNome +' está Inativo. Não é permitido fazer movimentação para o mesmo','Atenção',mtInformation,[mbOk],0);

   _Cds.Close;
end;

destructor TModulo.Destroy;
begin
  inherited;
  
end;

procedure TModulo.SetCadastraModeloRelat(const Value: Boolean);
begin
  FCadastraModeloRelat := Value;
end;

procedure TModulo.SetCodAForne(const Value: Integer);
begin
  FCodAForne := Value;
end;

procedure TModulo.SetCodDocCPMF(const Value: Integer);
begin
  FCodDocCPMF := Value;
end;

procedure TModulo.SetCodDocumento(const Value: Integer);
begin
  FCodDocumento := Value;
end;

procedure TModulo.SetCodPortForma(const Value: string);
begin
  FCodPortForma := Value;
end;

procedure TModulo.SetCodTipRecDes(const Value: String);
begin
  FCodTipRecDes := Value;
end;

procedure TModulo.SetContaNaoIdentificado(const Value: String);
begin
  FContaNaoIdentificado := Value;
end;

procedure TModulo.SetControlaEmisCheque(const Value: Boolean);
begin
  FControlaEmisCheque := Value;
end;

procedure TModulo.SetCorrigeDocAuto(const Value: Boolean);
begin
  FCorrigeDocAuto := Value;
end;

procedure TModulo.SetEmiteLancaBaixa(const Value: Boolean);
begin
  FEmiteLancaBaixa := Value;
end;

procedure TModulo.SetEmpresaProp(const Value: Integer);
begin
  FEmpresaProp := Value;
end;

procedure TModulo.SetEstornaFinanc(const Value: Boolean);
begin
  FEstornaFinanc := Value;
end;

procedure TModulo.SetExcluiContab(const Value: Boolean);
begin
  FExcluiContab := Value;
end;

procedure TModulo.SetExcluiPlanil(const Value: Boolean);
begin
  FExcluiPlanil := Value;
end;

procedure TModulo.SetExisteParametros(const Value: Boolean);
begin
  FExisteParametros := Value;
end;

procedure TModulo.SetFormEventos(const Value: String);
begin
  FFormEventos := Value;
end;

procedure TModulo.SetFormParam(const Value: String);
begin
  FFormParam := Value;
end;

procedure TModulo.SetHistPadFinan(const Value: String);
begin
  FHistPadFinan := Value;
end;

procedure TModulo.SetIdForCli(const Value: Double);
begin
  FIdForCli := Value;
end;

procedure TModulo.SetIdForCliIni(const Value: Double);
begin
  FIdForCliIni := Value;
end;

procedure TModulo.SetIdReports(const Value: Integer);
begin
  FIdReports := Value;
end;

procedure TModulo.SetIdTipoCliAdianto(const Value: Integer);
begin
  FIdTipoCliAdianto := Value;
end;

procedure TModulo.SetIdTipoProcRad(const Value: Integer);
begin
  FIdTipoProcRad := Value;
end;

procedure TModulo.SetImpressoraDefault(const Value: string);
begin
  FImpressoraDefault := Value;
end;

procedure TModulo.SetIndiceTipoBordero(const Value: Integer);
begin
  FIndiceTipoBordero := Value;
end;

procedure TModulo.SetLancaBaixaFloat(const Value: Boolean);
begin
  FLancaBaixaFloat := Value;
end;

procedure TModulo.SetLancaFinan(const Value: string);
begin
  FLancaFinan := Value;
end;

procedure TModulo.SetLoteBordero(const Value: string);
begin
  FLoteBordero := Value;
end;

procedure TModulo.SetModeloImpressora(const Value: Integer);
begin
  FModeloImpressora := Value;
end;

procedure TModulo.SetNomeReport(const Value: String);
begin
  FNomeReport := Value;
end;

procedure TModulo.SetNumLancto(const Value: Integer);
begin
  FNumLancto := Value;
end;

procedure TModulo.SetObrigaFormaPagto(const Value: Boolean);
begin
  FObrigaFormaPagto := Value;
end;

procedure TModulo.SetObrigaTrdxCCxConta(const Value: Boolean);
begin
  FObrigaTrdxCCxConta := Value;
end;

procedure TModulo.SetObrigaTrdxImposto(const Value: Boolean);
begin
  FObrigaTrdxImposto := Value;
end;

procedure TModulo.SetOrigemCm(const Value: Integer);
begin
  FOrigemCm := Value;
end;

procedure TModulo.SetPpReports(const Value: String);
begin
  FPpReports := Value;
end;

procedure TModulo.SetPrevEfet(const Value: string);
begin
  FPrevEfet := Value;
end;

procedure TModulo.SetRamoFornAdianto(const Value: Integer);
begin
  FRamoFornAdianto := Value;
end;

procedure TModulo.SetsIntegraVHL(const Value: string);
begin
  FsIntegraVHL := Value;
end;

procedure TModulo.SetSisCodOrigem(const Value: string);
begin
  FSisCodOrigem := Value;
end;

procedure TModulo.SetSubContaNaoIdent(const Value: Integer);
begin
  FSubContaNaoIdent := Value;
end;

procedure TModulo.SetTipoBordero(const Value: Boolean);
begin
  FTipoBordero := Value;
end;

procedure TModulo.SetUnidNegoc(const Value: Integer);
begin
  FUnidNegoc := Value;
end;

procedure TModulo.SetUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

procedure TModulo.SetValidaCCBaixa(const Value: Boolean);
begin
  FValidaCCBaixa := Value;
end;

procedure TModulo.SetValorZero(const Value: Double);
begin
  FValorZero := Value;
end;

procedure TModulo.SetVersao(const Value: string);
begin
  FVersao := Value;
end;

procedure TModulo.SetVlrRetencao(const Value: Double);
begin
  FVlrRetencao := Value;
end;

procedure TModulo.SetModificaAlteradoresDocBaixados(const Value: Boolean);
begin
  FModificaAlteradoresDocBaixados := Value;
end;

end.
