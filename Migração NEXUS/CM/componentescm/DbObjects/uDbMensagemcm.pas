{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uDbMensagemcm;

interface

Uses uCmCustomCdbObject,uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbMensagemcm = class(TCmDbObject)

  private
    FAssunto: TCmDbField;
    FDataenvio: TCmDbField;
    FDataprograma: TCmDbField;
    FLida: TCmDbField;
    FIdmsgpre: TCmDbField;
    FIdreservasfront: TCmDbField;
    FMensagem: TCmDbField;
    FIddestinatario: TCmDbField;
    FTipodestinatario: TCmDbField;
    FIdmensagem: TCmDbField;
    FIdremetente: TCmDbField;
    procedure SetAssunto(const Value: TCmDbField);
    procedure SetDataenvio(const Value: TCmDbField);
    procedure SetDataprograma(const Value: TCmDbField);
    procedure SetIddestinatario(const Value: TCmDbField);
    procedure SetIdmensagem(const Value: TCmDbField);
    procedure SetIdmsgpre(const Value: TCmDbField);
    procedure SetIdremetente(const Value: TCmDbField);
    procedure SetIdreservasfront(const Value: TCmDbField);
    procedure SetLida(const Value: TCmDbField);
    procedure SetMensagem(const Value: TCmDbField);
    procedure SetTipodestinatario(const Value: TCmDbField);

  public

     Property Tipodestinatario: TCmDbField read FTipodestinatario write SetTipodestinatario;
     Property Mensagem: TCmDbField read FMensagem write SetMensagem;
     Property Lida: TCmDbField read FLida write SetLida;
     Property Idreservasfront: TCmDbField read FIdreservasfront write SetIdreservasfront;
     Property Idremetente: TCmDbField read FIdremetente write SetIdremetente;
     Property Idmsgpre: TCmDbField read FIdmsgpre write SetIdmsgpre;
     Property Idmensagem: TCmDbField read FIdmensagem write SetIdmensagem;
     Property Iddestinatario: TCmDbField read FIddestinatario write SetIddestinatario;
     Property Dataprograma: TCmDbField read FDataprograma write SetDataprograma;
     Property Dataenvio: TCmDbField read FDataenvio write SetDataenvio;
     Property Assunto: TCmDbField read FAssunto write SetAssunto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMensagemcm }

constructor TDbMensagemcm.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MENSAGEMCM';

  fTipodestinatario := CreateCmDbField('TIPODESTINATARIO',ftString,False,False,False,True,'Tipo de Destinatário');
  fMensagem := CreateCmDbField('MENSAGEM',ftString,False,False,False,True,'Mensagem');
  fLida := CreateCmDbField('LIDA',ftfloat,False,False,False,False,'Status');
  fIdreservasfront := CreateCmDbField('IDRESERVASFRONT',ftfloat,False,False,False,True,'Reserva');
  fIdremetente := CreateCmDbField('IDREMETENTE',ftfloat,True,False,False,True,'Remetente');
  fIdmsgpre := CreateCmDbField('IDMSGPRE',ftfloat,False,False,False,True,'Identificador da Mensagem Pre');
  fIdmensagem := CreateCmDbField('IDMENSAGEM',ftfloat,True,True,False,True,'Identificador da Mensagem');
  fIddestinatario := CreateCmDbField('IDDESTINATARIO',ftfloat,False,False,False,True,'Destrinatário');
  fDataprograma := CreateCmDbField('DATAPROGRAMA',ftDateTime,False,False,False,True,'Data Programada');
  fDataenvio := CreateCmDbField('DATAENVIO',ftDateTime,True,False,False,True,'Data de Envio');
  fAssunto := CreateCmDbField('ASSUNTO',ftString,False,False,False,True,'Assunto');
end;

function TDbMensagemcm.Insert: Boolean;
begin
   fIdmensagem.AsFloat := GetSequence('MENSAGEMCM');
   Result := Inherited Insert;
end;

procedure TDbMensagemcm.SetAssunto(const Value: TCmDbField);
begin
  FAssunto := Value;
end;

procedure TDbMensagemcm.SetDataenvio(const Value: TCmDbField);
begin
  FDataenvio := Value;
end;

procedure TDbMensagemcm.SetDataprograma(const Value: TCmDbField);
begin
  FDataprograma := Value;
end;

procedure TDbMensagemcm.SetIddestinatario(const Value: TCmDbField);
begin
  FIddestinatario := Value;
end;

procedure TDbMensagemcm.SetIdmensagem(const Value: TCmDbField);
begin
  FIdmensagem := Value;
end;

procedure TDbMensagemcm.SetIdmsgpre(const Value: TCmDbField);
begin
  FIdmsgpre := Value;
end;

procedure TDbMensagemcm.SetIdremetente(const Value: TCmDbField);
begin
  FIdremetente := Value;
end;

procedure TDbMensagemcm.SetIdreservasfront(const Value: TCmDbField);
begin
  FIdreservasfront := Value;
end;

procedure TDbMensagemcm.SetLida(const Value: TCmDbField);
begin
  FLida := Value;
end;

procedure TDbMensagemcm.SetMensagem(const Value: TCmDbField);
begin
  FMensagem := Value;
end;

procedure TDbMensagemcm.SetTipodestinatario(const Value: TCmDbField);
begin
  FTipodestinatario := Value;
end;

end.



