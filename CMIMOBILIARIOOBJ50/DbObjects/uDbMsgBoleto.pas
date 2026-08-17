{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbMsgBoleto;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbMsgBoleto = class(TCmDbObject)

  private
    FFlgcuringa: TCmDbField;
    FIdmodulo: TCmDbField;
    FMsgdescricao: TCmDbField;
    FFlgtipocontrato: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIddocumento: TCmDbField;
    FIdmsgboleto: TCmDbField;
    FTrguserinclusao: TCmDbField;
    procedure SetFlgcuringa(const Value: TCmDbField);
    procedure SetFlgtipocontrato(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdmsgboleto(const Value: TCmDbField);
    procedure SetMsgdescricao(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Msgdescricao: TCmDbField read FMsgdescricao write SetMsgdescricao;
     Property Idmsgboleto: TCmDbField read FIdmsgboleto write SetIdmsgboleto;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
     Property Flgtipocontrato: TCmDbField read FFlgtipocontrato write SetFlgtipocontrato;
     Property Flgcuringa: TCmDbField read FFlgcuringa write SetFlgcuringa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMsgBoleto }

constructor TDbMsgBoleto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MSGBOLETO';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fMsgdescricao := CreateCmDbField('MSGDESCRICAO',ftString,True,False,False,True,'Descrição da Mensagem');
   fIdmsgboleto := CreateCmDbField('IDMSGBOLETO',ftfloat,True,True,False,True,'ID da Mensagem');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'ID do Módulo');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,False,False,False,True,'Nr. do Documento');
   fFlgtipocontrato := CreateCmDbField('FLGTIPOCONTRATO',ftString,False,False,False,True,'Tipo de Contrato');
   fFlgcuringa := CreateCmDbField('FLGCURINGA',ftfloat,False,False,False,True,'');
end;

function TDbMsgBoleto.Insert: Boolean;
begin

   fIdmsgboleto.AsFloat := GetSequence('MSGBOLETO');
   Result := Inherited Insert;

end;


procedure TDbMsgBoleto.SetFlgcuringa(const Value: TCmDbField);
begin
  FFlgcuringa := Value;
end;

procedure TDbMsgBoleto.SetFlgtipocontrato(const Value: TCmDbField);
begin
  FFlgtipocontrato := Value;
end;

procedure TDbMsgBoleto.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbMsgBoleto.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbMsgBoleto.SetIdmsgboleto(const Value: TCmDbField);
begin
  FIdmsgboleto := Value;
end;

procedure TDbMsgBoleto.SetMsgdescricao(const Value: TCmDbField);
begin
  FMsgdescricao := Value;
end;

procedure TDbMsgBoleto.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbMsgBoleto.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



