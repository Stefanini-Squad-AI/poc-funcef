unit uCtrlParamCAF;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes, Classes,  
     SysUtils, dbclient, Provider, uMidasUtil,  
     uDBParamCAF, uCtrlMoeda;

Type
   TCtrlParamCAF = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
      procedure AfterInitialize; Override;

   Private
      _dbParamCAF : TDbParamCAF;

      Fcds: TClientDataSet;

      Moeda : TCtrlMoeda;

      FCDPORTA: Integer;
      FPLANPREVPADRAO: Integer;
      FMOEDAOFICIAL: Integer;
      FPROXIMAPLACA: Integer;
      FTIPATUSALDOCONTAB: Integer;
      FEDITACODBEM: Integer;
      FMOEDAGERENCIALB: Integer;
      FFLGCALCCM: Integer;
      FMOEDAFISCAL: Integer;
      FMOEDAGERENCIAL: Integer;
      FEDITACODGRUPO: Integer;
      FPATROPADRAO: Integer;
      FFLGCLSDESBEM: Integer;
      FSEQBEMEMP: Integer;
      FATIVPROJETO: Integer;
      FDIGMASCPLACA: Integer;
      FPLANOVIGENTE: Integer;
      FCOLETORDADOS: Integer;
      FNUMTAXADEP: Integer;
      FFLGTIPOCALC: String;
      FINTEGRACAR: String;
      FMASCARACLASSE: String;
      FCDVELOC: String;
      FINTEGRACAP: String;
      FMASCCODGRUPO: String;
      FSISTEMAS: String;
      FINTEGRACONTAB: String;
      FCDPATH: String;
      FTIPOPERCTB: String;
      FFLGREMOVEPLANCTB: String;
      FMOEDAGERENCIALC: Integer;
      FFLGINTCAFCONT: String;
      FFLGCONTABFECHAM: Integer;
      FDTAINICAFMT: String;
      FPACDOBRADA: String;
      FFLGDIARIO: String;
      FFLGCTADEPREC: Integer;
      FTIPOCONJUNTO: Integer;
      FUSAPLANOPATRO: Boolean;
      FTIPOREAVAL: Integer;
      FMOEPADRAOARREDONDA: Boolean;
      FMOEDAPADRAO: Integer;
      FMOEPADRAODECIMAIS: Integer;
      FIDPAIS: Integer;
      // TotalPrev
      FIDPLANOPREVADM: Integer;
      FIDPATRO: Integer;
      FIDPLANOPREV: Integer;
      FFLGSEGREGAVIRTUAL: string;
    FAGRUPAHISTORICOCTB: Boolean;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetATIVPROJETO(const Value: Integer);
      procedure SetCDPATH(const Value: String);
      procedure SetCDPORTA(const Value: Integer);
      procedure SetCDVELOC(const Value: String);
      procedure SetCOLETORDADOS(const Value: Integer);
      procedure SetDIGMASCPLACA(const Value: Integer);
      procedure SetEDITACODBEM(const Value: Integer);
      procedure SetEDITACODGRUPO(const Value: Integer);
      procedure SetFLGCALCCM(const Value: Integer);
      procedure SetFLGCLSDESBEM(const Value: Integer);
      procedure SetFLGTIPOCALC(const Value: String);
      procedure SetINTEGRACAP(const Value: String);
      procedure SetINTEGRACAR(const Value: String);
      procedure SetINTEGRACONTAB(const Value: String);
      procedure SetMASCARACLASSE(const Value: String);
      procedure SetMASCCODGRUPO(const Value: String);
      procedure SetMOEDAFISCAL(const Value: Integer);
      procedure SetMOEDAGERENCIAL(const Value: Integer);
      procedure SetMOEDAGERENCIALB(const Value: Integer);
      procedure SetMOEDAOFICIAL(const Value: Integer);
      procedure SetNUMTAXADEP(const Value: Integer);
      procedure SetPATROPADRAO(const Value: Integer);
      procedure SetPLANOVIGENTE(const Value: Integer);
      procedure SetPLANPREVPADRAO(const Value: Integer);
      procedure SetPROXIMAPLACA(const Value: Integer);
      procedure SetSEQBEMEMP(const Value: Integer);
      procedure SetSISTEMAS(const Value: String);
      procedure SetTIPATUSALDOCONTAB(const Value: Integer);
      procedure SetTIPOPERCTB(const Value: String);
      procedure SetFLGREMOVEPLANCTB(const Value: String);
      procedure SetMOEDAGERENCIALC(const Value: Integer);
      procedure SetFLGINTCAFCONT(const Value: String);
      procedure SetFLGCONTABFECHAM(const Value: Integer);
      procedure SetDTAINICAFMT(const Value: String);
      procedure SetFLGDIARIO(const Value: String);
      procedure SetPACDOBRADA(const Value: String);
      procedure SetFLGCTADEPREC(const Value: Integer);
      procedure SetTIPOCONJUNTO(const Value: Integer);
      procedure SetUSAPLANOPATRO(const Value: boolean);
      procedure SetTIPOREAVAL(const Value: Integer);
      procedure SetMOEDAPADRAO(const Value: Integer);
      procedure SetMOEPADRAOARREDONDA(const Value: Boolean);
      procedure SetMOEPADRAODECIMAIS(const Value: Integer);
      procedure SetIDPAIS(const Value: Integer);
      // TotalPrev
      procedure SetFLGSEGREGAVIRTUAL(const Value: string);
      procedure SetIDPATRO(const Value: Integer);
      procedure SetIDPLANOPREV(const Value: Integer);
      procedure SetIDPLANOPREVADM(const Value: Integer);
    procedure SetAGRUPAHISTORICOCTB(const Value: Boolean);

   Public
      property cds : TClientDataSet read Fcds write Setcds;
      //----------------------------------------------------------------------------------
      // Propriedades do Objeto ParamCAF
      //----------------------------------------------------------------------------------
      property MOEDAOFICIAL      : Integer read FMOEDAOFICIAL write SetMOEDAOFICIAL;
      property MOEDAFISCAL       : Integer read FMOEDAFISCAL write SetMOEDAFISCAL;
      property MOEDAGERENCIAL    : Integer read FMOEDAGERENCIAL write SetMOEDAGERENCIAL;
      property MOEDAGERENCIALB   : Integer read FMOEDAGERENCIALB write SetMOEDAGERENCIALB;
      property MOEDAGERENCIALC   : Integer read FMOEDAGERENCIALC write SetMOEDAGERENCIALC;
      property MASCCODGRUPO      : String  read FMASCCODGRUPO write SetMASCCODGRUPO;
      property MASCARACLASSE     : String  read FMASCARACLASSE write SetMASCARACLASSE;
      property SEQBEMEMP         : Integer read FSEQBEMEMP write SetSEQBEMEMP;
      property EDITACODBEM       : Integer read FEDITACODBEM write SetEDITACODBEM;
      property EDITACODGRUPO     : Integer read FEDITACODGRUPO write SetEDITACODGRUPO;
      property SISTEMAS          : String  read FSISTEMAS write SetSISTEMAS;
      property FLGCALCCM         : Integer read FFLGCALCCM write SetFLGCALCCM;
      property FLGTIPOCALC       : String  read FFLGTIPOCALC write SetFLGTIPOCALC;
      property INTEGRACONTAB     : String  read FINTEGRACONTAB write SetINTEGRACONTAB;
      property INTEGRACAR        : String  read FINTEGRACAR write SetINTEGRACAR;
      property INTEGRACAP        : String  read FINTEGRACAP write SetINTEGRACAP;
      property PLANOVIGENTE      : Integer read FPLANOVIGENTE write SetPLANOVIGENTE;
      property TIPOPERCTB        : String  read FTIPOPERCTB write SetTIPOPERCTB;
      property FLGREMOVEPLANCTB  : String  read FFLGREMOVEPLANCTB write SetFLGREMOVEPLANCTB;
      property ATIVPROJETO       : Integer read FATIVPROJETO write SetATIVPROJETO;
      property PROXIMAPLACA      : Integer read FPROXIMAPLACA write SetPROXIMAPLACA;
      property DIGMASCPLACA      : Integer read FDIGMASCPLACA write SetDIGMASCPLACA;
      property FLGCLSDESBEM      : Integer read FFLGCLSDESBEM write SetFLGCLSDESBEM;
      property COLETORDADOS      : Integer read FCOLETORDADOS write SetCOLETORDADOS;
      property CDPORTA           : Integer read FCDPORTA write SetCDPORTA;
      property CDVELOC           : String  read FCDVELOC write SetCDVELOC;
      property CDPATH            : String  read FCDPATH write SetCDPATH;
      property PLANPREVPADRAO    : Integer read FPLANPREVPADRAO write SetPLANPREVPADRAO;
      property PATROPADRAO       : Integer read FPATROPADRAO write SetPATROPADRAO;
      property TIPATUSALDOCONTAB : Integer read FTIPATUSALDOCONTAB write SetTIPATUSALDOCONTAB;
      property NUMTAXADEP        : Integer read FNUMTAXADEP write SetNUMTAXADEP;
      property FLGINTCAFCONT     : String  read FFLGINTCAFCONT write SetFLGINTCAFCONT;
      property FLGCONTABFECHAM   : Integer read FFLGCONTABFECHAM write SetFLGCONTABFECHAM;
      property PACDOBRADA        : String  read FPACDOBRADA write SetPACDOBRADA;
      property FLGDIARIO         : String  read FFLGDIARIO write SetFLGDIARIO;
      property DTAINICAFMT       : String  read FDTAINICAFMT write SetDTAINICAFMT;
      property FLGCTADEPREC      : Integer read FFLGCTADEPREC write SetFLGCTADEPREC;
      property TIPOCONJUNTO      : Integer read FTIPOCONJUNTO write SetTIPOCONJUNTO;
      property TIPOREAVAL        : Integer read FTIPOREAVAL write SetTIPOREAVAL;
      property IDPAIS            : Integer read FIDPAIS write SetIDPAIS;
      //----------------------------------------------------------------------------------
      property MOEDAPADRAO : Integer read FMOEDAPADRAO write SetMOEDAPADRAO;
      property MOEPADRAODECIMAIS : Integer read FMOEPADRAODECIMAIS write SetMOEPADRAODECIMAIS;
      property MOEPADRAOARREDONDA : Boolean read FMOEPADRAOARREDONDA write SetMOEPADRAOARREDONDA;
      //----------------------------------------------------------------------------------
      // TotalPrev - SEGREGAÇÃO DE RECURSOS
      //----------------------------------------------------------------------------------
      property USAPLANOPATRO : boolean read FUSAPLANOPATRO write SetUSAPLANOPATRO;
      property FLGSEGREGAVIRTUAL : string read FFLGSEGREGAVIRTUAL write SetFLGSEGREGAVIRTUAL;
      property IDPATRO : Integer read FIDPATRO write SetIDPATRO;
      property IDPLANOPREV : Integer read FIDPLANOPREV write SetIDPLANOPREV;
      property IDPLANOPREVADM : Integer read FIDPLANOPREVADM write SetIDPLANOPREVADM;

      // Marchetti - Pandencia 21139 - 18/08/2006
      property AGRUPAHISTORICOCTB : Boolean read FAGRUPAHISTORICOCTB write SetAGRUPAHISTORICOCTB;

      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function CarregaProp(nIdEmpresa : Extended) : Boolean;
      function AplicaOperacao : Boolean;
      function Procurar(nIdPessoa : Extended) : OleVariant;
      function ListaParamCAF(nIdPessoa : Extended): OleVariant;
      function ListaParamCAFxImob(nIdPessoa : Extended): OleVariant;
      function ListaParamGlobal(nIdPessoa : Extended): OleVariant;
      function ListaPlanoContab : OleVariant;
      function ListaTipoOperacao : OleVariant;
      function ListaPatro : OleVariant;
      function ListaPlanoPrev : OleVariant;
      function TotBem(nIdPessoa : Extended) : Integer;
      function TotConjunto(nIdPessoa : Extended) : Integer;
      function ListaCAFMoedas(nIdEmpresa : Extended) : OleVariant;
      function ListaCAFPaises(nIdEmpresa : Extended) : OleVariant;
      function ListaPaises : OleVariant;
   end;

implementation

{ TCtrlParamCAF }

constructor TCtrlParamCAF.Create;
begin
   inherited;
   _dbParamCAF := TDbParamCAF.Create(Self);

   Moeda := TCtrlMoeda.Create;
end;

destructor TCtrlParamCAF.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCds]);

   _dbParamCAF.Free;

   Moeda.Free;

   inherited;
end;

procedure TCtrlParamCAF.OnCreateAppServer;
begin
   inherited;
   fCds := TClientDataSet.Create(nil);
end;

procedure TCtrlParamCAF.AfterInitialize;
begin
   inherited;
   Moeda.InitializeAs(Self);
end;

procedure TCtrlParamCAF.DoChangeDataBase;
begin
   inherited;
   _dbParamCAF.DataBaseName := DataBaseName;
end;

function TCtrlParamCAF.Procurar(nIdPessoa: Extended): OleVariant;
begin
   _dbParamCAF.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbParamCAF.sSQLSelect);
end;

procedure TCtrlParamCAF.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlParamCAF.SetATIVPROJETO(const Value: Integer);
begin
  FATIVPROJETO := Value;
end;

procedure TCtrlParamCAF.SetCDPATH(const Value: String);
begin
  FCDPATH := Value;
end;

procedure TCtrlParamCAF.SetCDPORTA(const Value: Integer);
begin
  FCDPORTA := Value;
end;

procedure TCtrlParamCAF.SetCDVELOC(const Value: String);
begin
  FCDVELOC := Value;
end;

procedure TCtrlParamCAF.SetCOLETORDADOS(const Value: Integer);
begin
  FCOLETORDADOS := Value;
end;

procedure TCtrlParamCAF.SetDIGMASCPLACA(const Value: Integer);
begin
  FDIGMASCPLACA := Value;
end;

procedure TCtrlParamCAF.SetEDITACODBEM(const Value: Integer);
begin
  FEDITACODBEM := Value;
end;

procedure TCtrlParamCAF.SetEDITACODGRUPO(const Value: Integer);
begin
  FEDITACODGRUPO := Value;
end;

procedure TCtrlParamCAF.SetFLGCALCCM(const Value: Integer);
begin
  FFLGCALCCM := Value;
end;

procedure TCtrlParamCAF.SetFLGCLSDESBEM(const Value: Integer);
begin
  FFLGCLSDESBEM := Value;
end;

procedure TCtrlParamCAF.SetFLGTIPOCALC(const Value: String);
begin
  FFLGTIPOCALC := Value;
end;

procedure TCtrlParamCAF.SetINTEGRACAP(const Value: String);
begin
  FINTEGRACAP := Value;
end;

procedure TCtrlParamCAF.SetINTEGRACAR(const Value: String);
begin
  FINTEGRACAR := Value;
end;

procedure TCtrlParamCAF.SetINTEGRACONTAB(const Value: String);
begin
  FINTEGRACONTAB := Value;
end;

procedure TCtrlParamCAF.SetMASCARACLASSE(const Value: String);
begin
  FMASCARACLASSE := Value;
end;

procedure TCtrlParamCAF.SetMASCCODGRUPO(const Value: String);
begin
  FMASCCODGRUPO := Value;
end;

procedure TCtrlParamCAF.SetMOEDAFISCAL(const Value: Integer);
begin
  FMOEDAFISCAL := Value;
end;

procedure TCtrlParamCAF.SetMOEDAGERENCIAL(const Value: Integer);
begin
  FMOEDAGERENCIAL := Value;
end;

procedure TCtrlParamCAF.SetMOEDAGERENCIALB(const Value: Integer);
begin
  FMOEDAGERENCIALB := Value;
end;

procedure TCtrlParamCAF.SetMOEDAOFICIAL(const Value: Integer);
begin
  FMOEDAOFICIAL := Value;
end;

procedure TCtrlParamCAF.SetNUMTAXADEP(const Value: Integer);
begin
  FNUMTAXADEP := Value;
end;

procedure TCtrlParamCAF.SetPATROPADRAO(const Value: Integer);
begin
  FPATROPADRAO := Value;
end;

procedure TCtrlParamCAF.SetPLANOVIGENTE(const Value: Integer);
begin
  FPLANOVIGENTE := Value;
end;

procedure TCtrlParamCAF.SetPLANPREVPADRAO(const Value: Integer);
begin
  FPLANPREVPADRAO := Value;
end;

procedure TCtrlParamCAF.SetPROXIMAPLACA(const Value: Integer);
begin
  FPROXIMAPLACA := Value;
end;

procedure TCtrlParamCAF.SetSEQBEMEMP(const Value: Integer);
begin
  FSEQBEMEMP := Value;
end;

procedure TCtrlParamCAF.SetSISTEMAS(const Value: String);
begin
  FSISTEMAS := Value;
end;

procedure TCtrlParamCAF.SetTIPATUSALDOCONTAB(const Value: Integer);
begin
  FTIPATUSALDOCONTAB := Value;
end;

procedure TCtrlParamCAF.SetTIPOPERCTB(const Value: String);
begin
  FTIPOPERCTB := Value;
end;

procedure TCtrlParamCAF.SetFLGREMOVEPLANCTB(const Value: String);
begin
  FFLGREMOVEPLANCTB := Value;
end;

procedure TCtrlParamCAF.SetMOEDAGERENCIALC(const Value: Integer);
begin
  FMOEDAGERENCIALC := Value;
end;

procedure TCtrlParamCAF.SetFLGINTCAFCONT(const Value: String);
begin
  FFLGINTCAFCONT := Value;
end;

procedure TCtrlParamCAF.SetFLGCONTABFECHAM(const Value: Integer);
begin
  FFLGCONTABFECHAM := Value;
end;

procedure TCtrlParamCAF.SetDTAINICAFMT(const Value: String);
begin
  FDTAINICAFMT := Value;
end;

procedure TCtrlParamCAF.SetFLGDIARIO(const Value: String);
begin
  FFLGDIARIO := Value;
end;

procedure TCtrlParamCAF.SetPACDOBRADA(const Value: String);
begin
  FPACDOBRADA := Value;
end;

procedure TCtrlParamCAF.SetFLGCTADEPREC(const Value: Integer);
begin
  FFLGCTADEPREC := Value;
end;

procedure TCtrlParamCAF.SetTIPOCONJUNTO(const Value: Integer);
begin
  FTIPOCONJUNTO := Value;
end;

procedure TCtrlParamCAF.SetUSAPLANOPATRO(const Value: boolean);
begin
  FUSAPLANOPATRO := Value;
end;

procedure TCtrlParamCAF.SetTIPOREAVAL(const Value: Integer);
begin
  FTIPOREAVAL := Value;
end;

procedure TCtrlParamCAF.SetMOEDAPADRAO(const Value: Integer);
begin
  FMOEDAPADRAO := Value;
end;

procedure TCtrlParamCAF.SetMOEPADRAOARREDONDA(const Value: Boolean);
begin
  FMOEPADRAOARREDONDA := Value;
end;

procedure TCtrlParamCAF.SetMOEPADRAODECIMAIS(const Value: Integer);
begin
  FMOEPADRAODECIMAIS := Value;
end;

procedure TCtrlParamCAF.SetIDPAIS(const Value: Integer);
begin
  FIDPAIS := Value;
end;

procedure TCtrlParamCAF.SetFLGSEGREGAVIRTUAL(const Value: string);
begin
  FFLGSEGREGAVIRTUAL := Value;
end;

procedure TCtrlParamCAF.SetIDPATRO(const Value: Integer);
begin
  FIDPATRO := Value;
end;

procedure TCtrlParamCAF.SetIDPLANOPREV(const Value: Integer);
begin
  FIDPLANOPREV := Value;
end;

procedure TCtrlParamCAF.SetIDPLANOPREVADM(const Value: Integer);
begin
  FIDPLANOPREVADM := Value;
end;

function TCtrlParamCAF.CarregaProp(nIdEmpresa : Extended) : Boolean;
var
   bMoedaOficial, bMoedaFiscal : Boolean;
   iSeqMoeda : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Parâmetros externos
   //-------------------------------------------------------------------------------------
   try
      _cds.Data := ListaParamCAFxImob(nIdEmpresa);
      //----------------------------------------------------------------------------------
      if not _cds.IsEmpty then
      begin
         if _cds.FieldByName('FLGINTCAFCONT').IsNull then
            FFLGINTCAFCONT := 'N'
         else
            FFLGINTCAFCONT := _cds.FieldByName('FLGINTCAFCONT').AsString;
         //-------------------------------------------------------------------------------
         if _cds.FieldByName('FLGDIARIO').IsNull then
            FFLGDIARIO := 'N'
         else
            FFLGDIARIO := _cds.FieldByName('FLGDIARIO').AsString;

      // Marchetti - Pandencia 21139 - 18/08/2006
      FAGRUPAHISTORICOCTB := (_cds.FieldByName('FLGAGRUPAHISTCTB').AsInteger = 1);
      // Fim Marchetti - Pandencia 21139 - 18/08/2006

      end else
      begin
         FFLGINTCAFCONT := 'N';
         FFLGDIARIO     := 'N';
      end;
   except
      FFLGINTCAFCONT := 'N';
      FFLGDIARIO     := 'N';
   end;
   //-------------------------------------------------------------------------------------
   // Parâmetros da Versão MT
   //-------------------------------------------------------------------------------------
   try
      _cds.Data := ListaParamCAF(nIdEmpresa);
      //----------------------------------------------------------------------------------
      FDTAINICAFMT     := _cds.FieldByName('DTAINICAFMT').AsString;
   except
      on E : Exception do
      begin
         FDTAINICAFMT     := '';
         MessageInfo := E.Message;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Parâmetros Clássicos
   //-------------------------------------------------------------------------------------
   try
      _cds.Data := ListaParamCAF(nIdEmpresa);
      FMASCCODGRUPO      := trim(_cds.FieldByName('MASCCODGRUPO').AsString)    ;
      FMASCARACLASSE     := trim(_cds.FieldByName('MASCARACLASSE').AsString)   ;
      FSEQBEMEMP         := _cds.FieldByName('SEQBEMEMP').AsInteger            ;
      FEDITACODBEM       := _cds.FieldByName('EDITACODBEM').AsInteger          ;
      FEDITACODGRUPO     := _cds.FieldByName('EDITACODGRUPO').AsInteger        ;
      FSISTEMAS          := trim(_cds.FieldByName('SISTEMAS').AsString)        ;
      FFLGCALCCM         := _cds.FieldByName('FLGCALCCM').AsInteger            ;
      FFLGTIPOCALC       := trim(_cds.FieldByName('FLGTIPOCALC').AsString)     ;
      FINTEGRACONTAB     := _cds.FieldByName('INTEGRACONTAB').AsString         ;
      FINTEGRACAR        := _cds.FieldByName('INTEGRACAR').AsString            ;
      FINTEGRACAP        := _cds.FieldByName('INTEGRACAP').AsString            ;
      FPLANOVIGENTE      := _cds.FieldByName('PLANOVIGENTE').AsInteger         ;
      FTIPOPERCTB        := _cds.FieldByName('TIPOPERCTB').AsString            ;
      FFLGREMOVEPLANCTB  := _cds.FieldByName('FLGREMOVEPLANCTB').AsString      ;
      FATIVPROJETO       := _cds.FieldByName('ATIVPROJETO').AsInteger          ;
      FPROXIMAPLACA      := _cds.FieldByName('PROXIMAPLACA').AsInteger         ;
      FDIGMASCPLACA      := _cds.FieldByName('DIGMASCPLACA').AsInteger         ;
      FFLGCLSDESBEM      := _cds.FieldByName('FLGCLSDESBEM').AsInteger         ;
      FCOLETORDADOS      := _cds.FieldByName('COLETORDADOS').AsInteger         ;
      FCDPORTA           := _cds.FieldByName('CDPORTA').AsInteger              ;
      FCDVELOC           := _cds.FieldByName('CDVELOC').AsString               ;
      FCDPATH            := _cds.FieldByName('CDPATH').AsString                ;
      FPLANPREVPADRAO    := _cds.FieldByName('PLANPREVPADRAO').AsInteger       ;
      FPATROPADRAO       := _cds.FieldByName('PATROPADRAO').AsInteger          ;
      FTIPATUSALDOCONTAB := _cds.FieldByName('TIPATUSALDOCONTAB').AsInteger    ;
      FFLGCONTABFECHAM   := _cds.FieldByName('FLGCONTABFECHAM').AsInteger      ;
      FFLGCTADEPREC      := _cds.FieldByName('FLGCTADEPREC').AsInteger         ;
      FPACDOBRADA        := _cds.FieldByName('PACDOBRADA').AsString            ;
      FTIPOCONJUNTO      := _cds.FieldByName('TIPOCONJUNTO').AsInteger         ;
      FTIPOREAVAL        := _cds.FieldByName('FLGREAVAL').AsInteger            ;
      FUSAPLANOPATRO     := (_cds.FieldByName('FLGPLANOPATRO').AsString = 'S') ;
      FIDPAIS            := _cds.FieldByName('IDPAIS').AsInteger               ;
      //----------------------------------------------------------------------------------
      FMOEDAPADRAO        := _cds.FieldByName('MOEDACORRENTE').AsInteger       ;
      FMOEPADRAODECIMAIS  := 2;
      FMOEPADRAOARREDONDA := True;
      //----------------------------------------------------------------------------------
      // Captura as Moedas da Tabela CAFMOEDAS
      //----------------------------------------------------------------------------------
      FMOEDAOFICIAL := _cds.FieldByName('MOEDAOFICIAL').AsInteger;
      if FMOEDAOFICIAL = 0 then
         FMOEDAOFICIAL := -1;
      //----------------------------------------------------------------------------------
      FMOEDAFISCAL := _cds.FieldByName('MOEDAFISCAL').AsInteger;
      if FMOEDAFISCAL = 0 then
         FMOEDAFISCAL := -1;
      //----------------------------------------------------------------------------------
      FMOEDAGERENCIAL := _cds.FieldByName('MOEDAGERENCIAL').AsInteger;
      if FMOEDAGERENCIAL = 0 then
         FMOEDAGERENCIAL := -1;
      FMOEDAGERENCIALB := -1;
      FMOEDAGERENCIALC := -1;
      //----------------------------------------------------------------------------------
      bMoedaOficial := False;
      bMoedaFiscal := False;
      _cds.Data := GetDataPacket(' SELECT MOECODIGO, IDTIPOMOEDA ' +
                                 ' FROM CAFMOEDAS ' +
                                 ' WHERE IDPESSOA = ' + floattostr(nIdEmpresa));
      iSeqMoeda := 0;
      while not _cds.EOF do
      begin
         if _cds.FieldByName('IDTIPOMOEDA').AsInteger = 1 then
         begin
            if not bMoedaOficial then
            begin
               FMOEDAOFICIAL := _cds.FieldByName('MOECODIGO').AsInteger;
               bMoedaOficial := True;
            end else
            begin
               Raise Exception.Create('Só é possível declarar uma Moeda Oficial!');
            end;
         end else
         if _cds.FieldByName('IDTIPOMOEDA').AsInteger = 2 then
         begin
            if not bMoedaFiscal then
            begin
               FMOEDAFISCAL := _cds.FieldByName('MOECODIGO').AsInteger;
               bMoedaFiscal := True;
            end else
            begin
               Raise Exception.Create('Só é possível declarar uma Moeda Fiscal!');
            end;
         end else
         if _cds.FieldByName('IDTIPOMOEDA').AsInteger = 3 then
         begin
            if (FMOEDAGERENCIAL = -1) and (iSeqMoeda = 0) then
            begin
               FMOEDAGERENCIAL := _cds.FieldByName('MOECODIGO').AsInteger;
               iSeqMoeda := iSeqMoeda + 1;
            end else
            if (FMOEDAGERENCIALB = -1) and (iSeqMoeda = 1) then
            begin
               FMOEDAGERENCIALB := _cds.FieldByName('MOECODIGO').AsInteger;
               iSeqMoeda := iSeqMoeda + 1;
            end else
            if (FMOEDAGERENCIALC = -1) and (iSeqMoeda = 2) then
            begin
               FMOEDAGERENCIALC := _cds.FieldByName('MOECODIGO').AsInteger;
               iSeqMoeda := iSeqMoeda + 1;
            end;
         end;
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Le o total de Países
      //----------------------------------------------------------------------------------
      FNUMTAXADEP := 0;
      _cds.Data := GetDataPacket(' SELECT COUNT(IDCAFPAISES) AS QTD ' +
                                 ' FROM CAFPAISES ' +
                                 ' WHERE IDPESSOA = ' + floattostr(nIdEmpresa));
      if not ((_cds.IsEmpty) or (_cds.FieldByName('QTD').AsInteger = 0)) then
         FNUMTAXADEP := _cds.FieldByName('QTD').AsInteger;
      //----------------------------------------------------------------------------------
      if FNUMTAXADEP = 0 then
         FNUMTAXADEP := 1;
      //----------------------------------------------------------------------------------
      // Preenche as propriedades da SEGREGAÇÃO DE RECURSOS
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT FLGSEGREGAVIRTUAL, IDPATRO, IDPLANOPREV, IDPLANOPREVADM ' +
                                 ' FROM PARAMGLOBAL ' +
                                 ' WHERE IDPESSOA = ' + floattostr(nIdEmpresa));
      if not _cds.IsEmpty then
      begin
         FFLGSEGREGAVIRTUAL := _cds.FieldByName('FLGSEGREGAVIRTUAL').AsString;
         FIDPATRO           := _cds.FieldByName('IDPATRO').AsInteger;
         FIDPLANOPREV       := _cds.FieldByName('IDPLANOPREV').AsInteger;
         FIDPLANOPREVADM    := _cds.FieldByName('IDPLANOPREVADM').AsInteger;
      end else
      begin
         FFLGSEGREGAVIRTUAL := 'N';
         FIDPATRO           := -1;
         FIDPLANOPREV       := -1;
         FIDPLANOPREVADM    := -1;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      on E : Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlParamCAF.ListaParamCAF(nIdPessoa : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT C.*, PC.PACDOBRADA, E.FLGPLANOPATRO, ' + #13 +
           '        G.MOEDACORRENTE, M.MOEDESC, ' + #13 +

           // Marchetti - Pandencia 21139 - 18/08/2006
           '        NVL(C.FLGAGRUPAHISTCTB,0) AS FLGAGRUPAHISTCTB ' + #13 +
           // Fim Marchetti - Pandencia 21139 - 18/08/2006

           ' FROM PARAMETROSCAFMANUT C, ' + #13 +
           '      PARAMCONTAB PC, ' + #13 +
           '      EMPRESAPROP E, ' + #13 +
           '      PARAMGLOBAL G, ' + #13 +
           '      MOEDA M ' + #13 +
           ' WHERE C.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '   AND C.IDPESSOA = PC.IDPESSOA(+) ' + #13 +
           '   AND C.IDPESSOA = E.IDPESSOA(+) ' + #13 +
           '   AND C.IDPESSOA = G.IDPESSOA(+) ' + #13 +
           '   AND G.MOEDACORRENTE = M.MOECODIGO(+) ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.ListaParamCAFxImob(nIdPessoa : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT C.IDPESSOA, I.FLGINTCAFCONT, I.FLGDIARIO, ' + #13 +
           // Marchetti - Pandencia 21139 - 18/08/2006
           '        NVL(C.FLGAGRUPAHISTCTB,0) AS FLGAGRUPAHISTCTB ' + #13 +
           // Fim Marchetti - Pandencia 21139 - 18/08/2006
           ' FROM PARAMETROSCAFMANUT C, ' + #13 +
           '      PARAMINVESTIMOB I ' + #13 +
           ' WHERE C.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '   AND C.IDPESSOA = I.IDPESSOA(+) ' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.ListaParamGlobal(nIdPessoa : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT G.UNIDNEGOC, G.MASCARACC, ' + #13 +
           '        G.MOEDACORRENTE, M.MOEDESC, ' + #13 +
           '        (2) AS NUMDECIMAIS, ' + #13 +
           '        (''S'') AS FLGARREDONDA ' + #13 +
           ' FROM PARAMGLOBAL G, ' + #13 +
           '      MOEDA M ' + #13 +
           ' WHERE G.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '   AND G.MOEDACORRENTE = M.MOECODIGO(+) ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.ListaPlanoContab : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT PLANO, DESCPLANO ' + #13 +
           ' FROM PLANO ' + #13 +
           ' ORDER BY PLANO ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.ListaTipoOperacao : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT TIPCODIGO, TIPDESCRICAO ' + #13 +
           ' FROM TIPOPER ' + #13 +
           ' ORDER BY TIPDESCRICAO ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.ListaPatro : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT PATRO.IDPESSOA AS IDPATRO, PESSOA.NOME ' + #13 +
           ' FROM PATRO, ' + #13 +
           '      PESSOA ' + #13 +
           ' WHERE PATRO.IDPESSOA = PESSOA.IDPESSOA ' + #13 +
           ' ORDER BY PESSOA.NOME ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.ListaPlanoPrev : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDPLANOPREV, NOME ' + #13 +
           ' FROM PLANPREVCONTABIL ' + #13 +
           ' WHERE ATIVO = ' + quotedstr('S') + #13 +
           ' ORDER BY NOME ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.TotBem(nIdPessoa : Extended) : Integer;
var
   sSql : String;

begin
   sSql := ' SELECT COUNT(IDBEM) AS TOTBEM ' +
           ' FROM BEM ' +
           ' WHERE IDPESSOA = ' + floattostr(nIdPessoa);
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   Result := _cds.FieldByName('TOTBEM').AsInteger;
end;

function TCtrlParamCAF.TotConjunto(nIdPessoa : Extended) : Integer;
var
   sSql : String;

begin
   sSql := ' SELECT COUNT(IDCONJUNTO) AS TOTCONJUNTO ' +
           ' FROM CONJUNTO ' +
           ' WHERE IDPESSOA = ' + floattostr(nIdPessoa);
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   Result := _cds.FieldByName('TOTCONJUNTO').AsInteger;
end;

function TCtrlParamCAF.ListaPaises : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDPAIS, NOMEPAIS, CODINTERNACIONAL ' + #13 +
           ' FROM PAIS ' + #13 +
           ' ORDER BY NOMEPAIS ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.ListaCAFMoedas(nIdEmpresa : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC ' + #13 +
           ' FROM CAFMOEDAS CM, ' + #13 +
           '      MOEDA M ' + #13 +
           ' WHERE CM.IDPESSOA = ' + floattostr(nIdEmpresa) + #13 +
           '   AND CM.MOECODIGO = M.MOECODIGO ' + #13 +
           ' ORDER BY CM.IDTIPOMOEDA ';
   Result := GetDataPacket( sSql );
end;

function TCtrlParamCAF.ListaCAFPaises(nIdEmpresa : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS, P.CODINTERNACIONAL, ' + #13 +
           '        CP.MOECODIGO, M.MOEDESC ' + #13 +
           ' FROM CAFPAISES CP, '+ #13 +
           '      PAIS P, ' + #13 +
           '      MOEDA M ' + #13 +
           ' WHERE CP.IDPESSOA = ' + floattostr(nIdEmpresa) + #13 +
           '   AND CP.IDPAIS = P.IDPAIS ' + #13 +
           '   AND CP.MOECODIGO = M.MOECODIGO(+) ' + #13 +
           ' ORDER BY P.NOMEPAIS ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAF.AplicaOperacao: Boolean;
var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoPARAMCAF( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbParamCAF,[],[]);
         sMensagem := _dbParamCAF.MessageInfo;

         if not Result then
            Raise Exception.Create(sMensagem);

         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

procedure TCtrlParamCAF.SetAGRUPAHISTORICOCTB(const Value: Boolean);
begin
   FAGRUPAHISTORICOCTB := Value;
end;

end.

