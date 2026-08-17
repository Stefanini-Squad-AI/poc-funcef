unit dInterfaceAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, uRegraMT, DBClient;

type
  TDtmInterfaceAtuarial = class(TDataModule)
    qryPartAss: TwwQuery;
    qryReserva: TwwQuery;
    qryPlanPrev: TwwQuery;
    qryGarantia: TwwQuery;
    QryIdRegraSRB: TwwQuery;
    qryAux: TwwQuery;
    RegraMT: TRegraMT;
  private
    { Private declarations }
  public
    { Public declarations }
    Function ExecutaRegra( piIdRegra : Integer;
                           pCdsRegra: TClientDataSet;
                           iTab_Masculino, iTab_Feminino, iTab_Pensao : Integer;
                           Var piIdCalculo : Integer;
                           Var pbErro      : Boolean;
                           pbGravaCalculo  : Boolean = False;
                           pbReloadRule    : Boolean = False;
                           pEventOnGetResult : TOnGetResult = Nil ): String;

  end;

var
  DtmInterfaceAtuarial: TDtmInterfaceAtuarial;

implementation

Uses uSistema, uTiposRegraMT ;
{$R *.DFM}

{ TDtmInterfaceAtuarial }

function TDtmInterfaceAtuarial.ExecutaRegra(piIdRegra: Integer;
                                            pCdsRegra: TClientDataSet;
                                            iTab_Masculino, iTab_Feminino, iTab_Pensao : Integer;
                                            Var piIdCalculo : Integer;
                                            Var pbErro      : Boolean;
                                            pbGravaCalculo  : Boolean = False;
                                            pbReloadRule    : Boolean = False;
                                            pEventOnGetResult: TOnGetResult = Nil ): String;
Var
  OnGetResultAcerto : TOnGetResult;
begin

  If Assigned( pEventOnGetResult ) Then Begin
    OnGetResultAcerto    := RegraMt.OnGetResult;            { Guarda evento original do Componente }
    RegraMt.OnGetResult  := pEventOnGetResult;              { Trasfere o evento do Regra para o evento passado }
  End;

  RegraMT.IdCalculo    := 0;                                { Identificador do calculo }
  RegraMT.RuleNumber   := IntToStr( piIdRegra );            { Identificador da Regra   }
  RegraMT.IdEmpresa    := Sistema.IdEmpresa;                { Identificado do Cliente  }
  RegraMT.GravaCalculo := pbGravaCalculo;                   { Se o Regra irá efetivamento gravar o Cálculo }
  RegraMT.ReloadRule   := pbReloadRule;                     { Se o Regra irá carregar os dados da Regra do BD toda vez que for executa-lá }

  If Sistema.TipoEmpresa = 'P' Then Begin                   { Indica o tipo de cliente }
    RegraMT.TipoCliente      := tcFundacao;
  End Else Begin
    RegraMT.TipoCliente      := tcOutros;
  End;

  RegraMT.PassoaPasso := False;                             { Se o Regra será executado em modo de Debug ( Passoa a passo ) }
  RegraMT.CopiaData( pCdsRegra.Data );                      { Passa o Clientdataset para o regra }
  RegraMT.Execute;                                          { Executa a Regra }

  { Seta resultados }
  Result := RegraMT.Result;

  pbErro      := RegraMT.Error;
  piIdCalculo := RegraMT.IdCalculo;

  If Assigned( pEventOnGetResult ) Then
    RegraMt.OnGetResult := OnGetResultAcerto;               { volta evento original do Componente }

end;

end.
