{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/07/2002                             }
{                                                       }
{*******************************************************}

unit uDb_PessoaFisica;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDb_PessoaFisica = class(TCmDbObject)

  private
    FDatamolestiagrave: TCmDbField;
    FIdpessoa: TCmDbField;
    FPercirrfjud: TCmDbField;
    FInicioinvalidez: TCmDbField;
    FVlrenquadramento: TCmDbField;
    FFlgsomairsupinss: TCmDbField;
    FNumdepirrf: TCmDbField;
    FIdcidades: TCmDbField;
    FIniciocompir: TCmDbField;
    FNomemae: TCmDbField;
    FStatusprocjud: TCmDbField;
    FIdgrinstr: TCmDbField;
    FCodestado: TCmDbField;
    FFlgbloqueio: TCmDbField;
    FNumdepsalf: TCmDbField;
    FTiposang: TCmDbField;
    FDatamorte: TCmDbField;
    FIdestado: TCmDbField;
    FVlrinss: TCmDbField;
    FDatanasc: TCmDbField;
    FFlgdeficiente: TCmDbField;
    FIdpais: TCmDbField;
    FCorpessoa: TCmDbField;
    FFlgmolestiagrave: TCmDbField;
    FVlrpensao: TCmDbField;
    FEstcivil: TCmDbField;
    FFiminvalidez: TCmDbField;
    FDataconcliminar: TCmDbField;
    FIdsindicato: TCmDbField;
    FIdprofiss: TCmDbField;
    FSexo: TCmDbField;
    FVlrtotcompir: TCmDbField;
    FDataconcjulg: TCmDbField;
    FIdfontrecr: TCmDbField;
    FVlrparccompir: TCmDbField;
    FNomepai: TCmDbField;
    FFlgdestcc: TCmDbField;
    FNumdeptot: TCmDbField;
    FFlgisentoirrf: TCmDbField;
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetCorpessoa(const Value: TCmDbField);
    procedure SetDataconcjulg(const Value: TCmDbField);
    procedure SetDataconcliminar(const Value: TCmDbField);
    procedure SetDatamolestiagrave(const Value: TCmDbField);
    procedure SetDatamorte(const Value: TCmDbField);
    procedure SetDatanasc(const Value: TCmDbField);
    procedure SetEstcivil(const Value: TCmDbField);
    procedure SetFiminvalidez(const Value: TCmDbField);
    procedure SetFlgbloqueio(const Value: TCmDbField);
    procedure SetFlgdeficiente(const Value: TCmDbField);
    procedure SetFlgdestcc(const Value: TCmDbField);
    procedure SetFlgisentoirrf(const Value: TCmDbField);
    procedure SetFlgmolestiagrave(const Value: TCmDbField);
    procedure SetFlgsomairsupinss(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIdestado(const Value: TCmDbField);
    procedure SetIdfontrecr(const Value: TCmDbField);
    procedure SetIdgrinstr(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdprofiss(const Value: TCmDbField);
    procedure SetIdsindicato(const Value: TCmDbField);
    procedure SetIniciocompir(const Value: TCmDbField);
    procedure SetInicioinvalidez(const Value: TCmDbField);
    procedure SetNomemae(const Value: TCmDbField);
    procedure SetNomepai(const Value: TCmDbField);
    procedure SetNumdepirrf(const Value: TCmDbField);
    procedure SetNumdepsalf(const Value: TCmDbField);
    procedure SetNumdeptot(const Value: TCmDbField);
    procedure SetPercirrfjud(const Value: TCmDbField);
    procedure SetSexo(const Value: TCmDbField);
    procedure SetStatusprocjud(const Value: TCmDbField);
    procedure SetTiposang(const Value: TCmDbField);
    procedure SetVlrenquadramento(const Value: TCmDbField);
    procedure SetVlrinss(const Value: TCmDbField);
    procedure SetVlrparccompir(const Value: TCmDbField);
    procedure SetVlrpensao(const Value: TCmDbField);
    procedure SetVlrtotcompir(const Value: TCmDbField);

  public

     Property Vlrtotcompir: TCmDbField read FVlrtotcompir write SetVlrtotcompir;
     Property Vlrpensao: TCmDbField read FVlrpensao write SetVlrpensao;
     Property Vlrparccompir: TCmDbField read FVlrparccompir write SetVlrparccompir;
     Property Vlrinss: TCmDbField read FVlrinss write SetVlrinss;
     Property Vlrenquadramento: TCmDbField read FVlrenquadramento write SetVlrenquadramento;
     Property Tiposang: TCmDbField read FTiposang write SetTiposang;
     Property Statusprocjud: TCmDbField read FStatusprocjud write SetStatusprocjud;
     Property Sexo: TCmDbField read FSexo write SetSexo;
     Property Percirrfjud: TCmDbField read FPercirrfjud write SetPercirrfjud;
     Property Numdeptot: TCmDbField read FNumdeptot write SetNumdeptot;
     Property Numdepsalf: TCmDbField read FNumdepsalf write SetNumdepsalf;
     Property Numdepirrf: TCmDbField read FNumdepirrf write SetNumdepirrf;
     Property Nomepai: TCmDbField read FNomepai write SetNomepai;
     Property Nomemae: TCmDbField read FNomemae write SetNomemae;
     Property Inicioinvalidez: TCmDbField read FInicioinvalidez write SetInicioinvalidez;
     Property Iniciocompir: TCmDbField read FIniciocompir write SetIniciocompir;
     Property Idsindicato: TCmDbField read FIdsindicato write SetIdsindicato;
     Property Idprofiss: TCmDbField read FIdprofiss write SetIdprofiss;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Idgrinstr: TCmDbField read FIdgrinstr write SetIdgrinstr;
     Property Idfontrecr: TCmDbField read FIdfontrecr write SetIdfontrecr;
     Property Idestado: TCmDbField read FIdestado write SetIdestado;
     Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
     Property Flgsomairsupinss: TCmDbField read FFlgsomairsupinss write SetFlgsomairsupinss;
     Property Flgmolestiagrave: TCmDbField read FFlgmolestiagrave write SetFlgmolestiagrave;
     Property Flgisentoirrf: TCmDbField read FFlgisentoirrf write SetFlgisentoirrf;
     Property Flgdestcc: TCmDbField read FFlgdestcc write SetFlgdestcc;
     Property Flgdeficiente: TCmDbField read FFlgdeficiente write SetFlgdeficiente;
     Property Flgbloqueio: TCmDbField read FFlgbloqueio write SetFlgbloqueio;
     Property Fiminvalidez: TCmDbField read FFiminvalidez write SetFiminvalidez;
     Property Estcivil: TCmDbField read FEstcivil write SetEstcivil;
     Property Datanasc: TCmDbField read FDatanasc write SetDatanasc;
     Property Datamorte: TCmDbField read FDatamorte write SetDatamorte;
     Property Datamolestiagrave: TCmDbField read FDatamolestiagrave write SetDatamolestiagrave;
     Property Dataconcliminar: TCmDbField read FDataconcliminar write SetDataconcliminar;
     Property Dataconcjulg: TCmDbField read FDataconcjulg write SetDataconcjulg;
     Property Corpessoa: TCmDbField read FCorpessoa write SetCorpessoa;
     Property Codestado: TCmDbField read FCodestado write SetCodestado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDb_PessoaFisica }

constructor TDb_PessoaFisica.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PESSOAFISICA';

   fVlrtotcompir := CreateCmDbField('VLRTOTCOMPIR',ftfloat,False,False,False,True,'');
   fVlrpensao := CreateCmDbField('VLRPENSAO',ftfloat,False,False,False,True,'');
   fVlrparccompir := CreateCmDbField('VLRPARCCOMPIR',ftfloat,False,False,False,True,'');
   fVlrinss := CreateCmDbField('VLRINSS',ftfloat,False,False,False,True,'');
   fVlrenquadramento := CreateCmDbField('VLRENQUADRAMENTO',ftfloat,False,False,False,True,'');
   fTiposang := CreateCmDbField('TIPOSANG',ftString,False,False,False,True,'');
   fStatusprocjud := CreateCmDbField('STATUSPROCJUD',ftfloat,False,False,False,True,'');
   fSexo := CreateCmDbField('SEXO',ftString,False,False,False,True,'');
   fPercirrfjud := CreateCmDbField('PERCIRRFJUD',ftfloat,False,False,False,True,'');
   fNumdeptot := CreateCmDbField('NUMDEPTOT',ftfloat,False,False,False,True,'');
   fNumdepsalf := CreateCmDbField('NUMDEPSALF',ftfloat,False,False,False,True,'');
   fNumdepirrf := CreateCmDbField('NUMDEPIRRF',ftfloat,False,False,False,True,'');
   fNomepai := CreateCmDbField('NOMEPAI',ftString,False,False,False,True,'');
   fNomemae := CreateCmDbField('NOMEMAE',ftString,False,False,False,True,'');
   fInicioinvalidez := CreateCmDbField('INICIOINVALIDEZ',ftDateTime,False,False,False,True,'');
   fIniciocompir := CreateCmDbField('INICIOCOMPIR',ftString,False,False,False,True,'');
   fIdsindicato := CreateCmDbField('IDSINDICATO',ftfloat,False,False,False,True,'');
   fIdprofiss := CreateCmDbField('IDPROFISS',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id. Pessoa');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'');
   fIdgrinstr := CreateCmDbField('IDGRINSTR',ftfloat,False,False,False,True,'');
   fIdfontrecr := CreateCmDbField('IDFONTRECR',ftfloat,False,False,False,True,'');
   fIdestado := CreateCmDbField('IDESTADO',ftfloat,False,False,False,True,'');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'');
   fFlgsomairsupinss := CreateCmDbField('FLGSOMAIRSUPINSS',ftfloat,False,False,False,True,'');
   fFlgmolestiagrave := CreateCmDbField('FLGMOLESTIAGRAVE',ftfloat,False,False,False,True,'');
   fFlgisentoirrf := CreateCmDbField('FLGISENTOIRRF',ftfloat,False,False,False,True,'');
   fFlgdestcc := CreateCmDbField('FLGDESTCC',ftfloat,False,False,False,True,'');
   fFlgdeficiente := CreateCmDbField('FLGDEFICIENTE',ftfloat,False,False,False,True,'');
   fFlgbloqueio := CreateCmDbField('FLGBLOQUEIO',ftfloat,False,False,False,True,'');
   fFiminvalidez := CreateCmDbField('FIMINVALIDEZ',ftDateTime,False,False,False,True,'');
   fEstcivil := CreateCmDbField('ESTCIVIL',ftString,False,False,False,True,'');
   fDatanasc := CreateCmDbField('DATANASC',ftDateTime,False,False,False,True,'');
   fDatamorte := CreateCmDbField('DATAMORTE',ftDateTime,False,False,False,True,'');
   fDatamolestiagrave := CreateCmDbField('DATAMOLESTIAGRAVE',ftDateTime,False,False,False,True,'');
   fDataconcliminar := CreateCmDbField('DATACONCLIMINAR',ftDateTime,False,False,False,True,'');
   fDataconcjulg := CreateCmDbField('DATACONCJULG',ftDateTime,False,False,False,True,'');
   fCorpessoa := CreateCmDbField('CORPESSOA',ftfloat,False,False,False,True,'');
   fCodestado := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'');
end;

procedure TDb_PessoaFisica.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDb_PessoaFisica.SetCorpessoa(const Value: TCmDbField);
begin
  FCorpessoa := Value;
end;

procedure TDb_PessoaFisica.SetDataconcjulg(const Value: TCmDbField);
begin
  FDataconcjulg := Value;
end;

procedure TDb_PessoaFisica.SetDataconcliminar(const Value: TCmDbField);
begin
  FDataconcliminar := Value;
end;

procedure TDb_PessoaFisica.SetDatamolestiagrave(const Value: TCmDbField);
begin
  FDatamolestiagrave := Value;
end;

procedure TDb_PessoaFisica.SetDatamorte(const Value: TCmDbField);
begin
  FDatamorte := Value;
end;

procedure TDb_PessoaFisica.SetDatanasc(const Value: TCmDbField);
begin
  FDatanasc := Value;
end;

procedure TDb_PessoaFisica.SetEstcivil(const Value: TCmDbField);
begin
  FEstcivil := Value;
end;

procedure TDb_PessoaFisica.SetFiminvalidez(const Value: TCmDbField);
begin
  FFiminvalidez := Value;
end;

procedure TDb_PessoaFisica.SetFlgbloqueio(const Value: TCmDbField);
begin
  FFlgbloqueio := Value;
end;

procedure TDb_PessoaFisica.SetFlgdeficiente(const Value: TCmDbField);
begin
  FFlgdeficiente := Value;
end;

procedure TDb_PessoaFisica.SetFlgdestcc(const Value: TCmDbField);
begin
  FFlgdestcc := Value;
end;

procedure TDb_PessoaFisica.SetFlgisentoirrf(const Value: TCmDbField);
begin
  FFlgisentoirrf := Value;
end;

procedure TDb_PessoaFisica.SetFlgmolestiagrave(const Value: TCmDbField);
begin
  FFlgmolestiagrave := Value;
end;

procedure TDb_PessoaFisica.SetFlgsomairsupinss(const Value: TCmDbField);
begin
  FFlgsomairsupinss := Value;
end;

procedure TDb_PessoaFisica.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDb_PessoaFisica.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDb_PessoaFisica.SetIdfontrecr(const Value: TCmDbField);
begin
  FIdfontrecr := Value;
end;

procedure TDb_PessoaFisica.SetIdgrinstr(const Value: TCmDbField);
begin
  FIdgrinstr := Value;
end;

procedure TDb_PessoaFisica.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDb_PessoaFisica.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDb_PessoaFisica.SetIdprofiss(const Value: TCmDbField);
begin
  FIdprofiss := Value;
end;

procedure TDb_PessoaFisica.SetIdsindicato(const Value: TCmDbField);
begin
  FIdsindicato := Value;
end;

procedure TDb_PessoaFisica.SetIniciocompir(const Value: TCmDbField);
begin
  FIniciocompir := Value;
end;

procedure TDb_PessoaFisica.SetInicioinvalidez(const Value: TCmDbField);
begin
  FInicioinvalidez := Value;
end;

procedure TDb_PessoaFisica.SetNomemae(const Value: TCmDbField);
begin
  FNomemae := Value;
end;

procedure TDb_PessoaFisica.SetNomepai(const Value: TCmDbField);
begin
  FNomepai := Value;
end;

procedure TDb_PessoaFisica.SetNumdepirrf(const Value: TCmDbField);
begin
  FNumdepirrf := Value;
end;

procedure TDb_PessoaFisica.SetNumdepsalf(const Value: TCmDbField);
begin
  FNumdepsalf := Value;
end;

procedure TDb_PessoaFisica.SetNumdeptot(const Value: TCmDbField);
begin
  FNumdeptot := Value;
end;

procedure TDb_PessoaFisica.SetPercirrfjud(const Value: TCmDbField);
begin
  FPercirrfjud := Value;
end;

procedure TDb_PessoaFisica.SetSexo(const Value: TCmDbField);
begin
  FSexo := Value;
end;

procedure TDb_PessoaFisica.SetStatusprocjud(const Value: TCmDbField);
begin
  FStatusprocjud := Value;
end;

procedure TDb_PessoaFisica.SetTiposang(const Value: TCmDbField);
begin
  FTiposang := Value;
end;

procedure TDb_PessoaFisica.SetVlrenquadramento(const Value: TCmDbField);
begin
  FVlrenquadramento := Value;
end;

procedure TDb_PessoaFisica.SetVlrinss(const Value: TCmDbField);
begin
  FVlrinss := Value;
end;

procedure TDb_PessoaFisica.SetVlrparccompir(const Value: TCmDbField);
begin
  FVlrparccompir := Value;
end;

procedure TDb_PessoaFisica.SetVlrpensao(const Value: TCmDbField);
begin
  FVlrpensao := Value;
end;

procedure TDb_PessoaFisica.SetVlrtotcompir(const Value: TCmDbField);
begin
  FVlrtotcompir := Value;
end;

end.



