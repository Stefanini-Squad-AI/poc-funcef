{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbTurnoDia;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbTurnoDia = class(TCmDbObject)
  private
    FIdTurnoDiario: TCmDbField;
    FInicioExpediente: TCmDbField;
    FInicioAlmoco: TCmDbField;
    FFinalAlmoco: TCmDbField;
    FFinalExpediente: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTurnoDiario: TCmDbField read FIdTurnoDiario write FIdTurnoDiario;
    property InicioExpediente: TCmDbField read FInicioExpediente write FInicioExpediente;
    property InicioAlmoco: TCmDbField read FInicioAlmoco write FInicioAlmoco;
    property FinalAlmoco: TCmDbField read FFinalAlmoco write FFinalAlmoco;
    property FinalExpediente: TCmDbField read FFinalExpediente write FFinalExpediente;
  end;

implementation

{ TDbTurnoDia }

constructor TDbTurnoDia.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TURNODIA';

  FIdTurnoDiario := CreateCmDbField('IDTURNODIARIO',ftFloat,true,true,false,true,'');
  FInicioExpediente := CreateCmDbField('INICIOEXPEDIENTE',ftString,false,false,false,true,'');
  FInicioAlmoco := CreateCmDbField('INICIOALMOCO',ftString,false,false,false,true,'');
  FFinalAlmoco := CreateCmDbField('FINALALMOCO',ftString,false,false,false,true,'');
  FFinalExpediente := CreateCmDbField('FINALEXPEDIENTE',ftString,false,false,false,true,'');
end;

end.
