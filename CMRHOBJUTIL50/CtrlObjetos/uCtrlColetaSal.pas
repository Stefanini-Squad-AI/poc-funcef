{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 25/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlColetaSal;

interface

uses Classes, SysUtils, uCMTypes, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uCtrlCalcRub;

type
  TOnIncProgresso = procedure of object;

  TCtrlColetaSal = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
  private
    FCtrlCalcRub: TCtrlCalcRub;

    FListaQuantSal: TStringList;
    FListaSalNominal: TStringList;
    FListaSalReal: TStringList;

    FOnIncProgresso: TOnIncProgresso;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHistorico(const IdPessoa: double; const ListaIdRubrica: string = ''): OleVariant;

    procedure ColetarDados(CdsPessoal: OleVariant; const ListaIdRubrica: string);

    property ListaQuantSal: TStringList read FListaQuantSal;
    property ListaSalNominal: TStringList read FListaSalNominal;
    property ListaSalReal: TStringList read FListaSalReal;
    property OnIncProgresso: TOnIncProgresso read FOnIncProgresso write FOnIncProgresso;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlColetaSal }

constructor TCtrlColetaSal.Create;
begin
  inherited;
  FCtrlCalcRub := TCtrlCalcRub.Create;
  FListaQuantSal := TStringList.Create;
  FListaSalNominal := TStringList.Create;
  FListaSalReal := TStringList.Create;
end;

destructor TCtrlColetaSal.Destroy;
begin
  FCtrlCalcRub.Free;
  FListaSalNominal.Free;
  FListaSalReal.Free;
  FListaQuantSal.Free;
  inherited;
end;

procedure TCtrlColetaSal.AfterInitialize;
begin
  inherited;
  FCtrlCalcRub.InitializeAs(Self);
end;

function TCtrlColetaSal.ListHistorico(const IdPessoa: double; const ListaIdRubrica: string): OleVariant;
begin
  Result := GetDataPacket(
    '(SELECT'+CR_LF+
    '   PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS,'+CR_LF+
    '   RI.NUMOCORRENCIAS, RI.FLGPERMANENTE, RI.IDREGRACALCULO,'+CR_LF+
    '   RI.VALORRUBRICA, RI.IDRUBRICA'+CR_LF+
    ' FROM'+CR_LF+
    '   RUBRICAINDIV RI, PROVDESC PD'+CR_LF+
    ' WHERE'+CR_LF+
    '   (RI.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    IFF(ListaIdRubrica='','',FU.MontaSelSQL('RI.IDRUBRICA',ListaIdRubrica,3,5) +CR_LF)+
    '   (PD.FLGCONSTAFOLHA = 0) AND'+CR_LF+
    '   (PD.IDBENEFSALAR  IS NOT NULL) AND'+CR_LF+
    '   (RI.IDRUBRICA      = PD.IDPROVENTO))'+CR_LF+
    'UNION'+CR_LF+
    '(SELECT'+CR_LF+
    '   PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS,'+CR_LF+
    '   0 AS NUMOCORRENCIAS, 1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO,'+CR_LF+
    '   H.VALORPROVENTO AS VALORRUBRICA, H.IDRUBRICA'+CR_LF+
    ' FROM'+CR_LF+
    '   HISTRUBSAL H, PROVDESC PD'+CR_LF+
    ' WHERE'+CR_LF+
    '   (H.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    IFF(ListaIdRubrica='','',FU.MontaSelSQL('H.IDRUBRICA',ListaIdRubrica,3,1) +CR_LF)+
    '   (H.MES = (SELECT MAX(H.MES)'+CR_LF+
    '             FROM   HISTRUBSAL H, PROVDESC PD, PARAMRH P'+CR_LF+
    '             WHERE  (PD.IDBENEFSALAR IS NOT NULL) AND'+CR_LF+
    '                    (H.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    IFF(ListaIdRubrica='','',FU.MontaSelSQL('H.IDRUBRICA',ListaIdRubrica,20,5) +CR_LF)+
    '                    (P.IDMOTIVO       = H.IDMOTIVO) AND'+CR_LF+
    '                    (PD.IDPROVENTO    = H.IDRUBRICA))) AND'+CR_LF+
    '   (PD.FLGCONSTAFOLHA = 1) AND'+CR_LF+
    '   (PD.IDBENEFSALAR  IS NOT NULL) AND'+CR_LF+
    '   (H.IDRUBRICA       = PD.IDPROVENTO))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  2 DESC');
end;

procedure TCtrlColetaSal.ColetarDados(CdsPessoal: OleVariant; const ListaIdRubrica: string);
var
  c, iAux: integer;
  rValBeneficio, rValSalario: real;
  dValCalc: double;
  bNaoTem: boolean;
  sIdRegra, sIdPessoa: string;
  _CdsHstBen, _CdsPessoal: TCMClientDataSet;
begin
  _CdsHstBen := TCMClientDataSet.Create(nil);
  _CdsPessoal := TCMClientDataSet.Create(nil);
  try
    _CdsPessoal.Data := CdsPessoal;
    
    FListaSalNominal.Clear;
    FListaSalReal.Clear;
    FListaQuantSal.Clear;

    while not(_CdsPessoal.EOF) do
    begin
      rValBeneficio := 0;
      if (_CdsPessoal.FieldByName('SALARIOATUAL').IsNull) then
        rValSalario := 0
      else
        rValSalario := _CdsPessoal.FieldByName('SALARIOATUAL').asFloat;

      if (_CdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
        rValSalario := rValSalario * 30
      else
      if (_CdsPessoal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
        rValSalario := rValSalario * _CdsPessoal.FieldByName('JORNADAMENSAL').asInteger;

      // Aqui entra a rotina de cálculo do benefício em rValBeneficio
      _CdsHstBen.Data := ListHistorico(_CdsPessoal.FieldByName('IDPESSOA').asFloat, ListaIdRubrica);
      while not(_CdsHstBen.EOF) do
      begin      
        if (_CdsHstBen.FieldByName('ANOMESINICIO').asString <= RetornaAnoMes(Date)) and
           ((_CdsHstBen.FieldByName('NUMOCORRENCIAS').asInteger <>
             _CdsHstBen.FieldByName('PARCELAS').asInteger) or
            (_CdsHstBen.FieldByName('FLGPERMANENTE').asInteger = 1) or
            (_CdsHstBen.FieldByName('IDREGRACALCULO').asFloat = -99)) then
        begin
          if (_CdsHstBen.FieldByName('VALORRUBRICA').IsNull) then
            dValCalc := 0
          else
            dValCalc := _CdsHstBen.FieldByName('VALORRUBRICA').asFloat;

          if not(_CdsHstBen.FieldByName('IDREGRACALCULO').IsNull) and
            (_CdsHstBen.FieldByName('IDREGRACALCULO').asFloat <> -99) then
          begin
            sIdRegra := _CdsHstBen.FieldByName('IDREGRACALCULO').asString;
            sIdPessoa := _CdsPessoal.FieldByName('IDPESSOA').asString;
            FCtrlCalcRub.CalcBeneficioRegra(sIdRegra, sIdPessoa, dValCalc);
          end;

          rValBeneficio := rValBeneficio + dValCalc;
        end;
        _CdsHstBen.Next;
      end;

      rValBeneficio := rValSalario + rValBeneficio; // Soma Salário com Benefício
      bNaoTem := true;
      if (FListaSalNominal.Count > 0) then
        for c:=0 to FListaSalNominal.Count-1 do
        begin
          if (FloatToStrF(rValSalario,ffFixed,12,2) = FListaSalNominal[c]) and
             (FloatToStrF(rValBeneficio,ffFixed,12,2) = FListaSalReal[c]) then
          begin
            iAux := StrToInt(FListaQuantSal[c]) + 1;
            FListaQuantSal[c] := IntToStr(iAux);
            bNaoTem := false;
            break;
          end;
        end;

      if (bNaoTem) then
      begin
        FListaSalNominal.Add(FloatToStrF(rValSalario, ffFixed,12,2));
        FListaSalReal.Add(FloatToStrF(rValBeneficio, ffFixed,12,2));
        FListaQuantSal.Add('1');
      end;
      _CdsPessoal.Next;
      if Assigned(FOnIncProgresso) then
        FOnIncProgresso;
    end;
  finally
    FreeObject(_CdsHstBen);
    FreeObject(_CdsPessoal);
  end;
end;

end.
