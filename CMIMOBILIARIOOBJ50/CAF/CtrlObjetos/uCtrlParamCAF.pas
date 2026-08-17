unit uCtrlParamCAF;

interface

Uses DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uMidasUtil,
     uDBParamCAF;

Type
   TCtrlParamCAF = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      _dbParamCAF : TDbParamCAF;

      Fcds: TClientDataSet;

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

   Public
      property cds : TClientDataSet read Fcds write Setcds;
      //----------------------------------------------------------------------------------
      // Propriedades do Objeto ParamCAF
      //----------------------------------------------------------------------------------
      property MOEDAOFICIAL       : Integer read FMOEDAOFICIAL write SetMOEDAOFICIAL;
      property MOEDAFISCAL        : Integer read FMOEDAFISCAL write SetMOEDAFISCAL;
      property MOEDAGERENCIAL     : Integer read FMOEDAGERENCIAL write SetMOEDAGERENCIAL;
      property MOEDAGERENCIALB    : Integer read FMOEDAGERENCIALB write SetMOEDAGERENCIALB;
      property MOEDAGERENCIALC    : Integer read FMOEDAGERENCIALC write SetMOEDAGERENCIALC;
      property MASCCODGRUPO       : String  read FMASCCODGRUPO write SetMASCCODGRUPO;
      property MASCARACLASSE      : String  read FMASCARACLASSE write SetMASCARACLASSE;
      property SEQBEMEMP          : Integer read FSEQBEMEMP write SetSEQBEMEMP;
      property EDITACODBEM        : Integer read FEDITACODBEM write SetEDITACODBEM;
      property EDITACODGRUPO      : Integer read FEDITACODGRUPO write SetEDITACODGRUPO;
      property SISTEMAS           : String  read FSISTEMAS write SetSISTEMAS;
      property FLGCALCCM          : Integer read FFLGCALCCM write SetFLGCALCCM;
      property FLGTIPOCALC        : String  read FFLGTIPOCALC write SetFLGTIPOCALC;
      property INTEGRACONTAB      : String  read FINTEGRACONTAB write SetINTEGRACONTAB;
      property INTEGRACAR         : String  read FINTEGRACAR write SetINTEGRACAR;
      property INTEGRACAP         : String  read FINTEGRACAP write SetINTEGRACAP;
      property PLANOVIGENTE       : Integer read FPLANOVIGENTE write SetPLANOVIGENTE;
      property TIPOPERCTB         : String  read FTIPOPERCTB write SetTIPOPERCTB;
      property FLGREMOVEPLANCTB   : String  read FFLGREMOVEPLANCTB write SetFLGREMOVEPLANCTB;
      property ATIVPROJETO        : Integer read FATIVPROJETO write SetATIVPROJETO;
      property PROXIMAPLACA       : Integer read FPROXIMAPLACA write SetPROXIMAPLACA;
      property DIGMASCPLACA       : Integer read FDIGMASCPLACA write SetDIGMASCPLACA;
      property FLGCLSDESBEM       : Integer read FFLGCLSDESBEM write SetFLGCLSDESBEM;
      property COLETORDADOS       : Integer read FCOLETORDADOS write SetCOLETORDADOS;
      property CDPORTA            : Integer read FCDPORTA write SetCDPORTA;
      property CDVELOC            : String  read FCDVELOC write SetCDVELOC;
      property CDPATH             : String  read FCDPATH write SetCDPATH;
      property PLANPREVPADRAO     : Integer read FPLANPREVPADRAO write SetPLANPREVPADRAO;
      property PATROPADRAO        : Integer read FPATROPADRAO write SetPATROPADRAO;
      property TIPATUSALDOCONTAB  : Integer read FTIPATUSALDOCONTAB write SetTIPATUSALDOCONTAB;
      property NUMTAXADEP         : Integer read FNUMTAXADEP write SetNUMTAXADEP;
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
      function ListaPlanoContab : OleVariant;
      function ListaTipoOperacao : OleVariant;
      function ListaPatro : OleVariant;
      function ListaPlanoPrev : OleVariant;

   end;

implementation

{ TCtrlParamCAF }

function TCtrlParamCAF.CarregaProp(nIdEmpresa : Extended) : Boolean;
begin
   _cds.Data := ListaParamCAF(nIdEmpresa);
   //-------------------------------------------------------------------------------------
   try
      FMOEDAOFICIAL       := _cds.FieldByName('MOEDAOFICIAL').AsInteger      ;
      FMOEDAFISCAL        := _cds.FieldByName('MOEDAFISCAL').AsInteger       ;
      FMOEDAGERENCIAL     := _cds.FieldByName('MOEDAGERENCIAL').AsInteger    ;
      FMOEDAGERENCIALB    := _cds.FieldByName('MOEDAGERENCIALB').AsInteger   ;
      FMOEDAGERENCIALC    := _cds.FieldByName('MOEDAGERENCIALC').AsInteger   ;
      FMASCCODGRUPO       := _cds.FieldByName('MASCCODGRUPO').AsString       ;
      FMASCARACLASSE      := _cds.FieldByName('MASCARACLASSE').AsString      ;
      FSEQBEMEMP          := _cds.FieldByName('SEQBEMEMP').AsInteger         ;
      FEDITACODBEM        := _cds.FieldByName('EDITACODBEM').AsInteger       ;
      FEDITACODGRUPO      := _cds.FieldByName('EDITACODGRUPO').AsInteger     ;
      FSISTEMAS           := _cds.FieldByName('SISTEMAS').AsString           ;
      FFLGCALCCM          := _cds.FieldByName('FLGCALCCM').AsInteger         ;
      FFLGTIPOCALC        := _cds.FieldByName('FLGTIPOCALC').AsString        ;
      FINTEGRACONTAB      := _cds.FieldByName('INTEGRACONTAB').AsString      ;
      FINTEGRACAR         := _cds.FieldByName('INTEGRACAR').AsString         ;
      FINTEGRACAP         := _cds.FieldByName('INTEGRACAP').AsString         ;
      FPLANOVIGENTE       := _cds.FieldByName('PLANOVIGENTE').AsInteger      ;
      FTIPOPERCTB         := _cds.FieldByName('TIPOPERCTB').AsString         ;
      FFLGREMOVEPLANCTB   := _cds.FieldByName('FLGREMOVEPLANCTB').AsString   ;
      FATIVPROJETO        := _cds.FieldByName('ATIVPROJETO').AsInteger       ;
      FPROXIMAPLACA       := _cds.FieldByName('PROXIMAPLACA').AsInteger      ;
      FDIGMASCPLACA       := _cds.FieldByName('DIGMASCPLACA').AsInteger      ;
      FFLGCLSDESBEM       := _cds.FieldByName('FLGCLSDESBEM').AsInteger      ;
      FCOLETORDADOS       := _cds.FieldByName('COLETORDADOS').AsInteger      ;
      FCDPORTA            := _cds.FieldByName('CDPORTA').AsInteger           ;
      FCDVELOC            := _cds.FieldByName('CDVELOC').AsString            ;
      FCDPATH             := _cds.FieldByName('CDPATH').AsString             ;
      FPLANPREVPADRAO     := _cds.FieldByName('PLANPREVPADRAO').AsInteger    ;
      FPATROPADRAO        := _cds.FieldByName('PATROPADRAO').AsInteger       ;
      FTIPATUSALDOCONTAB  := _cds.FieldByName('TIPATUSALDOCONTAB').AsInteger ;
      FNUMTAXADEP         := _cds.FieldByName('NUMTAXADEP').AsInteger        ;
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlParamCAF.AplicaOperacao: Boolean;
Var
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

constructor TCtrlParamCAF.Create;
begin
   inherited;
   _dbParamCAF := TDbParamCAF.Create;
end;

destructor TCtrlParamCAF.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCds]);

   _dbParamCAF.Free;

   inherited;
end;

procedure TCtrlParamCAF.DoChangeDataBase;
begin
   inherited;
   _dbParamCAF.DataBaseName := DataBaseName;
end;

function TCtrlParamCAF.Procurar(nIdPessoa: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarPARAMCAF( nIdPessoa ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbParamCAF.IDPESSOA.AsFloat := nIdPessoa;
      Result := GetDataPacket(_dbParamCAF.sSQLSelect);
   end;
end;

function TCtrlParamCAF.ListaParamCAF(nIdPessoa : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDPESSOA,MOEDAOFICIAL,MOEDAFISCAL,MOEDAGERENCIAL,MOEDAGERENCIALB, ' + #13 +
           '        MOEDAGERENCIALC,NUMDIASANO,MASCCODGRUPO,ALUGUELINTERNO,           ' + #13 +
           '        GERARREQMAT,DATAULTDEP,DATARECALCDEP,DTAULTALUG,                  ' + #13 +
           '        SEQBEMEMP,EDITACODBEM,SISTEMAS,EDITACODGRUPO,                     ' + #13 +
           '        DATAINICIAL,ULTTXTCONTAB,FLGCALCCM,FLGTIPOCALC,                   ' + #13 +
           '        MASCARACLASSE,INTEGRACONTAB,INTEGRACAR,                           ' + #13 +
           '        INTEGRACAP, PLANOVIGENTE,FLGREAVAL,TIPOPERCTB,                    ' + #13 +
           '        FLGREMOVEPLANCTB,ATIVPROJETO,PROXIMAPLACA,DIGMASCPLACA,           ' + #13 +
           '        FLGCLSDESBEM,COLETORDADOS,CDPORTA,CDVELOC,CDPATH,                 ' + #13 +
           '        PLANPREVPADRAO,PATROPADRAO,TIPATUSALDOCONTAB,                     ' + #13 +
           '        NUMTAXADEP                                                        ' + #13 +
           ' FROM PARAMETROSCAFMANUT                                                  ' + #13 +
           ' WHERE (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13;
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
           ' WHERE (PATRO.IDPESSOA = PESSOA.IDPESSOA) ' + #13 +
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
           ' ORDER BY NOME ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

procedure TCtrlParamCAF.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlParamCAF.OnCreateAppServer;
begin
   inherited;
   fCds := TClientDataSet.Create(nil);
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

end.
