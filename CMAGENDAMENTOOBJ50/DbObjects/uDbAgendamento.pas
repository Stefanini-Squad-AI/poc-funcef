unit uDbAgendamento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAgendamento = class(TCmDbObject)

  private
    FData: TCmDbField;
    FIdagendamento: TCmDbField;
    FFlgsituacao: TCmDbField;
    FHora: TCmDbField;
    FIdassuntoagenda: TCmDbField;
    FIdatend: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdatendeagenda: TCmDbField;
    FTelefone: TCmDbField;
    FNomesolic: TCmDbField;
    FObservacao: TCmDbField;
    FDataalteracao: TCmDbField;
    procedure SetData(const Value: TCmDbField);
    procedure SetFlgsituacao(const Value: TCmDbField);
    procedure SetHora(const Value: TCmDbField);
    procedure SetIdagendamento(const Value: TCmDbField);
    procedure SetIdassuntoagenda(const Value: TCmDbField);
    procedure SetIdatend(const Value: TCmDbField);
    procedure SetIdatendeagenda(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNomesolic(const Value: TCmDbField);
    procedure SetTelefone(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetDataalteracao(const Value: TCmDbField);

  public

     Property Telefone: TCmDbField read FTelefone write SetTelefone;
     Property Nomesolic: TCmDbField read FNomesolic write SetNomesolic;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idatendeagenda: TCmDbField read FIdatendeagenda write SetIdatendeagenda;
     Property Idatend: TCmDbField read FIdatend write SetIdatend;
     Property Idassuntoagenda: TCmDbField read FIdassuntoagenda write SetIdassuntoagenda;
     Property Idagendamento: TCmDbField read FIdagendamento write SetIdagendamento;
     Property Hora: TCmDbField read FHora write SetHora;
     Property Flgsituacao: TCmDbField read FFlgsituacao write SetFlgsituacao;
     Property Data: TCmDbField read FData write SetData;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Dataalteracao: TCmDbField read FDataalteracao write SetDataalteracao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAgendamento }

constructor TDbAgendamento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AGENDAMENTO';

   fTelefone := CreateCmDbField('TELEFONE',ftString,False,False,False,True,'Telefone de Contato');
   fNomesolic := CreateCmDbField('NOMESOLIC',ftString,False,False,False,True,'Nome do Solicitante');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'Id. Atendido');
   fIdatendeagenda := CreateCmDbField('IDATENDEAGENDA',ftfloat,True,False,False,True,'Id. Atendente');
   fIdatend := CreateCmDbField('IDATEND',ftfloat,False,False,False,True,'Id. Atendentimento');
   fIdassuntoagenda := CreateCmDbField('IDASSUNTOAGENDA',ftfloat,True,False,False,True,'Id. Assunto');
   fIdagendamento := CreateCmDbField('IDAGENDAMENTO',ftfloat,True,True,False,True,'Id. Agendamento');
   fHora := CreateCmDbField('HORA',ftString,True,False,False,True,'Hora');
   fFlgsituacao := CreateCmDbField('FLGSITUACAO',ftfloat,True,False,False,True,'Situação');
   fData := CreateCmDbField('DATA',ftDateTime,True,False,False,True,'Data');
   fDataalteracao := CreateCmDbField('DATAALTERACAO',ftDateTime,True,False,False,True,'Data de Alteração', -1, True );
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observação');   
end;

function TDbAgendamento.Insert: Boolean;
begin

   fIdagendamento.AsFloat := GetSequence('AGENDAMENTO');
   Result := Inherited Insert;

end;


procedure TDbAgendamento.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbAgendamento.SetDataalteracao(const Value: TCmDbField);
begin
  FDataalteracao := Value;
end;

procedure TDbAgendamento.SetFlgsituacao(const Value: TCmDbField);
begin
  FFlgsituacao := Value;
end;

procedure TDbAgendamento.SetHora(const Value: TCmDbField);
begin
  FHora := Value;
end;

procedure TDbAgendamento.SetIdagendamento(const Value: TCmDbField);
begin
  FIdagendamento := Value;
end;

procedure TDbAgendamento.SetIdassuntoagenda(const Value: TCmDbField);
begin
  FIdassuntoagenda := Value;
end;

procedure TDbAgendamento.SetIdatend(const Value: TCmDbField);
begin
  FIdatend := Value;
end;

procedure TDbAgendamento.SetIdatendeagenda(const Value: TCmDbField);
begin
  FIdatendeagenda := Value;
end;

procedure TDbAgendamento.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbAgendamento.SetNomesolic(const Value: TCmDbField);
begin
  FNomesolic := Value;
end;

procedure TDbAgendamento.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbAgendamento.SetTelefone(const Value: TCmDbField);
begin
  FTelefone := Value;
end;

end.



