{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/04/2002                             }
{                12/09/2003 - André Tavares - pendência 15017 }                                       
{*******************************************************}
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
//***************************************************************************************
//Rotina.............: Create
//N. SIG.............: 99868
//Data da Alteração..: 02/09/2020 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos campos para parametrização de Convênio Bancário.
// *****************************************************************************
 { --------------------------------------------------------------------------------------------------
Nº SOL......: 253577/17359
Nº PPM......: 842402
Data........: 23/06/2015
Responsável.: Helio Lima Custódio
Descrição...: Inclusão das flgs FLGAGRUPAANEXOS e FLGENVIAEMAIL, para
              geração dos boletos separado e envio de e-mail para o participante
-----------------------------------------------------------------------------------------------------}

unit uDbPortadorforma;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbPortadorforma = class(TCmDbObject)

  private
    FDiasemanalancto: TCmDbField;
    FFlgobrigafav: TCmDbField;
    FDmais: TCmDbField;
    FNumrazaocc: TCmDbField;
    FDatacontrremessa: TCmDbField;
    FIdpessoa: TCmDbField;
    FPatharquivorem: TCmDbField;
    FDescfinan: TCmDbField;
    FCodtipopagto: TCmDbField;
    FCodbloqche: TCmDbField;
    FIdtemplcheque: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdconfigbarras: TCmDbField;
    FCodarquivoremessa: TCmDbField;
    FPrazoprotesto: TCmDbField;
    FCodforma: TCmDbField;
    FDiasuteislancto: TCmDbField;
    FFlgcontabemischq: TCmDbField;
    FFlgchequediferido: TCmDbField;
    FNossonumero: TCmDbField;
    FCodsubconta: TCmDbField;
    FControleremessa: TCmDbField;
    FFlgcontrolacheque: TCmDbField;
    FCodcorresp: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FLotetransmissao: TCmDbField;
    FLancafinanc: TCmDbField;
    FPlano: TCmDbField;
    FDescricao: TCmDbField;
    FPlanocontabchq: TCmDbField;
    FCodformapagto: TCmDbField;
    FCodportador: TCmDbField;
    FFlgemiteaviso: TCmDbField;
    FPlaconta: TCmDbField;
    FPlacontacontabchq: TCmDbField;
    FPatharquivoret: TCmDbField;
    FIdempresa: TCmDbField;
    FJurospordia: TCmDbField;
    FIdforcli: TCmDbField;
    FRecpag: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FNumempresabanco: TCmDbField;
    FCodportforma: TCmDbField;
    FCodtipdoc  : TCmDbField;

//início 01/08/2003 - André Tavares - pendência 14643
    FValorMaximo: TCmDbField;
    FCodFormaPgtoAlt: TCmDbField;
    FDMaisAlt: TCmDbField;
    FFlgUsaAltEnvio: TCmDbField;
    FFlgMensagemVerso: TCmDbField;
    FFlgEncContas: TCmDbField;
    FFlgFloatArqBanc: TCmDbField;
    FFlgdatatdebcred: TCmDbField;
    FFlgAtivo: TCmDbField;
    FFlgObservObrigatoria: TCmDbField;

    //INICIO - Helio - SOL Nº 253577-17359 PPM Nº 842402
    FFlgAgrupaAnexos: TCmDbField;
    FFlgEnviaEmail  : TCmDbField;
    FFlgArquivo: TCmDbField;
    //FIM - Helio - SOL Nº 253577-17359 PPM Nº 842402

    procedure SetValorMaximo(const Value: TCmDbField);
    procedure SetCodFormaPgtoAlt(const Value: TCmDbField);
//fim 01/08/2003 - André Tavares - pendência 14643


    procedure SetCodarquivoremessa(const Value: TCmDbField);
    procedure SetCodbloqche(const Value: TCmDbField);
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcorresp(const Value: TCmDbField);
    procedure SetCodforma(const Value: TCmDbField);
    procedure SetCodformapagto(const Value: TCmDbField);
    procedure SetCodportador(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodtipopagto(const Value: TCmDbField);
    procedure SetControleremessa(const Value: TCmDbField);
    procedure SetDatacontrremessa(const Value: TCmDbField);
    procedure SetDescfinan(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetDiasemanalancto(const Value: TCmDbField);
    procedure SetDiasuteislancto(const Value: TCmDbField);
    procedure SetDmais(const Value: TCmDbField);
    procedure SetFlgchequediferido(const Value: TCmDbField);
    procedure SetFlgcontabemischq(const Value: TCmDbField);
    procedure SetFlgcontrolacheque(const Value: TCmDbField);
    procedure SetFlgemiteaviso(const Value: TCmDbField);
    procedure SetFlgobrigafav(const Value: TCmDbField);
    procedure SetIdconfigbarras(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtemplcheque(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetJurospordia(const Value: TCmDbField);
    procedure SetLancafinanc(const Value: TCmDbField);
    procedure SetLotetransmissao(const Value: TCmDbField);
    procedure SetNossonumero(const Value: TCmDbField);
    procedure SetNumempresabanco(const Value: TCmDbField);
    procedure SetNumrazaocc(const Value: TCmDbField);
    procedure SetPatharquivorem(const Value: TCmDbField);
    procedure SetPatharquivoret(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlacontacontabchq(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlanocontabchq(const Value: TCmDbField);
    procedure SetPrazoprotesto(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetDMaisAlt(const Value: TCmDbField);
    procedure SetFlgUsaAltEnvio(const Value: TCmDbField);
    procedure SetFlgMensagemVerso(const Value: TCmDbField);
    procedure SetFlgEncContas(const Value: TCmDbField);
    procedure SetFlgFloatArqBanc(const Value: TCmDbField);
    procedure SetFlgdatatdebcred(const Value: TCmDbField);
    procedure SetFlgAtivo(const Value: TCmDbField);
// Nilton 19/11/08 - Pendencia: 99772
    procedure SetFlgObservObrigatoria(const Value: TCmDbField);

    //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
    procedure SetFlgAgrupaAnexos(const Value: TCmDbField);
    procedure SetFlgEnviaEmail(const Value: TCmDbField);
    procedure SetFlgArquivo(const Value: TCmDbField);
    //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Prazoprotesto: TCmDbField read FPrazoprotesto write SetPrazoprotesto;
     Property Planocontabchq: TCmDbField read FPlanocontabchq write SetPlanocontabchq;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placontacontabchq: TCmDbField read FPlacontacontabchq write SetPlacontacontabchq;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Patharquivoret: TCmDbField read FPatharquivoret write SetPatharquivoret;
     Property Patharquivorem: TCmDbField read FPatharquivorem write SetPatharquivorem;
     Property Numrazaocc: TCmDbField read FNumrazaocc write SetNumrazaocc;
     Property Numempresabanco: TCmDbField read FNumempresabanco write SetNumempresabanco;
     Property Nossonumero: TCmDbField read FNossonumero write SetNossonumero;
     Property Lotetransmissao: TCmDbField read FLotetransmissao write SetLotetransmissao;
     Property Lancafinanc: TCmDbField read FLancafinanc write SetLancafinanc;
     Property Jurospordia: TCmDbField read FJurospordia write SetJurospordia;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idtemplcheque: TCmDbField read FIdtemplcheque write SetIdtemplcheque;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idconfigbarras: TCmDbField read FIdconfigbarras write SetIdconfigbarras;
     Property Flgobrigafav: TCmDbField read FFlgobrigafav write SetFlgobrigafav;
     Property Flgemiteaviso: TCmDbField read FFlgemiteaviso write SetFlgemiteaviso;
     Property Flgcontrolacheque: TCmDbField read FFlgcontrolacheque write SetFlgcontrolacheque;
     Property Flgcontabemischq: TCmDbField read FFlgcontabemischq write SetFlgcontabemischq;
     Property Flgchequediferido: TCmDbField read FFlgchequediferido write SetFlgchequediferido;
     Property Dmais: TCmDbField read FDmais write SetDmais;
     Property Diasuteislancto: TCmDbField read FDiasuteislancto write SetDiasuteislancto;
     Property Diasemanalancto: TCmDbField read FDiasemanalancto write SetDiasemanalancto;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Descfinan: TCmDbField read FDescfinan write SetDescfinan;
     Property Datacontrremessa: TCmDbField read FDatacontrremessa write SetDatacontrremessa;
     Property Controleremessa: TCmDbField read FControleremessa write SetControleremessa;
     Property Codtipopagto: TCmDbField read FCodtipopagto write SetCodtipopagto;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codtipdoc  : TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codportador: TCmDbField read FCodportador write SetCodportador;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codformapagto: TCmDbField read FCodformapagto write SetCodformapagto;
     Property Codforma: TCmDbField read FCodforma write SetCodforma;
     Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property Codbloqche: TCmDbField read FCodbloqche write SetCodbloqche;
     Property Codarquivoremessa: TCmDbField read FCodarquivoremessa write SetCodarquivoremessa;
     // Marcus Oliveira 12/04/2007 Pendência: 24823
     Property FlgAtivo: TCmDbField read FFlgAtivo write SetFlgAtivo;

// Nilton 19/11/08 - - Pendencia: 99772
     Property FlgObservObrigatoria: TCmDbField read FFlgObservObrigatoria write SetFlgObservObrigatoria;

//início 01/08/2003 - André Tavares - pendência 14643
     Property ValorMaximo: TCmDbField read FValorMaximo write SetValorMaximo;
     Property CodFormaPgtoAlt: TCmDbField read FCodFormaPgtoAlt write SetCodFormaPgtoAlt;
     Property DMaisAlt: TCmDbField read FDMaisAlt write SetDMaisAlt;
//fim 01/08/2003 - André Tavares - pendência 14643

//início - 21/06/2004 - André Tavares - pendência 17041
     Property FlgMensagemVerso: TCmDbField read FFlgMensagemVerso write SetFlgMensagemVerso;
//fim - 21/06/2004 - André Tavares - pendência 17041

//início 22/03/2004 - André Tavares - pendência 16244
     Property FlgUsaAltEnvio: TCmDbField read FFlgUsaAltEnvio write SetFlgUsaAltEnvio;
//fim 22/03/2004 - André Tavares - pendência 16244

     Property FlgEncContas: TCmDbField read FFlgEncContas write SetFlgEncContas; //andré tavares - pendência 22486 - 17/11/2006

     //andré tavares - pendência 21782 - 23/03/2007 - flag para indicar se utiliza float para fazer com que a data de crédito na conta do fornecedor seja igual à data programada do documento.
     Property FlgFloatArqBanc: TCmDbField read FFlgFloatArqBanc write SetFlgFloatArqBanc;
     Property Flgdatatdebcred: TCmDbField read FFlgdatatdebcred write SetFlgdatatdebcred;

     //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
     Property FlgAgrupaAnexos: TCmDbField read FFlgAgrupaAnexos write SetFlgAgrupaAnexos;
     Property FlgEnviaEmail  : TCmDbField read FFlgEnviaEmail   write SetFlgEnviaEmail;
     //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402

     property FlgArquivo: TCmDbField read FFlgArquivo write SetFlgArquivo; //Cássio Rovaroto - SIG nº 99868
     
     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPortadorforma }

constructor TDbPortadorforma.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PORTADORFORMA';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPrazoprotesto := CreateCmDbField('PRAZOPROTESTO',ftfloat,False,False,False,True,'');
   fPlanocontabchq := CreateCmDbField('PLANOCONTABCHQ',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlacontacontabchq := CreateCmDbField('PLACONTACONTABCHQ',ftString,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fPatharquivoret := CreateCmDbField('PATHARQUIVORET',ftString,False,False,False,True,'');
   fPatharquivorem := CreateCmDbField('PATHARQUIVOREM',ftString,False,False,False,True,'');
   fNumrazaocc := CreateCmDbField('NUMRAZAOCC',ftString,False,False,False,True,'');
   fNumempresabanco := CreateCmDbField('NUMEMPRESABANCO',ftString,False,False,False,True,'');
   fNossonumero := CreateCmDbField('NOSSONUMERO',ftString,False,False,False,True,'');
   fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True,'');
   fLancafinanc := CreateCmDbField('LANCAFINANC',ftString,False,False,False,True,'');
   fJurospordia := CreateCmDbField('JUROSPORDIA',ftfloat,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdtemplcheque := CreateCmDbField('IDTEMPLCHEQUE',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdconfigbarras := CreateCmDbField('IDCONFIGBARRAS',ftfloat,False,False,False,True,'');
   fFlgobrigafav := CreateCmDbField('FLGOBRIGAFAV',ftString,False,False,False,True,'');
   fFlgemiteaviso := CreateCmDbField('FLGEMITEAVISO',ftString,False,False,False,True,'');
   fFlgcontrolacheque := CreateCmDbField('FLGCONTROLACHEQUE',ftString,False,False,False,True,'');
   fFlgcontabemischq := CreateCmDbField('FLGCONTABEMISCHQ',ftString,False,False,False,True,'');
   fFlgchequediferido := CreateCmDbField('FLGCHEQUEDIFERIDO',ftString,False,False,False,True,'');
   fDmais := CreateCmDbField('DMAIS',ftfloat,False,False,False,True,'');
   fDiasuteislancto := CreateCmDbField('DIASUTEISLANCTO',ftfloat,False,False,False,True,'');
   fDiasemanalancto := CreateCmDbField('DIASEMANALANCTO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fDescfinan := CreateCmDbField('DESCFINAN',ftString,False,False,False,True,'');
   fDatacontrremessa := CreateCmDbField('DATACONTRREMESSA',ftDateTime,False,False,False,True,'');
   fControleremessa := CreateCmDbField('CONTROLEREMESSA',ftfloat,False,False,False,True,'');
   fCodtipopagto := CreateCmDbField('CODTIPOPAGTO',ftfloat,False,False,False,False,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,True,False,True,'');
   fCodtipdoc    := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodportador := CreateCmDbField('CODPORTADOR',ftfloat,False,False,False,True,'');
   fCodformapagto := CreateCmDbField('CODFORMAPAGTO',ftfloat,False,False,False,False,'');
   fCodforma := CreateCmDbField('CODFORMA',ftfloat,False,False,False,True,'');
   fCodcorresp := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fCodbloqche := CreateCmDbField('CODBLOQCHE',ftfloat,False,False,False,True,'');
   fCodarquivoremessa := CreateCmDbField('CODARQUIVOREMESSA',ftfloat,False,False,False,False,'');
// Marcus Oliveira 12/04/2007 Pendência: 24823
   fFlgAtivo := CreateCmDbField('FLGATIVO', ftString, False, False, False, False, '');

// Nilton 19/11/08 - Pendencia: 99772
   fFlgObservObrigatoria := CreateCmDbField('FLGOBSERVOBRIGATORIA', ftString, False, False, False, False, '');

//início 12/09/2003 - André Tavares - pendência 15017
   fValorMaximo := CreateCmDbField('VALORMAXIMO',ftfloat,False,False,false,true,'');
   fCodFormaPgtoAlt := CreateCmDbField('CODFORMAPGTOALT',ftfloat,False,False,False,true,'');
   fDmaisAlt := CreateCmDbField('DMAISALT',ftfloat,False,False,False,true,'');
//fim 12/09/2003 - André Tavares - pendência 15017

   fFlgUsaAltEnvio := CreateCmDbField('FLGUSAALTENVIO',ftfloat,False,False,False,true,'');

   fFlgMensagemVerso := CreateCmDbField('FLGMENSAGEMVERSO',ftfloat,False,False,False,true,'');

   fFlgEncContas := CreateCmDbField('FLGENCCONTAS',ftString,False,False,False,True,''); //andré tavares - pendência 22486 - 17/11/2006

   fFlgFloatArqBanc  := CreateCmDbField('FLGFLOATARQBANC',ftString,False,False,False,True,'');
   fFlgdatatdebcred  := CreateCmDbField('FLGDATATDEBCRED',ftString,False,False,False,True,'');

   //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
   FFlgAgrupaAnexos := CreateCmDbField('FLGAGRUPAANEXOS',ftString,False,False,False,true,'');
   FFlgEnviaEmail   := CreateCmDbField('FLGENVIAEMAIL',ftString,False,False,False,true,'');
   //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402   
   FFlgArquivo := CreateCmDbField('FLGARQUIVO', ftString, false, false, false, true, ''); //Cássio Rovaroto - SIG nº 99868
  
end;

function TDbPortadorforma.Insert: Boolean;
begin

   fCodportforma.AsFloat := GetSequence('PORTADORFORMA');
   Result := Inherited Insert;

end;

function TDbPortadorforma.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPortadorforma.SetCodarquivoremessa(const Value: TCmDbField);
begin
  FCodarquivoremessa := Value;
end;

procedure TDbPortadorforma.SetCodbloqche(const Value: TCmDbField);
begin
  FCodbloqche := Value;
end;

procedure TDbPortadorforma.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbPortadorforma.SetCodcorresp(const Value: TCmDbField);
begin
  FCodcorresp := Value;
end;

procedure TDbPortadorforma.SetCodforma(const Value: TCmDbField);
begin
  FCodforma := Value;
end;

procedure TDbPortadorforma.SetCodformapagto(const Value: TCmDbField);
begin
  FCodformapagto := Value;
end;

procedure TDbPortadorforma.SetCodportador(const Value: TCmDbField);
begin
  FCodportador := Value;
end;

procedure TDbPortadorforma.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbPortadorforma.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbPortadorforma.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbPortadorforma.SetCodtipopagto(const Value: TCmDbField);
begin
  FCodtipopagto := Value;
end;

procedure TDbPortadorforma.SetControleremessa(const Value: TCmDbField);
begin
  FControleremessa := Value;
end;

procedure TDbPortadorforma.SetDatacontrremessa(const Value: TCmDbField);
begin
  FDatacontrremessa := Value;
end;

procedure TDbPortadorforma.SetDescfinan(const Value: TCmDbField);
begin
  FDescfinan := Value;
end;

procedure TDbPortadorforma.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbPortadorforma.SetDiasemanalancto(const Value: TCmDbField);
begin
  FDiasemanalancto := Value;
end;

procedure TDbPortadorforma.SetDiasuteislancto(const Value: TCmDbField);
begin
  FDiasuteislancto := Value;
end;

procedure TDbPortadorforma.SetDmais(const Value: TCmDbField);
begin
  FDmais := Value;
end;

procedure TDbPortadorforma.SetFlgchequediferido(const Value: TCmDbField);
begin
  FFlgchequediferido := Value;
end;

procedure TDbPortadorforma.SetFlgcontabemischq(const Value: TCmDbField);
begin
  FFlgcontabemischq := Value;
end;

procedure TDbPortadorforma.SetFlgcontrolacheque(const Value: TCmDbField);
begin
  FFlgcontrolacheque := Value;
end;

procedure TDbPortadorforma.SetFlgemiteaviso(const Value: TCmDbField);
begin
  FFlgemiteaviso := Value;
end;

procedure TDbPortadorforma.SetFlgobrigafav(const Value: TCmDbField);
begin
  FFlgobrigafav := Value;
end;

procedure TDbPortadorforma.SetIdconfigbarras(const Value: TCmDbField);
begin
  FIdconfigbarras := Value;
end;

procedure TDbPortadorforma.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbPortadorforma.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbPortadorforma.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPortadorforma.SetIdtemplcheque(const Value: TCmDbField);
begin
  FIdtemplcheque := Value;
end;

procedure TDbPortadorforma.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbPortadorforma.SetJurospordia(const Value: TCmDbField);
begin
  FJurospordia := Value;
end;

procedure TDbPortadorforma.SetLancafinanc(const Value: TCmDbField);
begin
  FLancafinanc := Value;
end;

procedure TDbPortadorforma.SetLotetransmissao(const Value: TCmDbField);
begin
  FLotetransmissao := Value;
end;

procedure TDbPortadorforma.SetNossonumero(const Value: TCmDbField);
begin
  FNossonumero := Value;
end;

procedure TDbPortadorforma.SetNumempresabanco(const Value: TCmDbField);
begin
  FNumempresabanco := Value;
end;

procedure TDbPortadorforma.SetNumrazaocc(const Value: TCmDbField);
begin
  FNumrazaocc := Value;
end;

procedure TDbPortadorforma.SetPatharquivorem(const Value: TCmDbField);
begin
  FPatharquivorem := Value;
end;

procedure TDbPortadorforma.SetPatharquivoret(const Value: TCmDbField);
begin
  FPatharquivoret := Value;
end;

procedure TDbPortadorforma.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbPortadorforma.SetPlacontacontabchq(const Value: TCmDbField);
begin
  FPlacontacontabchq := Value;
end;

procedure TDbPortadorforma.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPortadorforma.SetPlanocontabchq(const Value: TCmDbField);
begin
  FPlanocontabchq := Value;
end;

procedure TDbPortadorforma.SetPrazoprotesto(const Value: TCmDbField);
begin
  FPrazoprotesto := Value;
end;

procedure TDbPortadorforma.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbPortadorforma.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

//início 01/08/2003 - André Tavares - pendência 14643
procedure TDbPortadorforma.SetCodFormaPgtoAlt(const Value: TCmDbField);
begin
  FCodFormaPgtoAlt := Value;
end;

procedure TDbPortadorforma.SetValorMaximo(const Value: TCmDbField);
begin
  FValorMaximo := Value;
end;
//Fim 01/08/2003 - André Tavares - pendência 14643


procedure TDbPortadorforma.SetDMaisAlt(const Value: TCmDbField);
begin
  FDMaisAlt := Value;
end;

procedure TDbPortadorforma.SetFlgUsaAltEnvio(const Value: TCmDbField);
begin
  FFlgUsaAltEnvio := Value;
end;

procedure TDbPortadorforma.SetFlgMensagemVerso(const Value: TCmDbField);
begin
  FFlgMensagemVerso := Value;
end;

procedure TDbPortadorforma.SetFlgEncContas(const Value: TCmDbField);
begin
  FFlgEncContas := Value;
end;

procedure TDbPortadorforma.SetFlgFloatArqBanc(const Value: TCmDbField);
begin
  FFlgFloatArqBanc := Value;
end;

procedure TDbPortadorforma.SetFlgdatatdebcred(const Value: TCmDbField);
begin
  FFlgdatatdebcred := Value;
end;

procedure TDbPortadorforma.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo := Value;
end;
//Nilton 19/11/08 - Pendencia: 99772
procedure TDbPortadorforma.SetFlgObservObrigatoria(
  const Value: TCmDbField);
begin
 FFlgObservObrigatoria:= Value;
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TDbPortadorforma.SetFlgAgrupaAnexos(const Value: TCmDbField);
begin
  FFlgAgrupaAnexos := Value;
end;

//Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TDbPortadorforma.SetFlgEnviaEmail(const Value: TCmDbField);
begin
  FFlgEnviaEmail := Value;
end;

procedure TDbPortadorforma.SetFlgArquivo(const Value: TCmDbField);
begin
  FFlgArquivo := Value;
end;

end.



