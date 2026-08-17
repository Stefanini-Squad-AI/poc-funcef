{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/12/2001                                 }
{                                                       }
{*******************************************************}

unit uCtrlLancaHoras;

interface

uses SysUtils, Db, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbRubricaIndiv;

type
  TCtrlLancaHoras = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbRubricaIndiv: TDbRubricaIndiv;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Processar(MesRef: string; IdEmpresa: integer;
      IdPessoa,IdProvento,IdRegra,ValorRubrica: double; SeqRubricaIndiv: integer): boolean;
  end;

implementation

uses uCtrlFuncoesRH , uSistema;

{ TCtrlLancaHoras }

constructor TCtrlLancaHoras.Create;
begin
  inherited;
  FDbRubricaIndiv := TDbRubricaIndiv.Create(Self);
end;

destructor TCtrlLancaHoras.Destroy;
begin
  inherited;
  FDbRubricaIndiv.Free;
end;

procedure TCtrlLancaHoras.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlLancaHoras.DoChangeDataBase;
begin
  inherited;
  FDbRubricaIndiv.DataBaseName := DataBaseName;
end;

function TCtrlLancaHoras.Processar(MesRef: string; IdEmpresa: integer;
  IdPessoa,IdProvento,IdRegra,ValorRubrica: double; SeqRubricaIndiv: integer): boolean;
var
  bOk: boolean;
begin
  try
    Result := false;
    if (ValorRubrica > 0) then
    begin
      FDbRubricaIndiv.Clear;
      FDbRubricaIndiv.FieldByName('IdEmpresa').asInteger := IdEmpresa;
      FDbRubricaIndiv.FieldByName('IdPessoa').asFloat := IdPessoa;
      FDbRubricaIndiv.FieldByName('IdRubrica').asFloat := IdProvento;
      FDbRubricaIndiv.FieldByName('SeqRubricaIndiv').asInteger := SeqRubricaIndiv;
      FDbRubricaIndiv.LoadFromDb;

      FDbRubricaIndiv.FieldByName('IdRegraCalculo').asFloat := IdRegra;
      FDbRubricaIndiv.FieldByName('AnoMesInicio').asString := MesRef;
      FDbRubricaIndiv.FieldByName('ValorRubrica').asFloat := ValorRubrica;
      if (FDbRubricaIndiv.RecordCount = 0) or
         (FDbRubricaIndiv.FieldByName('FlgPermanente').asString = '') then
      begin
        FDbRubricaIndiv.FieldByName('IdEmpresa').asInteger := IdEmpresa;
        FDbRubricaIndiv.FieldByName('IdPessoa').asFloat := IdPessoa;
        FDbRubricaIndiv.FieldByName('IdRubrica').asFloat := IdProvento;
        FDbRubricaIndiv.FieldByName('SeqRubricaIndiv').asInteger := 1;
        FDbRubricaIndiv.FieldByName('NumOcorrencias').asInteger := 0;
        FDbRubricaIndiv.FieldByName('FlgPermanente').asInteger := 0;
        FDbRubricaIndiv.FieldByName('FlgTpRubManut').asString := '2';
        FDbRubricaIndiv.FieldByName('Parcelas').asInteger := 1;

        StartTransaction;
        bOk := FDbRubricaIndiv.Insert;
      end
      else
      begin
        if (FDbRubricaIndiv.FieldByName('FlgPermanente').asInteger = 0) then
          FDbRubricaIndiv.FieldByName('Parcelas').asInteger :=
            FDbRubricaIndiv.FieldByName('NumOcorrencias').asInteger + 1;

        StartTransaction;
        bOk := FDbRubricaIndiv.Update;
      end;

      if (bOk) then
      begin
        Commit;
        Result := true;
      end
      else
        Rollback;
    end;
  except
    on E: Exception do
    begin
      Rollback;
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

end.
