{-------------------------------------------------------------------------------
----------------------- HISTÓRICO ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
N. Chamado....: WO13767          
Dt Alterações.: 05/09/2024
Responsável...: Paulo Nobre
Descrição.....: Por sugestão do Everson, o implementado no WO8951, foi desfeito
                permitindo que a sequence seja gerada e atualizada para todos os
                portadorforma.
--------------------------------------------------------------------------------
Pendência...: WO8951
Responsável.: Everson Cunha
Data........: 13/03/2024
Descrição...: SEQUENCE de NOSSONUMERO para o convênio 269 - 391400 - Empréstimo
-------------------------------------------------------------------------------}

unit UCtrlConfigbarras;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbConfigbarras, uSistema, DB, uDataBase,
     DbClient ,uCMTypes, uCtrlConfigRelatorio, uSequence, uCtrlEventoDocum;

type
  TCtrlConfigbarras = class(TCtrlConfigRelatorio)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
     procedure ProcessaCds(ovCds: OleVariant); override;
     procedure AfterInitialize; Override;
  private
    _DbConfigbarras : TDbConfigbarras;
    Fcds : TClientDataSet;
    CtrlEventoDocum : TCtrlEventoDocum;
    // Eventos dos ClientDataSet´s
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    // Métodos
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //  Informa os Compradore existentes
    Function  ListConfigbarras : OleVariant;
    function GravarConfigbarras  : Boolean;
    function GravaUpdatePortador(sSql : String) : Boolean;
    function GetNossoNumero(const icodportforma: integer; TamNossoNumero : integer = -1): Extended; //andré tavares - pendência 24373 - 31/01/2007

    function RecuperaNossoNumero( sControleRemessa : string; fCodDoc : extended; sFlgGrupo : string ) : string;

    //andré tavares - pendência 24373 - 31/01/2007
    function AtualizaDoc(cdsDocs: TClientDataSet;
                         sControleRemessa: string;
                         codportForma: integer): boolean;

End;


implementation

{ TCtrlConfigbarras }

constructor TCtrlConfigbarras.Create;
begin
  inherited;
  _DbConfigbarras := TDbConfigbarras.Create(self);
  CtrlEventoDocum := TCtrlEventoDocum.Create;
end;

destructor TCtrlConfigbarras.Destroy;
begin
  _DbConfigbarras.Free;
  CtrlEventoDocum.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlConfigbarras.DoChangeDataBase;
begin
  inherited;
  _DbConfigbarras.DataBaseName := DataBaseName;
end;

function TCtrlConfigbarras.ListConfigbarras : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT IDCONFIGBARRAS, DESCCONFIGBARRAS '+
        '  FROM CONFIGBARRAS '+
        ' ORDER BY DESCCONFIGBARRAS        ';
   Result := GetDataPacket(ssql);
end;

procedure TCtrlConfigbarras.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlConfigbarras.GravarConfigbarras: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarConfigbarras(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbConfigbarras,[],[]);
        Msg    := _DbConfigbarras.MessageInfo;
        If Not Result Then Raise Exception.create(Msg);
          Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

procedure TCtrlConfigbarras.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

procedure TCtrlConfigbarras.ProcessaCds(ovCds: OleVariant);
begin
  if ConnectionSide = cnsClient then
  begin
    Connection.AppServer.ConfigBarrasProcessaCds(ovCds);
  end
  else
  begin
    if _Cds.Active then
      _Cds.Close;
    _Cds.Data := ovCds;
    if _Operacao = OpApagar then
    begin
      while not _Cds.Eof do
        _Cds.Delete;
    end;
    if not ApplyCds(_Cds, _DbConfigbarras,
      [_DbReportsRelCM.Idreports, _DbReportsRelCM.Origemcm],
      [_DbConfigbarras.Idreports, _DbConfigbarras.Origemcm]) then
      raise Exception.Create(_DbConfigbarras.MessageInfo)
  end;
end;

function TCtrlConfigbarras.GravaUpdatePortador(sSql : String): Boolean;
var btransacaoExterna : boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravaUpdatePortador(sSql);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        btransacaoExterna := DataBase.InTransaction; // andre tavares - pendência 18844
        if not btransacaoExterna then
          StartTransaction;
        ExecSQL(sSql);
        if not btransacaoExterna then // andre tavares - pendência 18844
          Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          if not btransacaoExterna then // andre tavares - pendência 18844
            Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

//andré tavares - pendência 24373 - 31/01/2007
function TCtrlConfigbarras.GetNossoNumero(const icodportforma: integer; TamNossoNumero : integer): Extended;
begin
    StartTransaction;
    try
      try
        // Paulo Nobre - WO13767 - Inicio
        //if icodportforma = 269 then //WO8951 - Everson Cunha - Tratativa para convênio de empréstimo, NOSSONUMERO duplicado com o AutoAtendimento
        _cds.data := getDataPacket(' SELECT CM.SEQPORTADORFORMA_NOSSONUMERO.NEXTVAL AS NOSSONUMERO FROM DUAL '); //WO8951 - Everson Cunha
        //else
        //  _cds.data := getDataPacket(' SELECT NVL(NOSSONUMERO, 0) + 1 AS NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + intToStr(icodportforma) + ' FOR UPDATE ');
        // Paulo Nobre - WO13767 - Fim

        result := strToFloat(_cds.fieldByName('NOSSONUMERO').asString);
      except
        result := 0;
      end;
      
      if result > 0 then
        //case iIdModulo  of
        //  64,135,456:
        if (TamNossoNumero >= 15) then
          execSql( 'UPDATE PORTADORFORMA SET NOSSONUMERO = '+ QuotedStr(FloatToStrF(result, ffFixed, TamNossoNumero,0)) + ' WHERE CODPORTFORMA = ' + intToStr(icodportforma) )
        else
          execSql( 'UPDATE PORTADORFORMA SET NOSSONUMERO = '+ FloatToStr(result) + ' WHERE CODPORTFORMA = ' + intToStr(icodportforma) );
        //end;

      Commit;

    except
      on E:Exception do
      begin
        result := 0;
        Rollback;
        MessageInfo := E.Message;
      end;//on
    end;//try
end;

//andré tavares - pendência 24373 - 31/01/2007
//David - Pendência 26006 - Alterei a função para retornar corretamente TRUE ou FALSE de acordo com a geração do nosso número 
function TCtrlConfigbarras.AtualizaDoc(cdsDocs: TClientDataSet;
                                       sControleRemessa: string;
                                       codportForma: integer): boolean;
var
  bContinua : boolean;
  cdsDocsCNAB : TClientDataset;
begin
  Result := False;
  bContinua := True;

  try

    cdsDocsCNAB := TClientDataset.Create( nil );
  try
    StartTransaction;

      cdsDocs.First;
    while not CdsDocs.Eof do
    begin

      if CdsDocs.FieldByName('FLGGRUPO').AsString <> 'S' then
        begin
        bContinua := ExecSql(' UPDATE DOCUMENTO SET ' +
                '        STATUS = ''1'', ' +
                '        EMISBLOQ = ''S'', ' +
                '        NOSSONUMERO = ''' + CdsDocs.FieldByName('NOSSONUMERO').AsString + ''', ' +
                          '        CONTROLEREMESSA = ' + sControleRemessa + ', ' +
                '        DATAREMESSA = TO_DATE(''' + dateToStr(date) + ''',''DD/MM/YYYY'') ' +
                            ' WHERE CODDOCUMENTO = ' + CdsDocs.FieldByName('CODDOCUMENTO').AsString );

          if bContinua then
          begin
            bContinua := CtrlEventoDocum.GravaLogEvento( -2, Sistema.IdUsuario, CdsDocs.FieldByName('CODDOCUMENTO').AsFloat, 'Nosso número: ' + CdsDocs.FieldByName('NOSSONUMERO').AsString + '; Controle de Remessa: ' + sControleRemessa );
            if not bContinua then
            begin
              Raise Exception.Create( CtrlEventoDocum.MessageInfo );
              exit;
            end;
          end;
                          
        end
      else
        begin
        bContinua := ExecSql(' UPDATE DOCUMENTO SET ' +
                '        STATUS = ''1'', ' +
                '        EMISBLOQ = ''S'', ' +
                '        NOSSONUMERO = ''' + CdsDocs.FieldByName('NOSSONUMERO').AsString + ''', ' +
                '        CONTROLEREMESSA = ' + sControleRemessa + ', ' +
                '        DATAREMESSA = TO_DATE(''' + dateToStr(date) + ''',''DD/MM/YYYY'') ' +
                ' WHERE CODGRUPOCNAB = ' + CdsDocs.FieldByName('CODDOCUMENTO').AsString);

      if bContinua then
      begin
            cdsDocsCNAB.Close;
            cdsDocsCNAB.Data := GetDataPacket( ' select CODDOCUMENTO, NOSSONUMERO from DOCUMENTO where CODGRUPOCNAB = ' + CdsDocs.FieldByName('CODDOCUMENTO').AsString );
            cdsDocsCNAB.First;
            while not cdsDocsCNAB.Eof do
            begin
              bContinua := CtrlEventoDocum.GravaLogEvento( -2, Sistema.IdUsuario, cdsDocsCNAB.FieldByName('CODDOCUMENTO').AsFloat, 'Nosso número: ' + cdsDocsCNAB.FieldByName('NOSSONUMERO').AsString + '; Controle de Remessa: ' + sControleRemessa );
        if not bContinua then
        begin
          Raise Exception.Create( CtrlEventoDocum.MessageInfo );
          exit;
        end;
              cdsDocsCNAB.Next;
            end;
          end;

      end;

      if not bContinua then
        break;

      CdsDocs.Next;
    end;//while

    if bContinua then
      bContinua := ExecSql(' UPDATE PORTADORFORMA SET CONTROLEREMESSA = ' + sControleRemessa +
            ' WHERE CODPORTFORMA = ' + IntToStr(CodPortForma)) ;
    if not bContinua then
      Raise Exception.Create( MessageInfo );                       

    Commit;
    
    Result := True;

  except
    On E:Exception Do
    Begin
       Result := False;
       Rollback;
       MessageInfo := E.Message;
    End;
  end;

  finally
    cdsDocsCNAB.Free;  
  end;
  
end;



procedure TCtrlConfigbarras.AfterInitialize;
begin
  inherited;
  CtrlEventoDocum.InitializeAs( Self );
end;

function TCtrlConfigbarras.RecuperaNossoNumero( sControleRemessa : string; fCodDoc : extended; sFlgGrupo : string ) : string;
var
  sAux : string;
  cdsLocal : TClientDataset;
begin
  cdsLocal := TClientDataset.Create( nil );
  try
    
    sAux := 
     ' select NOSSONUMERO                          ' +
     ' from   DOCUMENTO                            ' +
     ' where  STATUS   = ''1''                     ' +
     '   and  EMISBLOQ = ''S''                     ' +
     '   and  DATAREMESSA is not null              ' +
     '   and  CONTROLEREMESSA = ' + sControleRemessa ;

    if trim( sFlgGrupo ) <> 'S' then
      sAux := sAux + ' and CODDOCUMENTO = ' + FloatToStr( fCodDoc )
    else
      sAux := sAux + ' and CODGRUPOCNAB = ' + FloatToStr( fCodDoc );

    cdsLocal.Data := GetDataPacket( sAux );

    Result := cdsLocal.FieldByName('NOSSONUMERO').AsString;

  finally
    cdsLocal.Free;
  end;
end;

end.
