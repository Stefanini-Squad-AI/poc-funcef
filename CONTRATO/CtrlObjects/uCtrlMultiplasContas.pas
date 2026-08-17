unit uCtrlMultiplasContas;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet, Classes;

type
   TMultiplasContas = Record
      rValor           : Double;
      iUnidNegoc       : Integer;
      iIdPlanoPrev     : Integer;
      iIdPatro         : Integer;
      iIdSegregaCriter : Integer;
      sConta           : String;
   End;

   TLancaMB = array of TMultiplasContas;

   TCtrlMultiplasContas = Class(TCmControlObject)
   private
   public
      procedure OnCreateAppServer; override;
      function BuscaMultiplasContas(var pvLancaMB : TLancaMB; pvContab : TLancaMB) : Boolean;

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

Uses uCtrlMedicao;

{ TCtrlMultiplasContas }

procedure TCtrlMultiplasContas.AfterInitialize;
begin
  inherited;
end;

{function TCtrlMultiplasContas.BuscaMultiplasContas(
  pIdContrato : Integer; pIdPessoa : Double): Boolean;
Var
  sSql      : String;
  cdsContas : TCMClientDataSet;

begin
  try
    cdsContas := TCMClientDataSet.Create(nil);
    try
      sSql := ' SELECT DISTINCT '+
                ' NVL(TR.PLACONTACREDITO, E.CONTACFORN) AS CONTACREDITO '+

              ' FROM '+
                ' CONTRATOCONTR C, '+
                ' OBJETOSXITEMCONTR O, '+
                ' OBJETOXITEM OI, '+
                ' TIPORECEBDESEMB TR, '+
                ' EMPRESAFORN E '+

              ' WHERE (OI.IDPESSOA     = TR.IDPESSOA(+)) '+
                ' AND (OI.CODTIPRECDES = TR.CODTIPRECDES(+)) '+
                ' AND (OI.RECPAG       = TR.RECPAG(+)) '+
                ' AND (O.IDCONTRATO    = '+IntToStr(pIdContrato)+') '+
                ' AND (C.IDCONTRATO    = O.IDCONTRATO) '+
                ' AND (O.IDOBJETO      = OI.IDOBJETO) '+
                ' AND (O.IDITEM        = OI.IDITEM) '+
                ' AND (E.IDFORCLI      = C.IDFORCLI) '+
                ' AND (E.IDPESSOA      = '+FloatToStr(pIdPessoa)+') ';
      cdsContas.Data := GetDataPacket(sSql);
      If cdsContas.RecordCount > 1 Then
        Result := True
      Else
        Result := False;
    Except
      on E:Exception do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    End;
  finally
    cdsContas.Free;
  end;
end;}

function TCtrlMultiplasContas.BuscaMultiplasContas(
  var pvLancaMB: TLancaMB; pvContab: TLancaMB): Boolean;
Var
  i, iRegistro : Integer;
  bNovoLancto  : Boolean;

begin
  Result    := False;
  For iRegistro := 0 to Length(pvContab)-1 do
  Begin
    bNovoLancto := True;
    For i := 0 to Length(pvLancaMB)-1 do
    Begin
      If (pvContab[iRegistro].iIdSegregaCriter = pvLancaMB[i].iIdSegregaCriter) And
         (pvContab[iRegistro].sConta           = pvLancaMB[i].sConta) Then
      Begin
        bNovoLancto := False;
        pvLancaMB[i].rValor := pvLancaMB[i].rValor + pvContab[iRegistro].rValor;
      End;
    End;

    If bNovoLancto Then
    Begin
      SetLength(pvLancaMB, (Length(pvLancaMB)+1) );
      i := High(pvLancaMB);
      pvLancaMB[i].iIdPatro         := pvContab[iRegistro].iIdPatro;
      pvLancaMB[i].iIdPlanoPrev     := pvContab[iRegistro].iIdPlanoPrev;
      pvLancaMB[i].iIdSegregaCriter := pvContab[iRegistro].iIdSegregaCriter;
      pvLancaMB[i].iUnidNegoc       := pvContab[iRegistro].iUnidNegoc;
      pvLancaMB[i].rValor           := pvContab[iRegistro].rValor;
      pvLancaMB[i].sConta           := pvContab[iRegistro].sConta;
    end;
  End;
  if Length(pvLancaMB) > 1 then
    Result := True;
end;

procedure TCtrlMultiplasContas.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlMultiplasContas.OnCreateAppServer;
begin
  inherited;
end;

end.
