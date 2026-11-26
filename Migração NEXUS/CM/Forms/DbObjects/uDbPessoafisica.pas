{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG...........: 134422
 Data da Alteração: 11/05/2023
 Responsável......: Everson Cunha
 Descrição........: Inclusão do campo EMAILFUNCEF (Email Pessoal) - FCadFunc.pas
--------------------------------------------------------------------------------
 N. SIG...........: 118900
 Data da Alteração: 16/09/2021
 Responsável......: Everson Cunha
 Descrição........: Retornar campo que havia sido retirado da tela
--------------------------------------------------------------------------------
 N. SIG...........: 38475
 Data da Alteração: 08/01/2021
 Responsável......: Everson Cunha
 Descrição........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Nº SOL: 250384.17324
 Nº PPM 1070235
 Data da Alteração: 12/02/2016
 Alteração Form: Leiaute e campos novos
 Responsável: Michelle Suellyn Mota
 Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
--------------------------------------------------------------------------------
 Rotina: -
 Nº SOL: 229881/16645
 Nº PPM: 565995
 Data da Alteração: 11/02/2015
 Alteração Form: Criação dos campos UniaoEstavel
 Responsável: William Santana
 Descrição: Criação do campo UniaoEstavel
--------------------------------------------------------------------------------
 Rotina: Create
 Nº SOL: 229874/16584
 Nº PPM: 544346
 Data da Alteração: 30/10/2014
 Alteração Form: Criação dos campos FlgIsentoContrPrevid, IdProcessosCP, IdProcessosIR
 Responsável: Felipe A. Santos
 Descrição: Criação dos campos FlgIsentoContrPrevid, IdProcessosCP, IdProcessosIR
--------------------------------------------------------------------------------
 Nº SOL: 229871/16137
 Nº PPM: 407073
 Data da Alteração: 02/10/2014
 Alteração Form: RecebBenefContrib_Idade e Obs
 Responsável: Felipe A. Santos
 Descrição: foi incluído os campos, RecebBenefContrib_Idade e Obs.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbPessoafisica;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbPessoafisica = class(TCmDbObject)

  private
    FIdpais: TCmDbField;
    FVlrinss: TCmDbField;
    FDatanasc: TCmDbField;
    FPercirrfjud: TCmDbField;
    FTiposang: TCmDbField;
    FVlrparccompir: TCmDbField;
    FIdestado: TCmDbField;
    FNumdepsalf: TCmDbField;
    FFlgdeficiente: TCmDbField;
    FIdgrinstr: TCmDbField;
    FFlgsomairsupinss: TCmDbField;
    FFlgisentoirrf: TCmDbField;
    FIdcidades: TCmDbField;
    FDataconcliminar: TCmDbField;
    FDatamorte: TCmDbField;
    FVlrpensao: TCmDbField;
    FCorpessoa: TCmDbField;
    FFiminvalidez: TCmDbField;
    FIniciocompir: TCmDbField;
    FNomemae: TCmDbField;
    FCodestado: TCmDbField;
    FStatusprocjud: TCmDbField;
    FSexo: TCmDbField;
    FFlgdestcc: TCmDbField;
    FNumdeptot: TCmDbField;
    FVlrtotcompir: TCmDbField;
    FNumdepirrf: TCmDbField;
    FFlgmolestiagrave: TCmDbField;
    FInicioinvalidez: TCmDbField;
    FIdsindicato: TCmDbField;
    FEstcivil: TCmDbField;
    FDatamolestiagrave: TCmDbField;
    FIdpessoa: TCmDbField;
    FVlrenquadramento: TCmDbField;
    FNomepai: TCmDbField;
    FDataconcjulg: TCmDbField;
    FIdprofiss: TCmDbField;
    FIdfontrecr: TCmDbField;

    // Felipe A. Santos SOL 229871.16137 - início
    FRecebBenefContrib_Idade: TCmDbField; //Everson Cunha - SIG38475 //SIG118900
    FObs: TCmDbField;
    // Felipe A. Santos SOL 229871.16137 - fim

    FFlgIsentoContrPrevid: TCmDbField; // Felipe A. Santos SOL 229874/16584 KTN 544346
    FIdProcessosCP: TCmDbField;  // Felipe A. Santos SOL 229874/16584 KTN 544346
    FIdProcessosIR: TCmDbField;  // Felipe A. Santos SOL 229874/16584 KTN 544346

    FUniaoEstavel: TCmDbField; //William Santana - SOL 229881/16645 PPM: 565995

    FDescContribPrev: TCmDbField;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 DESCCONTRIBPREV
    FEmailFuncef: TCmDbField;

    procedure SetCodestado(const Value: TCmDbField);
    procedure SetCorpessoa(const Value: TCmDbField);
    procedure SetDataconcjulg(const Value: TCmDbField);
    procedure SetDataconcliminar(const Value: TCmDbField);
    procedure SetDatamolestiagrave(const Value: TCmDbField);
    procedure SetDatamorte(const Value: TCmDbField);
    procedure SetDatanasc(const Value: TCmDbField);
    procedure SetEstcivil(const Value: TCmDbField);
    procedure SetFiminvalidez(const Value: TCmDbField);
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

    // Felipe A. Santos SOL 229871.16137 - início
    procedure SetObs(const Value: TCmDbField);
    procedure SetRecebBenefContrib_Idade(const Value: TCmDbField); //Everson Cunha - SIG38475 //SIG118900
    // Felipe A. Santos SOL 229871.16137 - fim

    procedure SetFlgIsentoContrPrevid(const Value: TCmDbField); // Felipe A. Santos SOL 229874/16584 KTN 544346
    procedure SetIdProcessosCP(const Value: TCmDbField); // Felipe A. Santos SOL 229874/16584 KTN 544346
    procedure SetIdProcessosIR(const Value: TCmDbField); // Felipe A. Santos SOL 229874/16584 KTN 544346

    procedure SetUniaoEstavel(const Value: TCmDbField); //William Santana - SOL 229881/16645 PPM: 565995
    procedure SetDescContribPrev(const Value: TCmDbField); //Michelle Mota - SOL: 250384.17324 - PPM: 1070235 DESCCONTRIBPREV
    procedure SetEmailFuncef(const Value: TCmDbField);

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
     Property Fiminvalidez: TCmDbField read FFiminvalidez write SetFiminvalidez;
     Property Estcivil: TCmDbField read FEstcivil write SetEstcivil;
     Property Datanasc: TCmDbField read FDatanasc write SetDatanasc;
     Property Datamorte: TCmDbField read FDatamorte write SetDatamorte;
     Property Datamolestiagrave: TCmDbField read FDatamolestiagrave write SetDatamolestiagrave;
     Property Dataconcliminar: TCmDbField read FDataconcliminar write SetDataconcliminar;
     Property Dataconcjulg: TCmDbField read FDataconcjulg write SetDataconcjulg;
     Property Corpessoa: TCmDbField read FCorpessoa write SetCorpessoa;
     Property Codestado: TCmDbField read FCodestado write SetCodestado;

     // Felipe A. Santos SOL 229871.16137 - início
     Property RecebBenefContrib_Idade : TCmDbField read FRecebBenefContrib_Idade write SetRecebBenefContrib_Idade; //Everson Cunha - SIG38475 //SIG118900
     Property Obs: TCmDbField read FObs write SetObs;
     // Felipe A. Santos SOL 229871.16137 - fim

     // Felipe A. Santos SOL 229874/16584 KTN 544346 - início
     Property FlgIsentoContrPrevid : TCmDbField read FFlgIsentoContrPrevid write SetFlgIsentoContrPrevid;
     Property IdProcessosIR : TCmDbField read FIdProcessosIR write SetIdProcessosIR;
     Property IdProcessosCP : TCmDbField read FIdProcessosCP write SetIdProcessosCP;
     // Felipe A. Santos SOL 229874/16584 KTN 544346 - fim

     Property UniaoEstavel: TCmDbField read FUniaoEstavel write SetUniaoEstavel; //William Santana - SOL 229881/16645 PPM: 565995

     Property DescContribPrev : TCmDbField read FDescContribPrev write SetDescContribPrev;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 DESCCONTRIBPREV

     Property EmailFuncef : TCmDbField read FEmailFuncef write SetEmailFuncef;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPessoafisica }

constructor TDbPessoafisica.Create(Aowner: TCmCustomCdbObject);
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
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'');
   fIdgrinstr := CreateCmDbField('IDGRINSTR',ftfloat,False,False,False,True,'');
   fIdfontrecr := CreateCmDbField('IDFONTRECR',ftfloat,False,False,False,True,'');
   fIdestado := CreateCmDbField('IDESTADO',ftfloat,False,False,False,True,'');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'');
   fFlgsomairsupinss := CreateCmDbField('FLGSOMAIRSUPINSS',ftfloat,False,False,False,True,'');
   fFlgmolestiagrave := CreateCmDbField('FLGMOLESTIAGRAVE',ftfloat,False,False,False,True,'');
   fFlgisentoirrf := CreateCmDbField('FLGISENTOIRRF',ftfloat,False,False,False,False,'');
   fFlgdestcc := CreateCmDbField('FLGDESTCC',ftfloat,False,False,False,True,'');
   fFlgdeficiente := CreateCmDbField('FLGDEFICIENTE',ftfloat,False,False,False,True,'');
   fFiminvalidez := CreateCmDbField('FIMINVALIDEZ',ftDateTime,False,False,False,True,'');
   fEstcivil := CreateCmDbField('ESTCIVIL',ftString,False,False,False,True,'');
   fDatanasc := CreateCmDbField('DATANASC',ftDateTime,False,False,False,True,'');
   fDatamorte := CreateCmDbField('DATAMORTE',ftDateTime,False,False,False,True,'');
   fDatamolestiagrave := CreateCmDbField('DATAMOLESTIAGRAVE',ftDateTime,False,False,False,True,'');
   fDataconcliminar := CreateCmDbField('DATACONCLIMINAR',ftDateTime,False,False,False,True,'');
   fDataconcjulg := CreateCmDbField('DATACONCJULG',ftDateTime,False,False,False,True,'');
   fCorpessoa := CreateCmDbField('CORPESSOA',ftfloat,False,False,False,False,'');
   fCodestado := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'');

   // Felipe A. Santos SOL 229871.16137 - início
   fRecebBenefContrib_Idade := CreateCmDbField('RECEBENEFCONTRIB_IDADE',ftString,False,False,False,True,''); //Everson Cunha - SIG38475 //SIG118900
   fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'');
   // Felipe A. Santos SOL 229871.16137 - fim

   // Felipe A. Santos SOL 229874/16584 KTN 544346 - início
   fFlgIsentoContrPrevid := CreateCmDbField('FLGISENTOCONTRPREVID',ftFloat,False,False,False,False,'');
   fIdProcessosIR := CreateCmDbField('IDPROCESSOSIR',ftFloat,False,False,False,True,'');
   fIdProcessosCP := CreateCmDbField('IDPROCESSOSCP',ftFloat,False,False,False,True,'');
   // Felipe A. Santos SOL 229874/16584 KTN 544346 - fim

   fUniaoEstavel := CreateCmDbField('UNIAOESTAVEL',ftString,False,False,False,True,''); //William Santana - SOL 229881/16645 PPM: 565995
   fDESCCONTRIBPREV := CreateCmDbField('DESCCONTRIBPREV',ftFloat,False,False,False,True,'');//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 DESCCONTRIBPREV

   FEmailFuncef := CreateCmDbField('EMAILFUNCEF', ftString,False,False,False,True,'');
end;

function TDbPessoafisica.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbPessoafisica.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbPessoafisica.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbPessoafisica.SetCorpessoa(const Value: TCmDbField);
begin
  FCorpessoa := Value;
end;

procedure TDbPessoafisica.SetDataconcjulg(const Value: TCmDbField);
begin
  FDataconcjulg := Value;
end;

procedure TDbPessoafisica.SetDataconcliminar(const Value: TCmDbField);
begin
  FDataconcliminar := Value;
end;

procedure TDbPessoafisica.SetDatamolestiagrave(const Value: TCmDbField);
begin
  FDatamolestiagrave := Value;
end;

procedure TDbPessoafisica.SetDatamorte(const Value: TCmDbField);
begin
  FDatamorte := Value;
end;

procedure TDbPessoafisica.SetDatanasc(const Value: TCmDbField);
begin
  FDatanasc := Value;
end;

procedure TDbPessoafisica.SetEstcivil(const Value: TCmDbField);
begin
  FEstcivil := Value;
end;

procedure TDbPessoafisica.SetFiminvalidez(const Value: TCmDbField);
begin
  FFiminvalidez := Value;
end;

procedure TDbPessoafisica.SetFlgdeficiente(const Value: TCmDbField);
begin
  FFlgdeficiente := Value;
end;

procedure TDbPessoafisica.SetFlgdestcc(const Value: TCmDbField);
begin
  FFlgdestcc := Value;
end;

procedure TDbPessoafisica.SetFlgisentoirrf(const Value: TCmDbField);
begin
  FFlgisentoirrf := Value;
end;

procedure TDbPessoafisica.SetFlgmolestiagrave(const Value: TCmDbField);
begin
  FFlgmolestiagrave := Value;
end;

procedure TDbPessoafisica.SetFlgsomairsupinss(const Value: TCmDbField);
begin
  FFlgsomairsupinss := Value;
end;

procedure TDbPessoafisica.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbPessoafisica.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDbPessoafisica.SetIdfontrecr(const Value: TCmDbField);
begin
  FIdfontrecr := Value;
end;

procedure TDbPessoafisica.SetIdgrinstr(const Value: TCmDbField);
begin
  FIdgrinstr := Value;
end;

procedure TDbPessoafisica.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbPessoafisica.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPessoafisica.SetIdprofiss(const Value: TCmDbField);
begin
  FIdprofiss := Value;
end;

procedure TDbPessoafisica.SetIdsindicato(const Value: TCmDbField);
begin
  FIdsindicato := Value;
end;

procedure TDbPessoafisica.SetIniciocompir(const Value: TCmDbField);
begin
  FIniciocompir := Value;
end;

procedure TDbPessoafisica.SetInicioinvalidez(const Value: TCmDbField);
begin
  FInicioinvalidez := Value;
end;

procedure TDbPessoafisica.SetNomemae(const Value: TCmDbField);
begin
  FNomemae := Value;
end;

procedure TDbPessoafisica.SetNomepai(const Value: TCmDbField);
begin
  FNomepai := Value;
end;

procedure TDbPessoafisica.SetNumdepirrf(const Value: TCmDbField);
begin
  FNumdepirrf := Value;
end;

procedure TDbPessoafisica.SetNumdepsalf(const Value: TCmDbField);
begin
  FNumdepsalf := Value;
end;

procedure TDbPessoafisica.SetNumdeptot(const Value: TCmDbField);
begin
  FNumdeptot := Value;
end;

// Felipe A. Santos SOL 229871.16137 - início
procedure TDbPessoafisica.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;
// Felipe A. Santos SOL 229871.16137 - fim

procedure TDbPessoafisica.SetPercirrfjud(const Value: TCmDbField);
begin
  FPercirrfjud := Value;
end;

// Felipe A. Santos SOL 229871.16137 - início
//Everson Cunha - SIG38475 - Ini //SIG118900
procedure TDbPessoafisica.SetRecebBenefContrib_Idade(
  const Value: TCmDbField);
begin
  FRecebBenefContrib_Idade := Value;
end;
//Everson Cunha - SIG38475 - Fim //SIG118900
// Felipe A. Santos SOL 229871.16137 - fim

procedure TDbPessoafisica.SetSexo(const Value: TCmDbField);
begin
  FSexo := Value;
end;

procedure TDbPessoafisica.SetStatusprocjud(const Value: TCmDbField);
begin
  FStatusprocjud := Value;
end;

procedure TDbPessoafisica.SetTiposang(const Value: TCmDbField);
begin
  FTiposang := Value;
end;

procedure TDbPessoafisica.SetVlrenquadramento(const Value: TCmDbField);
begin
  FVlrenquadramento := Value;
end;

procedure TDbPessoafisica.SetVlrinss(const Value: TCmDbField);
begin
  FVlrinss := Value;
end;

procedure TDbPessoafisica.SetVlrparccompir(const Value: TCmDbField);
begin
  FVlrparccompir := Value;
end;

procedure TDbPessoafisica.SetVlrpensao(const Value: TCmDbField);
begin
  FVlrpensao := Value;
end;

procedure TDbPessoafisica.SetVlrtotcompir(const Value: TCmDbField);
begin
  FVlrtotcompir := Value;
end;

// Felipe A. Santos SOL 229874/16584 KTN 544346 - início
procedure TDbPessoafisica.SetFlgIsentoContrPrevid(const Value: TCmDbField);
begin
  FFlgIsentoContrPrevid := Value;
end;
// Felipe A. Santos SOL 229874/16584 KTN 544346 - fim

// Felipe A. Santos SOL 229874/16584 KTN 544346 - início
procedure TDbPessoafisica.SetIdProcessosCP(const Value: TCmDbField);
begin
  FIdProcessosCP := Value;
end;

procedure TDbPessoafisica.SetIdProcessosIR(const Value: TCmDbField);
begin
  FIdProcessosIR := Value;
end;
// Felipe A. Santos SOL 229874/16584 KTN 544346 - fim

//Início - William Santana - SOL 229881/16645 PPM: 565995
 procedure TDbPessoafisica.SetUniaoEstavel(const Value: TCmDbField);
begin
  fUniaoEstavel := Value;
end;
//Término - William Santana - SOL 229881/16645 PPM: 565995

// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
procedure TDbPessoafisica.SetDescContribPrev(const Value: TCmDbField);
begin
  fDESCCONTRIBPREV := Value;
end;
// Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

procedure TDbPessoafisica.SetEmailFuncef(const Value: TCmDbField);
begin
  FEmailFuncef := Value;
end;

end.



