{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbMorador;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbMorador = class(TCmDbObject)

  private
    FFlgconveniomedico: TCmDbField;
    FEscolafilhos: TCmDbField;
    FHospitalacidente: TCmDbField;
    FIdmorador: TCmDbField;
    FOutrasatividades: TCmDbField;
    FNomeconveniomedic: TCmDbField;
    FIdnacionalidade: TCmDbField;
    FIdtipomorador: TCmDbField;
    FApelidomorador: TCmDbField;
    FObservacao: TCmDbField;
    FDatanascimento: TCmDbField;
    FIdprofiss: TCmDbField;
    FIdHorario: TCmDbField;
    procedure SetApelidomorador(const Value: TCmDbField);
    procedure SetDatanascimento(const Value: TCmDbField);
    procedure SetEscolafilhos(const Value: TCmDbField);
    procedure SetFlgconveniomedico(const Value: TCmDbField);
    procedure SetHospitalacidente(const Value: TCmDbField);
    procedure SetIdmorador(const Value: TCmDbField);
    procedure SetIdnacionalidade(const Value: TCmDbField);
    procedure SetIdprofiss(const Value: TCmDbField);
    procedure SetIdtipomorador(const Value: TCmDbField);
    procedure SetNomeconveniomedic(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetOutrasatividades(const Value: TCmDbField);
    procedure SetIdHorario(const Value: TCmDbField);

  public

     Property Outrasatividades: TCmDbField read FOutrasatividades write SetOutrasatividades;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Nomeconveniomedic: TCmDbField read FNomeconveniomedic write SetNomeconveniomedic;
     Property Idtipomorador: TCmDbField read FIdtipomorador write SetIdtipomorador;
     Property Idprofiss: TCmDbField read FIdprofiss write SetIdprofiss;
     Property Idnacionalidade: TCmDbField read FIdnacionalidade write SetIdnacionalidade;
     Property Idmorador: TCmDbField read FIdmorador write SetIdmorador;
     Property Hospitalacidente: TCmDbField read FHospitalacidente write SetHospitalacidente;
     Property Flgconveniomedico: TCmDbField read FFlgconveniomedico write SetFlgconveniomedico;
     Property Escolafilhos: TCmDbField read FEscolafilhos write SetEscolafilhos;
     Property Datanascimento: TCmDbField read FDatanascimento write SetDatanascimento;
     Property Apelidomorador: TCmDbField read FApelidomorador write SetApelidomorador;
     Property IdHorario: TCmDbField read FIdHorario write SetIdHorario;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMorador }

constructor TDbMorador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MORADOR';

   fOutrasatividades := CreateCmDbField('OUTRASATIVIDADES',ftString,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fNomeconveniomedic := CreateCmDbField('NOMECONVENIOMEDIC',ftString,False,False,False,True,'');
   fIdtipomorador := CreateCmDbField('IDTIPOMORADOR',ftfloat,False,False,False,True,'');
   fIdprofiss := CreateCmDbField('IDPROFISS',ftfloat,False,False,False,True,'');
   fIdnacionalidade := CreateCmDbField('IDNACIONALIDADE',ftfloat,False,False,False,True,'');
   fIdmorador := CreateCmDbField('IDMORADOR',ftfloat,True,True,False,True,'');
   fHospitalacidente := CreateCmDbField('HOSPITALACIDENTE',ftString,False,False,False,True,'');
   fFlgconveniomedico := CreateCmDbField('FLGCONVENIOMEDICO',ftString,False,False,False,True,'');
   fEscolafilhos := CreateCmDbField('ESCOLAFILHOS',ftString,False,False,False,True,'');
   fDatanascimento := CreateCmDbField('DATANASCIMENTO',ftDateTime,False,False,False,True,'');
   fApelidomorador := CreateCmDbField('APELIDOMORADOR',ftString,False,False,False,True,'');
   fIdHorario := CreateCmDbField('IDHORARIO',ftfloat,False,False,False,True,'');
end;

function TDbMorador.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbMorador.SetApelidomorador(const Value: TCmDbField);
begin
  FApelidomorador := Value;
end;

procedure TDbMorador.SetDatanascimento(const Value: TCmDbField);
begin
  FDatanascimento := Value;
end;

procedure TDbMorador.SetEscolafilhos(const Value: TCmDbField);
begin
  FEscolafilhos := Value;
end;

procedure TDbMorador.SetFlgconveniomedico(const Value: TCmDbField);
begin
  FFlgconveniomedico := Value;
end;

procedure TDbMorador.SetHospitalacidente(const Value: TCmDbField);
begin
  FHospitalacidente := Value;
end;

procedure TDbMorador.SetIdmorador(const Value: TCmDbField);
begin
  FIdmorador := Value;
end;

procedure TDbMorador.SetIdnacionalidade(const Value: TCmDbField);
begin
  FIdnacionalidade := Value;
end;

procedure TDbMorador.SetIdprofiss(const Value: TCmDbField);
begin
  FIdprofiss := Value;
end;

procedure TDbMorador.SetIdtipomorador(const Value: TCmDbField);
begin
  FIdtipomorador := Value;
end;

procedure TDbMorador.SetNomeconveniomedic(const Value: TCmDbField);
begin
  FNomeconveniomedic := Value;
end;

procedure TDbMorador.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbMorador.SetOutrasatividades(const Value: TCmDbField);
begin
  FOutrasatividades := Value;
end;

procedure TDbMorador.SetIdHorario(const Value: TCmDbField);
begin
  FIdHorario := Value;
end;

end.



