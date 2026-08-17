{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/04/2007                             }
{                                                       }
{*******************************************************}

unit uDBPartPrevPlan;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBPartPrevPlan = class(TCmDbObject)

  private
    FDatacancelamento: TCmDbField;
    FDtinicioinsc: TCmDbField;
    FInscricaotipo: TCmDbField;
    FIdsitpart: TCmDbField;
    FInscricaonumero: TCmDbField;
    FIdsitplanoprev: TCmDbField;
    FUltsalauxreaj: TCmDbField;
    FSeqproposta: TCmDbField;
    FDatafimsittemp: TCmDbField;
    FSalparticipacao: TCmDbField;
    FInscricaodata: TCmDbField;
    FSalinscricao: TCmDbField;
    FDatainicioassist: TCmDbField;
    FDatacontribinss: TCmDbField;
    FPrazoacumulacao: TCmDbField;
    FFlgdeveassistenc: TCmDbField;
    FSalmantido: TCmDbField;
    FDataopcaoir: TCmDbField;
    FUltsalpart: TCmDbField;
    FFlgusateto: TCmDbField;
    FTipoopcaoir: TCmDbField;
    FValorinfinss: TCmDbField;
    FFlgsalvirtbenef: TCmDbField;
    FSalvinculado: TCmDbField;
    FFlgdesativado: TCmDbField;
    FFlgfitespecial: TCmDbField;
    FUltsalmantreaj: TCmDbField;
    FTempoafastado: TCmDbField;
    FIdadebase: TCmDbField;
    FFlgdeveemprestimo: TCmDbField;
    FUltremtotal: TCmDbField;
    FSalauxdoenca: TCmDbField;
    FUltsalmanut: TCmDbField;
    FIdpessoa: TCmDbField;
    FSalpartic13: TCmDbField;
    FDatainiciomanut: TCmDbField;
    FNumprocinss: TCmDbField;
    FMesultreajsal: TCmDbField;
    FUltsalmanutparc: TCmDbField;
    FFlgdeveprevidenc: TCmDbField;
    FValorcalcinss: TCmDbField;
    FIdpessjur: TCmDbField;
    FDatafimassist: TCmDbField;
    FRequerimentodata: TCmDbField;
    FIdplanoprev: TCmDbField;
    FDatainiciosittemp: TCmDbField;
    FUltsalreajuste: TCmDbField;
    procedure SetDatacancelamento(const Value: TCmDbField);
    procedure SetDatacontribinss(const Value: TCmDbField);
    procedure SetDatafimassist(const Value: TCmDbField);
    procedure SetDatafimsittemp(const Value: TCmDbField);
    procedure SetDatainicioassist(const Value: TCmDbField);
    procedure SetDatainiciomanut(const Value: TCmDbField);
    procedure SetDatainiciosittemp(const Value: TCmDbField);
    procedure SetDataopcaoir(const Value: TCmDbField);
    procedure SetDtinicioinsc(const Value: TCmDbField);
    procedure SetFlgdesativado(const Value: TCmDbField);
    procedure SetFlgdeveassistenc(const Value: TCmDbField);
    procedure SetFlgdeveemprestimo(const Value: TCmDbField);
    procedure SetFlgdeveprevidenc(const Value: TCmDbField);
    procedure SetFlgfitespecial(const Value: TCmDbField);
    procedure SetFlgsalvirtbenef(const Value: TCmDbField);
    procedure SetFlgusateto(const Value: TCmDbField);
    procedure SetIdadebase(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdsitpart(const Value: TCmDbField);
    procedure SetIdsitplanoprev(const Value: TCmDbField);
    procedure SetInscricaodata(const Value: TCmDbField);
    procedure SetInscricaonumero(const Value: TCmDbField);
    procedure SetInscricaotipo(const Value: TCmDbField);
    procedure SetMesultreajsal(const Value: TCmDbField);
    procedure SetNumprocinss(const Value: TCmDbField);
    procedure SetPrazoacumulacao(const Value: TCmDbField);
    procedure SetRequerimentodata(const Value: TCmDbField);
    procedure SetSalauxdoenca(const Value: TCmDbField);
    procedure SetSalinscricao(const Value: TCmDbField);
    procedure SetSalmantido(const Value: TCmDbField);
    procedure SetSalpartic13(const Value: TCmDbField);
    procedure SetSalparticipacao(const Value: TCmDbField);
    procedure SetSalvinculado(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetTempoafastado(const Value: TCmDbField);
    procedure SetTipoopcaoir(const Value: TCmDbField);
    procedure SetUltremtotal(const Value: TCmDbField);
    procedure SetUltsalauxreaj(const Value: TCmDbField);
    procedure SetUltsalmantreaj(const Value: TCmDbField);
    procedure SetUltsalmanut(const Value: TCmDbField);
    procedure SetUltsalmanutparc(const Value: TCmDbField);
    procedure SetUltsalpart(const Value: TCmDbField);
    procedure SetUltsalreajuste(const Value: TCmDbField);
    procedure SetValorcalcinss(const Value: TCmDbField);
    procedure SetValorinfinss(const Value: TCmDbField);

  public

     Property Valorinfinss: TCmDbField read FValorinfinss write SetValorinfinss;
     Property Valorcalcinss: TCmDbField read FValorcalcinss write SetValorcalcinss;
     Property Ultsalreajuste: TCmDbField read FUltsalreajuste write SetUltsalreajuste;
     Property Ultsalpart: TCmDbField read FUltsalpart write SetUltsalpart;
     Property Ultsalmanutparc: TCmDbField read FUltsalmanutparc write SetUltsalmanutparc;
     Property Ultsalmanut: TCmDbField read FUltsalmanut write SetUltsalmanut;
     Property Ultsalmantreaj: TCmDbField read FUltsalmantreaj write SetUltsalmantreaj;
     Property Ultsalauxreaj: TCmDbField read FUltsalauxreaj write SetUltsalauxreaj;
     Property Ultremtotal: TCmDbField read FUltremtotal write SetUltremtotal;
     Property Tipoopcaoir: TCmDbField read FTipoopcaoir write SetTipoopcaoir;
     Property Tempoafastado: TCmDbField read FTempoafastado write SetTempoafastado;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Salvinculado: TCmDbField read FSalvinculado write SetSalvinculado;
     Property Salpartic13: TCmDbField read FSalpartic13 write SetSalpartic13;
     Property Salparticipacao: TCmDbField read FSalparticipacao write SetSalparticipacao;
     Property Salmantido: TCmDbField read FSalmantido write SetSalmantido;
     Property Salinscricao: TCmDbField read FSalinscricao write SetSalinscricao;
     Property Salauxdoenca: TCmDbField read FSalauxdoenca write SetSalauxdoenca;
     Property Requerimentodata: TCmDbField read FRequerimentodata write SetRequerimentodata;
     Property Prazoacumulacao: TCmDbField read FPrazoacumulacao write SetPrazoacumulacao;
     Property Numprocinss: TCmDbField read FNumprocinss write SetNumprocinss;
     Property Mesultreajsal: TCmDbField read FMesultreajsal write SetMesultreajsal;
     Property Inscricaotipo: TCmDbField read FInscricaotipo write SetInscricaotipo;
     Property Inscricaonumero: TCmDbField read FInscricaonumero write SetInscricaonumero;
     Property Inscricaodata: TCmDbField read FInscricaodata write SetInscricaodata;
     Property Idsitplanoprev: TCmDbField read FIdsitplanoprev write SetIdsitplanoprev;
     Property Idsitpart: TCmDbField read FIdsitpart write SetIdsitpart;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idadebase: TCmDbField read FIdadebase write SetIdadebase;
     Property Flgusateto: TCmDbField read FFlgusateto write SetFlgusateto;
     Property Flgsalvirtbenef: TCmDbField read FFlgsalvirtbenef write SetFlgsalvirtbenef;
     Property Flgfitespecial: TCmDbField read FFlgfitespecial write SetFlgfitespecial;
     Property Flgdeveprevidenc: TCmDbField read FFlgdeveprevidenc write SetFlgdeveprevidenc;
     Property Flgdeveemprestimo: TCmDbField read FFlgdeveemprestimo write SetFlgdeveemprestimo;
     Property Flgdeveassistenc: TCmDbField read FFlgdeveassistenc write SetFlgdeveassistenc;
     Property Flgdesativado: TCmDbField read FFlgdesativado write SetFlgdesativado;
     Property Dtinicioinsc: TCmDbField read FDtinicioinsc write SetDtinicioinsc;
     Property Dataopcaoir: TCmDbField read FDataopcaoir write SetDataopcaoir;
     Property Datainiciosittemp: TCmDbField read FDatainiciosittemp write SetDatainiciosittemp;
     Property Datainiciomanut: TCmDbField read FDatainiciomanut write SetDatainiciomanut;
     Property Datainicioassist: TCmDbField read FDatainicioassist write SetDatainicioassist;
     Property Datafimsittemp: TCmDbField read FDatafimsittemp write SetDatafimsittemp;
     Property Datafimassist: TCmDbField read FDatafimassist write SetDatafimassist;
     Property Datacontribinss: TCmDbField read FDatacontribinss write SetDatacontribinss;
     Property Datacancelamento: TCmDbField read FDatacancelamento write SetDatacancelamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBPartPrevPlan }

constructor TDBPartPrevPlan.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARTPREVPLAN';

   fValorinfinss := CreateCmDbField('VALORINFINSS',ftfloat,False,False,False,True,'');
   fValorcalcinss := CreateCmDbField('VALORCALCINSS',ftfloat,False,False,False,True,'');
   fUltsalreajuste := CreateCmDbField('ULTSALREAJUSTE',ftfloat,False,False,False,True,'');
   fUltsalpart := CreateCmDbField('ULTSALPART',ftfloat,False,False,False,True,'');
   fUltsalmanutparc := CreateCmDbField('ULTSALMANUTPARC',ftfloat,False,False,False,True,'');
   fUltsalmanut := CreateCmDbField('ULTSALMANUT',ftfloat,False,False,False,True,'');
   fUltsalmantreaj := CreateCmDbField('ULTSALMANTREAJ',ftfloat,False,False,False,True,'');
   fUltsalauxreaj := CreateCmDbField('ULTSALAUXREAJ',ftfloat,False,False,False,True,'');
   fUltremtotal := CreateCmDbField('ULTREMTOTAL',ftfloat,False,False,False,True,'');
   fTipoopcaoir := CreateCmDbField('TIPOOPCAOIR',ftfloat,False,False,False,True,'');
   fTempoafastado := CreateCmDbField('TEMPOAFASTADO',ftfloat,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fSalvinculado := CreateCmDbField('SALVINCULADO',ftfloat,False,False,False,True,'');
   fSalpartic13 := CreateCmDbField('SALPARTIC13',ftfloat,False,False,False,True,'');
   fSalparticipacao := CreateCmDbField('SALPARTICIPACAO',ftfloat,False,False,False,True,'');
   fSalmantido := CreateCmDbField('SALMANTIDO',ftfloat,False,False,False,True,'');
   fSalinscricao := CreateCmDbField('SALINSCRICAO',ftfloat,False,False,False,True,'');
   fSalauxdoenca := CreateCmDbField('SALAUXDOENCA',ftfloat,False,False,False,True,'');
   fRequerimentodata := CreateCmDbField('REQUERIMENTODATA',ftDateTime,False,False,False,True,'');
   fPrazoacumulacao := CreateCmDbField('PRAZOACUMULACAO',ftfloat,False,False,False,True,'');
   fNumprocinss := CreateCmDbField('NUMPROCINSS',ftString,False,False,False,True,'');
   fMesultreajsal := CreateCmDbField('MESULTREAJSAL',ftString,False,False,False,True,'');
   fInscricaotipo := CreateCmDbField('INSCRICAOTIPO',ftString,False,False,False,True,'');
   fInscricaonumero := CreateCmDbField('INSCRICAONUMERO',ftfloat,False,False,False,True,'');
   fInscricaodata := CreateCmDbField('INSCRICAODATA',ftDateTime,False,False,False,True,'');
   fIdsitplanoprev := CreateCmDbField('IDSITPLANOPREV',ftfloat,False,False,False,True,'');
   fIdsitpart := CreateCmDbField('IDSITPART',ftfloat,True,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdadebase := CreateCmDbField('IDADEBASE',ftfloat,False,False,False,True,'');
   fFlgusateto := CreateCmDbField('FLGUSATETO',ftfloat,False,False,False,True,'');
   fFlgsalvirtbenef := CreateCmDbField('FLGSALVIRTBENEF',ftfloat,False,False,False,True,'');
   fFlgfitespecial := CreateCmDbField('FLGFITESPECIAL',ftfloat,False,False,False,True,'');
   fFlgdeveprevidenc := CreateCmDbField('FLGDEVEPREVIDENC',ftfloat,False,False,False,True,'');
   fFlgdeveemprestimo := CreateCmDbField('FLGDEVEEMPRESTIMO',ftfloat,False,False,False,True,'');
   fFlgdeveassistenc := CreateCmDbField('FLGDEVEASSISTENC',ftfloat,False,False,False,True,'');
   fFlgdesativado := CreateCmDbField('FLGDESATIVADO',ftfloat,False,False,False,True,'');
   fDtinicioinsc := CreateCmDbField('DTINICIOINSC',ftDateTime,False,False,False,True,'');
   fDataopcaoir := CreateCmDbField('DATAOPCAOIR',ftDateTime,False,False,False,True,'');
   fDatainiciosittemp := CreateCmDbField('DATAINICIOSITTEMP',ftDateTime,False,False,False,True,'');
   fDatainiciomanut := CreateCmDbField('DATAINICIOMANUT',ftDateTime,False,False,False,True,'');
   fDatainicioassist := CreateCmDbField('DATAINICIOASSIST',ftDateTime,False,False,False,True,'');
   fDatafimsittemp := CreateCmDbField('DATAFIMSITTEMP',ftDateTime,False,False,False,True,'');
   fDatafimassist := CreateCmDbField('DATAFIMASSIST',ftDateTime,False,False,False,True,'');
   fDatacontribinss := CreateCmDbField('DATACONTRIBINSS',ftDateTime,False,False,False,True,'');
   fDatacancelamento := CreateCmDbField('DATACANCELAMENTO',ftDateTime,False,False,False,True,'');
end;

function TDBPartPrevPlan.Insert: Boolean;
begin

   fSeqproposta.AsFloat := GetSequence('PARTPREVPLAN');
   fIdplanoprev.AsFloat := GetSequence('PARTPREVPLAN');
   fIdpessoa.AsFloat := GetSequence('PARTPREVPLAN');
   fIdpessjur.AsFloat := GetSequence('PARTPREVPLAN');
   Result := Inherited Insert;

end;


procedure TDBPartPrevPlan.SetDatacancelamento(const Value: TCmDbField);
begin
  FDatacancelamento := Value;
end;

procedure TDBPartPrevPlan.SetDatacontribinss(const Value: TCmDbField);
begin
  FDatacontribinss := Value;
end;

procedure TDBPartPrevPlan.SetDatafimassist(const Value: TCmDbField);
begin
  FDatafimassist := Value;
end;

procedure TDBPartPrevPlan.SetDatafimsittemp(const Value: TCmDbField);
begin
  FDatafimsittemp := Value;
end;

procedure TDBPartPrevPlan.SetDatainicioassist(const Value: TCmDbField);
begin
  FDatainicioassist := Value;
end;

procedure TDBPartPrevPlan.SetDatainiciomanut(const Value: TCmDbField);
begin
  FDatainiciomanut := Value;
end;

procedure TDBPartPrevPlan.SetDatainiciosittemp(const Value: TCmDbField);
begin
  FDatainiciosittemp := Value;
end;

procedure TDBPartPrevPlan.SetDataopcaoir(const Value: TCmDbField);
begin
  FDataopcaoir := Value;
end;

procedure TDBPartPrevPlan.SetDtinicioinsc(const Value: TCmDbField);
begin
  FDtinicioinsc := Value;
end;

procedure TDBPartPrevPlan.SetFlgdesativado(const Value: TCmDbField);
begin
  FFlgdesativado := Value;
end;

procedure TDBPartPrevPlan.SetFlgdeveassistenc(const Value: TCmDbField);
begin
  FFlgdeveassistenc := Value;
end;

procedure TDBPartPrevPlan.SetFlgdeveemprestimo(const Value: TCmDbField);
begin
  FFlgdeveemprestimo := Value;
end;

procedure TDBPartPrevPlan.SetFlgdeveprevidenc(const Value: TCmDbField);
begin
  FFlgdeveprevidenc := Value;
end;

procedure TDBPartPrevPlan.SetFlgfitespecial(const Value: TCmDbField);
begin
  FFlgfitespecial := Value;
end;

procedure TDBPartPrevPlan.SetFlgsalvirtbenef(const Value: TCmDbField);
begin
  FFlgsalvirtbenef := Value;
end;

procedure TDBPartPrevPlan.SetFlgusateto(const Value: TCmDbField);
begin
  FFlgusateto := Value;
end;

procedure TDBPartPrevPlan.SetIdadebase(const Value: TCmDbField);
begin
  FIdadebase := Value;
end;

procedure TDBPartPrevPlan.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDBPartPrevPlan.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBPartPrevPlan.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBPartPrevPlan.SetIdsitpart(const Value: TCmDbField);
begin
  FIdsitpart := Value;
end;

procedure TDBPartPrevPlan.SetIdsitplanoprev(const Value: TCmDbField);
begin
  FIdsitplanoprev := Value;
end;

procedure TDBPartPrevPlan.SetInscricaodata(const Value: TCmDbField);
begin
  FInscricaodata := Value;
end;

procedure TDBPartPrevPlan.SetInscricaonumero(const Value: TCmDbField);
begin
  FInscricaonumero := Value;
end;

procedure TDBPartPrevPlan.SetInscricaotipo(const Value: TCmDbField);
begin
  FInscricaotipo := Value;
end;

procedure TDBPartPrevPlan.SetMesultreajsal(const Value: TCmDbField);
begin
  FMesultreajsal := Value;
end;

procedure TDBPartPrevPlan.SetNumprocinss(const Value: TCmDbField);
begin
  FNumprocinss := Value;
end;

procedure TDBPartPrevPlan.SetPrazoacumulacao(const Value: TCmDbField);
begin
  FPrazoacumulacao := Value;
end;

procedure TDBPartPrevPlan.SetRequerimentodata(const Value: TCmDbField);
begin
  FRequerimentodata := Value;
end;

procedure TDBPartPrevPlan.SetSalauxdoenca(const Value: TCmDbField);
begin
  FSalauxdoenca := Value;
end;

procedure TDBPartPrevPlan.SetSalinscricao(const Value: TCmDbField);
begin
  FSalinscricao := Value;
end;

procedure TDBPartPrevPlan.SetSalmantido(const Value: TCmDbField);
begin
  FSalmantido := Value;
end;

procedure TDBPartPrevPlan.SetSalpartic13(const Value: TCmDbField);
begin
  FSalpartic13 := Value;
end;

procedure TDBPartPrevPlan.SetSalparticipacao(const Value: TCmDbField);
begin
  FSalparticipacao := Value;
end;

procedure TDBPartPrevPlan.SetSalvinculado(const Value: TCmDbField);
begin
  FSalvinculado := Value;
end;

procedure TDBPartPrevPlan.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDBPartPrevPlan.SetTempoafastado(const Value: TCmDbField);
begin
  FTempoafastado := Value;
end;

procedure TDBPartPrevPlan.SetTipoopcaoir(const Value: TCmDbField);
begin
  FTipoopcaoir := Value;
end;

procedure TDBPartPrevPlan.SetUltremtotal(const Value: TCmDbField);
begin
  FUltremtotal := Value;
end;

procedure TDBPartPrevPlan.SetUltsalauxreaj(const Value: TCmDbField);
begin
  FUltsalauxreaj := Value;
end;

procedure TDBPartPrevPlan.SetUltsalmantreaj(const Value: TCmDbField);
begin
  FUltsalmantreaj := Value;
end;

procedure TDBPartPrevPlan.SetUltsalmanut(const Value: TCmDbField);
begin
  FUltsalmanut := Value;
end;

procedure TDBPartPrevPlan.SetUltsalmanutparc(const Value: TCmDbField);
begin
  FUltsalmanutparc := Value;
end;

procedure TDBPartPrevPlan.SetUltsalpart(const Value: TCmDbField);
begin
  FUltsalpart := Value;
end;

procedure TDBPartPrevPlan.SetUltsalreajuste(const Value: TCmDbField);
begin
  FUltsalreajuste := Value;
end;

procedure TDBPartPrevPlan.SetValorcalcinss(const Value: TCmDbField);
begin
  FValorcalcinss := Value;
end;

procedure TDBPartPrevPlan.SetValorinfinss(const Value: TCmDbField);
begin
  FValorinfinss := Value;
end;

end.



