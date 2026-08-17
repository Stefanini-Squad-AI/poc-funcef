unit uCtrlParamCota;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbParamCota, uTypesCota;

type TCtrlParamCota = class(TCMControlObject)

  private
    FCdsParamCota: TCMClientDataSet;
    FDbParamCota: TDbParamCota;
    FFlgCotizaDataAnt: Boolean;
    FFlgDiaUtil: Boolean;
    FVlrPrimeira: Extended;
    FIdEmpresaProp: Integer;
    FDtAbreFundoDIC: TDateTime;
    FDtPrimImob: TDateTime;
    FDtFechaFundoRF: TDateTime;
    FDtPrimRV: TDateTime;
    FDtAbreRV: TDateTime;
    FDtPrimeira: TDateTime;
    FDtAbreImob: TDateTime;
    FDtPrimFundoDIC: TDateTime;
    FDtPrimBMF: TDateTime;
    FDtFechaEP: TDateTime;
    FDtAbreFundoRF: TDateTime;
    FDtFechaRF: TDateTime;
    FDtFechaManual: TDateTime;
    FDtAbreManual: TDateTime;
    FDtAbreBMF: TDateTime;
    FDtPrimFundoImob: TDateTime;
    FDtAbreEP: TDateTime;
    FDtFechaRV: TDateTime;
    FDtPrimManual: TDateTime;
    FDtFechaFundoImob: TDateTime;
    FDtAbreRF: TDateTime;
    FDtPrimRF: TDateTime;
    FDtFechaFundoRV: TDateTime;
    FDtPrimEP: TDateTime;
    FDtAbreFundoImob: TDateTime;
    FDtPrimFundoRF: TDateTime;
    FDtPrimFundoRV: TDateTime;
    FDtAbreFundoRV: TDateTime;
    FDtFechaImob: TDateTime;
    FDtFechaFundoDIC: TDateTime;
    FDtFechaBMF: TDateTime;
    procedure SetCdsParamCota(const Value: TCMClientDataSet);
    procedure SetDbParamCota(const Value: TDbParamCota);

  protected
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbParamCota : TDbParamCota read FDbParamCota write SetDbParamCota;
    property CdsParamCota : TCMClientDataSet read FCdsParamCota write SetCdsParamCota;

    function SelecionaParamCota(const IDEmpresaProp: Integer): OLEVariant;
    function ListaParamCota(const IDEmpresaProp: Integer): OLEVariant;
    function TelefonePessoa(const iIdPessoa: Integer): string;
    function GravaParamCota : Boolean;
    function ListaGrupoRegra : OleVariant;
    function ListaTipoRegra  (iIdGrupo: integer = -1): OleVariant;

    function ExisteCotaTipoOper: boolean;

    property FlgCotizaDataAnt : Boolean   read FFlgCotizaDataAnt;
    property FlgDiaUtil       : Boolean   read FFlgDiaUtil;
    property IdEmpresaProp    : Integer   read FIdEmpresaProp;
    property DtFechaManual    : TDateTime read FDtFechaManual;
    property DtFechaEP        : TDateTime read FDtFechaEP;
    property DtFechaImob      : TDateTime read FDtFechaImob;
    property DtFechaRF        : TDateTime read FDtFechaRF;
    property DtFechaRV        : TDateTime read FDtFechaRV;
    property DtFechaBMF       : TDateTime read FDtFechaBMF;
    property DtFechaFundoRF   : TDateTime read FDtFechaFundoRF;
    property DtFechaFundoRV   : TDateTime read FDtFechaFundoRV;
    property DtFechaFundoImob : TDateTime read FDtFechaFundoImob;
    property DtFechaFundoDIC  : TDateTime read FDtFechaFundoDIC;
    property DtAbreManual     : TDateTime read FDtAbreManual;
    property DtAbreEP         : TDateTime read FDtAbreEP;
    property DtAbreImob       : TDateTime read FDtAbreImob;
    property DtAbreRF         : TDateTime read FDtAbreRF;
    property DtAbreRV         : TDateTime read FDtAbreRV;
    property DtAbreBMF        : TDateTime read FDtAbreBMF;
    property DtAbreFundoRF    : TDateTime read FDtAbreFundoRF;
    property DtAbreFundoRV    : TDateTime read FDtAbreFundoRV;
    property DtAbreFundoImob  : TDateTime read FDtAbreFundoImob;
    property DtAbreFundoDIC   : TDateTime read FDtAbreFundoDIC;
    property DtPrimManual     : TDateTime read FDtPrimManual;
    property DtPrimEP         : TDateTime read FDtPrimEP;
    property DtPrimImob       : TDateTime read FDtPrimImob;
    property DtPrimRF         : TDateTime read FDtPrimRF;
    property DtPrimRV         : TDateTime read FDtPrimRV;
    property DtPrimBMF        : TDateTime read FDtPrimBMF;
    property DtPrimFundoRF    : TDateTime read FDtPrimFundoRF;
    property DtPrimFundoRV    : TDateTime read FDtPrimFundoRV;
    property DtPrimFundoImob  : TDateTime read FDtPrimFundoImob;
    property DtPrimFundoDIC   : TDateTime read FDtPrimFundoDIC;
    property DtPrimeira       : TDateTime read FDtPrimeira;
    property VlrPrimeira      : Extended  read FVlrPrimeira;

    procedure GetParams(Const idEmpresa : Integer);

    function AtuDataFechCota(Const idEmpresa : Integer;
                             Const TipoCota  : TTipoCota;
                             Const dDtFech   : TDateTime) : Boolean;

  published

end;

implementation

{ TCtrlParamCota }

procedure TCtrlParamCota.AfterInitialize;
begin
  inherited;
  FDbParamCota.DataBaseName := DataBaseName;
end;

constructor TCtrlParamCota.Create;
begin
  inherited;
  FDbParamCota := TDbParamCota.Create(Self);
end;

destructor TCtrlParamCota.Destroy;
begin
  FreeAndNil(FDbParamCota);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FreeAndNil(FCdsParamCota);
  inherited;
end;

function TCtrlParamCota.ExisteCotaTipoOper: boolean;
var
  _CdsLocal: TCMClientDataSet;
begin
  _CdsLocal := TCMClientDataSet.Create (nil);
  try
    _CdsLocal.Data := GetDataPacket('SELECT COUNT(*) AS TOTAL FROM COTATIPOOPER');
    if _CdsLocal.FieldByName('TOTAL').AsInteger > 0 then
      Result := True
    else
      Result := False;
  finally
    FreeAndNil (_CdsLocal);
  end;
end;



function TCtrlParamCota.GravaParamCota: Boolean;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then
   begin
     Result := Connection.AppServer.GravaParamCota(CdsParamCota.Data);
     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
     try
       StartTransaction;

       // Aplica as alterações do Cds através do DbObject
       Result := ApplyCds(CdsParamCota, DbParamCota, [], []);
       if not Result then raise Exception.Create(DbParamCota.MessageInfo);

       Commit;
     except
       on E : Exception do begin
         Result := False;
         Rollback;
         MessageInfo := E.Message;
       end;
     end;
   end;
end;



procedure TCtrlParamCota.OnCreateAppServer;
begin
   inherited;
   FCdsParamCota := TCMClientDataSet.Create(nil);
end;



function TCtrlParamCota.SelecionaParamCota(const IDEmpresaProp: Integer): OLEVariant;
begin
   FDbParamCota.IDEmpresaProp.AsInteger := IDEmpresaProp;
   Result := GetDataPacket(FDbParamCota.sSQLSelect);
end;



function TCtrlParamCota.ListaParamCota(const IDEmpresaProp: Integer): OLEVariant;
var
   sSQL: string;
begin
   sSQL :=
   'SELECT                                                  ' + #13 +
   '   IDEMPRESAPROP,                                       ' + #13 +
   '   IDGRUPOREGRA,     IDTIPOREGRA,                       ' + #13 +
   '   DTPRIMMANUAL,     DTFECHAMANUAL,    DTABREMANUAL,    ' + #13 +
   '   DTPRIMEP,         DTFECHAEP,        DTABREEP,        ' + #13 +
   '   DTPRIMIMOB,       DTFECHAIMOB,      DTABREIMOB,      ' + #13 +
   '   DTPRIMRF,         DTFECHARF,        DTABRERF,        ' + #13 +
   '   DTPRIMRV,         DTFECHARV,        DTABRERV,        ' + #13 +
   '   DTPRIMBMF,        DTFECHABMF,       DTABREBMF,       ' + #13 +
   '   DTPRIMFUNDORF,    DTFECHAFUNDORF,   DTABREFUNDORF,   ' + #13 +
   '   DTPRIMFUNDORV,    DTFECHAFUNDORV,   DTABREFUNDORV,   ' + #13 +
   '   DTPRIMFUNDOIMOB,  DTFECHAFUNDOIMOB, DTABREFUNDOIMOB, ' + #13 +
   '   DTPRIMFUNDODIC,   DTFECHAFUNDODIC,  DTABREFUNDODIC,  ' + #13 +
   '   FLGCOTIZADATAANT, FLGDIAUTIL,       DTPRIMEIRA,      ' + #13 +
   '   VLRPRIMEIRA                                          ' + #13 +
   'FROM                                                    ' + #13 +
   '   PARAMCOTA                                            ' + #13 +
   'WHERE                                                   ' + #13 +
   '   IDEMPRESAPROP = ' + FormatFloat(#0, IDEmpresaProp);

   Result := GetDataPacket(sSQL);
end;



function TCtrlParamCota.TelefonePessoa(const iIdPessoa: Integer): string;
var
  sSQL: string;
  _cdsLocal: TCMClientDataSet;
begin
  try
    _cdsLocal := TCMClientDataSet.Create (nil);
    sSQL := 'SELECT TRIM(TP.DDD)||'' ''||TRIM(TP.NUMERO) AS TELEFONE ' + #13 +
            'FROM ENDPESS EP, TELENDPESS TP ' + #13 +
            'WHERE (EP.IDPESSOA = ' + IntToStr (iIdPessoa) + ') ' +
            'AND (EP.IDENDERECO = TP.IDENDERECO) ' + #13 +
            'AND (TP.TIPO LIKE ''%C%'') ' + #13 +
            'AND (ROWNUM = 1) ';
    _cdsLocal.Data := GetDataPacket (sSQL);
    Result := _cdsLocal.FieldByName('TELEFONE').AsString;
  finally
    FreeAndNil (_cdsLocal);
  end;
end;



procedure TCtrlParamCota.SetCdsParamCota(const Value: TCMClientDataSet);
begin
   FCdsParamCota := Value;
end;



procedure TCtrlParamCota.SetDbParamCota(const Value: TDbParamCota);
begin
   FDbParamCota := Value;
end;



function TCtrlParamCota.ListaGrupoRegra: OleVariant;
var
sSQL: string;

begin
  sSQL := 'SELECT '                                                      + #13 +
          '  IDGRUPOREGRA, DESCRICAO '                                   + #13 +
          'FROM '                                                        + #13 +
          '  GRUPOREGRA '                                                + #13 +
          'ORDER BY '                                                    + #13 +
          '  DESCRICAO ';
  Result := GetDataPacket(sSQL);
end;


function TCtrlParamCota.ListaTipoRegra(iIdGrupo: integer = -1): OleVariant;
var
sSQL: string;

begin
  sSQL := 'SELECT '                                                      + #13 +
          '  IDTIPOREGRA AS IDTIPOREG, '                                  + #13 +
          '  DESCREGRA '                                                 + #13 +
          'FROM '                                                        + #13 +
          '  TIPOREGRA ';

          if iIdGrupo <> -1 then
          sSQL := sSQL + 'WHERE IDGRUPOREGRA = ' + IntToStr(iIdGrupo);

          sSQL := sSQL + 'ORDER BY DESCREGRA ';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlParamCota.GetParams(const idEmpresa: Integer);
var CdsParametros : TCMClientDataSet;
begin
   try
      CdsParametros      := TCMClientDataSet.Create(Nil);
      CdsParametros.Data := ListaParamCota(idEmpresa);

      FFlgCotizaDataAnt := CdsParametros.FieldByName('FLGCOTIZADATAANT').AsString = 'S';
      FFlgDiaUtil       := CdsParametros.FieldByName('FLGDIAUTIL').AsString = 'S';
      FIdEmpresaProp    := CdsParametros.FieldByName('IDEMPRESAPROP').AsInteger;
      FDtFechaManual    := CdsParametros.FieldByName('DTFECHAMANUAL').AsDateTime;
      FDtFechaEP        := CdsParametros.FieldByName('DTFECHAEP').AsDateTime;
      FDtFechaImob      := CdsParametros.FieldByName('DTFECHAIMOB').AsDateTime;
      FDtFechaRF        := CdsParametros.FieldByName('DTFECHARF').AsDateTime;
      FDtFechaRV        := CdsParametros.FieldByName('DTFECHARV').AsDateTime;
      FDtFechaBMF       := CdsParametros.FieldByName('DTFECHABMF').AsDateTime;
      FDtFechaFundoRF   := CdsParametros.FieldByName('DTFECHAFUNDORF').AsDateTime;
      FDtFechaFundoRV   := CdsParametros.FieldByName('DTFECHAFUNDORV').AsDateTime;
      FDtFechaFundoImob := CdsParametros.FieldByName('DTFECHAFUNDOIMOB').AsDateTime;
      FDtFechaFundoDIC  := CdsParametros.FieldByName('DTFECHAFUNDODIC').AsDateTime;
      FDtAbreManual     := CdsParametros.FieldByName('DTABREMANUAL').AsDateTime;
      FDtAbreEP         := CdsParametros.FieldByName('DTABREEP').AsDateTime;
      FDtAbreImob       := CdsParametros.FieldByName('DTABREIMOB').AsDateTime;
      FDtAbreRF         := CdsParametros.FieldByName('DTABRERF').AsDateTime;
      FDtAbreRV         := CdsParametros.FieldByName('DTABRERV').AsDateTime;
      FDtAbreBMF        := CdsParametros.FieldByName('DTABREBMF').AsDateTime;
      FDtAbreFundoRF    := CdsParametros.FieldByName('DTABREFUNDORF').AsDateTime;
      FDtAbreFundoRV    := CdsParametros.FieldByName('DTABREFUNDORV').AsDateTime;
      FDtAbreFundoImob  := CdsParametros.FieldByName('DTABREFUNDOIMOB').AsDateTime;
      FDtAbreFundoDIC   := CdsParametros.FieldByName('DTABREFUNDODIC').AsDateTime;
      FDtPrimManual     := CdsParametros.FieldByName('DTPRIMMANUAL').AsDateTime;
      FDtPrimEP         := CdsParametros.FieldByName('DTPRIMEP').AsDateTime;
      FDtPrimImob       := CdsParametros.FieldByName('DTPRIMIMOB').AsDateTime;
      FDtPrimRF         := CdsParametros.FieldByName('DTPRIMRF').AsDateTime;
      FDtPrimRV         := CdsParametros.FieldByName('DTPRIMRV').AsDateTime;
      FDtPrimBMF        := CdsParametros.FieldByName('DTPRIMBMF').AsDateTime;
      FDtPrimFundoRF    := CdsParametros.FieldByName('DTPRIMFUNDORF').AsDateTime;
      FDtPrimFundoRV    := CdsParametros.FieldByName('DTPRIMFUNDORV').AsDateTime;
      FDtPrimFundoImob  := CdsParametros.FieldByName('DTPRIMFUNDOIMOB').AsDateTime;
      FDtPrimFundoDIC   := CdsParametros.FieldByName('DTPRIMFUNDODIC').AsDateTime;
      FDtPrimeira       := CdsParametros.FieldByName('DTPRIMEIRA').AsDateTime;
      FVlrPrimeira      := CdsParametros.FieldByName('VLRPRIMEIRA').AsFloat;

   finally
          FreeAndNil(CdsParametros);
   end;
end;


function TCtrlParamCota.AtuDataFechCota(Const idEmpresa : Integer;
                                        Const TipoCota  : TTipoCota;
                                        Const dDtFech   : TDateTime) : Boolean;
var
   bUpd : Boolean;

begin
     Result := True;
     bUpd   := False;

     DbParamCota.Clear;
     DbParamCota.IdEmpresaProp.AsFloat := StrToFloat(IntToStr(idEmpresa));
     DbParamCota.LoadFromDb;

     case TipoCota of
         ttHstMovCota  : if  (dDtFech < FDtFechaManual) then
                         begin
                              DbParamCota.DtFechaManual.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttEmprestimo  : if (dDtFech < FDtFechaEP) then
                         begin
                              DbParamCota.DtFechaEP.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttImobiliario : if (dDtFech < FDtFechaImob) then
                         begin
                              DbParamCota.DtFechaImob.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttRF          : if (dDtFech < FDtFechaRF) then
                         begin
                              DbParamCota.DtFechaRF.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttRV          : if (dDtFech < FDtFechaRV) then
                         begin
                              DbParamCota.DtFechaRV.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttBMF         : if (dDtFech < FDtFechaBMF) then
                         begin
                              DbParamCota.DtFechaBMF.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttFundoRF     : if (dDtFech < FDtFechaFundoRF) then
                         begin
                              DbParamCota.DtFechaFundoRF.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttFundoRV     : if (dDtFech < FDtFechaFundoRV) then
                         begin
                              DbParamCota.DtFechaFundoRV.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttFundoImob   : if (dDtFech < FDtFechaFundoImob) then
                         begin
                              DbParamCota.DtFechaFundoImob.AsDateTime := dDtFech;
                              bUpd := True;
                         end;

         ttFundoDIC    : if (dDtFech < FDtFechaFundoDIC) then
                         begin
                              DbParamCota.DtFechaFundoDIC.AsDateTime := dDtFech;
                              bUpd := True;
                         end;
     end;

     if bUpd then
     begin
          if not DbParamCota.Update then
          begin
               MessageInfo := DbParamCota.MessageInfo;
               Result := False;
          end;
     end;
end;

end.
