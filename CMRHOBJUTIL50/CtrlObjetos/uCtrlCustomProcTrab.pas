{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 03/06/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlCustomProcTrab;

interface

uses Controls, SysUtils, Db, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate,
  uCMClientDataSet, uCtrlCustomRH, uCtrlFuncoesRH, uCtrlRegra;

type
  TCtrlCustomProcTrab = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCtrlRegra: TCtrlRegra;

    FIdEmpresa: integer;
    FTipoEmpresa: string;

    function ExecRegra(IdRegra: double; Dados: OleVariant): double;
  public
    constructor Create(IdEmpresa: integer; TipoEmpresa: string); reintroduce;
    destructor  Destroy; override;

    function GetDataHist(Campo: TField): TDateTime;

    function GetValorAtual(ValHist: double; DataHist: TDate; MoeCodigo: integer;
      IdRegra: double; NumProcTrab: double; TipoCalc: integer): double;
  end;

implementation

uses uCMTypes, uTiposRegraMT;

{ TCtrlCustomProcTrab }

constructor TCtrlCustomProcTrab.Create(IdEmpresa: integer; TipoEmpresa: string);
begin
  inherited Create;
  FIdEmpresa := IdEmpresa;
  FTipoEmpresa := TipoEmpresa;

  FCtrlRegra := TCtrlRegra.Create;
end;

destructor TCtrlCustomProcTrab.Destroy;
begin
  FreeAndNil(FCtrlRegra);
  inherited;
end;

procedure TCtrlCustomProcTrab.AfterInitialize;
begin
  inherited;
  FCtrlRegra.InitializeAs(Self);
end;

procedure TCtrlCustomProcTrab.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlCustomProcTrab.DoChangeDataBase;
begin
  inherited;
  FCtrlRegra.DataBaseName := DataBaseName;
end;

function TCtrlCustomProcTrab.ExecRegra(IdRegra: double; Dados: OleVariant): double;
begin
  try
    FCtrlRegra.RuleNumber := FloatToStr(IdRegra);
    FCtrlRegra.IdEmpresa := FIdEmpresa;
    FCtrlRegra.GravaCalculo := false;
    FCtrlRegra.ReloadRule := false;

    if (FTipoEmpresa = 'P') then
      FCtrlRegra.TipoCliente := tcFundacao
    else
      FCtrlRegra.TipoCliente := tcOutros;

    FCtrlRegra.PassoaPasso := false;
    FCtrlRegra.CopiaDataSet(Dados);
    FCtrlRegra.Execute;

    if not(FCtrlRegra.Error) then
      Result := StrToFloat(OraNumero(FCtrlRegra.Result))
    else
      raise Exception.Create(FCtrlRegra.MessageInfo);
  except
    on E: Exception do
    begin
      Result := 0;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlCustomProcTrab.GetValorAtual(ValHist: double; DataHist: TDate;
  MoeCodigo: integer; IdRegra: double; NumProcTrab: double; TipoCalc: integer): double;
var
  _CdsAux: TCMClientDataSet;
  {sSQL, }sPercValor: string;
  //bErroRegra: boolean;
begin
  // Criar query temporária
  Result := ValHist;
  if (DataHist = 0) or (TipoCalc = 2) then
    exit;

  _CdsAux := TCMClientDataSet.Create(nil);
  try                                     
    if (TipoCalc = 0) and (MoeCodigo > 0) then
    begin
      _CdsAux.Data := GetdataPacket(
        'SELECT FLGPERCVALOR' +CR_LF+
        'FROM   MOEDA' +CR_LF+
        'WHERE  (MOECODIGO = ' +IntToStr(MoeCodigo)+ ')');
      sPercValor := _CdsAux.FieldByName('FLGPERCVALOR').asString;

      if (sPercValor = 'V') then
        _CdsAux.Data := GetdataPacket(
          'SELECT COTVALOR' +CR_LF+
          'FROM   COTACAOMOEDA' +CR_LF+
          'WHERE  (MOECODIGO = ' +IntToStr(MoeCodigo)+ ') AND' +CR_LF+
          '       (COTDATA  <= TO_DATE(' +QuotedStr(DateToStr(DataHist))+ ',''DD/MM/YYYY''))' +CR_LF+
          'ORDER BY' +CR_LF+
          '  COTDATA DESC')
      else
        _CdsAux.Data := GetdataPacket(
          'SELECT COTVALOR' +CR_LF+
          'FROM   COTACAOMOEDA' +CR_LF+
          'WHERE  (MOECODIGO = ' +IntToStr(MoeCodigo)+ ') AND' +CR_LF+
          '       (COTDATA  >= TO_DATE(' +QuotedStr(DateToStr(DataHist))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
          '       (COTDATA  <= SYSDATE)' +CR_LF+
          'ORDER BY' +CR_LF+
          '  COTDATA');

      if not(_CdsAux.IsEmpty) then
      begin
        if (sPercValor = 'V') then
          Result := ValHist * _CdsAux.FieldByName('COTVALOR').asFloat
        else
        begin
          while not(_CdsAux.EOF) do
          begin
            Result := Result + Result * _CdsAux.FieldByName('COTVALOR').asFloat / 100;
            _CdsAux.Next;
          end;
        end;
      end;
    end;

    if (TipoCalc = 1) and (IdRegra > 0) then
    begin
      _CdsAux.Data := GetdataPacket(
        'SELECT P.*, ' +OraNumero(FloatToStr(ValHist))+ ' AS VALORHIST' +CR_LF+
        'FROM   PROCESSOTRAB P ' +CR_LF+
        'WHERE  (P.NUMPROCTRAB = ' +FloatToStr(NumProcTrab)+ ')');
      Result := ExecRegra(IdRegra, _CdsAux.Data);
    end;
  finally
    FreeObject(_CdsAux);
  end;
end;

function TCtrlCustomProcTrab.GetDataHist(Campo: TField): TDateTime;
begin
  if (TDateField(Campo).asString = '') then
    Result := 0
  else
    Result := StrToDate(Copy(TDateField(Campo).asString,1,Length(ShortDateFormat)));
end;

end.
