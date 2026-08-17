{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidad               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit RRelatWeb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables, uSistema,
  ADODb, DBClient, Provider, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, uCMTypes, TXRB;


type
  TRptRelatWeb = class(TFrmCmReport)
    cdsTestaPer: TClientDataSet;
    cdsAux: TClientDataSet;
    cdsCotacaoMoeda: TClientDataSet;
    cdsEmpresaProp: TClientDataSet;
    dsEmpresaProp: TwwDataSource;
    pplEmpresaProp: TppBDEPipeline;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
    procedure CrmRptCMChangeConnection(Sender: TObject; Connection: TADOConnection);
    procedure CrmRptCMChangeConnectionType(Sender: TObject; ConnectionType: TDbConnectionType);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FLinhaAcima,FLinhaAbaixo,FSiglaMoedaCorr  : string;
    FExcluiuBloqueados : Boolean;
  public
    { Public declarations }
  protected
    sMascaraContas     : String;
    sMascaraCCusto     : String;
    sMascaraUnNeg      : String;
    sIntegra_Plano     : String;
    sPacTipoPerResult  : String;
    //====================================================================================
    // Incluído por Sergio Almeida em 17/11/2001
    //====================================================================================
    clCorMestre : string;
    clCorMestreEsp : TColor;
    iUnidGlobal : integer;
    iExercicioAtual : integer;
    property bExcluiuBloqueados : Boolean read FExcluiuBloqueados write FExcluiuBloqueados;
    property sLinhaAcima   : String read FLinhaAcima write FLinhaAcima;
    property sLinhaAbaixo  : String read FLinhaAbaixo write FLinhaAbaixo;
    property sSiglaMoedaCorr : String read FSiglaMoedaCorr write FSiglaMoedaCorr;
    function TestaNatureza(sDemNat, sFlagNat:string; rVal:double):boolean;
    function TestaPeriodo( bMostramsg : boolean; sDataBase : string;
                           sDataLanc : string; cSistOri  : string;
                           var liExercicio, liPeriodo, liEmpresa : LongInt;
                           var sMensagem : String ): Boolean;
    function TestaCotacaoMoeda(iCodMoeda: LongInt;sDataLanc,sExato: String):Extended;
    procedure EspecificaParametros(cdsDemo : TClientDataSet; bndDetalheDemo : TppDetailBand);
    //====================================================================================
    function Espaco(sTexto: String; iNumCar: Integer): String;
    function CalcMascaraPorGrau(sMascara: String; iGrau: Integer): string;
    function CalcGrau(sMascara, sConteudo: String): Integer;
    function CalcGrauMax(sMascara: String): Integer;
    function CalcNumEleGrau(sMascara: String; iGrau: Integer): Integer;

    Procedure AbreImagemEmpresaProp;
  end;

implementation

Uses uCtrlPadroes;

{$R *.DFM}

//========================================================================================
// Incluído por Sergio Almeida em 17/11/2001 08:01
//========================================================================================
function TRptRelatWeb.TestaPeriodo(bMostramsg : boolean;
                                   sDataBase : string;
                                   sDataLanc : string;
                                   cSistOri  : string;
                               var liExercicio,
                                   liPeriodo,
                                   liEmpresa : LongInt; var sMensagem : String): Boolean;
Begin
   Result      := true;
   sMensagem   := '';
   with cdsTestaPer do
   begin
      If Active Then Close;
      Data := Padroes.GetDataPacket(' SELECT ' +
                                    '    PERNUMERO, ' +
                                    '    PEREXERCICIO, ' +
                                    '    PERBLOQUE, ' +
                                    '    PERBLOINT ' +
                                    ' FROM ' +
                                    '    PERIODO ' +
                                    ' WHERE ' +
                                    '    (TO_DATE(' + QuotedStr(sDataLanc) + ',' + QuotedStr('DD/MM/YYYY') + ') BETWEEN PERDATINI AND PERDATFIM) AND ' +
                                    '    (IDPESSOA =' + IntToStr(liEmpresa) + ') ');
      //----------------------------------------------------------------------------------
      if isEmpty then
      begin
         Result := false;
         sMensagem := 'A Data ' + sDataLanc + ' não pertence a nenhum período cadastrado.';
         exit;
      end;
      //----------------------------------------------------------------------------------
      if RecordCount > 1 then
      begin
         Result := false;
         sMensagem :='A Data ' + sDataLanc + ' pertence a mais de um período. Verifique.';
         exit;
      end;
      //----------------------------------------------------------------------------------
      liExercicio := FieldByName('PEREXERCICIO').AsInteger;
      liPeriodo   := FieldByName('PERNUMERO').AsInteger;
      Close;
   end;
end;
//========================================================================================
// Incluído por Sergio Almeida em 17/11/2001 08:01
//========================================================================================
function TRptRelatWeb.TestaNatureza(sDemNat, sFlagNat:string; rVal:double):boolean;
begin
   if ((sDemNat = 'C') and
      (sFlagNat = 'C') and
      (rVal < 0)) or
      ((sDemNat = 'D') and
      (sFlagNat = 'D') and
      (rVal < 0)) or
      ((sDemNat = 'C') and
      (sFlagNat = 'D') and
      (rVal > 0)) or
      ((sDemNat = 'D') and
      (sFlagNat = 'C') and
      (rVal > 0)) then begin
      Result := true;
   end else begin
      Result := false;
   end;
end;
//========================================================================================
// Incluído por Sergio Almeida em 17/11/2001 08:01
//========================================================================================
function TRptRelatWeb.TestaCotacaoMoeda(iCodMoeda : LongInt; sDataLanc, sExato : String) : Extended;
Var
   sSql: String;
begin
   If cdsCotacaoMoeda.Active Then cdsCotacaoMoeda.Close;
   
   if sExato = 'S' then
      sSql := ' SELECT M.MOECODIGO,C.COTVALOR,M.MOEDESC,M.MOESIGLA ' +
                                  ' FROM COTACAOMOEDA C, MOEDA M ' +
                                  ' WHERE (C.MOECODIGO = M.MOECODIGO)' +
                                  '   AND (C.MOECODIGO = '+InttoStr(iCodMoeda)+') '+
                                  '   AND (TO_DATE('''+sDataLanc+''',''dd/MM/yyyy'') >= C.COTDATA) '+
                                  '   AND (TO_DATE('''+sDataLanc+''',''dd/MM/yyyy'') <= DECODE(C.COTDATAFIM,NULL,C.COTDATA,C.COTDATAFIM))'
   else
      sSql := ' SELECT M.MOECODIGO,C.COTVALOR,M.MOEDESC,M.MOESIGLA ' +
                                  ' FROM COTACAOMOEDA C, MOEDA M ' +
                                  ' WHERE (C.MOECODIGO = M.MOECODIGO) '+
                                  '   AND (C.MOECODIGO = '+InttoStr(iCodMoeda)+') '+
                                  '   AND (C.COTDATA <= TO_DATE('''+sDataLanc+''',''dd/MM/yyyy'')) '+
                                  ' ORDER BY C.COTDATA DESC';
   //----------------------------------------------------------------------------------
   If cdsCotacaoMoeda.Active Then cdsCotacaoMoeda.Close;
   cdsCotacaoMoeda.Data := Padroes.GetDataPacket(sSql);
   
   cdsCotacaoMoeda.First;
   if not cdsCotacaoMoeda.IsEmpty then
      result := cdsCotacaoMoeda.FieldByName('COTVALOR').AsFloat
   else
      result := 0;

   cdsCotacaoMoeda.Close;
end;
//========================================================================================
// Incluído por Sergio Almeida em 17/11/2001 08:01
//========================================================================================
procedure TRptRelatWeb.EspecificaParametros(cdsDemo : TClientDataSet; bndDetalheDemo : TppDetailBand);
var
   x : Integer;
begin
   x := 0;
   try
      while x <= ComponentCount-1 do
      begin
         if (Components[x] is tppDbText) and (tppDbText(Components[x]).Band = bndDetalheDemo) then
         begin
            if tppBdePipeline(tppDbText(Components[x]).DataPipeline).DataSource.DataSet.FieldByName(tppDbText(Components[x]).DataField).DataType = ftFloat Then
            begin
               tppDbText(Components[x]).BlankWhenZero := False;
               if cdsDemo.FieldByName('ELETIPOELEM').asString = 'T' then
                  tppDbText(Components[x]).BlankWhenZero := True;
            end;
            tppDbText(Components[x]).Font.Style := [];
            if cdsDemo.FieldByName('FLGNEGRITO').asString = 'S' then
               tppDbText(Components[x]).Font.Style :=[fsBold];
         end;
         inc(x);
      end;
   except
      showmessage(Components[x].Name);
   end;
end;
//========================================================================================
// Alterado por Sergio Almeida em 18/11/2001 as 14:00
//========================================================================================
procedure TRptRelatWeb.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
  inherited;
   With TClientDataSet.Create(Self) Do
   try
      If Active Then Close;
      Data := Padroes.GetDataPacket(
                      'SELECT ' +
                      '   MASCUNIDNEGOC, ' +
                      '   MASCCENTRORESPON, ' +
                      '   MASCARACC, ' +
                      '   MOEDACORRENTE ' +
                      'FROM ' +
                      '   PARAMGLOBAL ' +
                      'WHERE ' +
                      '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+')');
      sMascaraUnNeg:=FieldByName('MASCUNIDNEGOC').AsString;
      sMascaraCCusto:=FieldByName('MASCARACC').AsString;
      sSiglaMoedaCorr:=FieldByName('MOEDACORRENTE').AsString;
      //----------------------------------------------------------------------------------
      If Active Then Close;
      Data := Padroes.GetDataPacket(
                      'SELECT ' +
                      '   MOESIGLA ' +
                      'FROM ' +
                      '   MOEDA ' +
                      'WHERE ' +
                      '   (MOECODIGO = '+sSiglaMoedaCorr+') ');
      sSiglaMoedaCorr:=FieldByName('MOESIGLA').AsString;
      //----------------------------------------------------------------------------------
      If Active Then Close;
      Data := Padroes.GetDataPacket(
                      'SELECT ' +
                      '   PL.MASCARA, ' +
                      '   PC.PLANO, ' +
                      '   PC.PACTIPOPERRESULT ' +
                      'FROM ' +
                      '   PARAMCONTAB PC, ' +
                      '   PLANO PL ' +
                      'WHERE ' +
                      '   (PC.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND ' +
                      '   (PC.PLANO=PL.PLANO) ');
      sMascaraContas:=Trim(FieldByName('MASCARA').AsString);
      sIntegra_Plano:=Trim(FieldByName('PLANO').AsString);
      sPacTipoPerResult:=Trim(FieldByName('PACTIPOPERRESULT').AsString);
      Close;
   finally
      Free;
   end;
   //-------------------------------------------------------------------------------------
end;
//========================================================================================
procedure TRptRelatWeb.CrmRptCMChangeConnection(Sender: TObject; Connection: TADOConnection);
begin
   inherited;
   //-------------------------------------------------------------------------------------
end;
//========================================================================================
function TRptRelatWeb.Espaco(sTexto: String; iNumCar: Integer): String;
var
   indice : Integer;
   iTam   : Integer;
begin
   Result:='';
   if Trim(sTexto)='' then Exit;

   Result:=sTexto;
   iTam:=Length(sTexto);
   if iTam>=iNumCar then Exit;

   for indice:=1 to (iNumCar-iTam) do
       Result:=Result+#32;
end;

function TRptRelatWeb.CalcMascaraPorGrau(sMascara : String; iGrau : Integer): string;
var
   iNumElem: integer;
begin
   //Retorna a mascara até o grau solicitado
   //Ex.: Suponhamos a conta 11101 (grau 4) e a Mascara: 9.9.9.99.999
   //     CalcMascaraPorGrau('9.9.9.99.999',4) = '9.9.9.99'
   iNumElem := CalcNumEleGrau(sMascara,iGrau);
   result := copy(sMascara, 1, (iNumElem + iGrau - 1 ));
end;

function  TRptRelatWeb.CalcGrau(sMascara,sConteudo : String): Integer;
var
   iNumEleSP,iNumDigC,iNumDigM,i: Integer;
begin
   //Calcula o grau da conta indicada
   Result   := 1;
   sConteudo:=trim(sConteudo);
   sMascara :=trim(sMascara);
   iNumDigM :=Length(sMascara);
   iNumDigC :=Length(sConteudo);
   iNumEleSP:=0;
   for i:= 1 to iNumDigM do
   Begin
      if iNumEleSP>=iNumDigC then
         Break;
      if Copy(sMascara,i,1)='.' then
         Result:=Result+1
      else
         iNumEleSP:=iNumEleSP+1;
   end;
end;

function  TRptRelatWeb.CalcNumEleGrau(sMascara :String;iGrau:Integer): Integer;
var
   iNumDigM,iNumPontos,i: Integer;
begin
   //Retorna o número de elementos até o grau sem os pontos
   Result    := 0;
   iNumPontos:=1;
   sMascara  :=trim(sMascara);
   iNumDigM  :=Length(sMascara);
   for i:= 1 to iNumDigM do
   Begin
      if iNumPontos>iGrau then
         Break;
      if Copy(sMascara,i,1)='.' then
         iNumPontos:=iNumPontos+1
      else
         Result:=Result+1;
   end;
end;

function  TRptRelatWeb.CalcGrauMax(sMascara :String): Integer;
var
   iNumDigM,i: Integer;
begin
   //Calcula o número de graus máximo de acordo com a mascara
   Result   := 1;
   sMascara :=trim(sMascara);
   iNumDigM :=Length(sMascara);
   for i:= 1 to iNumDigM do
   Begin
      if Copy(sMascara,i,1)='.' then
         Result:=Result+1;
   end;
end;

procedure TRptRelatWeb.CrmRptCMChangeConnectionType(Sender: TObject; ConnectionType: TDbConnectionType);
begin
   inherited;
   
end;
//========================================================================================
// Incluído Fabio Barros e Marcos Inacio em 15/11/2001
//========================================================================================
procedure TRptRelatWeb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsAux.Close;
   cdsCotacaoMoeda.Close;
   cdsTestaPer.Close;
   cdsEmpresaProp.Close;
end;

procedure TRptRelatWeb.AbreImagemEmpresaProp;
begin
   If cdsEmpresaProp.Active Then cdsEmpresaProp.Close;
   cdsEmpresaProp.Data := Padroes.GetDataPacket(' SELECT ' +
                                                '   I.IMAGEM ' +
                                                'FROM ' +
                                                '   PESSOA P, IMAGENS I ' +
                                                'WHERE ' +
                                                '   P.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ' AND ' +
                                                '   P.IDIMAGEM = I.IDIMAGEM(+) ');


end;

end.
