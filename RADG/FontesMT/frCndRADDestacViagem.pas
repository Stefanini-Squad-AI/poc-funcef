{-------------------------------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Pendência: 26285
Descrição: Ajustes - O cdsCondicoes não estava armazenando corretamente o conteúdo do código externo.
---------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Pendência: 26278
Descrição: Alteração. Nas condições de destacamento, é utilizado o centro de responsabilidade
           ao invés de centro de custo.
           Esta alteração é somente para referências 32 e 33:
              . Solicitação de Destacamento de viagem (ida)
              . Solicitação de Destacamento de viagem (volta)
--------------------------------------------------------------------------------------------------}
unit frCndRADDestacViagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCondRad, Db, ImgList, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  Buttons, TB97, TB97Tlbr, ExtCtrls, DBClient, uCMClientDataSet, Provider,
  DBTables, Mask, DBCtrls, wwdblook, CMDBLookupCombo, uCtrlParamIntegra,
  uCmSqlParams;

type
  TframeCndRADDestacViagem = class(TframeCondRAD)
    dbedtValorInicial: TDBEdit;
    dbedtValorFinal: TDBEdit;
    lblValorInicial: TLabel;
    lblValorFinal: TLabel;
    cdsCentroRespon: TCMClientDataSet;
    Label4: TLabel;
    dblkpCentroRespon: TCMDBLookupCombo;
    Label1: TLabel;
    dblkpCentCust: TCMDBLookupCombo;
    cdsCentroCusto: TCMClientDataSet;
  private
    { Private declarations }
  public

    procedure OnCreate; override;
    function Valida : boolean; override;

  end;

var
  frameCndRADDestacViagem: TframeCndRADDestacViagem;

implementation

{$R *.DFM}


procedure TframeCndRADDestacViagem.OnCreate;
begin
  inherited;
  cdsCentroCusto.Data   :=  CtrlRadEtapaCond.LookupCentCust( ParamIntegra.PlanoCentroCusto );
  cdsCentroRespon.Data   := CtrlRadEtapaCond.LookupCentRespon( ParamIntegra.PlanoCentroRespon );

end;

function TframeCndRADDestacViagem.Valida: boolean;
begin
  try
     Result := True;
     //amf 26285 10.10.2007 - correção dos códigos externos. Estava gerando erros de teste de condição.
     cdsCondicoes.FieldByName('CODEXTERNOCC').AsString    := dblkpCentCust.Text;
     cdsCondicoes.FieldByName('CODEXTERNOCR').AsString    := dblkpCentroRespon.Text;
  except
     result := false;
  end;
end;

end.
