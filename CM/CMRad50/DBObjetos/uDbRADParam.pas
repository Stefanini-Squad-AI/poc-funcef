{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbRADParam;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadParam = class(TCmDbObject)

  private
    FIdemailconexao: TCmDbField;
    FIdempresa: TCmDbField;
    FFlgEnviaEmail: TCmDbField;
    FFlgEnviaCM: TCmDbField;
    FHoraFimExp: TCmDbField;
    FHoraIniExp: TCmDbField;
    FFLG24h: TCmDbField;
    FIdRemetente: TCmDbField;
    procedure SetIdemailconexao(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetFlgEnviaCM(const Value: TCmDbField);
    procedure SetFlgEnviaEmail(const Value: TCmDbField);
    procedure SetFLG24h(const Value: TCmDbField);
    procedure SetHoraFimExp(const Value: TCmDbField);
    procedure SetHoraIniExp(const Value: TCmDbField);
    procedure SetIdRemetente(const Value: TCmDbField);

  public

     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idemailconexao: TCmDbField read FIdemailconexao write SetIdemailconexao;
     //Marcus Oliveira 09/11/06
     Property FlgEnviaEmail: TCmDbField read FFlgEnviaEmail write SetFlgEnviaEmail;
     Property FlgEnviaCM: TCmDbField read FFlgEnviaCM write SetFlgEnviaCM;

     //amf 17.11.2006 21792
     property FLG24h: TCmDbField read FFLG24h write SetFLG24h;
     property HoraIniExp: TCmDbField read FHoraIniExp write SetHoraIniExp;
     property HoraFimExp: TCmDbField read FHoraFimExp write SetHoraFimExp;
     property IdRemetente: TCmDbField read FIdRemetente write SetIdRemetente;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbRadParam }

constructor TDbRadParam.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADPARAM';

   fIdempresa      := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'Id. Empresa');
   fIdemailconexao := CreateCmDbField('IDEMAILCONEXAO',ftfloat,False,False,False,True,'Id. Conexão e-mail');
   FFlgEnviaEmail  := CreateCmDbField('FLGENVIAEMAIL',ftfloat,True,False,False,False,'Envio de e-mail');
   FFlgEnviaCM     := CreateCmDbField('FLGENVIACM',ftfloat,True,False,False,False,'Envio de Mensagem CM');
   FFLG24h         := CreateCmDbField('FLG24H',ftfloat,True,False,False,False,'Cálculo de prazo, 24h 7 dias por semana');
   FHoraIniExp     := CreateCmDbField('HORAINIEXP',ftString,False,False,False,False,'Hora de início de expediente');
   FHoraIniExp     := CreateCmDbField('HORAFIMEXP',ftString,False,False,False,False,'Hora de término de expediente');
   FIdRemetente    := CreateCmDbField('IDREMETENTE',ftFloat,False,False,False,True,'Remetente CM');
end;

procedure TDbRadParam.SetFLG24h(const Value: TCmDbField);
begin
  FFLG24h := Value;
end;

procedure TDbRadParam.SetFlgEnviaCM(const Value: TCmDbField);
begin
  FFlgEnviaCM := Value;
end;

procedure TDbRadParam.SetFlgEnviaEmail(const Value: TCmDbField);
begin
  FFlgEnviaEmail := Value;
end;

procedure TDbRadParam.SetHoraFimExp(const Value: TCmDbField);
begin
  FHoraFimExp := Value;
end;

procedure TDbRadParam.SetHoraIniExp(const Value: TCmDbField);
begin
  FHoraIniExp := Value;
end;

procedure TDbRadParam.SetIdemailconexao(const Value: TCmDbField);
begin
  FIdemailconexao := Value;
end;

procedure TDbRadParam.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRadParam.SetIdRemetente(const Value: TCmDbField);
begin
  FIdRemetente := Value;
end;

end.



