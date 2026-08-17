//******************************************************************************
// Data      : 28/11/2006
// Código    : AL_1
// Pendencia : 23891
// SOL       : 42459
// Desc      : Implementação da Liquidação Com Ações
//******************************************************************************

unit uDbOperacaoinvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperacaoinvest = class(TCmDbObject)

  private
    FIdmodulo: TCmDbField;
    FInipagto: TCmDbField;
    FIdmotivobloqueio: TCmDbField;
    FIdcustorig: TCmDbField;
    FMoecodigo: TCmDbField;
    FVlroperacaoom: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FPrecounitoperacao: TCmDbField;
    FObservacao: TCmDbField;
    FPrzempresa: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FDivporacao: TCmDbField;
    FIdoperacaoorigem: TCmDbField;
    FInvorigem: TCmDbField;
    FVlroperacao: TCmDbField;
    FIdcartoridest: TCmDbField;
    FIdinstfin: TCmDbField;
    FIdlote: TCmDbField;
    FOrigdest: TCmDbField;
    FIdinvestdest: TCmDbField;
    FFormapagrec: TCmDbField;
    FQtdeoperacao: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FCodfinanceiro: TCmDbField;
    FVlrremuneracao: TCmDbField;
    FIdcorretvalores: TCmDbField;
    FDatavencoper: TCmDbField;
    FVlrvariacaoatual: TCmDbField;
    FIdopercustodia: TCmDbField;
    FIdoperacaoinvest: TCmDbField;
    FFlgcustodia: TCmDbField;
    FIdcustodiante: TCmDbField;
    FVlrcustoatual: TCmDbField;
    FPumercado: TCmDbField;
    FIdterceiro: TCmDbField;
    FIdforcli: TCmDbField;
    FIdinvestimento: TCmDbField;
    FIdoperacaodireito: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FIdcarteiragerenc: TCmDbField;
    FNumdocumento: TCmDbField;
    FCoddocumento: TCmDbField;
    FDataage: TCmDbField;
    FFlgstatusordmov: TCmDbField;
    FJuroscap: TCmDbField;
    FFlgstatusfechbol: TCmDbField;
    FIdcustdest: TCmDbField;
    FVlrir: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FPercentual: TCmDbField;
    FDataliqoper: TCmDbField;
    FDatacom: TCmDbField;
    FPrzbolsa: TCmDbField;
    FAtadecisao: TCmDbField;
    FIdordmovinv: TCmDbField;
    FEmpresaprop: TCmDbField;
    FParidade: TCmDbField;
    FVlrirremuner: TCmDbField;
    FDataoperacao: TCmDbField;
    FDataex: TCmDbField;
    //AL_1
    FIdOperContAcoes: TCmDbField;
    procedure SetAtadecisao(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodfinanceiro(const Value: TCmDbField);
    procedure SetDataage(const Value: TCmDbField);
    procedure SetDatacom(const Value: TCmDbField);
    procedure SetDataex(const Value: TCmDbField);
    procedure SetDataliqoper(const Value: TCmDbField);
    procedure SetDataoperacao(const Value: TCmDbField);
    procedure SetDatavencoper(const Value: TCmDbField);
    procedure SetDivporacao(const Value: TCmDbField);
    procedure SetEmpresaprop(const Value: TCmDbField);
    procedure SetFlgcustodia(const Value: TCmDbField);
    procedure SetFlgstatusfechbol(const Value: TCmDbField);
    procedure SetFlgstatusordmov(const Value: TCmDbField);
    procedure SetFormapagrec(const Value: TCmDbField);
    procedure SetIdcarteiragerenc(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcartoridest(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdcorretvalores(const Value: TCmDbField);
    procedure SetIdcustdest(const Value: TCmDbField);
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetIdcustorig(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdinstfin(const Value: TCmDbField);
    procedure SetIdinvestdest(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdmotivobloqueio(const Value: TCmDbField);
    procedure SetIdoperacaodireito(const Value: TCmDbField);
    procedure SetIdoperacaoinvest(const Value: TCmDbField);
    procedure SetIdoperacaoorigem(const Value: TCmDbField);
    procedure SetIdopercustodia(const Value: TCmDbField);
    procedure SetIdordmovinv(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdterceiro(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetInipagto(const Value: TCmDbField);
    procedure SetInvorigem(const Value: TCmDbField);
    procedure SetJuroscap(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNumdocumento(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetOrigdest(const Value: TCmDbField);
    procedure SetParidade(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPrecounitoperacao(const Value: TCmDbField);
    procedure SetPrzbolsa(const Value: TCmDbField);
    procedure SetPrzempresa(const Value: TCmDbField);
    procedure SetPumercado(const Value: TCmDbField);
    procedure SetQtdeoperacao(const Value: TCmDbField);
    procedure SetVlrcustoatual(const Value: TCmDbField);
    procedure SetVlrir(const Value: TCmDbField);
    procedure SetVlrirremuner(const Value: TCmDbField);
    procedure SetVlroperacao(const Value: TCmDbField);
    procedure SetVlroperacaoom(const Value: TCmDbField);
    procedure SetVlrremuneracao(const Value: TCmDbField);
    procedure SetVlrvariacaoatual(const Value: TCmDbField);
    //AL_1
    procedure SetIdOperContAcoes(const Value: TCmDbField);

  public

     Property Vlrvariacaoatual: TCmDbField read FVlrvariacaoatual write SetVlrvariacaoatual;
     Property Vlrremuneracao: TCmDbField read FVlrremuneracao write SetVlrremuneracao;
     Property Vlroperacaoom: TCmDbField read FVlroperacaoom write SetVlroperacaoom;
     Property Vlroperacao: TCmDbField read FVlroperacao write SetVlroperacao;
     Property Vlrirremuner: TCmDbField read FVlrirremuner write SetVlrirremuner;
     Property Vlrir: TCmDbField read FVlrir write SetVlrir;
     Property Vlrcustoatual: TCmDbField read FVlrcustoatual write SetVlrcustoatual;
     Property Qtdeoperacao: TCmDbField read FQtdeoperacao write SetQtdeoperacao;
     Property Pumercado: TCmDbField read FPumercado write SetPumercado;
     Property Przempresa: TCmDbField read FPrzempresa write SetPrzempresa;
     Property Przbolsa: TCmDbField read FPrzbolsa write SetPrzbolsa;
     Property Precounitoperacao: TCmDbField read FPrecounitoperacao write SetPrecounitoperacao;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Paridade: TCmDbField read FParidade write SetParidade;
     Property Origdest: TCmDbField read FOrigdest write SetOrigdest;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Numdocumento: TCmDbField read FNumdocumento write SetNumdocumento;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Juroscap: TCmDbField read FJuroscap write SetJuroscap;
     Property Invorigem: TCmDbField read FInvorigem write SetInvorigem;
     Property Inipagto: TCmDbField read FInipagto write SetInipagto;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idterceiro: TCmDbField read FIdterceiro write SetIdterceiro;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idordmovinv: TCmDbField read FIdordmovinv write SetIdordmovinv;
     Property Idopercustodia: TCmDbField read FIdopercustodia write SetIdopercustodia;
     Property Idoperacaoorigem: TCmDbField read FIdoperacaoorigem write SetIdoperacaoorigem;
     Property Idoperacaoinvest: TCmDbField read FIdoperacaoinvest write SetIdoperacaoinvest;
     Property Idoperacaodireito: TCmDbField read FIdoperacaodireito write SetIdoperacaodireito;
     Property Idmotivobloqueio: TCmDbField read FIdmotivobloqueio write SetIdmotivobloqueio;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idinvestdest: TCmDbField read FIdinvestdest write SetIdinvestdest;
     Property Idinstfin: TCmDbField read FIdinstfin write SetIdinstfin;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idcustorig: TCmDbField read FIdcustorig write SetIdcustorig;
     Property Idcustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
     Property Idcustdest: TCmDbField read FIdcustdest write SetIdcustdest;
     Property Idcorretvalores: TCmDbField read FIdcorretvalores write SetIdcorretvalores;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idcartoridest: TCmDbField read FIdcartoridest write SetIdcartoridest;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Idcarteiragerenc: TCmDbField read FIdcarteiragerenc write SetIdcarteiragerenc;
     Property Formapagrec: TCmDbField read FFormapagrec write SetFormapagrec;
     Property Flgstatusordmov: TCmDbField read FFlgstatusordmov write SetFlgstatusordmov;
     Property Flgstatusfechbol: TCmDbField read FFlgstatusfechbol write SetFlgstatusfechbol;
     Property Flgcustodia: TCmDbField read FFlgcustodia write SetFlgcustodia;
     Property Empresaprop: TCmDbField read FEmpresaprop write SetEmpresaprop;
     Property Divporacao: TCmDbField read FDivporacao write SetDivporacao;
     Property Datavencoper: TCmDbField read FDatavencoper write SetDatavencoper;
     Property Dataoperacao: TCmDbField read FDataoperacao write SetDataoperacao;
     Property Dataliqoper: TCmDbField read FDataliqoper write SetDataliqoper;
     Property Dataex: TCmDbField read FDataex write SetDataex;
     Property Datacom: TCmDbField read FDatacom write SetDatacom;
     Property Dataage: TCmDbField read FDataage write SetDataage;
     Property Codfinanceiro: TCmDbField read FCodfinanceiro write SetCodfinanceiro;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Atadecisao: TCmDbField read FAtadecisao write SetAtadecisao;
     //AL_1
     Property IdOperContAcoes: TCmDbField read FIdOperContAcoes write SetIdOperContAcoes;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperacaoinvest }

constructor TDbOperacaoinvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERACAOINVEST';

   fVlrvariacaoatual := CreateCmDbField('VLRVARIACAOATUAL',ftfloat,False,False,False,True,'');
   fVlrremuneracao := CreateCmDbField('VLRREMUNERACAO',ftfloat,False,False,False,True,'');
   fVlroperacaoom := CreateCmDbField('VLROPERACAOOM',ftfloat,False,False,False,True,'');
   fVlroperacao := CreateCmDbField('VLROPERACAO',ftfloat,False,False,False,True,'');
   fVlrirremuner := CreateCmDbField('VLRIRREMUNER',ftfloat,False,False,False,True,'');
   fVlrir := CreateCmDbField('VLRIR',ftfloat,False,False,False,True,'');
   fVlrcustoatual := CreateCmDbField('VLRCUSTOATUAL',ftfloat,False,False,False,True,'');
   fQtdeoperacao := CreateCmDbField('QTDEOPERACAO',ftfloat,False,False,False,True,'');
   fPumercado := CreateCmDbField('PUMERCADO',ftfloat,False,False,False,True,'');
   fPrzempresa := CreateCmDbField('PRZEMPRESA',ftDateTime,False,False,False,True,'');
   fPrzbolsa := CreateCmDbField('PRZBOLSA',ftDateTime,False,False,False,True,'');
   fPrecounitoperacao := CreateCmDbField('PRECOUNITOPERACAO',ftfloat,False,False,False,True,'');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
   fParidade := CreateCmDbField('PARIDADE',ftfloat,False,False,False,True,'');
   fOrigdest := CreateCmDbField('ORIGDEST',ftString,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fNumdocumento := CreateCmDbField('NUMDOCUMENTO',ftString,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fJuroscap := CreateCmDbField('JUROSCAP',ftString,False,False,False,True,'');
   fInvorigem := CreateCmDbField('INVORIGEM',ftfloat,False,False,False,True,'');
   fInipagto := CreateCmDbField('INIPAGTO',ftDateTime,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdterceiro := CreateCmDbField('IDTERCEIRO',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'');
   fIdordmovinv := CreateCmDbField('IDORDMOVINV',ftfloat,False,False,False,True,'');
   fIdopercustodia := CreateCmDbField('IDOPERCUSTODIA',ftfloat,False,False,False,True,'');
   fIdoperacaoorigem := CreateCmDbField('IDOPERACAOORIGEM',ftfloat,False,False,False,True,'');
   fIdoperacaoinvest := CreateCmDbField('IDOPERACAOINVEST',ftfloat,True,True,False,True,'');
   fIdoperacaodireito := CreateCmDbField('IDOPERACAODIREITO',ftfloat,False,False,False,True,'');
   fIdmotivobloqueio := CreateCmDbField('IDMOTIVOBLOQUEIO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdlote := CreateCmDbField('IDLOTE',ftString,False,False,False,True,'');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'');
   fIdinvestdest := CreateCmDbField('IDINVESTDEST',ftfloat,False,False,False,True,'');
   fIdinstfin := CreateCmDbField('IDINSTFIN',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdcustorig := CreateCmDbField('IDCUSTORIG',ftfloat,False,False,False,True,'');
   fIdcustodiante := CreateCmDbField('IDCUSTODIANTE',ftfloat,False,False,False,True,'');
   fIdcustdest := CreateCmDbField('IDCUSTDEST',ftfloat,False,False,False,True,'');
   fIdcorretvalores := CreateCmDbField('IDCORRETVALORES',ftfloat,False,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'');
   fIdcartoridest := CreateCmDbField('IDCARTORIDEST',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
   fIdcarteiragerenc := CreateCmDbField('IDCARTEIRAGERENC',ftfloat,False,False,False,True,'');
   fFormapagrec := CreateCmDbField('FORMAPAGREC',ftString,False,False,False,True,'');
   fFlgstatusordmov := CreateCmDbField('FLGSTATUSORDMOV',ftString,False,False,False,True,'');
   fFlgstatusfechbol := CreateCmDbField('FLGSTATUSFECHBOL',ftString,False,False,False,True,'');
   fFlgcustodia := CreateCmDbField('FLGCUSTODIA',ftString,False,False,False,True,'');
   fEmpresaprop := CreateCmDbField('EMPRESAPROP',ftfloat,False,False,False,True,'');
   fDivporacao := CreateCmDbField('DIVPORACAO',ftfloat,False,False,False,True,'');
   fDatavencoper := CreateCmDbField('DATAVENCOPER',ftDateTime,False,False,False,True,'');
   fDataoperacao := CreateCmDbField('DATAOPERACAO',ftDateTime,True,False,False,True,'');
   fDataliqoper := CreateCmDbField('DATALIQOPER',ftDateTime,False,False,False,True,'');
   fDataex := CreateCmDbField('DATAEX',ftDateTime,False,False,False,True,'');
   fDatacom := CreateCmDbField('DATACOM',ftDateTime,False,False,False,True,'');
   fDataage := CreateCmDbField('DATAAGE',ftDateTime,False,False,False,True,'');
   fCodfinanceiro := CreateCmDbField('CODFINANCEIRO',ftfloat,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fAtadecisao := CreateCmDbField('ATADECISAO',ftDateTime,False,False,False,True,'');
   //AL_1
   fIdOperContAcoes := CreateCmDbField('IDOPERCONTACOES',ftfloat,False,False,False,True,'');
end;

function TDbOperacaoinvest.Insert: Boolean;
begin

   fIdoperacaoinvest.AsFloat := GetSequence('OPERACAOINVEST');
   Result := Inherited Insert;

end;


procedure TDbOperacaoinvest.SetAtadecisao(const Value: TCmDbField);
begin
  FAtadecisao := Value;
end;

procedure TDbOperacaoinvest.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbOperacaoinvest.SetCodfinanceiro(const Value: TCmDbField);
begin
  FCodfinanceiro := Value;
end;

procedure TDbOperacaoinvest.SetDataage(const Value: TCmDbField);
begin
  FDataage := Value;
end;

procedure TDbOperacaoinvest.SetDatacom(const Value: TCmDbField);
begin
  FDatacom := Value;
end;

procedure TDbOperacaoinvest.SetDataex(const Value: TCmDbField);
begin
  FDataex := Value;
end;

procedure TDbOperacaoinvest.SetDataliqoper(const Value: TCmDbField);
begin
  FDataliqoper := Value;
end;

procedure TDbOperacaoinvest.SetDataoperacao(const Value: TCmDbField);
begin
  FDataoperacao := Value;
end;

procedure TDbOperacaoinvest.SetDatavencoper(const Value: TCmDbField);
begin
  FDatavencoper := Value;
end;

procedure TDbOperacaoinvest.SetDivporacao(const Value: TCmDbField);
begin
  FDivporacao := Value;
end;

procedure TDbOperacaoinvest.SetEmpresaprop(const Value: TCmDbField);
begin
  FEmpresaprop := Value;
end;

procedure TDbOperacaoinvest.SetFlgcustodia(const Value: TCmDbField);
begin
  FFlgcustodia := Value;
end;

procedure TDbOperacaoinvest.SetFlgstatusfechbol(const Value: TCmDbField);
begin
  FFlgstatusfechbol := Value;
end;

procedure TDbOperacaoinvest.SetFlgstatusordmov(const Value: TCmDbField);
begin
  FFlgstatusordmov := Value;
end;

procedure TDbOperacaoinvest.SetFormapagrec(const Value: TCmDbField);
begin
  FFormapagrec := Value;
end;

procedure TDbOperacaoinvest.SetIdcarteiragerenc(const Value: TCmDbField);
begin
  FIdcarteiragerenc := Value;
end;

procedure TDbOperacaoinvest.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbOperacaoinvest.SetIdcartoridest(const Value: TCmDbField);
begin
  FIdcartoridest := Value;
end;

procedure TDbOperacaoinvest.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbOperacaoinvest.SetIdcorretvalores(const Value: TCmDbField);
begin
  FIdcorretvalores := Value;
end;

procedure TDbOperacaoinvest.SetIdcustdest(const Value: TCmDbField);
begin
  FIdcustdest := Value;
end;

procedure TDbOperacaoinvest.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbOperacaoinvest.SetIdcustorig(const Value: TCmDbField);
begin
  FIdcustorig := Value;
end;

procedure TDbOperacaoinvest.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbOperacaoinvest.SetIdinstfin(const Value: TCmDbField);
begin
  FIdinstfin := Value;
end;

procedure TDbOperacaoinvest.SetIdinvestdest(const Value: TCmDbField);
begin
  FIdinvestdest := Value;
end;

procedure TDbOperacaoinvest.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbOperacaoinvest.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbOperacaoinvest.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbOperacaoinvest.SetIdmotivobloqueio(const Value: TCmDbField);
begin
  FIdmotivobloqueio := Value;
end;

procedure TDbOperacaoinvest.SetIdoperacaodireito(const Value: TCmDbField);
begin
  FIdoperacaodireito := Value;
end;

procedure TDbOperacaoinvest.SetIdoperacaoinvest(const Value: TCmDbField);
begin
  FIdoperacaoinvest := Value;
end;

procedure TDbOperacaoinvest.SetIdoperacaoorigem(const Value: TCmDbField);
begin
  FIdoperacaoorigem := Value;
end;

procedure TDbOperacaoinvest.SetIdOperContAcoes(const Value: TCmDbField);
begin
  FIdOperContAcoes := Value;
end;

procedure TDbOperacaoinvest.SetIdopercustodia(const Value: TCmDbField);
begin
  FIdopercustodia := Value;
end;

procedure TDbOperacaoinvest.SetIdordmovinv(const Value: TCmDbField);
begin
  FIdordmovinv := Value;
end;

procedure TDbOperacaoinvest.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbOperacaoinvest.SetIdterceiro(const Value: TCmDbField);
begin
  FIdterceiro := Value;
end;

procedure TDbOperacaoinvest.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbOperacaoinvest.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbOperacaoinvest.SetInipagto(const Value: TCmDbField);
begin
  FInipagto := Value;
end;

procedure TDbOperacaoinvest.SetInvorigem(const Value: TCmDbField);
begin
  FInvorigem := Value;
end;

procedure TDbOperacaoinvest.SetJuroscap(const Value: TCmDbField);
begin
  FJuroscap := Value;
end;

procedure TDbOperacaoinvest.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbOperacaoinvest.SetNumdocumento(const Value: TCmDbField);
begin
  FNumdocumento := Value;
end;

procedure TDbOperacaoinvest.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbOperacaoinvest.SetOrigdest(const Value: TCmDbField);
begin
  FOrigdest := Value;
end;

procedure TDbOperacaoinvest.SetParidade(const Value: TCmDbField);
begin
  FParidade := Value;
end;

procedure TDbOperacaoinvest.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbOperacaoinvest.SetPrecounitoperacao(const Value: TCmDbField);
begin
  FPrecounitoperacao := Value;
end;

procedure TDbOperacaoinvest.SetPrzbolsa(const Value: TCmDbField);
begin
  FPrzbolsa := Value;
end;

procedure TDbOperacaoinvest.SetPrzempresa(const Value: TCmDbField);
begin
  FPrzempresa := Value;
end;

procedure TDbOperacaoinvest.SetPumercado(const Value: TCmDbField);
begin
  FPumercado := Value;
end;

procedure TDbOperacaoinvest.SetQtdeoperacao(const Value: TCmDbField);
begin
  FQtdeoperacao := Value;
end;

procedure TDbOperacaoinvest.SetVlrcustoatual(const Value: TCmDbField);
begin
  FVlrcustoatual := Value;
end;

procedure TDbOperacaoinvest.SetVlrir(const Value: TCmDbField);
begin
  FVlrir := Value;
end;

procedure TDbOperacaoinvest.SetVlrirremuner(const Value: TCmDbField);
begin
  FVlrirremuner := Value;
end;

procedure TDbOperacaoinvest.SetVlroperacao(const Value: TCmDbField);
begin
  FVlroperacao := Value;
end;

procedure TDbOperacaoinvest.SetVlroperacaoom(const Value: TCmDbField);
begin
  FVlroperacaoom := Value;
end;

procedure TDbOperacaoinvest.SetVlrremuneracao(const Value: TCmDbField);
begin
  FVlrremuneracao := Value;
end;

procedure TDbOperacaoinvest.SetVlrvariacaoatual(const Value: TCmDbField);
begin
  FVlrvariacaoatual := Value;
end;

end.



