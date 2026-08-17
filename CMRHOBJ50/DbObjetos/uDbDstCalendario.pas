{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Criado Em: 17/02/2007                                 }
{                                                       }
{*******************************************************}

unit uDbDstCalendario;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbDstCalendario = class(TCmDbObject)
  private
    FIdDestacamento: TCmDbField;
    FDataDestacamento: TCmDbField;
    FFlgDiaria: TCmDbField;
    FVlrDiaria: TCmDbField;
    FVlrHotel: TCmDbField;
    FVlrDeslocamento: TCmDbField;
    FPcHotel: TCmDbField;
    FPcDiaria: TCmDbField;
    FPcDeslocamento: TCmDbField;
    procedure SetVlrDeslocamento(const Value: TCmDbField);
    procedure SetVlrDiaria(const Value: TCmDbField);
    procedure SetVlrHotel(const Value: TCmDbField);
    procedure SetDataDestacamento(const Value: TCmDbField);
    procedure SetFlgDiaria(const Value: TCmDbField);
    procedure SetIdDestacamento(const Value: TCmDbField);
    procedure SetPcDeslocamento(const Value: TCmDbField);
    procedure SetPcDiaria(const Value: TCmDbField);
    procedure SetPcHotel(const Value: TCmDbField);
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdDestacamento: TCmDbField   read FIdDestacamento   write SetIdDestacamento;
    property DataDestacamento: TCmDbField read FDataDestacamento write SetDataDestacamento;
    property FlgDiaria: TCmDbField        read FFlgDiaria        write SetFlgDiaria;
    property VlrDiaria: TCmDbField        read FVlrDiaria        write SetVlrDiaria;
    property VlrHotel: TCmDbField         read FVlrHotel         write SetVlrHotel;
    property VlrDeslocamento: TCmDbField  read FVlrDeslocamento  write SetVlrDeslocamento;
    property PcDiaria: TCmDbField read FPcDiaria write SetPcDiaria;
    property PcHotel: TCmDbField read FPcHotel write SetPcHotel;
    property PcDeslocamento: TCmDbField read FPcDeslocamento write SetPcDeslocamento;

  end;

implementation

{ TDbFerias }

constructor TDbDstCalendario.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'DSTCALENDARIO';

  FIdDestacamento   := CreateCmDbField('IDDESTACAMENTO',ftFloat,true,true,false,true,'');
  FDataDestacamento := CreateCmDbField('DATADESTACAMENTO',ftDateTime,true,true,false,true,'');
  FFlgDiaria        := CreateCmDbField('FLGDIARIA',ftFloat,false,false,false,false,'');
  FVlrDiaria        := CreateCmDbField('VLRDIARIA',ftFloat,false,false,false,false,'');
  FVlrHotel         := CreateCmDbField('VLRHOTEL',ftFloat,false,false,false,false,'');
  FVlrDeslocamento  := CreateCmDbField('VLRDESLOCAMENTO',ftFloat,false,false,false,false,'');
  FPcDiaria         := CreateCmDbField('PCDIARIA',ftFloat,false,false,false,false,'');
  FPcHotel          := CreateCmDbField('PCHOTEL',ftFloat,false,false,false,false,'');
  FPcDeslocamento   := CreateCmDbField('PCDESLOCAMENTO',ftFloat,false,false,false,false,'');

end;

procedure TDbDstCalendario.SetDataDestacamento(const Value: TCmDbField);
begin
  FDataDestacamento := Value;
end;

procedure TDbDstCalendario.SetFlgDiaria(const Value: TCmDbField);
begin
  FFlgDiaria := Value;
end;

procedure TDbDstCalendario.SetIdDestacamento(const Value: TCmDbField);
begin
  FIdDestacamento := Value;
end;

procedure TDbDstCalendario.SetPcDeslocamento(const Value: TCmDbField);
begin
  FPcDeslocamento := Value;
end;

procedure TDbDstCalendario.SetPcDiaria(const Value: TCmDbField);
begin
  FPcDiaria := Value;
end;

procedure TDbDstCalendario.SetPcHotel(const Value: TCmDbField);
begin
  FPcHotel := Value;
end;

procedure TDbDstCalendario.SetVlrDeslocamento(const Value: TCmDbField);
begin
  FVlrDeslocamento := Value;
end;

procedure TDbDstCalendario.SetVlrDiaria(const Value: TCmDbField);
begin
  FVlrDiaria := Value;
end;

procedure TDbDstCalendario.SetVlrHotel(const Value: TCmDbField);
begin
  FVlrHotel := Value;
end;

end.
